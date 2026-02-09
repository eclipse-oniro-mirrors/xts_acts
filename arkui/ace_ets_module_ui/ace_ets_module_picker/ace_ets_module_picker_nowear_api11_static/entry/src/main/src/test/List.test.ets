'use static';
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
import SelectTest from './SelectTest/Select.test';
import calendarpicker from './CalendarPickerTest/calendarpicker';
import select from './SelectTest/Select2.test';
import SelectAttr from './SelectTest/SelectAttr.test';
import selectJsunit from './SelectTest/SelectJsunit1.test';
import menuBackgroundBlurStyle from './SelectTest/menuBackgroundBlurStyle.test';
import menuBackgroundColor from './SelectTest/menuBackgroundColor.test';
import selectOnSelectJsunit from './SelectTest/select3.test';
import selectmenuTest from './SelectTest/SelectMenu.test';

export default function testsuite() {
  SelectTest();
  calendarpicker()
  SelectAttr()
  selectJsunit()
  menuBackgroundBlurStyle()
  menuBackgroundColor()
  selectOnSelectJsunit()
  selectmenuTest()
  select()
}
