import builtinsBlockTest from './BuiltinStatment/ConcurrentBuiltinsBlockTest.test.ets'
import builtinsBreakTest from './BuiltinStatment/ConcurrentBuiltinsBreakTest.test.ets'
import builtinsContinueTest from './BuiltinStatment/ConcurrentBuiltinsContinueTest.test.ets'
import builtinsForOfTest from './BuiltinStatment/ConcurrentBuiltinsForOfTest.test.ets'
import builtinsForTest from './BuiltinStatment/ConcurrentBuiltinsForTest.test.ets'
import builtinsIfTest from './BuiltinStatment/ConcurrentBuiltinsIfTest.test.ets'
import builtinsReturnTest from './BuiltinStatment/ConcurrentBuiltinsReturnTest.test.ets'
import builtinsSwitchTest from './BuiltinStatment/ConcurrentBuiltinsSwitchTest.test.ets'
import builtinsThrowTest from './BuiltinStatment/ConcurrentBuiltinsThrowTest.test.ets'
import builtinsTryTest from './BuiltinStatment/ConcurrentBuiltinsTryTest.test.ets'
import builtinsWhileTest from './BuiltinStatment/ConcurrentBuiltinsWhileTest.test.ets'

import expressionTest1 from './expression/ConcurrentExpressionTest1.test';
import expressionTest2 from './expression/ConcurrentExpressionTest2.test';
import expressionTest3 from './expression/ConcurrentExpressionTest3.test';
import expressionTest4 from './expression/ConcurrentExpressionTest4.test';
import expressionTest5 from './expression/ConcurrentExpressionTest5.test';
import expressionTest6 from './expression/ConcurrentExpressionTest6.test';
import DoubleEnumTest from './enumerations/ConcurrentDoubleEnum.test';

import SpecTypeTest from "./Types/ConcurrentTypes.test";
import SpecTypeTest1 from "./Types/ConcurrentTypes1.test";
import EqualityExpressions from "./Types/ConcurrentEqualityExpressions.test.ets";
import ClassLateInitizationTest from "./Class/ConcurrentClass.test";
import UnionTest from "./Union/ConcurrentUnionnormalization.test";

import abstractClassesTest from "./classes/classdeclaration/ConcurrentAbstractClassesTest.test";
import accessingParentClassTest from "./classes/classextensionclause/ConcurrentAccessingParentClassTest.test"
import classCallRewriteTest from "./classes/classextensionclause/ConcurrentClassCallRewriteTest.test"
import classInheritsParentMembersTest from "./classes/classextensionclause/ConcurrentClassInheritsParentMembersTest.test"
import classRewriteCallTest from "./classes/classextensionclause/ConcurrentClassRewriteCallTest.test"
import classRewritingTest from "./classes/classextensionclause/ConcurrentClassRewritingTest.test"
import classSuperclassNonPrivateTest from "./classes/classextensionclause/ConcurrentClassSuperclassNonPrivateTest.test"
import classSuperclassOverrideTest from "./classes/classextensionclause/ConcurrentClassSuperclassOverrideTest.test"
import classSuperclassStaticmethodTest from "./classes/classextensionclause/ConcurrentClassSuperclassStaticmethodTest.test"
import initializeMembersTest from "./classes/classextensionclause/ConcurrentInitializeMembersTest.test"

import AssignmentLikeContextsTest from "./contextsandconversions/ConcurrentAssignmentLikeContextsTest.test";
import AttemptInvalidTypeConversionTest from "./contextsandconversions/ConcurrentAttemptInvalidTypeConversionTest.test";
import NumericOperatorContextsTest from "./contextsandconversions/ConcurrentNumericOperatorContextsTest.test";
import StringOperatorContextsTest from "./contextsandconversions/ConcurrentStringOperatorContextsTest.test";

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
}