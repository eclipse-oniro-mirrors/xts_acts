'use static';
/**
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

import themePageTest from "./theme/themePageTest.test";
import themePageToggleTest from "./theme/themePageToggleTest.test";
import themePageSliderTest from "./theme/themePageSliderTest.test";

import APIFontPrimaryTest from "./theme/APIFontPrimaryTest.test";
import themePageListTest from "./theme/themePageListTest.test";
export default function testsuite() {
  themePageTest();
  themePageToggleTest();
  themePageSliderTest();
  themePageListTest();
  
}