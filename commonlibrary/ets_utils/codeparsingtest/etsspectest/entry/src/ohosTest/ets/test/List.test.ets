/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import builtinsStatementBlockTest from './statement/BuiltinsStatementBlockTest.test';
import BuiltinsStatementBreakTest from './statement/BuiltinsStatementBreakTest.test';
import BuiltinsStatementContinueTest from './statement/BuiltinsStatementContinueTest.test';
import builtinsStatementForOfTest from './statement/BuiltinsStatementForOfTest.test';
import builtinsStatementForTest from './statement/BuiltinsStatementForTest.test';
import builtinsStatementIfTest from './statement/BuiltinsStatementIfTest.test';
import builtinsStatementThrowTest from './statement/BuiltinsStatementThrowTest.test';
import builtinsStatementTry from './statement/BuiltinsStatementTryTest.test';
import builtinsStatementWhileTest from './statement/BuiltinsStatementWhile.test';
import builtinsStatementReturnTest from './statement/StatementReturnTest.test';
import builtinsStatementSwitchTest from './statement/StatementSwitchTest.test';
import numberTest from './numberstring/NumberTest.test';
import RegExpTest from './regexp/regexp.test';
import InheritTest from './Inherit/Inherit.test'
import KeyCollectionTest from './keycollection/keycollection.test';
import stringTest from './numberstring/StringTest.test';
import dateTimeTest from './datetime/DateTimeTest.test';
import ActsStatementTest from './statement/Statement.test';
import ActsGrammarTest from './statement/Grammar.test';
import functionTest1 from './function/FunctionTest1.test';
import functionTest2 from './function/FunctionTest2.test';
import functionTest3 from './function/FunctionTest3.test';
import expressionTest1 from './expression/ExpressionTest1.test';
import expressionTest2 from './expression/ExpressionTest2.test';
import expressionTest3 from './expression/ExpressionTest3.test';
import expressionTest4 from './expression/ExpressionTest4.test';
import expressionTest5 from './expression/ExpressionTest5.test';
import expressionTest6 from './expression/ExpressionTest6.test';
import expressionTest7 from './expression/ExpressionTest7.test';
import looper1Test from './looper/Looper1.test';
import looper2Test from './looper/Looper2.test';
import looper3Test from './looper/Looper3.test';
import looper4Test from './looper/Looper4.test';
import looper5Test from './looper/Looper5.test';
import typeArrayBigInt64ArrayTest from "./typearray/TypeArrayBigInt64Array.test";
import typeArrayInt8ArrayTest from "./typearray/TypeArrayInt8Array.test";
import typeArrayUint32ArrayTest from "./typearray/TypeArrayUint32Array.test";
import literalAsUnionTypeTest from "./literalAs/LiteralAsUnionType.test";
import unionTypeCombination from "./literalAs/UnionTypeCombination.test";

export default function testsuite() {
  builtinsStatementBlockTest();
  builtinsStatementForOfTest();
  builtinsStatementThrowTest();
  builtinsStatementTry();
  builtinsStatementIfTest();
  BuiltinsStatementBreakTest();
  BuiltinsStatementContinueTest();
  builtinsStatementForTest();
  builtinsStatementReturnTest();
  builtinsStatementSwitchTest();
  builtinsStatementWhileTest();
  ActsStatementTest();
  ActsGrammarTest();
  numberTest();
  stringTest();
  dateTimeTest();
  functionTest1();
  functionTest2();
  functionTest3();
  typeArrayBigInt64ArrayTest();
  typeArrayInt8ArrayTest();
  typeArrayUint32ArrayTest();
  expressionTest1();
  expressionTest2();
  expressionTest3();
  expressionTest4();
  expressionTest5();
  expressionTest6();
  expressionTest7();
  looper1Test();
  looper2Test();
  looper3Test();
  looper4Test();
  looper5Test();
  RegExpTest();
  InheritTest();
  KeyCollectionTest();
  literalAsUnionTypeTest();
  unionTypeCombination();
}
