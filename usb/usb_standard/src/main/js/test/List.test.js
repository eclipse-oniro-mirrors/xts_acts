/*
 * Copyright (c) 2021-2022 Huawei Device Co., Ltd.
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
import UsbPortAndFunctionsJsFunctionsTest from './UsbPortAndFunctionJsunit.test.js'
import UsbPortJsFunctionsTest from './UsbPortJsunit.test.js'
import UsbPortJsFunctionsTestEx from './UsbPortJsunitEx.test.js'
import UsbFunctionsJsFunctionsTestEx from './UsbFunctionsJsunitEx.test.js'
import UsbFunctionsJsFunctionsTest from './UsbFunctionsJsunit.test.js'
import UsbDevicePipeJsFunctionsTest from './UsbDevicePipeJsunit.test.js'
import UsbDevicePipeJsFunctionsTestEx from './UsbDevicePipeJsunitEx.test.js'
import UsbCoreJsFunctionsTest from './UsbCoreJsunit.test.js'
import UsbCoreJsFunctionsTestEx from './UsbCoreJsunitEx.test.js'
/* host test case */
export default function testsuite() {
UsbCoreJsFunctionsTest()
UsbCoreJsFunctionsTestEx()
UsbDevicePipeJsFunctionsTest()
UsbDevicePipeJsFunctionsTestEx()
UsbFunctionsJsFunctionsTest()
UsbFunctionsJsFunctionsTestEx()
// UsbPortAndFunctionsJsFunctionsTest()
UsbPortJsFunctionsTest()
UsbPortJsFunctionsTestEx()
}
