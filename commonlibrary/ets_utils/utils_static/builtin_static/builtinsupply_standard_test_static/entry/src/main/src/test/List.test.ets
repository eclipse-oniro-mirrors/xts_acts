/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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


export default function testsuite() {
  builtinsRegExpConstructorTest();
  builtinsRegExpInstancePropTest();
  builtinsRegExpSymbolMatchTest();
  builtinsRegExpSymbolReplaceTest();
  builtinsRegExpSymbolSearchTest();
  builtinsRegExpSymbolSplitTest();
  builtinsRegExpTestTest();
  builtinsRegExpToStringTest();
}
