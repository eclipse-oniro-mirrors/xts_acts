/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import power from '@ohos.power';

import { describe, it, expect } from '@ohos/hypium'

export default function powerManagerSuspendTest() {
describe('powerManagerSuspendTest', function () {
    console.log("*************Power Suspend Unit Test Begin*************");

    /**
     * @tc.number power_js_001
     * @tc.name power_Suspend_Device_JSTest001
     * @tc.desc Device reboot interface verification
     */
        it('power_Suspend_Device_JSTest001', 0, async function (done) {
            console.info('forcesuspend start');
            power.wakeupDevice("power_Suspend_Device_JSTest001");
            power.suspend(true);
            let isScreenOn =  await power.isScreenOn();
            console.info('power_Suspend_Device_JSTest001' + isScreenOn);
            expect(isScreenOn).assertFalse();
            done();
        })
})}
