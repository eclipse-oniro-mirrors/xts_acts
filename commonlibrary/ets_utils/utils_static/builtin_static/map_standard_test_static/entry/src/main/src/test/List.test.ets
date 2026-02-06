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


import MapConstructorTest from "./MapConstructorStatic.test";
import MapClearTest from "./MapClearStatic.test";
import MapDeleteTest from "./MapDeleteStatic.test";
import MapEntriesTest from "./MapEntriesStatic.test";
import MapForeachTest from "./MapForeachStatic.test";
import MapGetTest from "./MapGetStatic.test";
import MapHasTest from "./MapHasStatic.test";
import MapValueTest from "./MapValuesStatic.test";

export default function testsuite() {
  MapConstructorTest();
  MapClearTest();
  MapDeleteTest();
  MapEntriesTest();
  MapForeachTest();
  MapGetTest();
  MapHasTest();
  MapValueTest();
}