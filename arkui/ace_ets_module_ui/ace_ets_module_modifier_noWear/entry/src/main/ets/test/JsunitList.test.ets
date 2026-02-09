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

import calendarPickerJsunit from './CalendarPicker.test';
import columnSplitJsunit from './ColumnSplitJsunit.test';
import rowSplitJsunit from './RowSplitJsunit.test';
import selectJsunit from './SelectJsunit.test';
import sideBarContainerJsunit from './SideBarContainerJsunit.test';
import stepperItemJsunit from './StepperItem.test';
import waterFlowViewJsunit from './WaterFlowView.test';
import waterflowNestedScrollJsunit from './WaterFlowNestedScroll.test';

export default function testsuite() {
  calendarPickerJsunit();
  columnSplitJsunit();
  rowSplitJsunit();
  selectJsunit();
  sideBarContainerJsunit();
  stepperItemJsunit();
  waterflowNestedScrollJsunit();
  waterFlowViewJsunit();
}