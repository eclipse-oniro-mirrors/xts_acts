/*
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

import WantAgentTest from './WantAgent.test'
import AbilityDelegatorTest from './AbilityDelgator.test'
import StartChildProcessTest from './StartChildProcess.test'
import UiAbilityContextStartAbility from './uiabilitycontextstartability.test'
import UIAbilityContexttest from './UIAbilityContexttest.test'
import AbilityBase_UIAbilityContext from './AbilityBase_UIAbilityContext.test'
export default function testsuite() {
  WantAgentTest();
  AbilityDelegatorTest();
  StartChildProcessTest();
  UiAbilityContextStartAbility();
  UIAbilityContexttest();
  AbilityBase_UIAbilityContext()
}