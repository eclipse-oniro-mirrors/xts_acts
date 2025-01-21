/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import brightness from '@ohos.brightness';
import { describe, it, expect } from '@ohos/hypium'

const ERROR_CODE = 202;

export default function brightnessTest() {
describe('brightnessTest', function () {
    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0050
     * @tc.name testSystem_API_Test_brightness_Manager_0100
     * @tc.desc Test the third-party application call setValue will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_brightness_Manager_0100', 0, async function (done) {
        let TAG = 'System_API_Test_brightness_Manager_0100';
        try {
            brightness.setValue(128);
        } catch (error) {
            console.info(TAG + ` setValue err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0050
     * @tc.name testSystem_API_Test_brightness_Manager_0200
     * @tc.desc Test the third-party application call setValue will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_brightness_Manager_0200', 0, async function (done) {
        let TAG = 'System_API_Test_brightness_Manager_0200';
        try {
            brightness.setValue(128, true);
        } catch (error) {
            console.info(TAG + ` setValue err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0060
     * @tc.name testSystem_API_Test_brightness_Manager_0300
     * @tc.desc Test the third-party application call setValue will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_brightness_Manager_0300', 0, async function (done) {
        let TAG = 'System_API_Test_brightness_Manager_0300';
        try {
            brightness.setValue(255, false);
        } catch (error) {
            console.info(TAG + ` setValue err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })
})
}
