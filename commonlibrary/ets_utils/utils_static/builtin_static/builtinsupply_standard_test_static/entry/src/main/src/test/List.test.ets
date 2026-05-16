/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import builtinsRegExpConstructorTest from './RegExpConstructor.test';
import builtinsRegExpInstancePropTest from './RegExpInstanceProp.test';
import builtinsRegExpSymbolMatchTest from './RegExpSymbolMatch.test';
import builtinsRegExpSymbolReplaceTest from './RegExpSymbolReplace.test';
import builtinsRegExpSymbolSearchTest from './RegExpSymbolSearch.test';
import builtinsRegExpSymbolSplitTest from './RegExpSymbolSplit.test';
import builtinsRegExpTestTest from './RegExpTest.test';
import builtinsRegExpToStringTest from './RegExpToString.test';

import BuiltinsCharLiteralTest from "./CharLiteralStatic.test";
import BuiltinsFloatLiteralTest from "./FloatLiteralStatic.test";
import BuiltinsNullLiteralTest from "./NullLiteralStatic.test";
import BuiltinsUndefinedLiteralTest from "./UndefinedLiteralStatic.test";
import ArrayBuffer1Test from "./ArrayBuffer/ArrayBufferStatic1.test";
import ArrayBuffer2Test from "./ArrayBuffer/ArrayBufferStatic2.test";
import ArrayBuffer4Test from "./ArrayBuffer/ArrayBufferStatic4.test";
import BuiltinsAsIntNTest from "./BigInt/BigIntAsIntNStatic.test";
import BuiltinsAsUintNTest from "./BigInt/BigIntAsUintNStatic.test";
import BuiltinsBigIntLiteralTest from "./BigInt/BigIntLiteralStatic.test";

import builtinsBooleanConstructorTest from "./Boolean/BooleanConstructorStatic.test";
import BuiltinsBooleanLiteralTest from "./Boolean/BooleanLiteralStatic.test";
import builtinsBooleanToStringTest from "./Boolean/BooleanToStringStatic.test";
import builtinsBooleanValueOfTest from "./Boolean/BooleanValueOfStatic.test";

import IsFiniteTest from "./Global/IsFiniteStatic.test";
import IsNaNTest from "./Global/IsNaNStatic.test";
import NaNTest from "./Global/NaNStatic.test";
import ParseFloatTest from "./Global/ParseFloatStatic.test";
import ParseIntTest from "./Global/ParseIntStatic.test";

import BuiltinsMultilineStringLiteralTest from "./String/MultilineStringLiteralStatic.test";
import BuiltinsStringLiteralTest from "./String/StringLiteralStatic.test";
import builtinsStringPrototypeTest from "./String/StringPrototype1Static.test";
import builtinsStringPrototypebTest from "./String/StringPrototype2Static.test";
import BuiltinsStringPrototypeTest from "./String/StringPrototype3Static.test";

import BuiltinsPartialUtilityTypeTest from "./Utility/PartialUtilityStatic.test";
import BuiltinsPrivateFieldsUtilityTypeTest from "./Utility/PrivateFielldUtilityStatic.test";
import BuiltinsReadonlyUtilityTypeTest from "./Utility/ReadOnlyUtilityStatic.test";
import BuiltinsRecordUtilityTypeTest from "./Utility/RecordUtilityStatic.test";
import BuiltinsRequiredUtilityTypeTest from "./Utility/RequiredUtilityStatic.test";

import builtinsGenericsActTest from "./Generics/GenericsActStatic.test";
import builtinsGenericsDefaultTest from "./Generics/GenericsDefaultStatic.test";
import builtinsGenericsFormatTest from "./Generics/GenericsFormatStatic.test";

export default function testsuite() {
  builtinsRegExpConstructorTest();
  builtinsRegExpInstancePropTest();
  builtinsRegExpSymbolMatchTest();
  builtinsRegExpSymbolReplaceTest();
  builtinsRegExpSymbolSearchTest();
  builtinsRegExpSymbolSplitTest();
  builtinsRegExpTestTest();
  builtinsRegExpToStringTest();

  BuiltinsCharLiteralTest();
  BuiltinsFloatLiteralTest();
  BuiltinsNullLiteralTest();
  BuiltinsUndefinedLiteralTest();

  ArrayBuffer1Test();
  ArrayBuffer2Test();
  ArrayBuffer4Test();

  BuiltinsAsIntNTest();
  BuiltinsAsUintNTest();
  BuiltinsBigIntLiteralTest();

  builtinsBooleanConstructorTest();
  BuiltinsBooleanLiteralTest();
  builtinsBooleanToStringTest();
  builtinsBooleanValueOfTest();

  IsFiniteTest();
  IsNaNTest();
  NaNTest();
  ParseFloatTest();
  ParseIntTest();

  BuiltinsMultilineStringLiteralTest();
  BuiltinsStringLiteralTest();
  builtinsStringPrototypeTest();
  builtinsStringPrototypebTest();
  BuiltinsStringPrototypeTest();

  BuiltinsPartialUtilityTypeTest();
  BuiltinsPrivateFieldsUtilityTypeTest();
  BuiltinsReadonlyUtilityTypeTest();
  BuiltinsRecordUtilityTypeTest();
  BuiltinsRequiredUtilityTypeTest();

  builtinsGenericsActTest();
  builtinsGenericsDefaultTest();
  builtinsGenericsFormatTest();
}