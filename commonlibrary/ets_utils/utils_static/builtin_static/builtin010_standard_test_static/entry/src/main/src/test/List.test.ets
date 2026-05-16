import builtinsBooleanBoxBoxText from './booleanBox/BuiltinsBooleanBoxBoxTest.test';
import builtinsBooleanBoxConstructorText from './booleanBox/BuiltinsBooleanBoxConstructorTest.test';
import builtinsBooleanBoxGetText from './booleanBox/BuiltinsBooleanBoxGetTest.test';
import builtinsBooleanBoxSetText from './booleanBox/BuiltinsBooleanBoxSetTest.test';

import builtinsByteBoxBoxText from './byteBox/BuiltinsByteBoxBoxTest.test';
import builtinsByteBoxConstructorText from './byteBox/BuiltinsByteBoxConstructorTest.test';
import builtinsByteBoxGetText from './byteBox/BuiltinsByteBoxGetTest.test';
import builtinsByteBoxSetText from './byteBox/BuiltinsByteBoxSetTest.test';

import builtinsCharBoxBoxText from './charBox/BuiltinsCharBoxBoxTest.test';
import builtinsCharBoxConstructorText from './charBox/BuiltinsCharBoxConstructorTest.test';
import builtinsCharBoxGetText from './charBox/BuiltinsCharBoxGetTest.test';
import builtinsCharBoxSetText from './charBox/BuiltinsCharBoxSetTest.test';

import builtinsChronoTest from './chrono/BuiltinsChronoTest.test';

import builtinsDoubleBoxTest from './doubleBox/BuiltinsDoubleBoxTest.test';

import builtinsFloatBoxBoxText from './floatBox/BuiltinsFloatBoxBoxTest.test';
import builtinsFloatBoxConstructorWithParamText from './floatBox/BuiltinsFloatBoxConstructorTest.test';
import builtinsFloatBoxGetText from './floatBox/BuiltinsFloatBoxGetTest.test';
import builtinsFloatBoxSetText from './floatBox/BuiltinsFloatBoxSetTest.test';

import builtinsIntBoxTest from './intBox/BuiltinsIntBoxTest.test';

import builtinsJsonErrorConstructorTest from './json/BuiltinsJsonErrorConstructorTest.test';
import builtinsJsonParseErrorTest from './json/BuiltinsJsonParseErrorTest.test';
import builtinsJsonSerializationStringifyInterfaceTest from './json/BuiltinsJsonSerializationStringifyInterfaceTest.test';
import builtinsJsonSerializationStringifyTest from './json/BuiltinsJsonSerializationStringifyTest.test';
import builtinsJsonTest from './json/BuiltinsJsonTest.test';
import builtinsJsonTypeErrorConstructorTest from './json/BuiltinsJsonTypeErrorConstructorTypeTest.test';
import builtinsJsonTypeStringifiersTest from './json/BuiltinsJsonTypeStringifiersTest.test';

import builtinsJsonElementAsArrayTest from './jsonElement/BuiltinsJsonElementAsArrayTest.test';
import builtinsJsonElementAsBooleanTest from './jsonElement/BuiltinsJsonElementAsBooleanTest.test';
import builtinsJsonElementAsDoubleTest from './jsonElement/BuiltinsJsonElementAsDoubleTest.test';
import builtinsJsonElementAsIntegerTest from './jsonElement/BuiltinsJsonElementAsIntegerTest.test';
import builtinsJsonElementAsStringTest from './jsonElement/BuiltinsJsonElementAsStringTest.test';
import builtinsJsonElementConstructorTest from './jsonElement/BuiltinsJsonElementConstructorTest.test';
import builtinsJsonElementCreateArrayTest from './jsonElement/BuiltinsJsonElementCreateArrayTest.test';
import builtinsJsonElementCreateBooleanTest from './jsonElement/BuiltinsJsonElementCreateBooleanTest.test';
import builtinsJsonElementCreateDoubleTest from './jsonElement/BuiltinsJsonElementCreateDoubleTest.test';
import builtinsJsonElementCreateIntegerTest from './jsonElement/BuiltinsJsonElementCreateIntegerTest.test';
import builtinsJsonElementCreateNullTest from './jsonElement/BuiltinsJsonElementCreateNullTest.test';
import builtinsJsonElementCreateObjectTest from './jsonElement/BuiltinsJsonElementCreateObjectTest.test';
import builtinsJsonElementCreateStringTest from './jsonElement/BuiltinsJsonElementCreateStringTest.test';
import builtinsJsonElementGetArrayTest from './jsonElement/BuiltinsJsonElementGetArrayTest.test';
import builtinsJsonElementGetBooleanTest from './jsonElement/BuiltinsJsonElementGetBooleanTest.test';
import builtinsJsonElementGetDoubleTest from './jsonElement/BuiltinsJsonElementGetDoubleTest.test';
import builtinsJsonElementGetElementTest from './jsonElement/BuiltinsJsonElementGetElementTest.test';
import builtinsJsonElementGetIntegerTest from './jsonElement/BuiltinsJsonElementGetIntegerTest.test';
import builtinsJsonElementGetStringTest from './jsonElement/BuiltinsJsonElementGetStringTest.test';
import builtinsJsonElementGetTest from './jsonElement/BuiltinsJsonElementGetTest.test';
import builtinsJsonElementIteratorTest from './jsonElement/BuiltinsJsonElementIteratorTest.test';
import builtinsJsonElementJsonKeyTest from './jsonElement/BuiltinsJsonElementJsonKeyTest.test';
import builtinsJsonElementCreateUndefinedTest from './jsonElement/BuiltinsJsonElementCreateUndefinedTest.test';
import builtinsJsonElementJsonTypeTest from './jsonElement/BuiltinsJsonElementJsonTypeTest.test';
import builtinsJsonElementRemoveElementTest from './jsonElement/BuiltinsJsonElementRemoveElementTest.test';
import builtinsJsonElementSetElementTest from './jsonElement/BuiltinsJsonElementSetElementTest.test';
import builtinsJsonElementTest from './jsonElement/BuiltinsJsonElementTest.test';
import builtinsJsonElementTryAsArrayTest from './jsonElement/BuiltinsJsonElementTryAsArrayTest.test';
import builtinsJsonElementTryAsBooleanTest from './jsonElement/BuiltinsJsonElementTryAsBooleanTest.test';
import builtinsJsonElementTryAsDoubleTest from './jsonElement/BuiltinsJsonElementTryAsDoubleTest.test';
import builtinsJsonElementTryAsIntegerTest from './jsonElement/BuiltinsJsonElementTryAsIntegerTest.test';
import builtinsJsonElementTryAsStringTest from './jsonElement/BuiltinsJsonElementTryAsStringTest.test';
import builtinsJsonElementTryGetArrayTest from './jsonElement/BuiltinsJsonElementTryGetArrayTest.test';
import builtinsJsonElementTryGetBooleanTest from './jsonElement/BuiltinsJsonElementTryGetBooleanTest.test';
import builtinsJsonElementTryGetDoubleTest from './jsonElement/BuiltinsJsonElementTryGetDoubleTest.test';
import builtinsJsonElementTryGetElementTest from './jsonElement/BuiltinsJsonElementTryGetElementTest.test';
import builtinsJsonElementTryGetIntegerTest from './jsonElement/BuiltinsJsonElementTryGetIntegerTest.test';
import builtinsJsonElementTryGetStringTest from './jsonElement/BuiltinsJsonElementTryGetStringTest.test';

