/*
* Copyright (c) 2022 Huawei Device Co., Ltd.
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

import abilityManagerTest from './AbilityManager.test'
import appManagerTest from './AppManager.test'
import missionManagerTest from './MissionManager.test'
import wantAgentTest from './WantAgent.test'
import formHostTest from './FormHost.test'
import formProviderTest from './FormProvider.test'
import abilityContextTest from './AbilityContext.test'
import contextTest from './Context.test'

export default function testsuite() {
  abilityManagerTest();
  appManagerTest();
  missionManagerTest();
  wantAgentTest();
  formHostTest();
  formProviderTest();
  abilityContextTest();
  contextTest();
}