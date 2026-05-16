import abilityTest from './Ability.test';
import BigIntTest from './BigInt.test';
import BooleanTest from './Boolean.test';
import DataViewTest from './DataView.test';
import ErrorTest from './Error.test';
import globalTest from './Global.test';
import IntTest from './Intl.test';
import StringTest from './String.test';
import TypedArrayTest from './TypedArray.test';
import globalTest1 from './ConcurrentTest.test'
import globalTest2 from './ConcurrentSecondTest.test'
import globalTest3 from './ConcurrentThirdTest.test'
import supplyTest from './CoucurrentFourthTest.test';
import BuiltinsAsIntNTest from './BuiltinsAsIntNTest.test';
import BuiltinsConstructorTest from './BuiltinsConstructorTest.test';
import BuiltinsCharLiteralTest from './BuiltinsCharLiteralTest.test';
import BuiltinsFloatLiteralTest from './BuiltinsFloatLiteralTest.test';
import BuiltinsGenericsActTest from './BuiltinsGenericsActTest.test';
import BuiltinsMultilineStringLiteralTest from './BuiltinsMultilineStringLiteralTest.test';
import BuiltinsNullLiteralTest from './BuiltinsNullLiteralTest.test';
import builtinsNumberConstructorTest from './BuiltinsNumberConstructorTest.test';
import BuiltinsPartialUtilityType from './BuiltinsPartialUtilityType.test';

export default function testsuite() {
  abilityTest();
  BigIntTest();
  BooleanTest();
  DataViewTest();
  ErrorTest();
  globalTest();
  IntTest();
  StringTest();
  TypedArrayTest();
  globalTest1();
  globalTest2();
  globalTest3();
  supplyTest();
  BuiltinsAsIntNTest();
  BuiltinsCharLiteralTest();
  BuiltinsConstructorTest();
  BuiltinsFloatLiteralTest();
  BuiltinsGenericsActTest();
  BuiltinsMultilineStringLiteralTest();
  BuiltinsNullLiteralTest();
  builtinsNumberConstructorTest();
  BuiltinsPartialUtilityType();
}