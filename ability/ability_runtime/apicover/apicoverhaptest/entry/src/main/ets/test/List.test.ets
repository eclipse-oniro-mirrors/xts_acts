/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import apiCoverAbility from './ApiCoverAbility.test';
import newApiCoverAbility from './NewApiCoverAbility.test';
import verificationTest from './VerificationTest';
import wantAgentCover from './WantAgentCover.test';
import contextEnvironmentTest from './ContextEnvironmentTest.test';
import common from '@ohos.app.ability.common';
import UIContextWindowStageTest from './UIContextWindowStage.test';

export default function List() {
  apiCoverAbility();
  newApiCoverAbility();
  verificationTest();
  wantAgentCover();
  contextEnvironmentTest(AppStorage.get<common.ApplicationContext>("applicationContext")!);
  UIContextWindowStageTest();
}
