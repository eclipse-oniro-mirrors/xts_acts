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
}
