/*
* Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import preferencesCallBackTest from './PreferencesCallBackJsunit.test.js'
import preferencesHelperTest from './PreferencesHelperJsunit.test.js'
import preferencesPromiseTest from './PreferencesPromiseJsunit.test.js'
import storageCallBackTest from './StorageCallBackJsunit.test.js'
import storageHelperTest from './StorageHelperJsunit.test.js'
import storagePromiseTest from './StoragePromiseJsunit.test.js'
import storageSyncTest from './StorageSyncJsunit.test.js'
import systemStorageTest from './SystemStorageJsunit.test.js'
import preferencesV9CallbackTest from './V9PreferencesCallBackJsunit.test.js'
import preferencesV9PromiseTest from './V9PreferencesPromiseJsunit.test.js'
import PreferencesSyncTest from './PreferencesSyncJsunit.test.js'
import preferencesFlushTest from './PreferencesFlushJsunit.test.js'

export default function testsuite() {
    storageCallBackTest()
    storageHelperTest()
    storagePromiseTest()
    storageSyncTest()
    systemStorageTest()
    preferencesCallBackTest()
    preferencesHelperTest()
    preferencesPromiseTest()
    preferencesV9CallbackTest()
    preferencesV9PromiseTest()
    PreferencesSyncTest()
    preferencesFlushTest()
}
