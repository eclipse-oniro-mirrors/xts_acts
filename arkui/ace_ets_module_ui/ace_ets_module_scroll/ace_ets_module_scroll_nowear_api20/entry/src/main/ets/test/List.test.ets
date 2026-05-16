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
import barMarginFlow from './WaterFlowTest/barMarginFlow.test';
import focusWrapModeList from './ListTest/focusWrapModeList.test';
import focusWrapModeList2 from './ListTest/focusWrapModeList2.test';
import focusWrapDefault from './GridTest/focusWrapDefault.test';
import focusWrapWrap from './GridTest/focusWrapWrap.test';

export default function testsuite() {
  barMarginFlow()
  focusWrapModeList();
  focusWrapModeList2();
  focusWrapDefault()
  focusWrapWrap()
}