import builtinsShortBoxBoxText from './shortBox/BuiltinsShortBoxBoxTest.test';
import builtinsShortBoxConstructorText from './shortBox/BuiltinsShortBoxConstructorTest.test';
import builtinsShortBoxSetText from './shortBox/BuiltinsShortBoxSetTest.test';
import builtinsShortCharGetText from './shortBox/BuiltinsShortBoxGetTest.test';


export default function testsuite() {
  builtinsBooleanBoxBoxText();
  builtinsBooleanBoxConstructorText();
  builtinsBooleanBoxGetText();
  builtinsBooleanBoxSetText();

  builtinsByteBoxBoxText();
  builtinsByteBoxConstructorText();
  builtinsByteBoxGetText();
  builtinsByteBoxSetText();

  builtinsCharBoxBoxText();
  builtinsCharBoxConstructorText();
  builtinsCharBoxGetText();
  builtinsCharBoxSetText();

  builtinsChronoTest();

  builtinsDoubleBoxTest();

  builtinsFloatBoxBoxText();
  builtinsFloatBoxConstructorWithParamText();
  builtinsFloatBoxGetText();
  builtinsFloatBoxSetText();

  builtinsIntBoxTest();

  builtinsJsonErrorConstructorTest();
  builtinsJsonParseErrorTest();
  builtinsJsonSerializationStringifyInterfaceTest();
  builtinsJsonSerializationStringifyTest();
  builtinsJsonTest();
  builtinsJsonTypeErrorConstructorTest();
  builtinsJsonTypeStringifiersTest();

  builtinsJsonElementAsArrayTest();
  builtinsJsonElementAsBooleanTest();
  builtinsJsonElementAsDoubleTest();
  builtinsJsonElementAsIntegerTest();
  builtinsJsonElementAsStringTest();
  builtinsJsonElementConstructorTest();
  builtinsJsonElementCreateArrayTest();
  builtinsJsonElementCreateBooleanTest();
  builtinsJsonElementCreateDoubleTest();
  builtinsJsonElementCreateIntegerTest();
  builtinsJsonElementCreateNullTest();
  builtinsJsonElementCreateObjectTest();
  builtinsJsonElementCreateStringTest();
  builtinsJsonElementGetArrayTest();
  builtinsJsonElementGetBooleanTest();
  builtinsJsonElementGetDoubleTest();
  builtinsJsonElementGetElementTest();
  builtinsJsonElementGetIntegerTest();
  builtinsJsonElementGetStringTest();
  builtinsJsonElementGetTest();
  builtinsJsonElementIteratorTest();
  builtinsJsonElementJsonKeyTest();
  builtinsJsonElementJsonKeyTest();
  builtinsJsonElementJsonTypeTest();
  builtinsJsonElementRemoveElementTest();
  builtinsJsonElementSetElementTest();
  builtinsJsonElementTest();
  builtinsJsonElementTryAsArrayTest();
  builtinsJsonElementTryAsBooleanTest();
  builtinsJsonElementTryAsDoubleTest();
  builtinsJsonElementTryAsIntegerTest();
  builtinsJsonElementTryAsStringTest();
  builtinsJsonElementTryGetArrayTest();
  builtinsJsonElementTryGetBooleanTest();
  builtinsJsonElementTryGetDoubleTest();
  builtinsJsonElementTryGetElementTest();
  builtinsJsonElementTryGetIntegerTest();
  builtinsJsonElementTryGetStringTest();

  builtinsShortBoxBoxText();
  builtinsShortBoxConstructorText();
  builtinsShortBoxSetText();
  builtinsShortCharGetText();
}