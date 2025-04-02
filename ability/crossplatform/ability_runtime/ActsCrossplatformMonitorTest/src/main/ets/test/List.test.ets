/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import AbilityStageMonitorTest from "./AbilityStageMonitor.test";
import AbilityMonitorTest from "./AbilityMonitor.test";
import AbilityMonitorTest2 from "./AbilityMonitor2.test";
import AbilityStageMonitorTest2 from "./AbilityStageMonitor2.test";
export default function testsuite() {
  AbilityMonitorTest();
  AbilityMonitorTest2();
  AbilityStageMonitorTest2();
  AbilityStageMonitorTest();
}
