/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import bluetoothBLETest from './BleGattManager.test.js'
import bluetoothBLETest4 from './BleGattManager401.test.js'
import bluetoothBLETest1 from './BleService.test.js'
import bluetoothBLETest2 from './BleAdvertiser.test.js'
import bluetoothBLETest5 from './BleAdvertiser401.test.js'
import bluetoothBLETest6 from './BleScanResult.test.js'
export default function testsuite() {
bluetoothBLETest()
bluetoothBLETest1()
bluetoothBLETest2()
bluetoothBLETest4()
bluetoothBLETest5()
bluetoothBLETest6()
}
