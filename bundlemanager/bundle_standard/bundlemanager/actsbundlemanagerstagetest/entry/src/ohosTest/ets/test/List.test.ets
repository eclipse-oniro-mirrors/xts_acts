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

import getProfileByAbility from './GetProfileByAbility.test.ets';
import getProfileByExtensionAbility from './GetProfileByExtensionAbility.test.ets';
import getBundleInfoForSelf from './GetBundleInfoForSelf.test.ets';
import getSecondModuleTest from './GetSecondModule.test.ets';
import isDefaultApplicationTest from './IsDefaultApplication.test.ets';
import PublicApiEightTest from './PublicApiEightTest.test.ets';
import PublicApiNineTest from './PublicApiNineTest.test.ets';

export default function testsuite() {
  getProfileByAbility();
  getProfileByExtensionAbility();
  getBundleInfoForSelf();
  getSecondModuleTest();
  isDefaultApplicationTest();
  PublicApiEightTest();
  PublicApiNineTest();
}