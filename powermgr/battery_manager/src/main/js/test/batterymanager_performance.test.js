/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import batteryInfo from '@ohos.batteryInfo';
import { describe, it, expect } from '@ohos/hypium';

export default function BatteryManagerPerformanceTest() {
describe('BatteryManagerPerformanceTest', function () {

    console.log("*************Edited Battery Performance Test Begin*************");
    const MAXNUM = 1000;
    const MS_TO_US = 1000;
    const LIMIT_TIME = 1000;
    const HEALTH_LIMIT_TIME = 350;

    /**
     * @tc.number BatteryPerformance_001
     * @tc.name battery_temperature_test
     * @tc.desc Battery acquisition kit
     */
    it('BatteryPerformance_001', 0, function () {
        let startTime = new Date().getTime();
        for (let i = 0; i < MAXNUM; i++) {
            batteryInfo.batteryTemperature;
        }

        let waitTime = new Date().getTime() - startTime;
        let avgTime = waitTime / MAXNUM * MS_TO_US; //us
        console.info(`BATTERY_Performance_001: Promise: batteryInfo.batteryTemperature Average Time : ${waitTime}`);
        avgTime < LIMIT_TIME ? expect(true).assertTrue() : expect(false).assertTrue();
    })

    /**
     * @tc.number BatteryPerformance_004
     * @tc.name battery_pluggedtype_test
     * @tc.desc Battery acquisition kit
     */
    it('BatteryPerformance_004', 0, function () {
        let startTime = new Date().getTime();
        for (let i = 0; i < MAXNUM; i++) {
            batteryInfo.pluggedType;
        }

        let waitTime = new Date().getTime() - startTime;
        let avgTime = waitTime / MAXNUM * MS_TO_US; //us
        console.info(`BatteryPerformance_004: Promise: batteryInfo.pluggedType Average Time : ${waitTime}`);
        avgTime < LIMIT_TIME ? expect(true).assertTrue() : expect(false).assertTrue();
    })

    /**
     * @tc.number BatteryPerformance_005
     * @tc.name battery_technology_test
     * @tc.desc Battery acquisition kit
     */
    it('BatteryPerformance_005', 0, function () {
        let startTime = new Date().getTime();
        for (let i = 0; i < MAXNUM; i++) {
            batteryInfo.technology;
        }

        let waitTime = new Date().getTime() - startTime;
        let avgTime = waitTime / MAXNUM * MS_TO_US; //us
        console.info(`BatteryPerformance_005: Promise: batteryInfo.technology Average Time : ${waitTime}`);
        avgTime < LIMIT_TIME ? expect(true).assertTrue() : expect(false).assertTrue();
    })

    /**
     * @tc.number BatteryPerformance_006
     * @tc.name battery_capacity_test
     * @tc.desc Battery acquisition kit
     */
    it('BatteryPerformance_006', 0, function () {
        let startTime = new Date().getTime();
        for (let i = 0; i < MAXNUM; i++) {
            batteryInfo.batterySOC;
        }

        let waitTime = new Date().getTime() - startTime;
        let avgTime = waitTime / MAXNUM * MS_TO_US; //us
        console.info(`BatteryPerformance_006: Promise: batteryInfo.batterySOC Average Time : ${waitTime}`);
        avgTime < LIMIT_TIME ? expect(true).assertTrue() : expect(false).assertTrue();
    })

    /**
     * @tc.number BatteryPerformance_007
     * @tc.name battery_voltage_test
     * @tc.desc Battery acquisition kit
     */
    it('BatteryPerformance_007', 0, function () {
        let startTime = new Date().getTime();
        for (let i = 0; i < MAXNUM; i++) {
            batteryInfo.voltage;
        }

        let waitTime = new Date().getTime() - startTime;
        let avgTime = waitTime / MAXNUM * MS_TO_US; //us
        console.info(`BatteryPerformance_007: Promise: batteryInfo.voltage Average Time : ${waitTime}`);
        avgTime < LIMIT_TIME ? expect(true).assertTrue() : expect(false).assertTrue();
    })

    /**
     *@tc.number BatteryPerformance_008
     * @tc.name is_battery_present_test
     * @tc.desc Battery acquisition kit
     */
    it('BatteryPerformance_008', 0, function () {
        let startTime = new Date().getTime();
        for (let i = 0; i < MAXNUM; i++) {
            batteryInfo.isBatteryPresent;
        }

        let waitTime = new Date().getTime() - startTime;
        let avgTime = waitTime / MAXNUM * MS_TO_US; //us
        console.info(`BatteryPerformance_008: Promise: batteryInfo.isBatteryPresent Average Time : ${waitTime}`);
        avgTime < LIMIT_TIME ? expect(true).assertTrue() : expect(false).assertTrue();
    })

    /**
     *@tc.number BatteryPerformance_009
     * @tc.name battery_capacity_level_test
     * @tc.desc Battery acquisition kit
     */
    it('BatteryPerformance_009', 0, function () {
        let startTime = new Date().getTime();
        for (let i = 0; i < MAXNUM; i++) {
            batteryInfo.batteryCapacityLevel;
        }

        let waitTime = new Date().getTime() - startTime;
        let avgTime = waitTime / MAXNUM * MS_TO_US; //us
        console.info(`BatteryPerformance_009: Promise: batteryInfo.batteryCapacityLevel Average Time : ${waitTime}`);
        avgTime < LIMIT_TIME ? expect(true).assertTrue() : expect(false).assertTrue();
    })

    /**
     *@tc.number BatteryPerformance_010
     * @tc.name estimated_remaining_chargeTime_test
     * @tc.desc Battery acquisition kit
     */
    it('BatteryPerformance_010', 0, function () {
        let startTime = new Date().getTime();
        for (let i = 0; i < MAXNUM; i++) {
            batteryInfo.estimatedRemainingChargeTime;
        }

        let waitTime = new Date().getTime() - startTime;
        let avgTime = waitTime / MAXNUM * MS_TO_US; //us
        console.info(`BatteryPerformance_010: Promise: batteryInfo.estimatedRemainingChargeTime
            Average Time : ${waitTime}`);
        avgTime < LIMIT_TIME ? expect(true).assertTrue() : expect(false).assertTrue();
    })

    /**
     *@tc.number BatteryPerformance_011
     * @tc.name total_energy_test
     * @tc.desc Battery acquisition kit
     */
    it('BatteryPerformance_011', 0, function () {
        let startTime = new Date().getTime();
        for (let i = 0; i < MAXNUM; i++) {
            batteryInfo.totalEnergy;
        }

        let waitTime = new Date().getTime() - startTime;
        let avgTime = waitTime / MAXNUM * MS_TO_US; //us
        console.info(`BatteryPerformance_011: Promise: batteryInfo.totalEnergy Average Time : ${waitTime}`);
        avgTime < LIMIT_TIME ? expect(true).assertTrue() : expect(false).assertTrue();
    })

    /**
     *@tc.number BatteryPerformance_012
     * @tc.name now_current_test
     * @tc.desc Battery acquisition kit
     */
    it('BatteryPerformance_012', 0, function () {
        let startTime = new Date().getTime();
        for (let i = 0; i < MAXNUM; i++) {
            batteryInfo.nowCurrent;
        }

        let waitTime = new Date().getTime() - startTime;
        let avgTime = waitTime / MAXNUM * MS_TO_US; //us
        console.info(`BatteryPerformance_012: Promise: batteryInfo.nowCurrent Average Time : ${waitTime}`);
        avgTime < LIMIT_TIME ? expect(true).assertTrue() : expect(false).assertTrue();
    })

    /**
     *@tc.number BatteryPerformance_013
     * @tc.name remaining_energy_test
     * @tc.desc Battery acquisition kit
     */
    it('BatteryPerformance_013', 0, function () {
        let startTime = new Date().getTime();
        for (let i = 0; i < MAXNUM; i++) {
            batteryInfo.remainingEnergy;
        }

        let waitTime = new Date().getTime() - startTime;
        let avgTime = waitTime / MAXNUM * MS_TO_US; //us
        console.info(`BatteryPerformance_013: Promise: batteryInfo.remainingEnergy Average Time : ${waitTime}`);
        avgTime < LIMIT_TIME ? expect(true).assertTrue() : expect(false).assertTrue();
    })
})
}