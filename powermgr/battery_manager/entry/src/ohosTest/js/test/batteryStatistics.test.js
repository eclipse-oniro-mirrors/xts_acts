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

import batteryStats from '@ohos.batteryStatistics';
import { describe, it, expect } from '@ohos/hypium'

const ERROR_CODE = 202;

export default function BatteryStatisticsTest() {
describe('BatteryStatisticsTest', function () {
    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0040
     * @tc.name testSystem_API_Test_batteryStats_Manager_0100
     * @tc.desc Test the third-party application call getBatteryStats will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_batteryStats_Manager_0100', 0, async function (done) {
        let TAG = 'System_API_Test_batteryStats_Manager_0100';
        try {
            batteryStats.getBatteryStats()
            .then((data) => {
                console.info(TAG + ' info: ' + data);
                expect(data === null).assertTrue();
                done();
            })
            .catch((err) => {
                console.info(TAG + ` getBatteryStats err: ${err.code}  ${err.message}`);
                expect(err.code).assertEqual(ERROR_CODE);
                done();
            });
        } catch (error) {
            console.info(TAG + ` getBatteryStats err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0050
     * @tc.name testSystem_API_Test_batteryStats_Manager_0200
     * @tc.desc Test the third-party application call getBatteryStats will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_batteryStats_Manager_0200', 0, async function (done) {
        let TAG = 'System_API_Test_batteryStats_Manager_0200';
        try {
            batteryStats.getBatteryStats((err, data) => {
                if (typeof err === 'undefined') {
                    console.info(TAG + 'battery statistics info: ' + data);
                    expect().assertFail();
                } else {
                    console.info(TAG + ` getBatteryStats err: ${err.code}  ${err.message}`);
                    expect(err.code).assertEqual(ERROR_CODE);
                }
                done();
            });
        } catch (error) {
            console.info(TAG + ` getBatteryStats err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0050
     * @tc.name testSystem_API_Test_batteryStats_Manager_0300
     * @tc.desc Test the third-party application call getAppPowerValue will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_batteryStats_Manager_0300', 0, async function (done) {
        let TAG = 'System_API_Test_batteryStats_Manager_0300';
        try {
            let value = batteryStats.getAppPowerValue(10021);
            console.info(TAG + 'battery statistics value of app is: ' + value);
        } catch (error) {
            console.info(TAG + ` getAppPowerValue err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0050
     * @tc.name testSystem_API_Test_batteryStats_Manager_0400
     * @tc.desc Test the third-party application call getAppPowerPercent will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_batteryStats_Manager_0400', 0, async function (done) {
        let TAG = 'System_API_Test_batteryStats_Manager_0400';
        try {
            let percent = batteryStats.getAppPowerPercent(10021);
            console.info(TAG + 'battery statistics percent of app is: ' + percent);
        } catch (error) {
            console.info(TAG + ` getAppPowerPercent err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0050
     * @tc.name testSystem_API_Test_batteryStats_Manager_0500
     * @tc.desc Test the third-party application call getHardwareUnitPowerValue will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_batteryStats_Manager_0500', 0, async function (done) {
        let TAG = 'System_API_Test_batteryStats_Manager_0500';
        try {
            let value = batteryStats.getHardwareUnitPowerValue(batteryStats.ConsumptionType.CONSUMPTION_TYPE_USER);
            console.info(TAG + 'battery statistics value of hardware is: ' + value);
        } catch (error) {
            console.info(TAG + ` getHardwareUnitPowerValue err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0050
     * @tc.name testSystem_API_Test_batteryStats_Manager_0600
     * @tc.desc Test the third-party application call getHardwareUnitPowerPercent will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_batteryStats_Manager_0600', 0, async function (done) {
        let TAG = 'System_API_Test_batteryStats_Manager_0600';
        try {
            let value = batteryStats.getHardwareUnitPowerPercent(batteryStats.ConsumptionType.CONSUMPTION_TYPE_WIFI);
            console.info(TAG + 'battery statistics percent of hardware is: ' + value);
        } catch (error) {
            console.info(TAG + ` getHardwareUnitPowerPercent err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })
})
}
