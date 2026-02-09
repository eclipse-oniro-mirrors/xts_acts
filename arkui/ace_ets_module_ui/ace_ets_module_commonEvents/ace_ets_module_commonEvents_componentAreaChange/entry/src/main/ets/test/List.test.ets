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

import appearJsunit from './onAppearTest/AppearJsunit.test';
import areaChangeJsunit from './onAreaChangeTest/AreaChangeJsunit.test';
import uiAppearanceALWAYS_DARKJsunit from './onAppearTest/uiAppearance.test.ets';
import aboutToAppearTest from './onAppearTest/ComAttr_aboutToAppear.test';
import onAttachTest from './onAttachTest/onAttach.test';
import onVisibleTest from "./onVisiable/onVisibleAreaApproximateChange.test";
import onVisiable from './onVisiable/onVisiable.test';
import measureFromViewportTest from "./onVisiable/measureFromViewport.test";

export default function testsuite() {
  appearJsunit();
  areaChangeJsunit();
  aboutToAppearTest();
  onAttachTest();
  onVisiable();
  onVisibleTest();
  measureFromViewportTest();
}