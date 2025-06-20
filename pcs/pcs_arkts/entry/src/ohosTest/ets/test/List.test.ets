/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import developerModeTest from './DeveloperMode.test';
import hardwareTest from './Hardware.test';
import performanceTest from './Performance.test';
import securityTest from './Security.test';
import softwareTest from './Software.test';
import optionalSystemCapability from './OptionalSystemCapability.test';
export default function testsuite() {
  hardwareTest()
  developerModeTest()
  softwareTest()
  securityTest()
  performanceTest()
  optionalSystemCapability();
}