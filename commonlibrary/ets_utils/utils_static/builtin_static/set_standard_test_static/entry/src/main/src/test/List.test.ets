/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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


import SetSetTest from "./Set.test";
import SetAddTest from "./SetAdd.test";
import SetClearTest from "./SetClear.test";
import SetConstructorTest from "./SetConstructor.test";
import SetDeleteTest from "./SetDelete.test";
import SetEntriesTest from "./SetEntries.test";
import SetForeachTest from "./SetForeach.test";
import SetFromTest from "./SetFrom.test";
import SetHasTest from "./SetHas.test";
import SetKeysTest from "./SetKeys.test";
import SetSymbolIteratorTest from "./Symboliterator.test";

export default function testsuite() {
  SetSetTest();
  SetAddTest();
  SetClearTest();
  SetConstructorTest();
  SetDeleteTest();
  SetEntriesTest();
  SetForeachTest();
  SetFromTest();
  SetHasTest();
  SetKeysTest();
  SetSymbolIteratorTest();
}