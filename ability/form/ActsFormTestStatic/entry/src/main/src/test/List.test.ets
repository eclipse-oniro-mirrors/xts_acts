/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License");
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

import formExtensionAbilityTest from './FormExtensionAbility.test';
import formBindingDataTest from './FormBindingData.test';
import formProviderTest from './FormProvider.test';
import formLinkTest from './FormLink.test';
import formInfoTest from './FormInfo.test';
import formErrorTest from './FormError.test';
import OverflowApiCoverTest from './OverflowApiCoverTest.test';
import formHostTest from './FormHost.test';
import formAgentTest from './FormAgent.test';
import formObserverTest from './FormObserver.test';


export default function testsuite() {
  formExtensionAbilityTest();
  formBindingDataTest();
  formProviderTest();
  formLinkTest();
  formInfoTest();
  formErrorTest();
  OverflowApiCoverTest();
  formHostTest();
  formAgentTest();
  formObserverTest();
}