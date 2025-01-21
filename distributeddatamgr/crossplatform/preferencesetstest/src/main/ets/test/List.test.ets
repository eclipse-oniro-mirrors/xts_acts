/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import preferencescallback from './PreferencesCallBack.test'
import preferenceshelper from './PreferencesHelper.test'
import preferencespromise from './PreferencesPromise.test'
import preferencescallbackwitherror from './PreferencesCallBackWithError.test'
import preferencespromisewitherror from './PreferencesPromiseWithError.test'
import preferencesIgnoreTest from './PreferencesIgnore.test'


export default function testsuite() {
  preferencescallback()
  preferenceshelper()
  preferencespromise()
  preferencescallbackwitherror()
  preferencespromisewitherror()
  preferencesIgnoreTest()
}