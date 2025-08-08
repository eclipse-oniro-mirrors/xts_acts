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
import vibrator from '@system.vibrator';
import deviceInfo from '@ohos.deviceInfo'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function Vibrator_ErrCode_Test() {
    let isAvailable;
    const ABILITYJUDGMENT = canIUse('SystemCapability.Sensors.MiscDevice');
    describe("Vibrator_ErrCode_Test", function () {
        beforeAll(async function (done) {
            /*
             * @tc.setup: setup invoked before all testcases
             */
            console.info('beforeAll called')
            console.info('Vibrator_ErrCode_Test Device type = ' + deviceInfo.deviceType);
            console.info('Vibrator_ErrCode_Test isAvailable = ' + isAvailable);
            try {
                if (deviceInfo.deviceType === '2in1' || ABILITYJUDGMENT == false) {
                    isAvailable = false;
                    console.info('Vibrator_ErrCode_Test isAvailable ' + isAvailable);
                    done()
                }else {
                    isAvailable = true;
                    console.info('Vibrator_ErrCode_Test isAvailable ' + isAvailable);
                    done()
                }
            } catch(error) {
                console.error('Vibrator_ErrCode_Test exception :' + JSON.stringify(error))
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

        const UNSUPPORTED = 801;
        let TAG = ""

        /*
        * @tc.name:Vibrator_ErrCode_Test_0001
        * @tc.desc:Verification results of the incorrect parameters of the test interface.
        * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0190
        * @tc.level:Level 0
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("Vibrator_ErrCode_Test_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('----------------------Vibrator_ErrCode_Test_0001---------------------------');
            TAG = "Vibrator_ErrCode_Test_0001"
            if (isAvailable) {
                vibrator.startVibration({
                    type: "preset",
                    effectId: 'haptic.clock.timer',
                    count: 5,
                }, {
                    id: 0,
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator  error:' + error);
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator success');
                    }
                    setTimeout(() => {
                        vibrator.stopVibration();
                        done();
                    }, 500);
                });
            } else {
                console.log(TAG + ' is not supported on this device.');
                expect(error.code).assertEqual(UNSUPPORTED);
                done();
            }
        })

        /*
        * @tc.name:Vibrator_ErrCode_Test_0002
        * @tc.desc:Verification results of the incorrect parameters of the test interface.
        * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0290
        * @tc.level:Level 0
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("Vibrator_ErrCode_Test_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            TAG = "Vibrator_ErrCode_Test_0002"
            console.info(TAG + ' isAvailable ' + isAvailable);
            if (isAvailable) {
                vibrator.startVibration({
                    type: "preset",
                    effectId: 'haptic.clock.timer',
                    count: 5,
                }, {
                    usage: "unknown"
                }, (error)=>{
                    if (error) {
                        console.info('vibrator error');
                        expect(false).assertTrue();
                    } else {
                        console.info('vibrator success');
                    }
                    setTimeout(()=>{
                        vibrator.stopVibration();
                        done();
                    }, 500);
                });
            } else {
                console.log(TAG + ' is not supported on this device.');
                expect(error.code).assertEqual(UNSUPPORTED);
                done();
            }
        })
})}
