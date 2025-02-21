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

import searchMaxFontSize from "./component/searchMaxFontSize.test.ets";
import searchMinFontSize from "./component/serachMinFontSize.test.ets";
import searchDecoration from "./component/searchDecoration.test.ets";
import searchLetterSpacing from "./component/searchLetterSpacing.test.ets";
import searchLineHeight from "./component/searchLineHeight.test.ets";
import APISearchExample from "./component/APISearchExample.test.ets";
import MenuPolicy_HIDE_APITest from './CommonTest/SearchTest/Search_APITest/MenuPolicy_HIDE_APITest';
import MenuPolicy_SHOW_APITest from './CommonTest/SearchTest/Search_APITest/MenuPolicy_SHOW_APITest';
export default function testsuite() {
  searchMaxFontSize();
  searchMinFontSize();
  searchDecoration();
  searchLetterSpacing();
  searchLineHeight();
  APISearchExample();
  MenuPolicy_HIDE_APITest();
  MenuPolicy_SHOW_APITest();
}