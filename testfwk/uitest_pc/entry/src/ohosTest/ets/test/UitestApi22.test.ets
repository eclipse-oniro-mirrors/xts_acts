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
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver, Point, ComponentEventType,
    WindowChangeType } from '@ohos.UiTest'
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
const CapabilityCode = 801;

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
    console.log(`${TestTag},softKeyBoard: ${JSON.stringify(softKeyBoard)}`);
    if (softKeyBoard != null) {
        await driver.pressBack()
    }
}

async function getInputMethodPermission() {
    let driver = Driver.create()
    await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
    await driver.delayMs(2000)
    let TextInput = await driver.findComponent(ON.type('TextInput'))
    if (TextInput == null) {
        let scorll = await driver.findComponent(ON.type('Scroll'))
        TextInput = await scorll.scrollSearch(ON.type('TextInput'))
    }
    await TextInput.click()
    await driver.delayMs(1000)
    let permissionBtn1 = await driver.findComponent(ON.text('同意'))
    if (permissionBtn1 != null) {
        await permissionBtn1.click()
        await driver.delayMs(1000)
    }
    let permissionBtn2 = await driver.findComponent(ON.text('下一步'))
    if (permissionBtn2 != null) {
        await permissionBtn2.click()
        await driver.delayMs(1000)
    }
    await stopApplication('com.uitestScene.acts')
}

export default function UiTest() {
    describe('UiTest_API22', () => {
        let driver: Driver
        beforeAll(async (done: Function) => {
            driver = Driver.create()
            await driver.delayMs(1000)
            await getInputMethodPermission()
            done()
        })

        beforeEach(async () => {
            await stopApplication('com.uitestScene.acts');
        })

        /**
         * @tc.name   testWindowChangeAddOptionsMonitor
         * @tc.number UiTest_API22_001
         * @tc.desc   monitor window add.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testWindowChangeAddOptionsMonitor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(`${TestTag}, testWindowChangeAddOptionsMonitor start`);
            let observer = await driver.createUIEventObserver();
            let isCallBack = false;
            let callback = (elementInfo : UIElementInfo) => {
                console.log(`${TestTag}, testWindowChangeAddOptionsMonitor elementInfo,${JSON.stringify(elementInfo)}`);
                isCallBack = true;
                try {
                    expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
                    expect(elementInfo.windowChangeType == WindowChangeType.WINDOW_ADDED).assertTrue();
                    expect(elementInfo.windowId != 0).assertTrue();
                } catch (err) {
                    console.log(`${TestTag}, testWindowChangeAddOptionsMonitor callback error ,${JSON.stringify(err)}`);
                }
            }
            try {
                observer.once('windowChange', WindowChangeType.WINDOW_ADDED, {
                    bundleName: 'com.uitestScene.acts',
                    timeout: 9000
                }, callback);
            } catch (error) {
                console.log(`${TestTag}, testWindowChangeAddOptionsMonitor once error ,${JSON.stringify(error)}`);
                expect(error.code).assertEqual(17000005);
            }
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(2000);
            await stopApplication('com.uitestScene.acts');
            expect(isCallBack).assertTrue();
            console.log(`${TestTag}, testWindowChangeAddOptionsMonitor end`);
        })

        /**
         * @tc.name   testWindowChangeRemoveOptionsMonitor
         * @tc.number UiTest_API22_002
         * @tc.desc   monitor window add.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testWindowChangeRemoveOptionsMonitor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor start`);
            let observer = await driver.createUIEventObserver();
            let isCallBack = false;
            let callback = (elementInfo : UIElementInfo) => {
                console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor elementInfo,${JSON.stringify(elementInfo)}`);
                isCallBack = true;
                try {
                    expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
                    expect(elementInfo.windowChangeType == WindowChangeType.WINDOW_REMOVED).assertTrue();
                    expect(elementInfo.windowId != 0).assertTrue();
                } catch (err) {
                    console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor callback error ,${JSON.stringify(err)}`);
                }
            }
            try {
                observer.once('windowChange', WindowChangeType.WINDOW_REMOVED, {
                    bundleName: 'com.uitestScene.acts',
                    timeout: 9000
                }, callback);
            } catch (error) {
                console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor once error ,${JSON.stringify(error)}`);
                expect(error.code).assertEqual(17000005);
            }
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(2000);
            await stopApplication('com.uitestScene.acts');
            expect(isCallBack).assertTrue();
            console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor end`);
        })

        /**
         * @tc.name   testWindowChangeResizeOptionsMonitor
         * @tc.number UiTest_API22_003
         * @tc.desc   monitor window resize.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testWindowChangeResizeOptionsMonitor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor start`);
            let observer = await driver.createUIEventObserver();
            let isCallBack = false;
            let callback = (elementInfo : UIElementInfo) => {
                console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor elementInfo,${JSON.stringify(elementInfo)}`);
                isCallBack = true;
                try {
                    expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
                    expect(elementInfo.windowChangeType == WindowChangeType.WINDOW_BOUNDS_CHANGED).assertTrue();
                    expect(elementInfo.windowId != 0).assertTrue();
                } catch (err) {
                    console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor callback error ,${JSON.stringify(err)}`);
                }
            }
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            try {
                observer.once('windowChange', WindowChangeType.WINDOW_BOUNDS_CHANGED, {
                    bundleName: 'com.uitestScene.acts',
                    timeout: 9000
                }, callback)
            } catch (error) {
                console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor once error ,${JSON.stringify(error)}`);
                expect(error.code).assertEqual(17000005);
            }
            try {
                let window = await driver.findWindow({bundleName:'com.uitestScene.acts'})
                let wModel: WindowMode = await window.getWindowMode();
                if (wModel != WindowMode.FLOATING) {
                    await window.resume();
                    await driver.delayMs(1000);
                }
                await window.maximize();
                await driver.delayMs(1000);
            } catch (err) {
                console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor resize error ,${JSON.stringify(err)}`);
            }
            await driver.delayMs(5000);
            await stopApplication('com.uitestScene.acts');
            expect(isCallBack).assertTrue();
            console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor end`);
        })

        /**
         * @tc.name   testWindowResizeB_split1
         * @tc.number UiTest_Uiwindow0180
         * @tc.desc   resize this UiWindow.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testWindowResizeB_split1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
            await window1.split()
            await driver.delayMs(waitUiReadyMs*2)
            let testLabel = await driver.findComponent(ON.text('test label'));
            await driver.delayMs(waitUiReadyMs);
            await testLabel.click()
            await driver.delayMs(waitUiReadyMs)
            let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
            let bounds1 = await window2.getBounds()
            try {
              await window2.resize(600, bounds1.bottom - bounds1.top, ResizeDirection.RIGHT)
              await driver.delayMs(waitUiReadyMs*5)
              let window3 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
              let bounds2 = await window3.getBounds()
              expect(bounds1.right != bounds2.right).assertTrue()
            } catch (error) {
              console.log('testWindowMinimize_split1 error is ' + error)
              expect(error.code == DeviceErrorCode).assertTrue()
            }
            await stopApplication('com.uitestScene.acts')
            let resumeWindow = await driver.findWindow({ bundleName: 'com.uitest.acts' })
            if (resumeWindow != null) {
              await resumeWindow.resume()
            }
          })

    })
}
