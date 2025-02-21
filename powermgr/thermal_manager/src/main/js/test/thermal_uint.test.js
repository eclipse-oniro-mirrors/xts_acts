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

import thermal from "@ohos.thermal"
import { describe, it, expect } from '@ohos/hypium'

export default function ThermalUnit() {
describe('ThermalUnit', function () {
    console.log("*************Thermal API Test Begin*************");
    test1();
    test2();
    test3();
    test4();
    test5();
    test6();
    test7();
    test8();
    test9();
    test10();
    test11();
    test12();
    test13();
    console.log("*************Thermal API Test End*************");
})

function test1() {
    const MSEC_1000 = 1000;

    /* @tc.number SUB_PowerSystem_ThermalManager_JSTest_0010
     * @tc.name Thermal_JSTest0010
     * @tc.desc Thermal acquisition kit
     */
    it('Thermal_JSTest0010', 0, async function (done) {
        console.info("enter");
        await new Promise((resolve, reject) => {
            setTimeout(() => {
                let cold = thermal.getThermalLevel();
                console.info("cold level is: " + cold);
                expect(cold >= thermal.ThermalLevel.COOL && cold <= thermal.ThermalLevel.EMERGENCY).assertTrue();
                resolve();
                done();
            }, MSEC_1000 * 1);
        })
    })
}

function test2() {
    const MSEC_1000 = 1000;

    /* @tc.number SUB_PowerSystem_ThermalManager_JSTest_0020
     * @tc.name Thermal_JSTest0020
     * @tc.desc Thermal acquisition kit
     */
    it('Thermal_JSTest0020', 0, async function (done) {
        await new Promise((resolve, reject) => {
            setTimeout(() => {
                let warm = thermal.getThermalLevel();
                console.info("warm level is: " + warm);
                expect(warm >= thermal.ThermalLevel.COOL && warm <= thermal.ThermalLevel.EMERGENCY).assertTrue();
                resolve();
                done();
            }, MSEC_1000 * 1);
        })
    })
}

function test3() {
    const MSEC_1000 = 1000;

    /* @tc.number SUB_PowerSystem_ThermalManager_JSTest_0030
     * @tc.name Thermal_JSTest0030
     * @tc.desc Thermal acquisition kit
     */
    it('Thermal_JSTest0030', 0, async function (done) {
        await new Promise((resolve, reject) => {
            setTimeout(() => {
                let hot = thermal.getThermalLevel();
                console.info("hot level is: " + hot);
                expect(hot >= thermal.ThermalLevel.COOL && hot <= thermal.ThermalLevel.EMERGENCY).assertTrue();
                resolve();
                done();
            }, MSEC_1000 * 1);
        })
    })
}

function test4() {
    const MSEC_1000 = 1000;

    /* @tc.number SUB_PowerSystem_ThermalManager_JSTest_0040
     * @tc.name Thermal_JSTest0040
     * @tc.desc Thermal acquisition kit
     */
    it('Thermal_JSTest0040', 0, async function (done) {
        await new Promise((resolve, reject) => {
            setTimeout(() => {
                let overheated = thermal.getThermalLevel();
                console.info("overheated level is: " + overheated);
                expect(overheated >= thermal.ThermalLevel.COOL &&
                    overheated <= thermal.ThermalLevel.EMERGENCY).assertTrue();
                resolve();
                done();
            }, MSEC_1000 * 1);
        })
    })
}

function test5() {
    const MSEC_1000 = 1000;

    /* @tc.number SUB_PowerSystem_ThermalManager_JSTest_0050
     * @tc.name Thermal_JSTest0050
     * @tc.desc Thermal acquisition kit
     */
    it('Thermal_JSTest0050', 0, async function (done) {
        await new Promise((resolve, reject) => {
            setTimeout(() => {
                let warning = thermal.getThermalLevel();
                console.info("warning level is: " + warning);
                expect(warning >= thermal.ThermalLevel.COOL && warning <= thermal.ThermalLevel.EMERGENCY).assertTrue();
                resolve();
                done();
            }, MSEC_1000 * 1);
        })
    })
}

function test6() {
    const MSEC_1000 = 1000;

    /* @tc.number SUB_PowerSystem_ThermalManager_JSTest_0060
     * @tc.name Thermal_JSTest0060
     * @tc.desc Thermal acquisition kit
     */
    it('Thermal_JSTest0060', 0, async function (done) {
        await new Promise((resolve, reject) => {
            setTimeout(() => {
                let emergency = thermal.getThermalLevel();
                console.info("emergency level is: " + emergency);
                expect(emergency >= thermal.ThermalLevel.COOL &&
                    emergency <= thermal.ThermalLevel.EMERGENCY).assertTrue();
                resolve();
                done();
            }, MSEC_1000 * 1);
        })
    })
}

function test7() {
    const MSEC_1000 = 1000;

    /* @tc.number SUB_PowerSystem_ThermalManager_JSTest_0070
     * @tc.name Thermal_JSTest0070
     * @tc.desc Thermal acquisition kit
     */
    it('Thermal_JSTest0070', 0, async function (done) {
        thermal.subscribeThermalLevel((cool) => {
            console.info("warm level is: " + cool);
            expect(cool >= thermal.ThermalLevel.COOL && cool <= thermal.ThermalLevel.EMERGENCY).assertTrue();
        })
        await new Promise((resolve, reject) => {
            setTimeout(() => {
                thermal.unsubscribeThermalLevel(() => {
                    console.info("unsubscribe successfully!");
                });
                resolve();
            }, MSEC_1000 * 4);
        })
        done();
    })
}

function test8() {
    const MSEC_1000 = 1000;

    /* @tc.number SUB_PowerSystem_ThermalManager_JSTest_0080
     * @tc.name Thermal_JSTest0080
     * @tc.desc Thermal acquisition kit
     */
    it('Thermal_JSTest0080', 0, async function (done) {
        thermal.subscribeThermalLevel((warm) => {
            console.info("warm level is: " + warm);
            expect(warm >= thermal.ThermalLevel.COOL && warm <= thermal.ThermalLevel.EMERGENCY).assertTrue();
        })
        await new Promise((resolve, reject) => {
            setTimeout(() => {
                thermal.unsubscribeThermalLevel(() => {
                    console.info("unsubscribe successfully!");
                });
                resolve();
            }, MSEC_1000 * 4);
        })
        done();
    })
}

function test9() {
    const MSEC_1000 = 1000;

    /* @tc.number SUB_PowerSystem_ThermalManager_JSTest_0090
     * @tc.name Thermal_JSTest0090
     * @tc.desc Thermal acquisition kit
     */
    it('Thermal_JSTest0090', 0, async function (done) {
        thermal.subscribeThermalLevel((hot) => {
            console.info("hot level is: " + hot);
            expect(hot >= thermal.ThermalLevel.COOL && hot <= thermal.ThermalLevel.EMERGENCY).assertTrue();
        })
        await new Promise((resolve, reject) => {
            setTimeout(() => {
                thermal.unsubscribeThermalLevel(() => {
                    console.info("unsubscribe successfully!");
                });
                resolve();
            }, MSEC_1000 * 2);
        })
        done();
    })

}

function test10() {
    const MSEC_1000 = 1000;

    /* @tc.number SUB_PowerSystem_ThermalManager_JSTest_0100
     * @tc.name Thermal_JSTest0100
     * @tc.desc Thermal acquisition kit
     */
    it('Thermal_JSTest0100', 0, async function (done) {
        thermal.subscribeThermalLevel((overheated) => {
            console.info("overheated level is: " + overheated);
            expect(overheated >= thermal.ThermalLevel.COOL &&
                overheated <= thermal.ThermalLevel.EMERGENCY).assertTrue();
        })
        await new Promise((resolve, reject) => {
            setTimeout(() => {
                thermal.unsubscribeThermalLevel(() => {
                    console.info("unsubscribe successfully!");
                });
                resolve();
            }, MSEC_1000 * 2);
        })
        done();
    })
}

function test11() {
    const MSEC_1000 = 1000;

    /* @tc.number SUB_PowerSystem_ThermalManager_JSTest_0110
     * @tc.name Thermal_JSTest0110
     * @tc.desc Thermal acquisition kit
     */
    it('Thermal_JSTest0110', 0, async function (done) {
        thermal.subscribeThermalLevel((warning) => {
            console.info("warning level is: " + warning);
            expect(warning >= thermal.ThermalLevel.COOL && warning <= thermal.ThermalLevel.EMERGENCY).assertTrue();
        })
        await new Promise((resolve, reject) => {
            setTimeout(() => {
                thermal.unsubscribeThermalLevel(() => {
                    console.info("unsubscribe successfully!");
                });
                resolve();
            }, MSEC_1000 * 4);
        })
        done();
    })
}

function test12() {
    const MSEC_1000 = 1000;

    /* @tc.number SUB_PowerSystem_ThermalManager_JSTest_0120
     * @tc.name Thermal_JSTest0120
     * @tc.desc Thermal acquisition kit
     */
    it('Thermal_JSTest0120', 0, async function (done) {
        thermal.subscribeThermalLevel((emergency) => {
            console.info("emergency level is: " + emergency);
            expect(emergency >= thermal.ThermalLevel.COOL && emergency <= thermal.ThermalLevel.EMERGENCY).assertTrue();
        })
        await new Promise((resolve, reject) => {
            setTimeout(() => {
                thermal.unsubscribeThermalLevel(() => {
                    console.info("unsubscribe successfully!");
                });
                resolve();
            }, MSEC_1000 * 4);
        })
        done();
    })
}

function test13() {
    const MSEC_1000 = 1000;

    /* @tc.number SUB_PowerSystem_ThermalManager_JSTest_0130
     * @tc.name Thermal_JSTest0130
     * @tc.desc Thermal acquisition kit
     */
    it('Thermal_JSTest0130', 0, async function (done) {
        thermal.subscribeThermalLevel((cool) => {
            console.info("cool level is: " + cool);
            expect(cool >= thermal.ThermalLevel.COOL && cool <= thermal.ThermalLevel.EMERGENCY).assertTrue();
        })
        await new Promise((resolve, reject) => {
            setTimeout(() => {
                thermal.unsubscribeThermalLevel(() => {
                    console.info("unsubscribe successfully!");
                });
                resolve();
            }, MSEC_1000 * 4);
        })
        done();
    })
}}
