import builtinsBlockTest from './BuiltinStatment/BuiltinsBlockTest.test.ets'
import builtinsBreakTest from './BuiltinStatment/BuiltinsBreakTest.test.ets'
import builtinsContinueTest from './BuiltinStatment/BuiltinsContinueTest.test.ets'
import builtinsForOfTest from './BuiltinStatment/BuiltinsForOfTest.test.ets'
import builtinsForTest from './BuiltinStatment/BuiltinsForTest.test.ets'
import builtinsIfTest from './BuiltinStatment/BuiltinsIfTest.test.ets'
import builtinsReturnTest from './BuiltinStatment/BuiltinsReturnTest.test.ets'
import builtinsSwitchTest from './BuiltinStatment/BuiltinsSwitchTest.test.ets'
import builtinsThrowTest from './BuiltinStatment/BuiltinsThrowTest.test.ets'
import builtinsTryTest from './BuiltinStatment/BuiltinsTryTest.test.ets'
import builtinsWhileTest from './BuiltinStatment/BuiltinsWhileTest.test.ets'

import expressionTest1 from './expression/ExpressionTest1.test';
import expressionTest2 from './expression/ExpressionTest2.test';
import expressionTest3 from './expression/ExpressionTest3.test';
import expressionTest4 from './expression/ExpressionTest4.test';  
import expressionTest5 from './expression/ExpressionTest5.test';
import expressionTest6 from './expression/ExpressionTest6.test';
import objectLiteralThisCaptureTest from './expression/ObjectLiteralThisCapture.test.ets';
import DoubleEnumTest from './enumerations/DoubleEnum.test';

import SpecTypeTest from "./Types/Types.test";
import SpecTypeTest1 from "./Types/Types1.test";
import EqualityExpressions from "./Types/EqualityExpressions.test.ets";
import ClassLateInitizationTest from "./Class/Class.test";
import UnionTest from "./Union/Unionnormalization.test";

import abstractClassesTest from "./classes/classdeclaration/AbstractClassesTest.test";
import accessingParentClassTest from "./classes/classextensionclause/AccessingParentClassTest.test"
import classCallRewriteTest from "./classes/classextensionclause/ClassCallRewriteTest.test"
import classInheritsParentMembersTest from "./classes/classextensionclause/ClassInheritsParentMembersTest.test"
import classRewriteCallTest from "./classes/classextensionclause/ClassRewriteCallTest.test"
import classRewritingTest from "./classes/classextensionclause/ClassRewritingTest.test"
import classSuperclassNonPrivateTest from "./classes/classextensionclause/ClassSuperclassNonPrivateTest.test"
import classSuperclassOverrideTest from "./classes/classextensionclause/ClassSuperclassOverrideTest.test"
import classSuperclassStaticmethodTest from "./classes/classextensionclause/ClassSuperclassStaticmethodTest.test"
import initializeMembersTest from "./classes/classextensionclause/InitializeMembersTest.test"

import AssignmentLikeContextsTest from "./contextsandconversions/AssignmentLikeContextsTest.test";
import AttemptInvalidTypeConversionTest from "./contextsandconversions/AttemptInvalidTypeConversionTest.test";
import NumericOperatorContextsTest from "./contextsandconversions/NumericOperatorContextsTest.test";
import StringOperatorContextsTest from "./contextsandconversions/StringOperatorContextsTest.test";
import optionalChainingTest from "./ChainingOperator/NotEmptyOptional.test";
import forLoopHeaderSmartCastTest from "./statements/ForLoopHeaderSmartCastTest.test.ets";
import test2ForLoopCasesTest from "./statements/Test2ForLoopCases.test.ets";

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
  objectLiteralThisCaptureTest();
  DoubleEnumTest();

  SpecTypeTest();
  SpecTypeTest1();
  ClassLateInitizationTest();
  EqualityExpressions();
  UnionTest();

  abstractClassesTest();
  accessingParentClassTest();
  classCallRewriteTest();
  classInheritsParentMembersTest();
  classRewriteCallTest();
  classRewritingTest();
  classSuperclassNonPrivateTest();
  classSuperclassOverrideTest();
  classSuperclassStaticmethodTest();
  initializeMembersTest();

  AssignmentLikeContextsTest();
  AttemptInvalidTypeConversionTest();
  NumericOperatorContextsTest();
  StringOperatorContextsTest();
  
  optionalChainingTest();
  forLoopHeaderSmartCastTest();
  test2ForLoopCasesTest();
}
