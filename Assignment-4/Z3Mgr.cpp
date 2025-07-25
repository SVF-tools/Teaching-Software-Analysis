//===- Z3Mgr.cpp -- Z3 manager for software verification ------------------//
//
//                     SVF: Static Value-Flow Analysis
//
// Copyright (C) <2013-2022>  <Yulei Sui>
//

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.

// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
//===----------------------------------------------------------------------===//
/*
 * Z3 manager for software verification
 *
 * Created on: Feb 19, 2024
 */

#include "Z3Mgr.h"
#include <iomanip>
#include <iostream>
#include <set>
#include <sstream>

using namespace SVF;
using namespace z3;
using namespace std;

/// Store and Select for Loc2ValMap, i.e., store and load
/// The address needs to be evaluated to a value before accessing loc2ValMap
z3::expr Z3Mgr::storeValue(const z3::expr loc, const z3::expr value) {
	z3::expr addr = getEvalExpr(loc);
	assert(isVirtualMemAddress(addr) && "Pointer operand is not a physical address?");
	z3::expr loc2ValMap = varID2ExprMap[lastSlot];
	loc2ValMap = z3::store(loc2ValMap, addr, value);
	varID2ExprMap.set(lastSlot, loc2ValMap);
	return loc2ValMap;
}

z3::expr Z3Mgr::loadValue(const z3::expr loc) {
	z3::expr addr = getEvalExpr(loc);
	assert(isVirtualMemAddress(addr) && "Pointer operand is not a physical address?");
	z3::expr loc2ValMap = varID2ExprMap[lastSlot];
	return z3::select(loc2ValMap, addr);
}

/// Return int value from an expression if it is a numeral, otherwise return an approximate value
s32_t Z3Mgr::z3Expr2NumValue(z3::expr e) {
	z3::expr val = getEvalExpr(e);
	if (val.is_numeral())
		return val.get_numeral_int64();
	else {
		assert(false && "this expression is not numeral");
		abort();
	}
}

/// It checks if the constraints added to the Z3 solver are satisfiable.
/// If they are, it retrieves the model that satisfies these constraints
/// and evaluates the given complex expression e within this model, returning the evaluated result
z3::expr Z3Mgr::getEvalExpr(z3::expr e) {
	z3::check_result res = solver.check();
	assert(res != z3::unsat && "unsatisfied constraints! Check your contradictory constraints added to the solver");
	z3::model m = solver.get_model();
	return m.eval(e);
}

/// Print all expressions' values after evaluation
void Z3Mgr::printExprValues() {
	std::cout.flags(std::ios::left);
	std::cout << "-----------Var and Value-----------\n";
	for (u32_t i = 0; i < lastSlot; i++) {
		expr e = getEvalExpr(varID2ExprMap[i]);
		if (e.is_numeral()) {
			s32_t value = e.get_numeral_int64();
			std::stringstream exprName;
			exprName << "Var" << i;
			std::cout << std::setw(25) << exprName.str();
			if (isVirtualMemAddress(value))
				std::cout << "\t Value: " << std::hex << "0x" << value << "\n";
			else
				std::cout << "\t Value: " << std::dec << value << "\n";
		}
	}
	std::cout << "-----------------------------------------\n";
}

void Z3Mgr::printZ3Exprs() {
	std::cout << solver << "\n";
}
