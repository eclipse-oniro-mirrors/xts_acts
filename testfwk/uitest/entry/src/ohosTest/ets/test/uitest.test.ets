/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'
import ability_featureAbility from '@ohos.ability.featureAbility';
import { BusinessError } from '@ohos.base';
import display from '@ohos.display';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator : AbilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName : string = abilityDelegatorRegistry.getArguments().bundleName;
const waitUiReadyMs : number = 1000;
const TestTag = 'UiTest_API16';
const DeviceErrorCode = 17000005;
const ErrorCode = 401;

async function startAbility(bundleName: string, abilityName: string) {
    await delegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`).then(result => {
        console.info(`UiTestCase, start abilityFinished: ${result}`)
    }).catch((err : BusinessError) => {
        console.error(`UiTestCase, start abilityFailed: ${err}`)
    })
}

async function stopApplication(bundleName: string) {
    await delegator.executeShellCommand(`aa force-stop ${bundleName} `).then(result => {
        console.info(`UiTestCase, stop application finished: ${result}`)
    }).catch((err : BusinessError) => {
        console.error(`UiTestCase,stop application failed: ${err}`)
    })
}

async function exitInputMethod() {
    let driver = Driver.create()
    let softKeyBoard = await driver.findComponent(ON.type('Canvas'))
    if (softKeyBoard != null) {
        await driver.pressBack()
    }
}

export default function UiTest() {
    describe('UiTest_API16', () => {
        let driver: Driver
        beforeAll(async (done: Function) => {
            driver = Driver.create()
            await driver.delayMs(1000)
            done()
        })

        beforeEach(async () => {
            await stopApplication('com.uitestScene.acts');
        })

        /*
        * @tc.number: UiTest_API16_001
        * @tc.name: test_touchPadMultiFingerSwipe_Up_Down_3
        * @tc.desc: Swipe UP or Down with three point.
        */
        it('test_touchPadMultiFingerSwipe_Up_Down_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_Up_Down_3 start');
            try {
                await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
                await driver.delayMs(waitUiReadyMs);
                // 三指上划返回桌面。
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP);
                await driver.delayMs(waitUiReadyMs);
                let mainPageCom = await driver.findComponent(ON.text('MainPage'));
                await driver.delayMs(waitUiReadyMs);
                expect(mainPageCom).assertNull();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_Up_Down_3_Up, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                // 三指下划,应用返回前台
                await driver.touchPadMultiFingerSwipe(3, UiDirection.DOWN);
                await driver.delayMs(waitUiReadyMs);
                let mainPageCom = await driver.findComponent(ON.text('MainPage'));
                await driver.delayMs(waitUiReadyMs);
                expect(mainPageCom).not().assertNull();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_Up_Down_3_Down, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            }
            await driver.delayMs(waitUiReadyMs);
            await stopApplication('com.uitestScene.acts');
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_Up_Down_3 end');
        })

        /*
        * @tc.number: UiTest_API16_002
        * @tc.name: test_touchPadMultiFingerSwipe_Up_Down_Stay_3
        * @tc.desc: Swipe Up or Down with three point then  in more task statue
        */
        it('test_touchPadMultiFingerSwipe_Up_Down_Stay_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_Up_Down_Stay_3 start');
            try {
                await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
                await driver.delayMs(waitUiReadyMs);
                // 三指上划停留, 进入多任务中心。
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, {stay: true});
                let mainPageCom = await driver.findComponent(ON.text('MainPage'));
                await driver.delayMs(waitUiReadyMs);
                expect(mainPageCom).assertNull();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_Up_Down_Stay_3_Up, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                // 三指下划,应用返回前台。
                await driver.touchPadMultiFingerSwipe(3, UiDirection.DOWN);
                await driver.delayMs(waitUiReadyMs);
                let mainPageCom = await driver.findComponent(ON.text('MainPage'));
                await driver.delayMs(waitUiReadyMs);
                expect(mainPageCom).not().assertNull();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_Up_Down_Stay_3_Down, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            }
            await driver.delayMs(waitUiReadyMs);
            await stopApplication('com.uitestScene.acts');
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_Up_Down_Stay_3 end');
        })

        /*
        * @tc.number: UiTest_API16_003
        * @tc.name: test_touchPadMultiFingerSwipe_other
        * @tc.desc: Swipe Left, Swipe with four point
        */
        it('test_touchPadMultiFingerSwipe_other', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_other start');
            try {
                // 3指左划
                await driver.touchPadMultiFingerSwipe(3, UiDirection.LEFT);
                console.log(TestTag, `test_touchPadMultiFingerSwipe_other_left`);
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_other_left, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            }
            try {
                // 4指上划
                await driver.touchPadMultiFingerSwipe(4, UiDirection.UP);
                console.log(TestTag, `test_touchPadMultiFingerSwipe_other_4`);
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_other_4, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            }
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_other end');
        })

        /*
        * @tc.number: UiTest_API16_004
        * @tc.name: test_touchPadMultiFingerSwipe_fingers_verification_401
        * @tc.desc: finger params 401 test
        */
        it('test_touchPadMultiFingerSwipe_fingers_verification_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_fingers_verification_401 start');
            try {
                await driver.touchPadMultiFingerSwipe(null, UiDirection.UP);
                console.log(TestTag, `test_touchPadMultiFingerSwipe_fingers_verification_401_null`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_fingers_verification_401_null, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await driver.touchPadMultiFingerSwipe(undefined, UiDirection.UP);
                console.log(TestTag, `test_touchPadMultiFingerSwipe_fingers_verification_401_undefined`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_fingers_verification_401_undefined, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await driver.touchPadMultiFingerSwipe(2, UiDirection.UP);
                console.log(TestTag, `test_touchPadMultiFingerSwipe_fingers_verification_401_2`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_fingers_verification_401_2, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await driver.touchPadMultiFingerSwipe(5, UiDirection.UP);
                console.log(TestTag, `test_touchPadMultiFingerSwipe_fingers_verification_401_5`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_fingers_verification_401_5, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_fingers_verification_401 end');
        })

        /*
        * @tc.number: UiTest_API16_005
        * @tc.name: test_touchPadMultiFingerSwipe_direction_verification_401
        * @tc.desc: direction param 401 test
        */
        it('test_touchPadMultiFingerSwipe_direction_verification_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_direction_verification_401 start');
            try {
                await driver.touchPadMultiFingerSwipe(3, null);
                console.log(TestTag, `test_touchPadMultiFingerSwipe_direction_verification_401_null`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_direction_verification_401_null, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await driver.touchPadMultiFingerSwipe(3, undefined);
                console.log(TestTag, `test_touchPadMultiFingerSwipe_direction_verification_401_undefined`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_direction_verification_401_undefined, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await driver.touchPadMultiFingerSwipe(3, -1);
                console.log(TestTag, `test_touchPadMultiFingerSwipe_direction_verification_401_1`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_direction_verification_401_1, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await driver.touchPadMultiFingerSwipe(3, 4);
                console.log(TestTag, `test_touchPadMultiFingerSwipe_direction_verification_401_4`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_direction_verification_401_4, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_direction_verification_401 start');
        })

        /*
        * @tc.number: UiTest_API16_006
        * @tc.name: test_touchPadMultiFingerSwipe_option_verification_Up
        * @tc.desc: option param test
        */
        it('test_touchPadMultiFingerSwipe_option_verification_Up', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_option_verification_Up start');
            try {
                await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
                await driver.delayMs(waitUiReadyMs);
                // 三指上划返回桌面
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, null);
                await driver.delayMs(waitUiReadyMs);
                let mainPageCom = await driver.findComponent(ON.text('MainPage'));
                await driver.delayMs(waitUiReadyMs);
                expect(mainPageCom).assertNull();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_option_verification_Up_null, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {
                await stopApplication('com.uitestScene.acts');
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
                await driver.delayMs(waitUiReadyMs);
                // 三指上划返回桌面
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, undefined);
                await driver.delayMs(waitUiReadyMs);
                let mainPageCom = await driver.findComponent(ON.text('MainPage'));
                await driver.delayMs(waitUiReadyMs);
                expect(mainPageCom).assertNull();
                await stopApplication('com.uitestScene.acts');
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_option_verification_Up_undefined, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {
                await stopApplication('com.uitestScene.acts');
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
                await driver.delayMs(waitUiReadyMs);
                // 三指上划返回桌面
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, {});
                await driver.delayMs(waitUiReadyMs);
                let mainPageCom = await driver.findComponent(ON.text('MainPage'));
                await driver.delayMs(waitUiReadyMs);
                expect(mainPageCom).assertNull();
                await stopApplication('com.uitestScene.acts');
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_option_verification_Up_obj, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {
                await stopApplication('com.uitestScene.acts');
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
                await driver.delayMs(waitUiReadyMs);
                // 三指上划返回桌面
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, {stay: false});
                await driver.delayMs(waitUiReadyMs);
                let mainPageCom = await driver.findComponent(ON.text('MainPage'));
                await driver.delayMs(waitUiReadyMs);
                expect(mainPageCom).assertNull();
                await stopApplication('com.uitestScene.acts');
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_option_verification_Up_false, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {
                await stopApplication('com.uitestScene.acts');
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
                await driver.delayMs(waitUiReadyMs);
                // 三指上划返回桌面
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, {stay: undefined});
                await driver.delayMs(waitUiReadyMs);
                let mainPageCom = await driver.findComponent(ON.text('MainPage'));
                await driver.delayMs(waitUiReadyMs);
                expect(mainPageCom).assertNull();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_option_verification_Up_stay_undefined, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {
                await stopApplication('com.uitestScene.acts');
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, {stay: null});
                let mainPageCom = await driver.findComponent(ON.text('MainPage'));
                await driver.delayMs(waitUiReadyMs);
                expect(mainPageCom).assertNull();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_option_verification_Up_stay_null, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {
                await stopApplication('com.uitestScene.acts');
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, {speed: null});
                let mainPageCom = await driver.findComponent(ON.text('MainPage'));
                await driver.delayMs(waitUiReadyMs);
                expect(mainPageCom).assertNull();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_option_verification_Up_speed_null, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
                await driver.delayMs(waitUiReadyMs);
                // 三指上划返回桌面
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, {speed: 200});
                await driver.delayMs(waitUiReadyMs);
                let mainPageCom = await driver.findComponent(ON.text('MainPage'));
                await driver.delayMs(waitUiReadyMs);
                expect(mainPageCom).assertNull();
                await stopApplication('com.uitestScene.acts');
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_option_verification_Up_speed_200, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {
                await stopApplication('com.uitestScene.acts');
            }
            await driver.delayMs(waitUiReadyMs);
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_option_verification_Up end');
        })


        /*
        * @tc.number: UiTest_API16_07
        * @tc.name: test_penClick_function
        * @tc.desc: penClick function test
        */
        it('test_penClick_function', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'test_penClick_function start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs);
            let btnCom = await driver.findComponent(ON.text('next page'));
            expect(btnCom).not().assertNull();
            await driver.delayMs(waitUiReadyMs);
            let btnPoint = await btnCom.getBoundsCenter();
            try {
                await driver.penClick(btnPoint);
                await driver.delayMs(waitUiReadyMs);
                let strCom = await driver.findComponent(ON.text('back to index'));
                await driver.delayMs(waitUiReadyMs);
                let strText = await strCom.getText();
                expect(strText).assertEqual('back to index');
                await driver.delayMs(waitUiReadyMs);
                await strCom.click();
                await driver.delayMs(waitUiReadyMs);
            } catch (error) {
                console.log(TestTag, `test_penClick_function error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {

                await stopApplication('com.uitestScene.acts');
            }
            console.log(TestTag, 'test_penClick_function end');
        })

        /*
        * @tc.number: UiTest_API16_08
        * @tc.name: test_penClick_function_401
        * @tc.desc: penClick param 401 test
        */
        it('test_penClick_function_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () =>{
            console.log(TestTag, 'test_penClick_function_401 start');
            try {
                await driver.penClick(null);
                console.log(TestTag, `test_penClick_function_401_null`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penClick_function_401_null error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            try {
                await driver.penClick(undefined);
                console.log(TestTag, `test_penClick_function_401_undefined`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penClick_function_401_undefined error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            try {
                await driver.penClick({x: -1, y: 100});
                console.log(TestTag, `test_penClick_function_401_x`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penClick_function_401_x error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            try {
                await driver.penClick({x: 100, y: -1});
                console.log(TestTag, `test_penClick_function_401_y`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penClick_function_401_y error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            console.log(TestTag, 'test_penClick_function_401 end');
        })

        /*
        * @tc.number: UiTest_API16_09
        * @tc.name: test_penLongClick_function
        * @tc.desc: penLongClick function test
        */
        it('test_penLongClick_function', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () =>{
            console.log(TestTag, 'test_penLongClick_function start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('next page'))
            let btnPoint = await button.getBoundsCenter();
            try {
                await driver.penLongClick(btnPoint);
                await driver.delayMs(waitUiReadyMs)
                let newButton = await driver.findComponent(ON.text('longClick'))
                let text = await newButton.getText()
                expect(text == 'longClick').assertTrue()
                await newButton.click()
                await driver.delayMs(waitUiReadyMs);
            } catch (error) {
                console.log(TestTag, `test_penLongClick_function error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {
                await stopApplication('com.uitestScene.acts');
            }
            console.log(TestTag, 'test_penLongClick_function end');
        })

        /*
        * @tc.number: UiTest_API16_010
        * @tc.name: test_penLongClick_function_401
        * @tc.desc: penLongClick param 401 test
        */
        it('test_penLongClick_function_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () =>{
            console.log(TestTag, 'test_penLongClick_function_401 start');
            try {
                await driver.penLongClick(null, 0.5);
                console.log(TestTag, `test_penLongClick_function_401_null`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penLongClick_function_401_null error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            try {
                await driver.penLongClick(undefined);
                console.log(TestTag, `test_penLongClick_function_401_undefined`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penLongClick_function_401_undefined is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            try {
                await driver.penLongClick({x: -1, y: 100});
                console.log(TestTag, `test_penLongClick_function_401_x`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penLongClick_function_401_x is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            try {
                await driver.penLongClick({x: 100, y: -1});
                console.log(TestTag, `test_penLongClick_function_401_y`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penLongClick_function_401_y is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            console.log(TestTag, 'test_penLongClick_function_401 end');
        })

        /*
        * @tc.number: UiTest_API16_011
        * @tc.name: test_penDoubleClick_function
        * @tc.desc: penDoubleClick function test
        */
        it('test_penDoubleClick_function', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'test_penDoubleClick_function start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            await driver.delayMs(waitUiReadyMs);
            let btnCom = await driver.findComponent(ON.text('Click twice'))
            if (btnCom == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                btnCom = await scorll.scrollSearch(ON.text('Click twice'))
            }
            expect(btnCom).not().assertNull();
            await driver.delayMs(waitUiReadyMs);
            let btnPoint = await btnCom.getBoundsCenter();
            try {
                await driver.penDoubleClick(btnPoint);
                let newButton = await driver.findComponent(ON.text('doubleClick'))
                let text = await newButton.getText()
                expect(text == 'doubleClick').assertTrue()
                await newButton.click()
                await driver.delayMs(waitUiReadyMs);
            } catch (error) {
                console.log(TestTag, `test_penDoubleClick_function error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {
                await stopApplication('com.uitestScene.acts');
            }
            console.log(TestTag, 'test_penDoubleClick_function end');
        })

        /*
        * @tc.number: UiTest_API16_012
        * @tc.name: test_penDoubleClick_function_401
        * @tc.desc: penLongClick param 401 test
        */
        it('test_penDoubleClick_function_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () =>{
            console.log(TestTag, 'test_penDoubleClick_function_401 start');
            try {
                await driver.penDoubleClick(null);
                console.log(TestTag, `test_penDoubleClick_function_401`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penDoubleClick_function_401_null error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            try {
                await driver.penDoubleClick(undefined);
                console.log(TestTag, `test_penDoubleClick_function_401_undefined`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penDoubleClick_function_401_undefined is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            try {
                await driver.penDoubleClick({x: -1, y: 100});
                console.log(TestTag, `test_penDoubleClick_function_401_x`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penDoubleClick_function_401_x is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            try {
                await driver.penDoubleClick({x: 100, y: -1});
                console.log(TestTag, `test_penDoubleClick_function_401_y`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penDoubleClick_function_401_y is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            console.log(TestTag, 'test_penDoubleClick_function_401 end ');
        })

        /*
        * @tc.number: UiTest_API16_013
        * @tc.name: test_penSwipe_function
        * @tc.desc: penSwipe function test
        */
        it('test_penSwipe_function', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () =>{
            console.log(TestTag, 'test_penSwipe_function start');
            await driver.delayMs(waitUiReadyMs);
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs);
            try {
                // 垂直滑动
                await driver.delayMs(waitUiReadyMs);
                let scroll = await driver.findComponent(ON.type('Scroll'))
                let scrollRect = await scroll.getBounds()
                let screenWidth = scrollRect.right - scrollRect.left;
                let screenHeight = scrollRect.bottom - scrollRect.top;
                console.log(TestTag, 'screenWidth:' + screenWidth + ', screenHeight:' +screenHeight);
                await driver.penSwipe({x: Math.floor(screenWidth / 2), y: Math.floor(screenHeight / 2 + screenHeight / 4)},
                    {x: Math.floor(screenWidth / 2), y: Math.floor(screenHeight / 2 - screenHeight / 4) },600, 0.5);
                await driver.delayMs(waitUiReadyMs);
                let text = await driver.findComponent(ON.text('toast'));
                await driver.delayMs(waitUiReadyMs);
                expect(text == null).assertTrue();
                await driver.delayMs(waitUiReadyMs);
                let pressureCom = await driver.findComponent(ON.id('pressure'));
                await driver.delayMs(waitUiReadyMs);
                let pressure = await pressureCom.getText();
                await driver.delayMs(waitUiReadyMs);
                expect(pressure).assertEqual('0.5');
                let scrollBar = await driver.findComponent(ON.type('Scroll'));
                await driver.delayMs(waitUiReadyMs);
                await scrollBar.scrollToTop();
                await driver.delayMs(waitUiReadyMs);
            } catch (error) {
                console.log(TestTag, `test_penSwipe_function error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {
                await stopApplication('com.uitestScene.acts');
            }
            console.log(TestTag, 'test_penSwipe_function end');
        })

        /*
        * @tc.number: UiTest_API16_013
        * @tc.name: test_penSwipe_function_pressure
        * @tc.desc: penSwipe function test
        */
        it('test_penSwipe_function_pressure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () =>{
            console.log(TestTag, 'test_penSwipe_function_pressure start');
            await driver.delayMs(waitUiReadyMs);
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs);
            try {
                // 垂直滑动
                await driver.delayMs(waitUiReadyMs);
                let scroll = await driver.findComponent(ON.type('Scroll'))
                let scrollRect = await scroll.getBounds()
                let screenWidth = scrollRect.right - scrollRect.left;
                let screenHeight = scrollRect.bottom - scrollRect.top;
                console.log(TestTag, 'screenWidth:' + screenWidth + ', screenHeight:' +screenHeight);
                await driver.penSwipe({x: Math.floor(screenWidth / 2), y: Math.floor(screenHeight / 2 + screenHeight / 4)},
                    {x: Math.floor(screenWidth / 2), y: Math.floor(screenHeight / 2 - screenHeight / 4) },600);
                await driver.delayMs(waitUiReadyMs);
                let text = await driver.findComponent(ON.text('toast'));
                await driver.delayMs(waitUiReadyMs);
                expect(text == null).assertTrue();
            } catch (error) {
                console.log(TestTag, `test_penSwipe_function error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {
                await stopApplication('com.uitestScene.acts');
            }
            console.log(TestTag, 'test_penSwipe_function end');
        })

        /*
        * @tc.number: UiTest_API16_013
        * @tc.name: test_penSwipe_function_speed
        * @tc.desc: penSwipe function test
        */
        it('test_penSwipe_function_speed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () =>{
            console.log(TestTag, 'test_penSwipe_function_speed start');
            await driver.delayMs(waitUiReadyMs);
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs);
            try {
                // 垂直滑动
                await driver.delayMs(waitUiReadyMs);
                let scroll = await driver.findComponent(ON.type('Scroll'))
                let scrollRect = await scroll.getBounds()
                let screenWidth = scrollRect.right - scrollRect.left;
                let screenHeight = scrollRect.bottom - scrollRect.top;
                console.log(TestTag, 'screenWidth:' + screenWidth + ', screenHeight:' +screenHeight);
                await driver.penSwipe({x: Math.floor(screenWidth / 2), y: Math.floor(screenHeight / 2 + screenHeight / 4)},
                    {x: Math.floor(screenWidth / 2), y: Math.floor(screenHeight / 2 - screenHeight / 4)});
                await driver.delayMs(waitUiReadyMs);
                let text = await driver.findComponent(ON.text('toast'));
                await driver.delayMs(waitUiReadyMs);
                expect(text == null).assertTrue();
            } catch (error) {
                console.log(TestTag, `test_penSwipe_function_speed error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {
                await stopApplication('com.uitestScene.acts');
            }
            console.log(TestTag, 'test_penSwipe_function_speed end');
        })

        /*
        * @tc.number: UiTest_API16_014
        * @tc.name: test_penSwipe_function_401
        * @tc.desc: penSwipe param 401  test
        */
        it('test_penSwipe_function_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () =>{
            console.log(TestTag, 'test_penSwipe_function_401 start');
            try {
                await driver.penSwipe(null, {x: 100, y: 100});
                console.log(TestTag, `test_penSwipe_function_401_startPoint_null`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penSwipe_function_401_startPoint_null is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            try {
                await driver.penSwipe({x: 100, y: 100}, null);
                console.log(TestTag, `test_penSwipe_function_401_endPoint_null`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penSwipe_function_401_endPoint_null is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                await driver.penSwipe({x: -1, y: 100}, {x: 100, y: 500});
                console.log(TestTag, `test_penSwipe_function_401_startPoint_x`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penSwipe_function_401_endPointPoint_x is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                await driver.penSwipe({x: 100, y: -1}, {x: 100, y: 500});
                console.log(TestTag, `test_penSwipe_function_401_startPoint_y`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penSwipe_function_401_startPoint_y is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                await driver.penSwipe({x: 100, y: 100}, {x: 100, y: 500}, 600, -0.1);
                console.log(TestTag, `test_penSwipe_function_401_pressure_l`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penSwipe_function_401_pressure_l is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                await driver.penSwipe({x: 100, y: 100}, {x: 100, y: 500}, 600, 1.1);
                console.log(TestTag, `test_penSwipe_function_401_pressure_r`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penSwipe_function_401_pressure_r is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            console.log(TestTag, 'test_penSwipe_function_401 end');
        })

        /*
        * @tc.number: UiTest_API16_015
        * @tc.name: test_injectPenPointAction_function
        * @tc.desc: injectPenPointAction function test
        */
        it('test_injectPenPointAction_function', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, `test_injectPenPointAction_function start`);
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            await driver.delayMs(waitUiReadyMs)
            let scroll = await driver.findComponent(ON.type('Scroll'))
            let scrollRect = await scroll.getBounds()
            let screenWidth = scrollRect.right - scrollRect.left;
            let screenHeight = scrollRect.bottom - scrollRect.top;
            console.log(TestTag, 'screenWidth:' + screenWidth + ', screenHeight:' +screenHeight);
            let pointer = PointerMatrix.create(1,8);
            let stepLength = Math.floor((screenHeight / 4) * 2 / 8);
            console.log(TestTag, `stepLength is, ${stepLength}`);
            let startX = Math.floor(screenWidth / 2);
            for (let step = 0; step < 8; step++) {
                let startY = Math.floor((screenHeight / 2 + screenHeight / 4) - stepLength * step);
                console.log(TestTag, `startX is, ${startX}, startY is, ${ startY }`);
                pointer.setPoint(0, step, {x: startX, y: startY });
            }
            try {
                await driver.injectPenPointerAction(pointer, 600, 0.5);
                await driver.delayMs(waitUiReadyMs * 2);
                let text = await driver.findComponent(ON.text('toast'));
                expect(text == null).assertTrue();
                await driver.delayMs(waitUiReadyMs);
                let pressureCom = await driver.findComponent(ON.id('pressure'));
                await driver.delayMs(waitUiReadyMs);
                let pressure = await pressureCom.getText();
                await driver.delayMs(waitUiReadyMs);
                expect(pressure).assertEqual('0.5');
                await driver.delayMs(waitUiReadyMs);
                let scrollBar = await driver.findComponent(ON.type('Scroll'));
                await driver.delayMs(waitUiReadyMs);
                await scrollBar.scrollToTop();
                await driver.delayMs(waitUiReadyMs);
            } catch (error) {
                console.log(TestTag, `test_injectPenPointAction_function error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {
                await stopApplication('com.uitestScene.acts')
            }
            console.log(TestTag, `test_injectPenPointAction_function end`);
        })

        /*
        * @tc.number: UiTest_API16_016
        * @tc.name: test_injectPenPointAction_function_401
        * @tc.desc: injectPenPointAction param 401 test
        */
        it('test_injectPenPointAction_function_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () =>{
            console.log(TestTag, 'test_injectPenPointAction_function_401 start');
            try {
                await driver.injectPenPointerAction(null, 600);
                console.log(TestTag, `test_injectPenPointAction_function_401_null`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_injectPenPointAction_function_401_null error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                await driver.injectPenPointerAction(undefined);
                console.log(TestTag, `test_injectPenPointAction_function_401_undefined`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_injectPenPointAction_function_401_undefined error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                let points = PointerMatrix.create(0, 2);
                await driver.injectPenPointerAction(points);
                console.log(TestTag, `test_injectPenPointAction_function_401_fingers_0`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_injectPenPointAction_function_401_fingers_0 error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                let points = PointerMatrix.create(2, 2);
                await driver.injectPenPointerAction(points);
                console.log(TestTag, `test_injectPenPointAction_function_401_fingers_2`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_injectPenPointAction_function_401_fingers_2 error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                let points = PointerMatrix.create(1, 0);
                await driver.injectPenPointerAction(points);
                console.log(TestTag, `test_injectPenPointAction_function_401_step_0`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_injectPenPointAction_function_401_step_0 error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                let points = PointerMatrix.create(1, 1001);
                await driver.injectPenPointerAction(points);
                console.log(TestTag, `test_injectPenPointAction_function_401_step_1001`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_injectPenPointAction_function_401_step_1001 error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                let points = PointerMatrix.create(1, 2);
                points.setPoint(0, 1, {x:100, y:100});
                points.setPoint(0, 2, {x:100, y:150})
                await driver.injectPenPointerAction(points, 600, -0.1);
                console.log(TestTag, `test_injectPenPointAction_function_401_pressure_l`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_injectPenPointAction_function_401_pressure_l error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                let points = PointerMatrix.create(1, 2);
                points.setPoint(0, 1, {x:100, y:100});
                points.setPoint(0, 2, {x:100, y:150})
                await driver.injectPenPointerAction(points, 600, 1.1);
                console.log(TestTag, `test_injectPenPointAction_function_401_pressure_r`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_injectPenPointAction_function_401_pressure_r error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

        })

        /*
        * @tc.number: UiTest_API16_017
        * @tc.name: testScrollSearchVertical
        * @tc.desc: scroll vertically on this UiComponent to find matched UiComponent.
        */
        it('testScrollSearchVertical', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testScrollSearchVertical start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('scroll'))
            if (button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                button = await scorll.scrollSearch(ON.text('scroll'))
            }
            await driver.delayMs(waitUiReadyMs)
            await button.click()
            await driver.delayMs(waitUiReadyMs)
            let scrollBar = await driver.findComponent(ON.id('verticalScroll'))
            await driver.delayMs(waitUiReadyMs)
            let text1 = await scrollBar.scrollSearch(ON.text('11'), true, 80);
            await driver.delayMs(waitUiReadyMs)
            expect(text1 == null).assertTrue()
            await driver.delayMs(waitUiReadyMs)
            let text2 = await scrollBar.scrollSearch(ON.text('2'), true);
            let text2Msg = await text2.getText();
            console.log(TestTag, `testScrollSearchVertical 2 is , ${ text2Msg }`);
            await driver.delayMs(waitUiReadyMs)
            expect(await text2.getText()).assertEqual('2')
            await driver.delayMs(waitUiReadyMs)
            let text3 = await scrollBar.scrollSearch(ON.text('8'));
            await driver.delayMs(waitUiReadyMs);
            let text3Msg = await text3.getText();
            console.log(TestTag, `testScrollSearchVertical 2 is , ${ text3Msg }`);
            expect(await text3.getText()).assertEqual('8')
            await driver.delayMs(waitUiReadyMs)
            await stopApplication('com.uitestScene.acts');
            console.log(TestTag, 'testScrollSearchVertical end');
        })



        /*
        * @tc.number: UiTest_API16_019
        * @tc.name: testScrollSearchHorizontal_401
        * @tc.desc: param 401 test.
        */
        it('testScrollSearchHorizontal_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            await driver.delayMs(waitUiReadyMs);
            let button = await driver.findComponent(ON.text('scroll'));
            if (button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                button = await scorll.scrollSearch(ON.text('scroll'))
            }
            await driver.delayMs(waitUiReadyMs);
            await button.click();
            await driver.delayMs(waitUiReadyMs);
            let scrollBar = await driver.findComponent(ON.id('verticalScroll'));
            try {
                let text1 = await scrollBar.scrollSearch(null);
                expect(false).assertTrue();
            } catch (error) {
                let err = error as BusinessError;
                expect(err.code).assertEqual(401);
            }
            try {
                let text2 = await scrollBar.scrollSearch(undefined);
                expect(false).assertTrue();
            } catch (error) {
                let err = error as BusinessError;
                expect(err.code).assertEqual(401);
            }
            try {
                let text3 = await scrollBar.scrollSearch(ON.text('8'), true, -1);
                expect(false).assertTrue();
            } catch (error) {
                let err = error as BusinessError;
                expect(err.code).assertEqual(401);
            }
            try {
                let rect = await scrollBar.getBounds();
                let text4 = await scrollBar.scrollSearch(ON.text('8'), true, (rect.bottom + rect.top) / 2);
                expect(false).assertTrue();
            } catch (error) {
                let err = error as BusinessError;
                expect(err.code).assertEqual(401);
            }
            await driver.delayMs(waitUiReadyMs);
            await stopApplication('com.uitestScene.acts');
        })

        /*
        * @tc.number: UiTest_API16_020
        * @tc.name: testMatchPatternIcase
        * @tc.desc: find button component by Regular Expression ignore icase，and doubleClick button by mouse.
        */
        it('testMatchPatternIcase', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            await driver.delayMs(waitUiReadyMs);
            let Button = await driver.findComponent(ON.text('click twice', MatchPattern.REG_EXP_ICASE));
            if (Button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                Button = await scorll.scrollSearch(ON.text('Click twice'))
            }
            await driver.delayMs(waitUiReadyMs);
            let center = await Button.getBoundsCenter();
            await driver.delayMs(waitUiReadyMs);
            await driver.mouseDoubleClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 0);
            await driver.delayMs(waitUiReadyMs);
            let button = await driver.findComponent(ON.text('doublec\\w{2,4}', MatchPattern.REG_EXP_ICASE));
            await driver.delayMs(waitUiReadyMs);
            let text = await button.getText();
            await driver.delayMs(waitUiReadyMs);
            expect(text == 'doubleClick').assertTrue();
            await stopApplication('com.uitestScene.acts');
        })

        /*
        * @tc.number: UiTest_API16_021
        * @tc.name: testMatchPatternRegExp
        * @tc.desc: find button component by Regular Expression, and longClick button by mouse.
        */
        it('testMatchPatternRegExp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            await driver.delayMs(waitUiReadyMs);
            let btn = await driver.findComponent(ON.text('next \\w{2,6}', MatchPattern.REG_EXP));
            if (btn == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                btn = await scorll.scrollSearch(ON.text('next \\w{2,6}', MatchPattern.REG_EXP))
            }
            await driver.delayMs(waitUiReadyMs);
            let center = await btn.getBoundsCenter();
            await driver.delayMs(waitUiReadyMs);
            await driver.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 0);
            await driver.delayMs(waitUiReadyMs);
            let newButton = await driver.findComponent(ON.text('longClick'));
            await driver.delayMs(waitUiReadyMs);
            let text = await newButton.getText();
            await driver.delayMs(waitUiReadyMs);
            expect(text == 'longClick').assertTrue();
            await stopApplication('com.uitestScene.acts');
        })

        /*
        * @tc.number: UiTest_API16_022
        * @tc.name: testGetHint
        * @tc.desc: find button component by Regular Expression, and get Hint of the component.
        */
        it('testGetHint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            await driver.delayMs(waitUiReadyMs);
            let button = await driver.findComponent(ON.hint('welcome', MatchPattern.REG_EXP));
            if (button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                button = await scorll.scrollSearch(ON.hint('welcome', MatchPattern.REG_EXP))
            }
            await driver.delayMs(waitUiReadyMs);
            let hint = await button.getHint();
            await driver.delayMs(waitUiReadyMs);
            expect(hint == 'welcome').assertTrue();
            let button1 = await driver.findComponent(ON.hint('welcome'));
            if (button1 == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                button1 = await scorll.scrollSearch(ON.hint('welcome'))
            }
            await driver.delayMs(waitUiReadyMs);
            let hint1 = await button1.getHint();
            await driver.delayMs(waitUiReadyMs);
            expect(hint1 == 'welcome').assertTrue();
            await stopApplication('com.uitestScene.acts');
        })

        /*
        * @tc.number: UiTest_API16_023
        * @tc.name: testGetHint1
        * @tc.desc: find button component by Hint.
        */
        it('testGetHint1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            await driver.delayMs(waitUiReadyMs);
            let button = await driver.findComponent(ON.text('Hello \\w{3,6}', MatchPattern.REG_EXP));
            if (button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                button = await scorll.scrollSearch(ON.text('Hello \\w{3,6}', MatchPattern.REG_EXP))
            }
            await driver.delayMs(waitUiReadyMs);
            let hint = await button.getHint();
            await driver.delayMs(waitUiReadyMs);
            expect(hint == 'welcome').assertTrue();
            await stopApplication('com.uitestScene.acts');
        })
    })

    describe('UiTest_API11', () => {
        let driver: Driver
        beforeAll(async (done: Function) => {
            driver = Driver.create()
            await driver.delayMs(1000)
            done()
        })

        beforeEach(async () => {
            await stopApplication('com.uitestScene.acts')
        })

        /*
        * @tc.number: uiTest_11001
        * @tc.name: testMouseDoubleClick
        * @tc.desc: doubleClick in the specified location on the screen by mouse.
        */
        it('testMouseDoubleClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let Button = await driver.findComponent(ON.text('Click twice'))
            if (Button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                Button = await scorll.scrollSearch(ON.text('Click twice'))
            }
            let center = await Button.getBoundsCenter()
            await driver.mouseDoubleClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 0);
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('doubleClick'))
            let text = await button.getText()
            expect(text == 'doubleClick').assertTrue()
        })

        /*
        * @tc.number: uiTest_11001
        * @tc.name: testMouseDoubleClick_1
        * @tc.desc: doubleClick in the specified location on the screen by mouse.
        */
        it('testMouseDoubleClick_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let Button = await driver.findComponent(ON.text('Click twice'))
            if (Button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                Button = await scorll.scrollSearch(ON.text('Click twice'))
            }
            let center = await Button.getBoundsCenter()
            await driver.mouseDoubleClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0);
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('doubleClick'))
            let text = await button.getText()
            expect(text == 'doubleClick').assertTrue()
        })

        /*
        * @tc.number: uiTest_11001
        * @tc.name: testMouseDoubleClick_1
        * @tc.desc: doubleClick in the specified location on the screen by mouse.
        */
        it('testMouseDoubleClick_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let Button = await driver.findComponent(ON.text('Click twice'))
            if (Button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                Button = await scorll.scrollSearch(ON.text('Click twice'))
            }
            let center = await Button.getBoundsCenter()
            await driver.mouseDoubleClick(center, MouseButton.MOUSE_BUTTON_LEFT);
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('doubleClick'))
            let text = await button.getText()
            expect(text == 'doubleClick').assertTrue()
        })

        /*
        * @tc.number: uiTest_11002
        * @tc.name: testMouseLongClick
        * @tc.desc: longClick in the specified location on the screen by mouse.
        */
        it('testMouseLongClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let Button = await driver.findComponent(ON.text('next page'))
            let center = await Button.getBoundsCenter()
            await driver.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 0)
            await driver.delayMs(waitUiReadyMs)
            let newButton = await driver.findComponent(ON.text('longClick'))
            let text = await newButton.getText()
            expect(text == 'longClick').assertTrue()
        })

        /*
        * @tc.number: uiTest_11002
        * @tc.name: testMouseLongClick_1
        * @tc.desc: longClick in the specified location on the screen by mouse.
        */
        it('testMouseLongClick_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let Button = await driver.findComponent(ON.text('next page'))
            let center = await Button.getBoundsCenter()
            await driver.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0)
            await driver.delayMs(waitUiReadyMs)
            let newButton = await driver.findComponent(ON.text('longClick'))
            let text = await newButton.getText()
            expect(text == 'longClick').assertTrue()
        })

        /*
        * @tc.number: uiTest_11002
        * @tc.name: testMouseLongClick_2
        * @tc.desc: longClick in the specified location on the screen by mouse.
        */
        it('testMouseLongClick_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let Button = await driver.findComponent(ON.text('next page'))
            let center = await Button.getBoundsCenter()
            await driver.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT)
            await driver.delayMs(waitUiReadyMs)
            let newButton = await driver.findComponent(ON.text('longClick'))
            let text = await newButton.getText()
            expect(text == 'longClick').assertTrue()
        })

        /*
         * @tc.number: uiTest_11004
         * @tc.name: testMouseMoveWithTrack
         * @tc.desc: swipe on the screen between the specified points with mouse.
         */
		it('testMouseMoveWithTrack', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
           await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
           let driver = Driver.create()
           await driver.delayMs(waitUiReadyMs)
           let Button = await driver.findComponent(ON.id('jump'))
           if (Button == null) {
             let scorll = await driver.findComponent(ON.type('Scroll'))
             Button = await scorll.scrollSearch(ON.id('jump'))
            }
            let center = await Button.getBoundsCenter()
            await driver.mouseMoveTo(center)
            await driver.delayMs(waitUiReadyMs)
            let checkBox = await driver.findComponent(ON.type('Checkbox'))
            if (checkBox != null) {
                let center2 = await checkBox.getBoundsCenter()
                await driver.mouseMoveWithTrack(center, center2, 600)
                await driver.delayMs(waitUiReadyMs);
                await driver.mouseMoveWithTrack(center, center2)
            }
            await driver.delayMs(waitUiReadyMs)
            let newButton = await driver.findComponent(ON.text('jump'))
            expect(newButton == null).assertTrue()
        })


        /*
         * @tc.number: uiTest_11005
         * @tc.name: testDriverInputText
         * @tc.desc: inject text on the specified location.
         */
        it('testDriverInputText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let inputText = await driver.findComponent(ON.type('TextInput'))
            if (inputText == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                inputText = await scorll.scrollSearch(ON.type('TextInput'))
            }
            let input = await driver.findComponent(ON.type('TextInput'))
            await input.clearText()
            await driver.delayMs(2000)
            await exitInputMethod()
            await driver.delayMs(waitUiReadyMs)
            let center = await input.getBoundsCenter()
            await driver.inputText(center, '123')
            await driver.delayMs(2000)
            await exitInputMethod()
            await driver.delayMs(2000)
            let input_new = await driver.findComponent(ON.type('TextInput'))
            let text = await input_new.getText()
            console.info("testInputText result :" + text)
            expect(text == '123').assertTrue()
        })

        /*
         * @tc.number: uiTest_11006
         * @tc.name: testMouseScroll
         * @tc.desc: scroll the mouse wheel at the specified location to specify the cell.
         */
        it('testMouseScroll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let btn = await driver.findComponent(ON.id('jump'))
            if (btn == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                btn = await scorll.scrollSearch(ON.id('jump'))
            }
            await btn.click()
            await driver.delayMs(waitUiReadyMs)
            let img1 = await driver.findComponent(ON.id('test_pict'))
            let bounds1 = await img1.getBounds()
            let center1 = await img1.getBoundsCenter()
            await driver.mouseScroll(center1,false,5,2072,0,20)
            await driver.delayMs(waitUiReadyMs)
            let img2 = await driver.findComponent(ON.id('test_pict'))
            let bounds2 = await img2.getBounds()
            expect(bounds1 != bounds2).assertTrue()

            await driver.pressBack()
            await driver.delayMs(waitUiReadyMs)
            let btn2 = await driver.findComponent(ON.text('1'))
            if (btn2 == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                btn2 = await scorll.scrollSearch(ON.text('1'))
            }
            let center = await btn2.getBoundsCenter()
            await driver.mouseScroll(center,true,30)
            await driver.delayMs(waitUiReadyMs)
            let button1 = await driver.findComponent(ON.text('next page'))
            expect(button1 == null).assertTrue()
        })

        /*
         * @tc.number: uiTest_11007
         * @tc.name: testWindowAttr
         * @tc.desc: find window by WindowFilter and get it's active status.
         */
        it('testWindowAttr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let window = await driver.findWindow({bundleName:'com.uitestScene.acts',focused:true,active:true,title:''})
            await window.focus()
            await driver.delayMs(waitUiReadyMs)
            let isActive = await window.isActive()
            expect(isActive == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_11008
         * @tc.name: testDescription
         * @tc.desc: find UiComponent by description attribute and get it's description attribute.
         */
        it('testDescription', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let text = await driver.findComponent(ON.type('Text').description(''))
            if (text == null) {
                text = await driver.findComponent(ON.type('Text').description('', MatchPattern.EQUALS))
            }
            let description = await text.getDescription()
            expect(description == '').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })
    })

    describe('UiTest_API10', () =>  {
        let driver: Driver
        beforeAll(async (done: Function) => {
            driver = Driver.create()
            await driver.delayMs(1000)
            done()
        })

        afterEach(async () => {
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_10001
         * @tc.name: testWithIn
         * @tc.desc: find UiComponent inside of the given UiComponent.
         */
        it('testWithIn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let scroll = await driver.findComponent(ON.type('Scroll'))
            let btn = await driver.findComponent(ON.within(ON.type('Scroll')).text('next page'))
            let bounds1 = await scroll.getBounds()
            let bounds2 = await btn.getBounds()
            expect(bounds1.top <= bounds2.top).assertTrue()
            expect(bounds1.bottom >= bounds2.bottom).assertTrue()
            expect(bounds1.left <= bounds2.right).assertTrue()
            expect(bounds1.right >= bounds2.right).assertTrue()
        })



        /*
         * @tc.number: uiTest_10003
         * @tc.name: testScreenCapture
         * @tc.desc: capture the specified area of current screen.
         */
        it('testScreenCapture', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let savePath = '/data/storage/el2/base/cache/1.png'
            let success = await driver.screenCapture(savePath, {left: 0, top: 0, right: 100, bottom: 100})
            expect(success == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_10003
         * @tc.name: testScreenCapture_default
         * @tc.desc: capture the specified area of current screen.
         */
        it('testScreenCapture_default', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let savePath = '/data/storage/el2/base/cache/1.png'
            let success = await driver.screenCapture(savePath)
            expect(success == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_10004
         * @tc.name: testMouseClick
         * @tc.desc: click in the specified location on the screen by mouse.
         */
        it('testMouseClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let Button = await driver.findComponent(ON.id('jump'))
            if (Button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                Button = await scorll.scrollSearch(ON.id('jump'))
            }
            let center = await Button.getBoundsCenter()
            await driver.mouseClick({x:center.x, y:center.y}, MouseButton.MOUSE_BUTTON_RIGHT)
            await driver.delayMs(waitUiReadyMs)
            let Button1 = await driver.findComponent(ON.text('right'))
            expect(Button1 != null).assertTrue()
            await driver.mouseClick({x:center.x, y:center.y}, MouseButton.MOUSE_BUTTON_MIDDLE,2072,2045)
            await driver.delayMs(waitUiReadyMs)
            let Button2 = await driver.findComponent(ON.text('middle'))
            expect(Button2 != null).assertTrue()
            await driver.mouseClick({x:center.x, y:center.y}, MouseButton.MOUSE_BUTTON_LEFT)
            await driver.delayMs(waitUiReadyMs)
            let Button3 = await driver.findComponent(ON.id('jump'))
            expect(Button3 == null).assertTrue()
            await driver.click(center.x, center.y)
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_10005
         * @tc.name: testMouseMoveTo
         * @tc.desc: move the mouse cursor to the specified location.
         */
        it('testMouseMoveTo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let Button = await driver.findComponent(ON.id('jump'))
            if (Button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                Button = await scorll.scrollSearch(ON.id('jump'))
            }
            let center = await Button.getBoundsCenter()
            await driver.mouseMoveTo(center)
            await driver.delayMs(waitUiReadyMs)
            let newButton = await driver.findComponent(ON.text('hover'))
            expect(newButton != null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_10006
         * @tc.name: testMouseScroll
         * @tc.desc: scroll the mouse wheel at the specified location to specify the cell.
         */
        it('testMouseScroll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let btn = await driver.findComponent(ON.id('jump'))
            if (btn == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                btn = await scorll.scrollSearch(ON.id('jump'))
            }
            await btn.click()
            await driver.delayMs(waitUiReadyMs)
            let img1 = await driver.findComponent(ON.type('Image').inWindow('com.uitestScene.acts'))
            let bounds1 = await img1.getBounds()
            let center1 = await img1.getBoundsCenter()
            await driver.click(center1.x, center1.y)
            await driver.delayMs(waitUiReadyMs)
            await driver.mouseScroll(center1,false,5,2072,0)
            await driver.delayMs(waitUiReadyMs)
            let img2 = await driver.findComponent(ON.type('Image').inWindow('com.uitestScene.acts'))
            let bounds2 = await img2.getBounds()
            expect(bounds1 != bounds2).assertTrue()

            await driver.pressBack()
            await driver.delayMs(waitUiReadyMs)
            let btn2 = await driver.findComponent(ON.text('1'))
            if (btn2 == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                btn2 = await scorll.scrollSearch(ON.text('1'))
            }
            let center = await btn2.getBoundsCenter()
            await driver.mouseScroll(center,true,30)
            await driver.delayMs(waitUiReadyMs)
            let button1 = await driver.findComponent(ON.text('next page'))
            expect(button1 == null).assertTrue()
        })

        /*
         * @tc.number: uiTest_10007
         * @tc.name: testInWindow
         * @tc.desc: scroll the mouse wheel at the specified location to specify the cell.
         */
        it('testInWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let btn = await driver.findComponent(ON.inWindow('com.uitestScene.acts').text('next page'))
            expect(btn != null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
        * @tc.number: uiTest_10008
        * @tc.name: testMonitor1
        * @tc.desc: monitor toast appearance.
        */
        it('testMonitor1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let observer = await driver.createUIEventObserver()
            let callback = (UiElementInfo : UIElementInfo) => {
                try {
                    console.info('UIElementInfo bundleName:'+ UiElementInfo.bundleName)
                    console.info('UIElementInfo text:'+ UiElementInfo.text)
                    console.info('UIElementInfo type:'+ UiElementInfo.type)
                    expect(UiElementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
                    expect(UiElementInfo.text == 'toastShow').assertTrue()
                    expect(UiElementInfo.type == 'Toast').assertTrue()
                } catch (err) {
                    console.info(err)
                }
            }
            observer.once('toastShow', callback)
            let btn = await driver.findComponent(ON.text('toast'))
            await btn.click()
            await driver.delayMs(waitUiReadyMs)
            await stopApplication('com.uitestScene.acts')
        })

        /*
        * @tc.number: uiTest_10009
        * @tc.name: testMonitor2
        * @tc.desc: monitor dialog appearance.
        */

        it('testMonitor2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let observer = await driver.createUIEventObserver()
            let callback = (UiElementInfo : UIElementInfo) => {
                try {
                    console.info('UIElementInfo bundleName:'+ UiElementInfo.bundleName)
                    console.info('UIElementInfo text:'+ UiElementInfo.text)
                    console.info('UIElementInfo type:'+ UiElementInfo.type)
                    expect(UiElementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
                    expect(UiElementInfo.text == 'dialogShow').assertTrue()
                    expect(UiElementInfo.type == 'AlertDialog').assertTrue()
                } catch (err) {
                    console.info(err)
                }
            }
            observer.once('dialogShow', callback)
            let btn = await driver.findComponent(ON.text('dialog'))
            await btn.click()
            await driver.delayMs(waitUiReadyMs)
            await stopApplication('com.uitestScene.acts')
        })
    })

    describe('UiTest_API9', () => {
        let driver: Driver
        beforeAll(async (done: Function) => {
            driver = Driver.create()
            await driver.delayMs(1000)
            done()
        })

        afterEach(async () => {
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9001
         * @tc.name: testInputText
         * @tc.desc: inject text to the target UiComponent
         */
        it('testInputText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let input = await driver.findComponent(ON.type('TextInput'))
            if (input == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                input = await scorll.scrollSearch(ON.type('TextInput'))
            }
            await input.inputText('123')
            await driver.delayMs(2000)
            await exitInputMethod()
            await driver.delayMs(2000)
            let input_new = await driver.findComponent(ON.type('TextInput'))
            let text = await input_new.getText()
            console.info("testInputText result :" + text)
            expect(text == '123').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9002
         * @tc.name: testClearText
         * @tc.desc: clear text of the target UiComponent
         */
        it('testClearText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let input1 = await driver.findComponent(ON.type('TextInput'))
            if (input1 == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                input1 = await scorll.scrollSearch(ON.type('TextInput'))
            }
            await input1.inputText('abc')
            await driver.delayMs(2000)
            await exitInputMethod()
            await driver.delayMs(2000)
            let input2 = await driver.findComponent(ON.type('TextInput'))
            await input2.clearText()
            await driver.delayMs(2000)
            await exitInputMethod()
            await driver.delayMs(waitUiReadyMs)
            let input_new = await driver.findComponent(ON.type('TextInput'))
            let text = await input_new.getText()
            console.info("testClearText result :" + text)
            expect(text).assertEqual('')
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9003
         * @tc.name: testCheckable
         * @tc.desc: find UiComponent by checkable attribute and get it's checkable attribute.
         */
        it('testCheckable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.checkable().type('Checkbox'))
            if (button == null) {
               let scorll = await driver.findComponent(ON.type('Scroll'))
               button = await scorll.scrollSearch(ON.type('Checkbox').checkable(true))
            }
            let checkable = await button.isCheckable()
            expect(checkable == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9004
         * @tc.name: testChecked
         * @tc.desc: find UiComponent by checked attribute and get it's checked attribute.
         */
        it('testChecked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.checked().type('Checkbox'))
            if (button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                button = await scorll.scrollSearch(ON.type('Checkbox').checked(false))
            }
            let checked = await button.isChecked()
            expect(checked == false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9005
         * @tc.name: testMatchPattern
         * @tc.desc: specifies the string value match pattern.
         */
        it('testMatchPattern', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let Button1 = await driver.findComponent(ON.text('next page',MatchPattern.EQUALS))
            expect(await Button1.getText() == 'next page').assertTrue()
            let Button2 = await driver.findComponent(ON.text('next',MatchPattern.STARTS_WITH))
            expect(await Button2.getText() == 'next page').assertTrue()
            let Button3 = await driver.findComponent(ON.text('xt page',MatchPattern.ENDS_WITH))
            expect(await Button3.getText() == 'next page').assertTrue()
            let Button4 = await driver.findComponent(ON.text('ext',MatchPattern.CONTAINS))
            expect(await Button4.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9006
         * @tc.name: testDriverClick
         * @tc.desc: click in the specified location on the screen.
         */
        it('testDriverClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let Button = await driver.findComponent(ON.text('next page'))
            let center = await Button.getBoundsCenter()
            await driver.click(center.x, center.y)
            await driver.delayMs(waitUiReadyMs)
            let newButton = await driver.findComponent(ON.text('back to index'))
            let text = await newButton.getText()
            expect(text == 'back to index').assertTrue()
            await newButton.click()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9007
         * @tc.name: testDriverDoubleClick
         * @tc.desc: doubleClick in the specified location on the screen.
         */
        it('testDriverDoubleClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let Button = await driver.findComponent(ON.text('Click twice'))
            if (Button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                Button = await scorll.scrollSearch(ON.text('Click twice'))
            }
            let center = await Button.getBoundsCenter()
            await driver.doubleClick(center.x, center.y)
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('doubleClick'))
            let text = await button.getText()
            expect(text == 'doubleClick').assertTrue()
            await button.click()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9008
         * @tc.name: testDriverLongClick
         * @tc.desc: longClick in the specified location on the screen.
         */
        it('testDriverLongClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let Button = await driver.findComponent(ON.text('next page'))
            let center = await Button.getBoundsCenter()
            await driver.longClick(center.x, center.y)
            await driver.delayMs(waitUiReadyMs)
            let newButton = await driver.findComponent(ON.text('longClick'))
            let text = await newButton.getText()
            expect(text == 'longClick').assertTrue()
            await newButton.click()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9009
         * @tc.name: testUiComponentClick
         * @tc.desc: click this UiComponentClick.
         */
        it('testUiComponentClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('next page'))
            await button.click()
            await driver.delayMs(waitUiReadyMs)
            let newButton = await driver.findComponent(ON.text('back to index'))
            let text = await newButton.getText()
            expect(text == 'back to index').assertTrue()
            await newButton.click()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9010
         * @tc.name: testUiComponentDoubleClick
         * @tc.desc: doubleClick this UiComponentClick.
         */
        it('testUiComponentDoubleClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('Click twice'))
            if (button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                button = await scorll.scrollSearch(ON.text('Click twice'))
            }
            await button.doubleClick()
            await driver.delayMs(waitUiReadyMs)
            let newButton = await driver.findComponent(ON.text('doubleClick'))
            let text = await newButton.getText()
            expect(text == 'doubleClick').assertTrue()
            await newButton.click()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9011
         * @tc.name: testUiComponentLongClick
         * @tc.desc: longClick this UiComponentClick.
         */
        it('testUiComponentLongClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('next page'))
            await button.longClick()
            await driver.delayMs(waitUiReadyMs)
            let newButton = await driver.findComponent(ON.text('longClick'))
            let text = await newButton.getText()
            expect(text == 'longClick').assertTrue()
            await newButton.click()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9012
         * @tc.name: testKey
         * @tc.desc: find UiComponent by key attribute and get it's key attribute.
         */
        it('testKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.id('my-key'))
            expect(await button.getId() == 'my-key').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9013
         * @tc.name: testType
         * @tc.desc: find UiComponent by type attribute and get it's type attribute.
         */
        it('testType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let text = await driver.findComponent(ON.type('Text'))
            let type = await text.getType()
            expect(type == 'Text').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9014
         * @tc.name: testClickable
         * @tc.desc: find UiComponent by clickable attribute and get it's clickable attribute.
         */
        it('testClickable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('next page').clickable())
            if (button == null) {
                button = await driver.findComponent(ON.text('next page').clickable(false))
            }
            let clickable = await button.isClickable()
            expect(clickable == false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9015
         * @tc.name: testLongClickable
         * @tc.desc: find UiComponent by longClickable attribute and get it's longClickable attribute.
         */
        it('testLongClickable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('next page').longClickable())
            if (button == null) {
                button = await driver.findComponent(ON.text('next page').longClickable(false))
            }
            let longClickable = await button.isLongClickable()
            expect(longClickable== false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9016
         * @tc.name: testScrollable
         * @tc.desc: find UiComponent by scrollable attribute and get it's scrollable attribute.
         */
        it('testScrollable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let scrollBar = await driver.findComponent(ON.type('Scroll').scrollable(false))
            if (scrollBar == null) {
                scrollBar = await driver.findComponent(ON.type('Scroll').scrollable())
            }
            let scrollable = await scrollBar.isScrollable()
            expect(scrollable == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9017
         * @tc.name: testEnabled
         * @tc.desc: find UiComponent by enabled attribute and get it's enabled attribute.
         */
        it('testEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('next page').enabled(false))
            if (button == null) {
                button = await driver.findComponent(ON.text('next page').enabled())
            }
            let enable = await button.isEnabled()
            expect(enable == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9018
         * @tc.name: testFocused
         * @tc.desc: find UiComponent by focused attribute and get it's focused attribute.
         */
        it('testFocused', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('next page').focused())
            if (button == null) {
                button = await driver.findComponent(ON.text('next page').focused(false))
            }
            let focused = await button.isFocused()
            expect(focused == false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9019
         * @tc.name: testSelected
         * @tc.desc: find UiComponent by selected attribute and get it's selected attribute.
         */
        it('testSelected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('next page').selected())
            if (button == null) {
                button = await driver.findComponent(ON.text('next page').selected(false))
            }
            let selected = await button.isSelected()
            expect(selected == false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9020
         * @tc.name: testPressBack
         * @tc.desc: Press the BACK key.
         */
        it('testPressBack', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('next page'))
            await button.click()
            await driver.delayMs(waitUiReadyMs)
            await driver.pressBack()
            await driver.delayMs(waitUiReadyMs)
            let button_ori = await driver.findComponent(ON.text('next page'))
            expect(await button_ori.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9021
         * @tc.name: testFindComponents
         * @tc.desc: find all the matched UiComponents on current UI
         */
        it('testFindComponents', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let buttons = await driver.findComponents(ON.type('Button'))
            expect(await buttons[0].getText() != null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9022
         * @tc.name: testTriggerKey
         * @tc.desc: press the specified key.
         */
        it('testTriggerKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('next page'))
            await button.click()
            await driver.delayMs(waitUiReadyMs)
            let keyBack = 2
            await driver.triggerKey(keyBack)
            await driver.delayMs(waitUiReadyMs)
            let button_ori = await driver.findComponent(ON.text('next page'))
            expect(await button_ori.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })



        /*
         * @tc.number: uiTest_9024
         * @tc.name: testGetUiComponentBounds
         * @tc.desc: get the bounds of this UiComponent.
         */
        it('testGetUiComponentBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let text = await driver.findComponent(ON.text('next page'))
            expect(text !== null).assertTrue()
            let bounds = await text.getBounds();
            expect(bounds !== null).assertTrue()
            expect(bounds.right).assertLarger(bounds.left)
            expect(bounds.bottom).assertLarger(bounds.top)
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9025
         * @tc.name: testGetUiComponentBoundsCenter
         * @tc.desc: get the boundsCenter of this @link UiComponent.
         */
        it('testGetUiComponentBoundsCenter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('next page'))
            let point = await button.getBoundsCenter()
            expect(point!== null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9026
         * @tc.name: testWaitForComponent
         * @tc.desc: Find the first matched UiComponent on current UI during the time given.
         */
        it('testWaitForComponent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.waitForComponent(ON.text('next page'), waitUiReadyMs)
            expect(button !== null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9027
         * @tc.name: testScreenCap
         * @tc.desc: capture current screen.
         */
        it('testScreenCap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let savePath = '/data/storage/el2/base/cache/1.png'
            let success = await driver.screenCap(savePath)
            expect(success == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9028
         * @tc.name: testAssertComponentExist
         * @tc.desc:  Assert whether the matched UiComponent exists on current UI;.
         */
        it('testAssertComponentExist', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            await driver.assertComponentExist(ON.text('next page'))
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9029
         * @tc.name: testIsBefore
         * @tc.desc: find uiComponent which is before another UiComponent that specified by given.
         */
        it('testIsBefore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.isBefore(ON.text('next page')).type('Button'))
            expect(await button.getType() == 'Button').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9030
         * @tc.name: testIsAfter
         * @tc.desc: find uiComponent which is after another UiComponent that specified by given.
         */
        it('testIsAfter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.isAfter(ON.text('dialog')).type('Text'))
            expect(await button.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9031
         * @tc.name: testSwipe
         * @tc.desc: swipe on the screen between the specified points.
         */
        it('testSwipe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let scoll = await driver.findComponent(ON.type('Scroll'))
            let rect = await scoll.getBounds()
            let center = await scoll.getBoundsCenter()
            await driver.swipe(center.x, Math.floor(center.y + (rect.bottom - rect.top) / 4),
                center.x, Math.floor(center.y - (rect.bottom - rect.top) / 4))
            await driver.delayMs(waitUiReadyMs)
            let text = await driver.findComponent(ON.text('toast'))
            expect(text == null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9032
         * @tc.name: testFling
         * @tc.desc: inject fling on the device display.
         */
        it('testFling', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let scoll = await driver.findComponent(ON.type('Scroll'))
            let rect = await scoll.getBounds()
            let center = await scoll.getBoundsCenter()
            await driver.fling({x: center.x, y:Math.floor(center.y + (rect.bottom - rect.top) / 4)},
                {x: center.x, y:Math.floor(center.y - (rect.bottom - rect.top) / 4)}, 20, 600)
            await driver.delayMs(1000)
            let text = await driver.findComponent(ON.text('toast'))
            expect(text == null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9033
         * @tc.name: testScrollSearch
         * @tc.desc: scroll on this UiComponent to find matched UiComponent.
         */
        it('testScrollSearch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let scrollBar = await driver.findComponent(ON.type('Scroll'))
            let button = await scrollBar.scrollSearch(ON.text('next page'))
            expect(await button.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9034
         * @tc.name: testScrollToBottom
         * @tc.desc: scroll on this UiComponent to the bottom.
         */
        it('testScrollToBottom', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let scrollBar = await driver.findComponent(ON.type('Scroll'))
            expect(scrollBar != null).assertTrue()
            await scrollBar.scrollToBottom()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('bottom'))
            expect(await button.getText() == 'bottom').assertTrue()
            await scrollBar.scrollToTop()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9034
         * @tc.name: testScrollToBottom
         * @tc.desc: scroll on this UiComponent to the bottom.
         */
        it('testScrollToBottom_speed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let scrollBar = await driver.findComponent(ON.type('Scroll'))
            expect(scrollBar != null).assertTrue()
            await scrollBar.scrollToBottom(600)
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('bottom'))
            expect(await button.getText() == 'bottom').assertTrue()
            await scrollBar.scrollToTop()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9035
         * @tc.name: testScrollToTop
         * @tc.desc: scroll on this UiComponent to the top.
         */
        it('testScrollToTop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let scrollBar = await driver.findComponent(ON.type('Scroll'))
            expect(scrollBar !== null).assertTrue()
            await scrollBar.scrollToBottom()
            await driver.delayMs(waitUiReadyMs)
            await scrollBar.scrollToTop()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('next page'))
            expect(await button.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9035
         * @tc.name: testScrollToTop
         * @tc.desc: scroll on this UiComponent to the top.
         */
        it('testScrollToTop_speed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let scrollBar = await driver.findComponent(ON.type('Scroll'))
            expect(scrollBar !== null).assertTrue()
            await scrollBar.scrollToBottom()
            await driver.delayMs(waitUiReadyMs)
            await scrollBar.scrollToTop(600)
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('next page'))
            expect(await button.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })


        /*
         * @tc.number: uiTest_9036
         * @tc.name: testPinch
         * @tc.desc: pinch enlarge this UiComponent to the target scale.
         */
        it('testPinch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.id('jump'))
            if (button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                button = await scorll.scrollSearch(ON.id('jump'))
            }
            await button.click()
            await driver.delayMs(waitUiReadyMs)
            let image1 = await driver.findComponent(ON.id('test_pict'))
            let bounds1 = await image1.getBounds()
            await image1.pinchIn(0.5);
            await driver.delayMs(waitUiReadyMs)
            let image2 = await driver.findComponent(ON.id('test_pict'))
            let bounds2 = await image2.getBounds()
            expect(bounds2 != bounds1).assertTrue()
            await image2.pinchOut(1.2);
            let image3 = await driver.findComponent(ON.id('test_pict'))
            let bounds3 = await image3.getBounds()
            expect(bounds3 != bounds2).assertTrue()
            await driver.pressBack()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9037
         * @tc.name: testInjectMultiPointerAction
         * @tc.desc: inject multi-pointer action on the device display.
         */
        it('testInjectMultiPointerAction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.id('jump'))
            if (button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                button = await scorll.scrollSearch(ON.id('jump'))
            }
            await button.click()
            await driver.delayMs(waitUiReadyMs)
            let image1 = await driver.findComponent(ON.id('test_pict'))
            let bounds1 = await image1.getBounds()
            let left = bounds1.left
            let right = bounds1.right
            let centerY = Math.floor((bounds1.top + bounds1.bottom) / 2)
            let pointer = PointerMatrix.create(2,11)
            await driver.delayMs(300)
            for (let step = 0; step < 11; step++) {
                pointer.setPoint(0, step, {x: left + 200 - (step + 1) *20, y: centerY + step * 20})
            }
            for (let step = 0; step < 11; step++) {
                pointer.setPoint(1, step, {x: right - 200 + (step + 1) *20, y: centerY - step * 20})
            }
            await driver.injectMultiPointerAction(pointer, 400)
            await driver.delayMs(3000)
            let image2 = await driver.findComponent(ON.id('test_pict'))
            let bounds2= await image2.getBounds()
            expect(bounds2 != bounds1).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9038
         * @tc.name: testGetWindowMode
         * @tc.desc: get the window mode of this UiWindow.
         */
        it('testGetWindowMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let window1 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
            let mode1 = await window1.getWindowMode()
            try {
                await window1.resume()
                let window2 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
                let mode2 = await window2.getWindowMode()
                if (mode1 == WindowMode.FULLSCREEN) {
                    expect(mode2 == WindowMode.FLOATING).assertTrue()
                    expect(mode2 != WindowMode.SECONDARY).assertTrue()
                    expect(mode2 != WindowMode.PRIMARY).assertTrue()
                } else {
                    expect(mode2 == WindowMode.FULLSCREEN).assertTrue()
                }
                await stopApplication('com.uitestScene.acts')
            }
            catch (err) {
                if (err.message == 'this device can not support this action') {
                    expect(window1 != null).assertTrue()
                } else {
                    expect(false).assertTrue()
                }
            }
        })

        /*
         * @tc.number: uiTest_9039
         * @tc.name: testGetBundleName
         * @tc.desc: get the bundleName of this UiWindow.
         */
        it('testGetBundleName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let window = await driver.findWindow({bundleName:'com.uitestScene.acts'})
            let name = await window.getBundleName()
            expect(name == 'com.uitestScene.acts').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9040
         * @tc.name: testGetTitle
         * @tc.desc: get the title of this UiWindow.
         */
        it('testGetTitle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let window = await driver.findWindow({bundleName:'com.uitestScene.acts'})
            let title = await window.getTitle()
            expect(title == '').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9041
         * @tc.name: testWindowMoveTo
         * @tc.desc: move this UiWindow to the specified points.
         */
        it('testWindowMoveTo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let window = await driver.findWindow({bundleName:'com.uitestScene.acts'})
            try{
                let windowMode = await window.getWindowMode()
                if (windowMode != WindowMode.FLOATING) {
                    await window.resume()
                }
                await driver.delayMs(waitUiReadyMs)
                let window1 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
                let bounds1 = await window1.getBounds()
                await window1.moveTo(100,100)
                await driver.delayMs(waitUiReadyMs)
                let window2 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
                let bounds2 = await window2.getBounds()
                expect(bounds1 != bounds2).assertTrue()
                await stopApplication('com.uitestScene.acts')
            }
            catch (err) {
                if (err.message == 'this device can not support this action') {
                    expect(window != null).assertTrue()
                } else {
                    expect(false).assertTrue()
                }
            }
        })

        /*
         * @tc.number: uiTest_9042
         * @tc.name: testWindowResize
         * @tc.desc: resize this UiWindow to the specified size for the specified direction.
         */
        it('testWindowResizeA', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let window = await driver.findWindow({bundleName:'com.uitestScene.acts'})
            try{
                let windowMode = await window.getWindowMode()
                if (windowMode != WindowMode.FLOATING) {
                    await window.resume()
                }
                await driver.delayMs(waitUiReadyMs)

                let window1 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
                let bounds1 = await window1.getBounds()
                await window1.resize(600,600,ResizeDirection.RIGHT_DOWN)
                await driver.delayMs(waitUiReadyMs)
                let window2 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
                let bounds2 = await window2.getBounds()
                expect(bounds2 != bounds1).assertTrue()

                await window2.resize(400,400,ResizeDirection.RIGHT_UP)
                await driver.delayMs(waitUiReadyMs)
                let window3 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
                let bounds3= await window3.getBounds()
                expect(bounds3 != bounds2).assertTrue()
                await window3.resize(300,300,ResizeDirection.LEFT_DOWN)
                await driver.delayMs(waitUiReadyMs)
                let window4 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
                let bounds4= await window4.getBounds()
                expect(bounds4 != bounds3).assertTrue()

                await window4.resize(500,500,ResizeDirection.LEFT_UP)
                await driver.delayMs(waitUiReadyMs)
                let window5 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
                let bounds5= await window5.getBounds()
                expect(bounds5 != bounds4).assertTrue()
                await stopApplication('com.uitestScene.acts')
            }
            catch (err) {
                if (err.message == 'this device can not support this action') {
                    expect(window != null).assertTrue()
                } else {
                    expect(false).assertTrue()
                }
            }
        })

        it('testWindowResizeB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let window = await driver.findWindow({bundleName:'com.uitestScene.acts'})
            try{
                let windowMode = await window.getWindowMode()
                if (windowMode != WindowMode.FLOATING) {
                    await window.resume()
                }
                await driver.delayMs(waitUiReadyMs)

                let window5 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
                let bounds5= await window5.getBounds()
                await window5.resize(bounds5.right - bounds5.left,300,ResizeDirection.DOWN)
                await driver.delayMs(waitUiReadyMs)
                let window6 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
                let bounds6= await window6.getBounds()
                expect(bounds6 != bounds5).assertTrue()

                await window6.resize(bounds6.right - bounds6.left,500,ResizeDirection.UP)
                await driver.delayMs(waitUiReadyMs)
                let window7 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
                let bounds7 = await window7.getBounds()
                expect(bounds7 != bounds6).assertTrue()

                await window7.resize(300,bounds7.bottom - bounds7.top,ResizeDirection.LEFT)
                await driver.delayMs(waitUiReadyMs)
                let window8 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
                let bounds8 = await window8.getBounds()
                expect(bounds8 != bounds7).assertTrue()

                await window8.resize(500,bounds8.bottom - bounds8.top,ResizeDirection.RIGHT)
                await driver.delayMs(waitUiReadyMs)
                let window9 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
                let bounds9 = await window9.getBounds()
                expect(bounds9 != bounds8).assertTrue()

                await stopApplication('com.uitestScene.acts')
            }
            catch (err) {
                if (err.message == 'this device can not support this action') {
                    expect(window != null).assertTrue()
                } else {
                    expect(false).assertTrue()
                }
            }
        })

        /*
         * @tc.number: uiTest_9043
         * @tc.name: testWindowAttr
         * @tc.desc: set the focused status of this UiWindow.
         */
        it('testWindowAttr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let window = await driver.findWindow({bundleName:'com.uitestScene.acts',focused:true,actived:true,title:''})
            await window.focus()
            await driver.delayMs(waitUiReadyMs)
            let isFocused = await window.isFocused()
            let isActived = await window.isActived()
            expect(isFocused == true).assertTrue()
            expect(isActived == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9044
         * @tc.name: testWindowMaximize
         * @tc.desc: maximize this UiWindow.
         */
        it('testWindowMaximize', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let window = await driver.findWindow({bundleName:'com.uitestScene.acts'})
            try{
                let windowMode = await window.getWindowMode()
                if (windowMode != WindowMode.FLOATING) {
                    await window.resume()
                }
                let window2 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
                await window2.maximize()
                await driver.delayMs(waitUiReadyMs)
                let window3 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
                let mode = await window3.getWindowMode()
                expect(mode == WindowMode.FULLSCREEN).assertTrue()
                await stopApplication('com.uitestScene.acts')
            }
            catch (err) {
                if (err.message == 'this device can not support this action') {
                    expect(window != null).assertTrue()
                } else {
                    expect(false).assertTrue()
                }
            }
        })

        /*
         * @tc.number: uiTest_9045
         * @tc.name: testWindowMinimize
         * @tc.desc: minimize this UiWindow.
         */
        it('testWindowMinimize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let window = await driver.findWindow({bundleName:'com.uitestScene.acts'})
            try{
                await window.minimize()
                await driver.delayMs(waitUiReadyMs)
                let window1 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
                expect(window1 == null).assertTrue()
                await stopApplication('com.uitestScene.acts')
            }
            catch (err) {
                if (err.message == 'this device can not support this action') {
                    expect(window != null).assertTrue()
                } else {
                    expect(false).assertTrue()
                }
            }
        })

        /*
         * @tc.number: uiTest_9046
         * @tc.name: testWindowClose
         * @tc.desc: close this UiWindow.
         */
        it('testWindowClose', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let window = await driver.findWindow({bundleName:'com.uitestScene.acts'})
            try{
                await window.close()
                await driver.delayMs(waitUiReadyMs)
                let window1 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
                expect(window1 == null).assertTrue()
            }
            catch (err) {
                if (err.message == 'this device can not support this action') {
                    expect(window != null).assertTrue()
                } else {
                    expect(false).assertTrue()
                }
            }
        })

        /*
         * @tc.number: uiTest_9047
         * @tc.name: testGetDisplaySize
         * @tc.desc: get the size of the device display.
         */
        it('testGetDisplaySize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let s = await driver.getDisplaySize()
            expect(s.x != 0).assertTrue()
            expect(s.y != 0).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9048
         * @tc.name: testGetDisplayDensity
         * @tc.desc: get the density of the device display.
         */
        it('testGetDisplayDensity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let s = await driver.getDisplayDensity()
            expect(s.x != 0).assertTrue()
            expect(s.y != 0).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9051
         * @tc.name: testWakeUpDisplay
         * @tc.desc: wake up the device display.
         */
        it('testWakeUpDisplay', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            await driver.wakeUpDisplay()
            await stopApplication('com.uitestScene.acts')
        })



        /*
         * @tc.number: uiTest_9053
         * @tc.name: testWaitForIdle
         * @tc.desc: wait for the UI become idle.
         */
        it('testWaitForIdle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(2000)
            let idled = await driver.waitForIdle(4000,5000)
            expect(idled = true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9056
         * @tc.name: testSplit
         * @tc.desc: change this UiWindow into split screen mode.
         */
        it('testSplit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let window1 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
            try {
                await window1.split()
                await driver.delayMs(waitUiReadyMs)
                let bar = await driver.findComponent(ON.type('DecorBar'))
                expect(bar == null).assertTrue()
            }
            catch (err) {
                if (err.message == 'this device can not support this action') {
                    expect(window1 != null).assertTrue()
                } else {
                    expect(false).assertTrue()
                }
            }
            await stopApplication('com.uitestScene.acts')
        })
    })

    describe('UiTest_API8', () => {
        let driver: UiDriver
        beforeAll(async (done: Function) => {
            driver = UiDriver.create()
            await driver.delayMs(1000)
            done()
        })

        afterEach(async () => {
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8001
         * @tc.name: testInputText
         * @tc.desc: inject text to the target UiComponent
         */
        it('testInputText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let input = await driver.findComponent(BY.type('TextInput'))
            if (input == null) {
                let scorll = await driver.findComponent(BY.type('Scroll'))
                input = await scorll.scrollSearch(BY.type('TextInput'))
            }
            await input.inputText('123')
            await driver.delayMs(2000)
            await exitInputMethod()
            await driver.delayMs(2000)
            let input_new = await driver.findComponent(BY.type('TextInput'))
            let text = await input_new.getText()
            console.info("testInputText result :" + text)
            expect(text == '123').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8002
         * @tc.name: testMatchPattern
         * @tc.desc: specifies the string value match pattern.
         */
        it('testMatchPattern', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let Button1 = await driver.findComponent(BY.text('next page', MatchPattern.EQUALS))
            expect(await Button1.getText() == 'next page').assertTrue()
            let Button2 = await driver.findComponent(BY.text('next', MatchPattern.STARTS_WITH))
            expect(await Button2.getText() == 'next page').assertTrue()
            let Button3 = await driver.findComponent(BY.text('xt page', MatchPattern.ENDS_WITH))
            expect(await Button3.getText() == 'next page').assertTrue()
            let Button4 = await driver.findComponent(BY.text('ext', MatchPattern.CONTAINS))
            expect(await Button4.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8003
         * @tc.name: testUiComponentClick
         * @tc.desc: click this UiComponentClick.
         */
        it('testUiComponentClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('next page'))
            await button.click()
            await driver.delayMs(waitUiReadyMs)
            let newButton = await driver.findComponent(BY.text('back to index'))
            let text = await newButton.getText()
            expect(text == 'back to index').assertTrue()
            await newButton.click()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8004
         * @tc.name: testUiComponentDoubleClick
         * @tc.desc: doubleClick this UiComponentClick.
         */
        it('testUiComponentDoubleClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('Click twice'))
            if (button == null) {
                let scorll = await driver.findComponent(BY.type('Scroll'))
                button = await scorll.scrollSearch(BY.text('Click twice'))
            }
            await button.doubleClick()
            await driver.delayMs(waitUiReadyMs)
            let newButton = await driver.findComponent(BY.text('doubleClick'))
            let text = await newButton.getText()
            expect(text == 'doubleClick').assertTrue()
            await newButton.click()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8005
         * @tc.name: testUiComponentLongClick
         * @tc.desc: longClick this UiComponentClick.
         */
        it('testUiComponentLongClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('next page'))
            await button.longClick()
            await driver.delayMs(waitUiReadyMs)
            let newButton = await driver.findComponent(BY.text('longClick'))
            let text = await newButton.getText()
            expect(text == 'longClick').assertTrue()
            await newButton.click()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8006
         * @tc.name: testKey
         * @tc.desc: find UiComponent by key attribute and get it's key attribute.
         */
        it('testKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.key('my-key'))
            expect(await button.getKey() == 'my-key').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8007
         * @tc.name: testId
         * @tc.desc: find UiComponent by id attribute and get it's id attribute.
         */
        it('testId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('next page'))
            let id = await button.getId()
            let button2 = await driver.findComponent(BY.id(id))
            expect(await button2.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8008
         * @tc.name: testType
         * @tc.desc: find UiComponent by type attribute and get it's type attribute.
         */
        it('testType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let text = await driver.findComponent(BY.type('Text'))
            let type = await text.getType()
            expect(type == 'Text').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8009
         * @tc.name: testClickable
         * @tc.desc: find UiComponent by clickable attribute and get it's clickable attribute.
         */
        it('testClickable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('next page').clickable())
            if (button == null) {
                button = await driver.findComponent(BY.text('next page').clickable(false))
            }
            let clickable = await button.isClickable()
            expect(clickable == false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8010
         * @tc.name: testScrollable
         * @tc.desc: find UiComponent by scrollable attribute and get it's scrollable attribute.
         */
        it('testScrollable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let scrollBar = await driver.findComponent(BY.type('Scroll').scrollable(false))
            if (scrollBar == null) {
                scrollBar = await driver.findComponent(BY.type('Scroll').scrollable())
            }
            let scrollable = await scrollBar.isScrollable()
            expect(scrollable == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8011
         * @tc.name: testEnabled
         * @tc.desc: find UiComponent by enabled attribute and get it's enabled attribute.
         */
        it('testEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('next page').enabled(false))
            if (button == null) {
                button = await driver.findComponent(BY.text('next page').enabled())
            }
            let enable = await button.isEnabled()
            expect(enable == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8012
         * @tc.name: testFocused
         * @tc.desc: find UiComponent by focused attribute and get it's focused attribute.
         */
        it('testFocused', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('next page').focused())
            if (button == null) {
                button = await driver.findComponent(BY.text('next page').focused(false))
            }
            let focused = await button.isFocused()
            expect(focused == false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8013
         * @tc.name: testSelected
         * @tc.desc: find UiComponent by selected attribute and get it's selected attribute.
         */
        it('testSelected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('next page').selected())
            if (button == null) {
                button = await driver.findComponent(BY.text('next page').selected(false))
            }
            let selected = await button.isSelected()
            expect(selected == false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8014
         * @tc.name: testPressBack
         * @tc.desc: Press the BACK key.
         */
        it('testPressBack', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('next page'))
            await button.click()
            await driver.delayMs(waitUiReadyMs)
            await driver.pressBack()
            await driver.delayMs(waitUiReadyMs)
            let button_ori = await driver.findComponent(BY.text('next page'))
            expect(await button_ori.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8015
         * @tc.name: testFindComponents
         * @tc.desc: find all the matched UiComponents on current UI
         */
        it('testFindComponents', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let buttons = await driver.findComponents(BY.type('Button'))
            expect(await buttons[0].getText() != null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8016
         * @tc.name: testTriggerKey
         * @tc.desc: press the specified key.
         */
        it('testTriggerKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('next page'))
            await button.click()
            await driver.delayMs(waitUiReadyMs)
            let keyBack = 2
            await driver.triggerKey(keyBack)
            await driver.delayMs(waitUiReadyMs)
            let button_ori = await driver.findComponent(BY.text('next page'))
            expect(await button_ori.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8017
         * @tc.name: testScreenCap
         * @tc.desc: capture current screen.
         */
        it('testScreenCap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let savePath = '/data/storage/el2/base/cache/1.png'
            let success = await driver.screenCap(savePath)
            expect(success == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8018
         * @tc.name: testAssertComponentExist
         * @tc.desc:  Assert whether the matched UiComponent exists on current UI;.
         */
        it('testAssertComponentExist', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            await driver.assertComponentExist(BY.text('next page'))
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8019
         * @tc.name: testIsBefore
         * @tc.desc: find uiComponent which is before another UiComponent that specified by given.
         */
        it('testIsBefore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.isBefore(BY.text('next page')).type('Button'))
            expect(await button.getType() == 'Button').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8020
         * @tc.name: testIsAfter
         * @tc.desc: find uiComponent which is after another UiComponent that specified by given.
         */
        it('testIsAfter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.isAfter(BY.text('dialog')).type('Text'))
            expect(await button.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8021
         * @tc.name: testSwipe
         * @tc.desc: swipe on the screen between the specified points.
         */
        it('testSwipe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let displayClass = await display.getDefaultDisplay();
            let screenWidth = displayClass.width
            let screenHeight = displayClass.height
            console.info('screenWidth:' + screenWidth + ', screenHeight:' +screenHeight)
            await driver.swipe(Math.floor(screenWidth / 2), Math.floor(screenHeight / 2 + screenHeight / 8),
                Math.floor(screenWidth / 2), Math.floor(screenHeight / 2 - screenHeight / 8))
            await driver.delayMs(waitUiReadyMs)
            let text = await driver.findComponent(BY.text('toast'))
            expect(text == null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8022
         * @tc.name: testScrollSearch
         * @tc.desc: scroll on this UiComponent to find matched UiComponent.
         */
        it('testScrollSearch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let scrollBar = await driver.findComponent(BY.type('Scroll'))
            let button = await scrollBar.scrollSearch(BY.text('next page'))
            expect(await button.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8023
         * @tc.name: testUiDriverClick
         * @tc.desc: click in the specified location on the screen.
         */
        it('testUiDriverClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            const driver1 = Driver.create();
            await driver1.delayMs(waitUiReadyMs)
            let button = await driver1.findComponent(ON.text('next page'))
            let center = await button.getBoundsCenter();
            await driver.click(center.x, center.y)
            await driver1.delayMs(waitUiReadyMs)
            let newButton = await driver1.findComponent(ON.text('back to index'))
            let text = await newButton.getText()
            expect(text == 'back to index').assertTrue()
            await newButton.click()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8024
         * @tc.name: testDriverDoubleClick
         * @tc.desc: doubleClick in the specified location on the screen.
         */
        it('testUiDriverDoubleClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            const driver1 = Driver.create();
            await driver1.delayMs(waitUiReadyMs)
            let Button = await driver1.findComponent(ON.text('Click twice'))
            if (Button == null) {
                let scorll = await driver1.findComponent(ON.type('Scroll'))
                Button = await scorll.scrollSearch(ON.text('Click twice'))
            }
            let center = await Button.getBoundsCenter()
            await driver.doubleClick(center.x, center.y)
            await driver.delayMs(waitUiReadyMs)
            let button = await driver1.findComponent(ON.text('doubleClick'))
            let text = await button.getText()
            expect(text == 'doubleClick').assertTrue()
            await button.click()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9008
         * @tc.name: testDriverLongClick
         * @tc.desc: longClick in the specified location on the screen.
         */
        it('testUiDriverLongClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            const driver1 = Driver.create();
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let Button = await driver1.findComponent(ON.text('next page'))
            let center = await Button.getBoundsCenter()
            await driver.longClick(center.x, center.y)
            await driver.delayMs(waitUiReadyMs)
            let newButton = await driver1.findComponent(ON.text('longClick'))
            let text = await newButton.getText()
            expect(text == 'longClick').assertTrue()
            await newButton.click()
            await stopApplication('com.uitestScene.acts')
        })
    })
}
