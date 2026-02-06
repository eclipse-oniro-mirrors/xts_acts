import builtinsBlockTest from './BuiltinsBlockTest.test.ets'
import builtinsBreakTest from './BuiltinsBreakTest.test.ets'
import builtinsContinueTest from './BuiltinsContinueTest.test.ets'
import builtinsForOfTest from './BuiltinsForOfTest.test.ets'
import builtinsForTest from './BuiltinsForTest.test.ets'
import builtinsIfTest from './BuiltinsIfTest.test.ets'
import builtinsReturnTest from './BuiltinsReturnTest.test.ets'
import builtinsSwitchTest from './BuiltinsSwitchTest.test.ets'
import builtinsThrowTest from './BuiltinsThrowTest.test.ets'
import builtinsTryTest from './BuiltinsTryTest.test.ets'
import builtinsWhileTest from './BuiltinsWhileTest.test.ets'

import expressionTest1 from './expression/ExpressionTest1.test';
import expressionTest2 from './expression/ExpressionTest2.test';
import expressionTest3 from './expression/ExpressionTest3.test';
import expressionTest4 from './expression/ExpressionTest4.test';
import expressionTest5 from './expression/ExpressionTest5.test';
import expressionTest6 from './expression/ExpressionTest6.test';
import DoubleEnumTest from './enumerations/DoubleEnum.test';

import SpecTypeTest from "./Types/Types.test";
import SpecTypeTest1 from "./Types/Types1.test";
import EqualityExpressions from "./Types/EqualityExpressions.test.ets";
import ClassLateInitizationTest from "./Class/Class.test";

export default function testsuite() {
  builtinsBlockTest();
  builtinsBreakTest();
  builtinsContinueTest();
  builtinsForOfTest();
  builtinsForTest();
  builtinsIfTest();
  builtinsReturnTest();
  builtinsSwitchTest();
  builtinsThrowTest();
  builtinsTryTest();
  builtinsWhileTest();

  expressionTest1();
  expressionTest2();
  expressionTest3();
  expressionTest4();
  expressionTest5();
  expressionTest6();
  DoubleEnumTest();

  SpecTypeTest();
  SpecTypeTest1();
  ClassLateInitizationTest();
  EqualityExpressions();
  
}