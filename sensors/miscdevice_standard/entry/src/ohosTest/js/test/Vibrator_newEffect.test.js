/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import vibrator from '@ohos.vibrator'
import deviceInfo from '@ohos.deviceInfo'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function VibratorJsTest_misc_8() {
let isAvailable;
const ABILITYJUDGMENT = canIUse('SystemCapability.Sensors.MiscDevice');
describe("VibratorJsTest_misc_8", function () {
    beforeAll(async function (done) {
        /*
         * @tc.setup: setup invoked before all testcases
         */
        console.info('beforeAll called')
        console.info('VibratorJsTest_misc_8 Device type = ' + deviceInfo.deviceType);
        console.info('VibratorJsTest_misc_8 isAvailable = ' + isAvailable);
        try {
            const vibratorsList = vibrator.getVibratorInfoSync();
            if (ABILITYJUDGMENT === false || vibratorsList.length === 0 ||
                (vibratorsList.length !== 0 && vibratorsList.every(vibrator => !vibrator.isLocalVibrator))) {
                isAvailable = false;
                console.info('VibratorJsTest_misc_8 isAvailable ' + isAvailable);
                done()
            }else {
                isAvailable = true;
                console.info('VibratorJsTest_misc_8 isAvailable ' + isAvailable);
                done()
            }
        } catch(error) {
            console.error('VibratorJsTest_misc_8 exception :' + JSON.stringify(error))
            done()
        }
    })

    afterAll(function () {

        /*
         * @tc.teardown: teardown invoked after all testcases
         */
        console.info('afterAll called')
    })

    beforeEach(function () {

        /*
         * @tc.setup: setup invoked before each testcases
         */
        console.info('beforeEach called')
    })

    afterEach(function () {

        /*
         * @tc.teardown: teardown invoked after each testcases
         */
        console.info('afterEach called')
    })
    const EFFECT_IDSUCCESS = "haptic.notice.success"
    const EFFECT_IDFAIL = "haptic.notice.fail"
    const EFFECT_IDWARNING = "haptic.notice.warning"
    let TAG = ""

    /*
     * @tc.name:UniversalVibratorJsTest01
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_0100
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("UniversalVibratorJsTest01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "UniversalVibratorJsTest01"
        if (isAvailable) {
            let ret = vibrator.isSupportEffectSync(EFFECT_IDSUCCESS);
            console.info(TAG + "ret:" + ret);
            if(ret){
                vibrator.startVibration({
                    type: "preset",
                    effectId: EFFECT_IDSUCCESS,
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator EFFECT_IDSUCCESS error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator EFFECT_IDSUCCESS success');
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
            } else{
                console.log(TAG + ' is not supported.');
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
     * @tc.name:UniversalVibratorJsTest02
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_0200
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("UniversalVibratorJsTest02", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "UniversalVibratorJsTest02"
        if (isAvailable) {
            let ret1 = vibrator.isSupportEffectSync(EFFECT_IDFAIL);
            console.info(TAG + "ret1:" + ret1);
            if(ret1){
                vibrator.startVibration({
                    type: "preset",
                    effectId: EFFECT_IDFAIL,
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator EFFECT_IDFAIL error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator EFFECT_IDFAIL success');
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
            } else{
                console.log(TAG + ' is not supported.');
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
     * @tc.name:UniversalVibratorJsTest03
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_0300
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("UniversalVibratorJsTest03", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "UniversalVibratorJsTest03"
        if (isAvailable) {
            let ret2 = vibrator.isSupportEffectSync(EFFECT_IDWARNING);
            console.info(TAG + "ret2:" + ret2);
            if(ret2){
                vibrator.startVibration({
                    type: "preset",
                    effectId: EFFECT_IDWARNING,
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator EFFECT_IDWARNING error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator EFFECT_IDWARNING success');
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
            } else{
                console.log(TAG + ' is not supported.');
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
     * @tc.name:UniversalVibratorJsTest04
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_0400
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("UniversalVibratorJsTest04", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "UniversalVibratorJsTest04"
         if (isAvailable) {
            let ret2 = vibrator.isSupportEffectSync(EFFECT_IDWARNING);
            let ret1 = vibrator.isSupportEffectSync(EFFECT_IDFAIL);
            console.info(TAG + "ret1:" + ret1 + "ret2:" + ret2);
            if(ret1 && ret2){
                vibrator.startVibration({
                    type: "preset",
                    effectId: EFFECT_IDFAIL,
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator EFFECT_IDFAIL error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator EFFECT_IDFAIL success');
                    }
                });
                vibrator.startVibration({
                    type: "preset",
                    effectId: EFFECT_IDWARNING,
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator EFFECT_IDWARNING error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator EFFECT_IDWARNING success');
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
            } else{
                console.log(TAG + ' is not supported.');
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
     * @tc.name:UniversalVibratorJsTest05
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_0500
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("UniversalVibratorJsTest05", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "UniversalVibratorJsTest05"
         if (isAvailable) {
            let ret2 = vibrator.isSupportEffectSync(EFFECT_IDWARNING);
            let ret = vibrator.isSupportEffectSync(EFFECT_IDSUCCESS);
            console.info(TAG + "ret:" + ret + "ret2:" + ret2);
            if(ret && ret2){
                vibrator.startVibration({
                    type: "preset",
                    effectId: EFFECT_IDSUCCESS,
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator EFFECT_IDSUCCESS error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator EFFECT_IDSUCCESS success');
                    }
                });
                vibrator.startVibration({
                    type: "preset",
                    effectId: EFFECT_IDWARNING,
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator EFFECT_IDWARNING error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator EFFECT_IDWARNING success');
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
            } else{
                console.log(TAG + ' is not supported.');
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
     * @tc.name:UniversalVibratorJsTest06
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_0600
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("UniversalVibratorJsTest06", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "UniversalVibratorJsTest06"
         if (isAvailable) {
            let ret2 = vibrator.isSupportEffectSync(EFFECT_IDWARNING);
            let ret1 = vibrator.isSupportEffectSync(EFFECT_IDFAIL);
            console.info(TAG + "ret1:" + ret1 + "ret2:" + ret2);
            if(ret1 && ret2){
                vibrator.startVibration({
                    type: "preset",
                    effectId: EFFECT_IDWARNING,
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator EFFECT_IDWARNING error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator EFFECT_IDWARNING success');
                    }
                });
                vibrator.startVibration({
                    type: "preset",
                    effectId: EFFECT_IDFAIL,
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator EFFECT_IDFAIL error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator EFFECT_IDFAIL success');
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
            } else{
                console.log(TAG + ' is not supported.');
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
     * @tc.name:UniversalVibratorJsTest07
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_0700
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("UniversalVibratorJsTest07", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "UniversalVibratorJsTest07"
         if (isAvailable) {
            let ret = vibrator.isSupportEffectSync(EFFECT_IDSUCCESS);
            let ret1 = vibrator.isSupportEffectSync(EFFECT_IDFAIL);
            console.info(TAG + "ret:" + ret + "ret1:" + ret1);
            if(ret && ret1){
                vibrator.startVibration({
                    type: "preset",
                    effectId: EFFECT_IDSUCCESS,
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator EFFECT_IDSUCCESS error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator EFFECT_IDSUCCESS success');
                    }
                });
                vibrator.startVibration({
                    type: "preset",
                    effectId: EFFECT_IDFAIL,
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator EFFECT_IDFAIL error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator EFFECT_IDFAIL success');
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
            } else{
                console.log(TAG + ' is not supported.');
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
     * @tc.name:UniversalVibratorJsTest08
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_0800
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("UniversalVibratorJsTest08", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "UniversalVibratorJsTest08"
         if (isAvailable) {
            let ret = vibrator.isSupportEffectSync(EFFECT_IDSUCCESS);
            let ret2 = vibrator.isSupportEffectSync(EFFECT_IDWARNING);
            console.info(TAG + "ret:" + ret + "ret2:" + ret2);
            if(ret && ret2){
                vibrator.startVibration({
                    type: "preset",
                    effectId: EFFECT_IDWARNING,
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator EFFECT_IDWARNING error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator EFFECT_IDWARNING success');
                    }
                });
                vibrator.startVibration({
                    type: "preset",
                    effectId: EFFECT_IDSUCCESS,
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator EFFECT_IDSUCCESS error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator EFFECT_IDSUCCESS success');
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
            } else{
                console.log(TAG + ' is not supported.');
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
     * @tc.name:UniversalVibratorJsTest09
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_0900
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("UniversalVibratorJsTest09", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "UniversalVibratorJsTest09"
         if (isAvailable) {
            let ret = vibrator.isSupportEffectSync(EFFECT_IDSUCCESS);
            let ret2 = vibrator.isSupportEffectSync(EFFECT_IDWARNING);
            console.info(TAG + "ret:" + ret + "ret2:" + ret2);
            if(ret && ret2){
                vibrator.startVibration({
                    type: "preset",
                    effectId: EFFECT_IDSUCCESS,
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator success');
                    }
                });
                vibrator.startVibration({
                    type: "preset",
                    effectId: EFFECT_IDWARNING,
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator EFFECT_IDWARNING error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator EFFECT_IDWARNING success');
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
            } else{
                console.log(TAG + ' is not supported.');
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
     * @tc.name:UniversalVibratorJsTest10
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_1000
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("UniversalVibratorJsTest10", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "UniversalVibratorJsTest10"
         if (isAvailable) {
            let ret = vibrator.isSupportEffectSync(EFFECT_IDSUCCESS);
            let ret1 = vibrator.isSupportEffectSync(EFFECT_IDFAIL);
            let ret2 = vibrator.isSupportEffectSync(EFFECT_IDWARNING);
            console.info(TAG + "ret:" + ret + "ret1:" + ret1 + "ret2:" + ret2);
            if(ret && ret1 && ret2){
                vibrator.startVibration({
                    type: "preset",
                    effectId: EFFECT_IDWARNING,
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator EFFECT_IDWARNING error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator EFFECT_IDWARNING success');
                    }
                });
                vibrator.startVibration({
                    type: "preset",
                    effectId: EFFECT_IDFAIL,
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator EFFECT_IDFAIL error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator EFFECT_IDFAIL success');
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
                vibrator.startVibration({
                    type: "preset",
                    effectId: EFFECT_IDSUCCESS,
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator EFFECT_IDSUCCESS error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator EFFECT_IDSUCCESS success');
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
            } else{
                console.log(TAG + ' is not supported.');
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
     * @tc.name:UniversalVibratorJsTest11
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_1100
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("UniversalVibratorJsTest11", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "UniversalVibratorJsTest11"
         if (isAvailable) {
            let ret = vibrator.isSupportEffectSync(EFFECT_IDSUCCESS);
            let ret1 = vibrator.isSupportEffectSync(EFFECT_IDFAIL);
            let ret2 = vibrator.isSupportEffectSync(EFFECT_IDWARNING);
            console.info(TAG + "ret:" + ret + "ret1:" + ret1 + "ret2:" + ret2);
            if(ret && ret1 && ret2){
                vibrator.startVibration({
                    type: "preset",
                    effectId: EFFECT_IDWARNING,
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator EFFECT_IDWARNING error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator EFFECT_IDWARNING success');
                    }
                });
                vibrator.startVibration({
                    type: "preset",
                    effectId: EFFECT_IDSUCCESS,
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator EFFECT_IDSUCCESS error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator EFFECT_IDSUCCESS success');
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
                vibrator.startVibration({
                    type: "preset",
                    effectId: EFFECT_IDFAIL,
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator EFFECT_IDFAIL error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator EFFECT_IDFAIL success');
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
            } else{
                console.log(TAG + ' is not supported.');
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
     * @tc.name:UniversalVibratorJsTest12
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_1200
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("UniversalVibratorJsTest12", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "UniversalVibratorJsTest12"
         if (isAvailable) {
            let ret = vibrator.isSupportEffectSync(EFFECT_IDSUCCESS);
            let ret1 = vibrator.isSupportEffectSync(EFFECT_IDFAIL);
            let ret2 = vibrator.isSupportEffectSync(EFFECT_IDWARNING);
            console.info(TAG + "ret:" + ret + "ret1:" + ret1 + "ret2:" + ret2);
            if(ret && ret1 && ret2){
                vibrator.startVibration({
                    type: "preset",
                    effectId: EFFECT_IDSUCCESS,
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator EFFECT_IDSUCCESS error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator EFFECT_IDSUCCESS success');
                    }
                });
                vibrator.startVibration({
                    type: "preset",
                    effectId: EFFECT_IDFAIL,
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator EFFECT_IDFAIL error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator EFFECT_IDFAIL success');
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
                vibrator.startVibration({
                    type: "preset",
                    effectId: EFFECT_IDWARNING,
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator EFFECT_IDWARNING error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator EFFECT_IDWARNING success');
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
            } else{
                console.log(TAG + ' is not supported.');
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
     * @tc.name:ReliabilityVibratorJsTest13
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Reliability_Test_0600
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("ReliabilityVibratorJsTest13", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "ReliabilityVibratorJsTest13"
         if (isAvailable) {
            let ret = vibrator.isSupportEffectSync(EFFECT_IDSUCCESS);
            console.info(TAG + "ret:" + ret);
            if(ret){
                for(let times = 1; times <= 100; times++){
                    await vibrator.startVibration({
                        type: "preset",
                        effectId: EFFECT_IDSUCCESS,
                        count: 1,
                        intensity: 50,
                    }, {
                        usage: "unknown"
                    }, (error) => {
                        if (error) {
                            console.info(TAG + ' vibrator error:' + error);
                            expect(false).assertTrue();
                        } else {
                            console.info(TAG + ' vibrator success');
                        }
                    });
                    console.info(TAG + ' vibrator times:' + times);
                }
                console.info(TAG + " end");
                done();
            } else{
                console.log(TAG + ' is not supported.');
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
     * @tc.name:ReliabilityVibratorJsTest14
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Reliability_Test_0700
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("ReliabilityVibratorJsTest14", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "ReliabilityVibratorJsTest14"
         if (isAvailable) {
            let ret1 = vibrator.isSupportEffectSync(EFFECT_IDFAIL);
            console.info(TAG + "ret1:" + ret1);
            if(ret1){
                for(let times = 1; times <= 100; times++){
                    await vibrator.startVibration({
                        type: "preset",
                        effectId: EFFECT_IDFAIL,
                        count: 1,
                        intensity: 50,
                    }, {
                        usage: "unknown"
                    }, (error) => {
                        if (error) {
                            console.info(TAG + ' vibrator error:' + error);
                            expect(false).assertTrue();
                        } else {
                            console.info(TAG + ' vibrator success');
                        }
                    });
                    console.info(TAG + ' vibrator times:' + times);
                }
                console.info(TAG + " end");
                done();
            } else{
                console.log(TAG + ' is not supported.');
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
     * @tc.name:ReliabilityVibratorJsTest15
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Reliability_Test_0800
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("ReliabilityVibratorJsTest15", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "ReliabilityVibratorJsTest15"
         if (isAvailable) {
            let ret2 = vibrator.isSupportEffectSync(EFFECT_IDWARNING);
            console.info(TAG + "ret2:" + ret2);
            if(ret2){
                for(let times = 1; times <= 100; times++){
                    await vibrator.startVibration({
                        type: "preset",
                        effectId: EFFECT_IDWARNING,
                        count: 1,
                        intensity: 50,
                    }, {
                        usage: "unknown"
                    }, (error) => {
                        if (error) {
                            console.info(TAG + ' vibrator error:' + error);
                            expect(false).assertTrue();
                        } else {
                            console.info(TAG + ' vibrator success');
                        }
                    });
                    console.info(TAG + ' vibrator times:' + times);
                }
                console.info(TAG + " end");
                done();
            } else{
                console.log(TAG + ' is not supported.');
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })
    })}
