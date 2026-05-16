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
import SelectAttr from './SelectTest/SelectAttr.test'
import selectoptionwithJsSuit from './SelectTest/selectoptionwithJsSuit.test';
import SelectTest from './SelectTest/Select.test';
import selectJsunit from './SelectTest/SelectJsunit1.test';
import menuBackgroundBlurStyle from './SelectTest/menuBackgroundBlurStyle.test'
import menuBackgroundColor from './SelectTest/menuBackgroundColor.test'
import select from './SelectTest/Select';
import selectmenuTest from './SelectTest/SelectMenu';
import calendarpicker from './CalendarPickerTest/calendarpicker';
import selectOnSelectJsunit from './SelectTest/select3.test';

export default function testsuite() {
  SelectAttr()
  selectoptionwithJsSuit()
  SelectTest()
  selectJsunit()
  menuBackgroundBlurStyle()
  menuBackgroundColor()
  select()
  selectmenuTest()
  calendarpicker()
  selectOnSelectJsunit()
}