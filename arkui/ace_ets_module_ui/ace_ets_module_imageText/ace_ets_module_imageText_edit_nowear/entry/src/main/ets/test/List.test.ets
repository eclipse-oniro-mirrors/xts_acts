/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import PresetTest from './Preset.test';
import search_center from './SearchApi11Test/search_center.test'
import search_gesture from './SearchApi11Test/search_gesture.test';
import SearchJsunit from './SearchApi11Test/SearchJsunit.test';
import searchTest from './SearchApi12Test/searchTest.test'

import textArea_center from './TextAreaApi11Test/textArea_center.test'
import textAreaBC1Jsunit from './TextAreaApi11Test/textAreaBC1Jsunit.test';
import textAreaUIJsunit from './TextAreaApi11Test/textAreaUIJsunit.test';
import setTextSelectionTest from './TextAreaApi12Test/setTextSelection.test'
import TextDeleteDirectionTest from "./TextAreaApi12Test/TextDeleteDirectionTest.test";

import textinputSec from './TextInputApi11Test/textinputSec'
import TextInputPageJsunit from './TextInputApi11Test/TextInputPageJsunit.test';


export default function testsuite() {
  PresetTest();
  search_center()        // Api11
  search_gesture()
  SearchJsunit()
  searchTest()           // Api12

  textArea_center()      // Api11
  textAreaBC1Jsunit()
  setTextSelectionTest() // Api12
  TextDeleteDirectionTest()

  textinputSec()         // Api11
  TextInputPageJsunit()
  textAreaUIJsunit()
}