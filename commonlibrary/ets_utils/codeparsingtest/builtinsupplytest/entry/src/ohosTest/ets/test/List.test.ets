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
import BuiltinsNumberConstructorTest from "./BuiltinsNumberConstructorTest.test";
import BuiltinsNumberIsFiniteTest from "./BuiltinsNumberIsFiniteTest.test";
import BuiltinsNumberIsIntegerTest from "./BuiltinsNumberIsIntegerTest.test";
import BuiltinsNumberIsNaNTest from "./BuiltinsNumberIsNaNTest.test";
import BuiltinsNumberIsSafeIntegerTest from "./BuiltinsNumberIsSafeIntegerTest.test";
import BuiltinsNumberParseTest from "./BuiltinsNumberParseTest.test";
import BuiltinsNumberPropertyTest from "./BuiltinsNumberPropertyTest.test";
import BuiltinsNumberPrototypeTest from "./BuiltinsNumberPrototypeTest.test";
import BuiltinsAsIntNTest from "./BuiltinsAsIntNTest.test";
import BuiltinsAsUintNTest from "./BuiltinsAsUintNTest.test";
import BuiltinsConstructorTest from "./BuiltinsConstructorTest.test";
import BuiltinsToLocaleStringTest from "./BuiltinsToLocaleStringTest.test";
import BuiltinsToStringTest from "./BuiltinsToStringTest.test";
import BuiltinsValueOfTest from "./BuiltinsValueOfTest.test";
import builtinsBooleanConstructorTest from './BooleanConstructor.test';
import builtinsBooleanToStringTest from './BooleanToString.test';
import builtinsBooleanValueOfTest from './BooleanValueOf.test';
import builtinsRegExpConstructorTest from './RegExpConstructor.test';
import builtinsRegExpSymbolMatchTest from './RegExpSymbolMatch.test';
import builtinsRegExpSymbolReplaceTest from './RegExpSymbolReplace.test';
import builtinsRegExpSymbolSearchTest from './RegExpSymbolSearch.test';
import builtinsRegExpSymbolSplitTest from './RegExpSymbolSplit.test';
import builtinsRegExpStaticPropTest from './RegExpStaticProp.test';
import builtinsRegExpTestTest from './RegExpTest.test';
import builtinsRegExpToStringTest from './RegExpToString.test';
import builtinsRegExpInstancePropTest from './RegExpInstanceProp.test';
import BuiltinsBigIntLiteralTest from './BuiltinsBigIntLiteralTest.test';
import BuiltinsFloatLiteralTest from './BuiltinsFloatLiteralTest.test';
import BuiltinsBooleanLiteralTest from './BuiltinsBooleanLiteralTest.test';
import BuiltinsMultilineStringLiteralTest from './BuiltinsMultilineStringLiteralTest.test';
import BuiltinsStringLiteralTest from './BuiltinsStringLiteralTest.test';
import BuiltinsNullLiteralTest from './BuiltinsNullLiteralTest.test';
import BuiltinsCharLiteralTest from './BuiltinsCharLiteralTest.test';
import BuiltinsUndefinedLiteralTest from './BuiltinsUndefinedLiteralTest.test';
import BuiltinsPartialUtilityTypeTest from './BuiltinsPartialUtilityType.test';
import BuiltinsRequiredUtilityTypeTest from './BuiltinsRequiredUtilityType.test';
import BuiltinsReadonlyUtilityTypeTest from './BuiltinsReadonlyUtilityType.test';
import BuiltinsRecordUtilityTypeTest from './BuiltinsRecordUtilityType.test';
import BuiltinsPrivateFieldsUtilityTypeTest from './BuiltinsPrivateFieldsUtilityType.test';
import builtinsGenericsActTest from './BuiltinsGenericsActTest.test';
import builtinsGenericsFormatTest from './BuiltinsGenericsFormatTest.test';
import builtinsGenericsRestraintTest from './BuiltinsGenericsRestraintTest.test';
import builtinsGenericsDefaultTest from './BuiltinsGenericsDefaultTest.test';
import builtinsmMultipleGenericsRestraintTest from './BuiltinsmMultipleGenericsRestraintTest.test';
import builtinsProxyTest from './BuiltinsProxyTest.test';
import ReflectTest from './BuiltinsReflect.test';
import builtinsStringPrototypeTest from './BuiltinsStringPrototype.test';
import builtinsStringPrototypebTest from './BuiltinsStringPrototypebTest.test';
import BuiltinsStringPrototypeTest from './BuiltinsStringPrototypet.test';
import builtinsRegExpEscapeTest from './RegExpEscape.test';

export default function testsuite() {
  BuiltinsNumberConstructorTest();
  BuiltinsNumberIsFiniteTest();
  BuiltinsNumberIsIntegerTest();
  BuiltinsNumberIsNaNTest();
  BuiltinsNumberIsSafeIntegerTest();
  BuiltinsNumberParseTest();
  BuiltinsNumberPrototypeTest();
  BuiltinsNumberPropertyTest();
  BuiltinsConstructorTest();
  BuiltinsAsIntNTest();
  BuiltinsAsUintNTest();
  BuiltinsToLocaleStringTest();
  BuiltinsToStringTest();
  BuiltinsValueOfTest();
  builtinsBooleanConstructorTest();
  builtinsBooleanToStringTest();
  builtinsBooleanValueOfTest();
  builtinsRegExpConstructorTest();
  builtinsRegExpTestTest();
  builtinsRegExpToStringTest();
  builtinsRegExpSymbolMatchTest();
  builtinsRegExpSymbolReplaceTest();
  builtinsRegExpSymbolSearchTest();
  builtinsRegExpSymbolSplitTest();
  builtinsRegExpStaticPropTest();
  builtinsRegExpInstancePropTest();
  BuiltinsBigIntLiteralTest();
  BuiltinsFloatLiteralTest();
  BuiltinsBooleanLiteralTest();
  BuiltinsStringLiteralTest();
  BuiltinsMultilineStringLiteralTest();
  BuiltinsNullLiteralTest();
  BuiltinsUndefinedLiteralTest();
  BuiltinsCharLiteralTest();
  BuiltinsPartialUtilityTypeTest();
  BuiltinsRequiredUtilityTypeTest();
  BuiltinsReadonlyUtilityTypeTest();
  BuiltinsRecordUtilityTypeTest();
  BuiltinsPrivateFieldsUtilityTypeTest();
  builtinsGenericsActTest();
  builtinsGenericsFormatTest();
  builtinsGenericsRestraintTest();
  builtinsGenericsDefaultTest();
  builtinsmMultipleGenericsRestraintTest();
  builtinsProxyTest();
  ReflectTest();
  builtinsStringPrototypeTest();
  builtinsStringPrototypebTest();
  BuiltinsStringPrototypeTest();
  builtinsRegExpEscapeTest();
}
