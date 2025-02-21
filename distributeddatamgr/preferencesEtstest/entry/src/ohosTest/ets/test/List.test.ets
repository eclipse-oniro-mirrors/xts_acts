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

import preferencesCallBackTest from './PreferencesCallBackJsunit.test';
import preferencesFlushTest from './PreferencesFlushJsunit.test';
import preferencesHelperTest from './PreferencesHelperJsunit.test';
import preferencesPromiseTest from './PreferencesPromiseJsunit.test';
import PreferencesSyncTest from './PreferencesSyncJsunit.test';
import preferencesV9CallbackTest from './PreferencesV9CallBackJsunit.test';
import preferencesV9PromiseTest from './PreferencesV9PromiseJsunit.test';

export default function testsuite() {
  preferencesCallBackTest()
  preferencesFlushTest()
  preferencesHelperTest()
  preferencesPromiseTest()
  PreferencesSyncTest()
  preferencesV9CallbackTest()
  preferencesV9PromiseTest()
}

