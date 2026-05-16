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
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver, Point, ComponentEventType, On } from '@ohos.UiTest'
import ability_featureAbility from '@ohos.ability.featureAbility';
import { BusinessError } from '@ohos.base';
import display from '@ohos.display';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator: AbilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
const waitUiReadyMs: number = 1000;
const TestTag = 'UiTest_TAG';
const DeviceErrorCode = 17000005;
const ErrorCode = 401;
const CapabilityCode = 801;

async function startAbility(bundleName: string, abilityName: string) {
    await delegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`).then(result => {
        console.info(`UiTestCase, start abilityFinished: ${result}`)
    }).catch((err: BusinessError) => {
        console.error(`UiTestCase, start abilityFailed: ${err}`)
    })
}

async function stopApplication(bundleName: string) {
    await delegator.executeShellCommand(`aa force-stop ${bundleName} `).then(result => {
        console.info(`UiTestCase, stop application finished: ${result}`)
    }).catch((err: BusinessError) => {
        console.error(`UiTestCase,stop application failed: ${err}`)
    })
}

async function maxUiWindow(driver: Driver, window: UiWindow | null) {
    if (window != null) {
        try {
            let windowMode = await window.getWindowMode();
            if (windowMode == WindowMode.FULLSCREEN) {
                return;
            }
            await window.maximize();
        } catch (error) {
            console.log(`${TestTag}, maxUiWindow error,${JSON.stringify(error)}`);
        }
    } else {
        console.log(`${TestTag}, maxUiWindow null`);
    }
    await driver.delayMs(3000);
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
    let textInput = await driver.findComponent(ON.type('TextInput'))
    if (textInput == null) {
        let scroll = await driver.findComponent(ON.type('Scroll'))
        textInput = await scroll.scrollSearch(ON.type('TextInput'))
    }
    if (textInput != null) {
        await textInput.click()
        await driver.delayMs(1000)
    }
    let permissionBtn1 = await driver.findComponent(ON.text('同意'))
    if (permissionBtn1 == null) {
        let scroll = await driver.findComponent(ON.type('Scroll'))
        if (scroll != null) {
            permissionBtn1 = await scroll.scrollSearch(ON.text('同意'))
        }
    }
    if (permissionBtn1 != null) {
        await permissionBtn1.click()
        await driver.delayMs(1000)
    }
    let permissionBtn2 = await driver.findComponent(ON.text('下一步'))
    if (permissionBtn2 != null) {
        await permissionBtn2.click()
        await driver.delayMs(1000)
    }
    let permissionBtn3 = await driver.findComponent(ON.text('完成'))
    if (permissionBtn3 != null) {
        await permissionBtn3.click()
        await driver.delayMs(1000)
    }
    let keyboardMenuBtnAreaBtn = await driver.findComponent(ON.id('keyboardMenuBtnArea'))
    if (keyboardMenuBtnAreaBtn != null) {
        await keyboardMenuBtnAreaBtn.click()
        await driver.delayMs(1000)
        let menuItemList = await driver.findComponents(ON.id('menuItem'))
        if (menuItemList != null && menuItemList.length > 4) {
            await menuItemList[3].click()
            await driver.delayMs(1000)
        }
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

        afterAll(async () => {
            await stopApplication('com.uitestScene.acts');
        })

        /**
         * @tc.name   testComponentEventOccurOptionsClickMonitor
         * @tc.number UiTest_API22_001
         * @tc.desc   monitor component click.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testComponentEventOccurOptionsClickMonitor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(`${TestTag}, testComponentEventOccurOptionsClickMonitor start`);
            let isCallBack = false;
            let observer = await driver.createUIEventObserver()
            let callback = (elementInfo: UIElementInfo) => {
                console.log(`${TestTag}, testComponentEventOccurOptionsClickMonitor elementInfo,${JSON.stringify(elementInfo)}`);
                isCallBack = true;
                try {
                    expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
                    expect(elementInfo.text == 'toast').assertTrue()
                    expect(elementInfo.type == 'Button').assertTrue()
                    expect(elementInfo.componentEventType == 1).assertTrue();
                    expect(elementInfo.componentId).assertEqual('toastBtn');
                } catch (err) {
                    console.log(`${TestTag}, testComponentEventOccurOptionsClickMonitor callback error ,${JSON.stringify(err)}`);
                }
            }
            try {
                let nextOn: On = ON.text('toast').type('Button');
                observer.once('componentEventOccur', ComponentEventType.COMPONENT_CLICKED, {
                    timeout: 9000,
                    on: nextOn
                }, callback);
            } catch (error) {
                console.log(`${TestTag}, testComponentEventOccurOptionsClickMonitor once error ,${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            }
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let btn = await driver.findComponent(ON.isBefore(ON.text('next page')).type('Button'))
            await btn.click()
            await driver.delayMs(5000)
            expect(isCallBack).assertTrue();
            await stopApplication('com.uitestScene.acts')
            console.log(`${TestTag}, testComponentEventOccurOptionsClickMonitor end`);
        })

        /**
         * @tc.name   testComponentEventOccurOptionsLongClickMonitor
         * @tc.number UiTest_API22_002
         * @tc.desc   monitor component LongClick.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testComponentEventOccurOptionsLongClickMonitor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(`${TestTag}, testComponentEventOccurOptionsLongClickMonitor start`);
            let observer = await driver.createUIEventObserver();
            let isCallBack = false;
            let callback = (elementInfo: UIElementInfo) => {
                console.log(`${TestTag}, testComponentEventOccurOptionsLongClickMonitor elementInfo,${JSON.stringify(elementInfo)}`);
                isCallBack = true;
                try {
                    expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue();
                    expect(elementInfo.text == '').assertTrue();
                    expect(elementInfo.type == 'Button').assertTrue();
                    expect(elementInfo.componentEventType == 2).assertTrue();
                    expect(elementInfo.componentId).assertEqual('my-key');
                } catch (err) {
                    console.log(`${TestTag}, testComponentEventOccurOptionsLongClickMonitor callback,${JSON.stringify(err)}`);
                }
            }
            try {
                observer.once('componentEventOccur', ComponentEventType.COMPONENT_LONG_CLICKED, {
                    on: ON.type('Button').text('')
                }, callback);
            } catch (error) {
                console.log(`${TestTag}, testComponentEventOccurOptionsLongClickMonitor once error ,${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            }
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            await driver.delayMs(waitUiReadyMs);
            let btn = await driver.findComponent(ON.text('next page'));
            await btn.longClick();
            await driver.delayMs(5000);
            console.log(`${TestTag}, testComponentEventOccurOptionsLongClickMonitor isCallBack,${JSON.stringify(isCallBack)}`);
            expect(isCallBack).assertTrue();
            await stopApplication('com.uitestScene.acts');
            console.log(`${TestTag}, testComponentEventOccurOptionsLongClickMonitor end`);
        })

        /**
         * @tc.name   testComponentEventOccurOptionsWithInClickMonitor
         * @tc.number UiTest_API22_003
         * @tc.desc   monitor component click.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testComponentEventOccurOptionsWithInClickMonitor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(`${TestTag}, testComponentEventOccurOptionsWithInClickMonitor start`);
            let observer = await driver.createUIEventObserver();
            let isCallBack = false;
            let callback = (elementInfo: UIElementInfo) => {
                console.log(`${TestTag}, testComponentEventOccurOptionsWithInClickMonitor elementInfo,${JSON.stringify(elementInfo)}`);
                isCallBack = true;
                try {
                    expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
                    expect(elementInfo.text == 'toast').assertTrue()
                    expect(elementInfo.type == 'Button').assertTrue()
                    expect(elementInfo.componentEventType == 1).assertTrue();
                    expect(elementInfo.componentId).assertEqual('toastBtn');
                } catch (err) {
                    console.log(`${TestTag}, testComponentEventOccurOptionsWithInClickMonitor callback error ,${JSON.stringify(err)}`);
                }
            }
            try {
                observer.once('componentEventOccur', ComponentEventType.COMPONENT_CLICKED, {
                    timeout: 9000,
                    on: ON.text('toast')
                }, callback);
            } catch (error) {
                console.log(`${TestTag}, testComponentEventOccurOptionsWithInClickMonitor once error ,${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            }
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            await driver.delayMs(waitUiReadyMs);
            let btn = await driver.findComponent(ON.within(ON.type('Scroll')).text('toast'));
            await btn.click();
            await driver.delayMs(5000);
            expect(isCallBack).assertTrue();
            await stopApplication('com.uitestScene.acts');
            console.log(`${TestTag}, testComponentEventOccurOptionsWithInClickMonitor end`);
        })

        /**
         * @tc.name   testComponentEventOccurOptionsScrollStartMonitor
         * @tc.number UiTest_API22_004
         * @tc.desc   monitor component Scroll start.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testComponentEventOccurOptionsScrollStartMonitor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(`${TestTag}, testComponentEventOccurOptionsScrollStartMonitor start`);
            let observer = await driver.createUIEventObserver();
            let isCallBack = false;
            let callback = async (elementInfo: UIElementInfo) => {
                console.log(`${TestTag}, testComponentEventOccurOptionsScrollStartMonitor elementInfo,${JSON.stringify(elementInfo)}`);
                isCallBack = true;
                try {
                    expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
                    expect(elementInfo.text == '').assertTrue()
                    expect(elementInfo.type == 'Scroll').assertTrue()
                    expect(elementInfo.componentEventType == 3).assertTrue();
                    expect(elementInfo.componentId == 'parentScroll').assertTrue();
                    expect(elementInfo.componentRect != null).assertTrue();
                } catch (err) {
                    console.log(`${TestTag}, testComponentEventOccurOptionsScrollStartMonitor callback error, ${JSON.stringify(err)}`);
                }
            }
            try {
                let on1: On = ON.type('Scroll').id('parentScroll');
                observer.once('componentEventOccur', ComponentEventType.COMPONENT_SCROLL_START, {
                    on: on1
                }, callback);
            } catch (error) {
                console.log(`${TestTag}, testComponentEventOccurOptionsScrollStartMonitor once error, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            }
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let scrollBar = await driver.findComponent(ON.type('Scroll').id('parentScroll'))
            let rect = await scrollBar.getBounds()
            let center = await scrollBar.getBoundsCenter()
            await driver.swipeBetween({ x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4) },
                { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4) })
            await driver.delayMs(5000);
            await stopApplication('com.uitestScene.acts');
            expect(isCallBack).assertTrue();
            console.log(`${TestTag}, testComponentEventOccurOptionsScrollStartMonitor end`);
        })

        /**
         * @tc.name   testComponentEventOccurOptionsScrollEndMonitor
         * @tc.number UiTest_API22_005
         * @tc.desc   monitor component Scroll end.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testComponentEventOccurOptionsScrollEndMonitor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(`${TestTag}, testComponentEventOccurOptionsScrollEndMonitor start`);
            let observer = await driver.createUIEventObserver();
            let isCallBack = false;
            let callback = async (elementInfo: UIElementInfo) => {
                console.log(`${TestTag}, testComponentEventOccurOptionsScrollEndMonitor elementInfo,${JSON.stringify(elementInfo)}`);
                isCallBack = true;
                try {
                    expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
                    expect(elementInfo.text == '').assertTrue()
                    expect(elementInfo.type == 'Scroll').assertTrue()
                    expect(elementInfo.componentEventType == 4).assertTrue();
                    expect(elementInfo.componentId == 'parentScroll').assertTrue();
                    expect(elementInfo.componentRect != null).assertTrue();
                } catch (err) {
                    console.log(`${TestTag}, testComponentEventOccurOptionsScrollEndMonitor callback error, ${JSON.stringify(err)}`);
                }
            }
            try {
                observer.once('componentEventOccur', ComponentEventType.COMPONENT_SCROLL_END, {
                    on: ON.type('Scroll').id('parentScroll')
                }, callback)
            } catch (error) {
                console.log(`${TestTag}, testComponentEventOccurOptionsScrollEndMonitor once error, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            }
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let scrollBar = await driver.findComponent(ON.type('Scroll').id('parentScroll'))
            let rect = await scrollBar.getBounds()
            let center = await scrollBar.getBoundsCenter()
            await driver.swipeBetween({ x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4) },
                { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4) })
            await driver.delayMs(5000);
            await stopApplication('com.uitestScene.acts');
            expect(isCallBack).assertTrue();
            console.log(`${TestTag}, testComponentEventOccurOptionsScrollEndMonitor end`);
        })

        /**
         * @tc.name   testComponentEventOccurOptionsTextContentMonitor
         * @tc.number UiTest_API22_006
         * @tc.desc   monitor component text changed.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testComponentEventOccurOptionsTextContentMonitor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(`${TestTag}, testComponentEventOccurOptionsTextContentMonitor start`);
            let observer = await driver.createUIEventObserver();
            let isCallBack = false;
            let callback = async (elementInfo: UIElementInfo) => {
                console.log(`${TestTag}, testComponentEventOccurOptionsTextContentMonitor elementInfo,${JSON.stringify(elementInfo)}`);
                isCallBack = true;
                try {

                    expect(elementInfo.bundleName).assertEqual('com.uitestScene.acts');
                    expect(elementInfo.text).assertEqual('Second Page');
                    expect(elementInfo.type).assertEqual('TextInput');
                    expect(elementInfo.componentEventType).assertEqual(5);
                    expect(elementInfo.componentId).assertEqual('changContext');
                } catch (err) {
                    console.log(`${TestTag}, testComponentEventOccurOptionsTextContentMonitor callback error, ${JSON.stringify(err)}`);
                }
            }
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs);
            let nextPageBtn = await driver.findComponent(ON.text('next page'));
            await driver.delayMs(waitUiReadyMs);
            await nextPageBtn.click();
            await driver.delayMs(waitUiReadyMs);
            try {
                observer.once('componentEventOccur', ComponentEventType.COMPONENT_TEXT_CHANGED, {
                    on: ON.id('changContext')
                }, callback);
            } catch (err) {
                console.log(`${TestTag}, testComponentEventOccurOptionsTextContentMonitor once error, ${JSON.stringify(err)}`);
                expect(err.code).assertEqual(DeviceErrorCode);
            }
            let changTest = await driver.findComponent(ON.id('changTest'));
            await driver.delayMs(1000);
            let center = await changTest.getBoundsCenter();
            await driver.click(center.x, center.y);
            await driver.delayMs(waitUiReadyMs);
            await driver.triggerCombineKeys(2072, 2017);
            await driver.delayMs(waitUiReadyMs);
            await driver.triggerCombineKeys(2072, 2019);
            await driver.delayMs(waitUiReadyMs);
            await exitInputMethod();
            await driver.delayMs(1000);
            let changContextTxt = await driver.findComponent(ON.id('changContext'));
            let changCenter = await changContextTxt.getBoundsCenter();
            await driver.click(changCenter.x, changCenter.y);
            await driver.delayMs(waitUiReadyMs);
            await driver.triggerCombineKeys(2072, 2038);
            await driver.delayMs(1000);
            await exitInputMethod();
            await driver.delayMs(5000);
            await stopApplication('com.uitestScene.acts');
            expect(isCallBack).assertTrue();
            console.log(`${TestTag}, testComponentEventOccurOptionsTextContentMonitor end`);
        })

        /**
         * @tc.name   testComponentEventOccurOptionsTimeOutClickMonitor
         * @tc.number UiTest_API22_007
         * @tc.desc   monitor component click.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testComponentEventOccurOptionsTimeOutClickMonitor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(`${TestTag}, testComponentEventOccurOptionsTimeOutClickMonitor start`);
            let isCallback = false;
            let observer = await driver.createUIEventObserver()
            let callback = (elementInfo: UIElementInfo) => {
                try {
                    console.log(`${TestTag}, testComponentEventOccurOptionsTimeOutClickMonitor elementInfo,${JSON.stringify(elementInfo)}`);
                    isCallback = true;
                    expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
                    expect(elementInfo.text == 'toast').assertTrue()
                    expect(elementInfo.type == 'Button').assertTrue()
                    expect(elementInfo.componentEventType == 1).assertTrue();
                } catch (err) {
                    isCallback = false;
                    console.log(`${TestTag}, testComponentEventOccurOptionsTimeOutClickMonitor callback error ,${JSON.stringify(err)}`);
                }
            }
            try {
                observer.once('componentEventOccur', ComponentEventType.COMPONENT_CLICKED, {
                    timeout: 3000
                }, callback)
            } catch (erro) {
                console.log(`${TestTag}, testComponentEventOccurOptionsTimeOutClickMonitor callback error ,${JSON.stringify(erro)}`);
                expect(erro.code).assertEqual(DeviceErrorCode);
            }
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let btn = await driver.findComponent(ON.isBefore(ON.text('next page')).type('Button'))
            console.log(`${TestTag}, testComponentEventOccurOptionsTimeOutClickMonitor btn, ${JSON.stringify(btn)}`);
            await driver.delayMs(5000);
            await btn.click()
            await driver.delayMs(waitUiReadyMs)
            await stopApplication('com.uitestScene.acts')
            console.log(`${TestTag}, testComponentEventOccurOptionsTimeOutClickMonitor isCallback, ${JSON.stringify(isCallback)}`);
            expect(isCallback).assertFalse();
            console.log(`${TestTag}, testComponentEventOccurOptionsTimeOutClickMonitor end`);
        })

        /**
         * @tc.name   tesIsComponentPresentWhenLongClickTrue
         * @tc.number UiTest_API22_012
         * @tc.desc   isComponentPresentWhenLongClick test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('tesIsComponentPresentWhenLongClickTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(`${TestTag}, tesIsComponentPresentWhenLongClickTrue start`);
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            await driver.delayMs(waitUiReadyMs);
            let to5Btn = await driver.findComponent(ON.id('to5'));
            if (to5Btn == null) {
                let scroll = await driver.findComponent(ON.type('Scroll'))
                to5Btn = await scroll.scrollSearch(ON.id('to5'))

            }
            await to5Btn.click();
            await driver.delayMs(waitUiReadyMs);
            let longClickBtn = await driver.findComponent(ON.id('longClickBtn'));
            await driver.delayMs(waitUiReadyMs);
            let center = await longClickBtn.getBoundsCenter();
            await driver.delayMs(waitUiReadyMs);
            let result = await driver.isComponentPresentWhenLongClick(ON.text('ShowLongEventText'), center)
            expect(result).assertTrue();
            await driver.delayMs(waitUiReadyMs);
            let longClickTextResultBtn = await driver.findComponent(ON.id('longClickTextResult'));
            let longClickText = await longClickTextResultBtn.getText();
            expect(longClickText == 'longClickEvent').assertTrue();
            await driver.delayMs(waitUiReadyMs);
            await stopApplication('com.uitestScene.acts')
            console.log(`${TestTag}, tesIsComponentPresentWhenLongClickTrue end`);
        })

        /**
         * @tc.name   tesIsComponentPresentWhenLongClickFalse
         * @tc.number UiTest_API22_013
         * @tc.desc   isComponentPresentWhenLongClick test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('tesIsComponentPresentWhenLongClickFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(`${TestTag}, tesIsComponentPresentWhenLongClickNotCom start`);
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            await driver.delayMs(waitUiReadyMs);
            let to5Btn = await driver.findComponent(ON.id('to5'));
            if (to5Btn == null) {
                let scroll = await driver.findComponent(ON.type('Scroll'))
                to5Btn = await scroll.scrollSearch(ON.id('to5'))

            }
            await to5Btn.click();
            await driver.delayMs(waitUiReadyMs);
            let longClickBtn = await driver.findComponent(ON.id('longClickBtn'));
            await driver.delayMs(waitUiReadyMs);
            let center = await longClickBtn.getBoundsCenter();
            await driver.delayMs(waitUiReadyMs);
            let disPlay = display.getDefaultDisplaySync();
            console.log(`${TestTag}, tesIsComponentPresentWhenLongClickNotCom disPlay is: ${JSON.stringify(disPlay)}`);
            let result = await driver.isComponentPresentWhenLongClick(ON.text('ShowLongEventTextNot'), {
                x: center.x,
                y: center.y,
                displayId: disPlay.id
            }, 3000)
            expect(result).assertFalse();
            await driver.delayMs(waitUiReadyMs);
            let longClickTextResultBtn = await driver.findComponent(ON.id('longClickTextResult'));
            let longClickText = await longClickTextResultBtn.getText();
            expect(longClickText == 'longClickEvent').assertTrue();
            await driver.delayMs(waitUiReadyMs);
            await stopApplication('com.uitestScene.acts')
            console.log(`${TestTag}, tesIsComponentPresentWhenLongClickNotCom end`);
        })

        /**
         * @tc.name   tesIsComponentPresentWhenDragFalse
         * @tc.number UiTest_API22_015
         * @tc.desc   isComponentPresentWhenDrag test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('tesIsComponentPresentWhenDragFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(`${TestTag}, tesIsComponentPresentWhenDragFalse start`);
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            await driver.delayMs(waitUiReadyMs);
            let to5Btn = await driver.findComponent(ON.id('to5'));
            if (to5Btn == null) {
                let scroll = await driver.findComponent(ON.type('Scroll'))
                to5Btn = await scroll.scrollSearch(ON.id('to5'))

            }
            await to5Btn.click();
            await driver.delayMs(waitUiReadyMs);
            let dragColCom = await driver.findComponent(ON.id('dragCol'));
            await driver.delayMs(waitUiReadyMs);
            let center1 = await dragColCom.getBoundsCenter();
            let dragResultTextCom = await driver.findComponent(ON.id('dragResultText'));
            await driver.delayMs(waitUiReadyMs);
            let center2 = await dragResultTextCom.getBoundsCenter();
            let disPlay = display.getDefaultDisplaySync();
            console.log(`${TestTag}, tesIsComponentPresentWhenDragFalse disPlay is: ${JSON.stringify(disPlay)}`);
            let result = await driver.isComponentPresentWhenDrag(ON.text('ShowDragEventTextNot'), {
                x: center1.x,
                y: center1.y,
                displayId: disPlay.id
            }, {
                x: center2.x,
                y: center2.y,
                displayId: disPlay.id
            }, 2000)
            console.log(`${TestTag}, tesIsComponentPresentWhenDragFalse result, ${JSON.stringify(result)}`);
            expect(result).assertFalse();
            let text = await driver.findComponent(ON.text('drag end'));
            expect(text != null).assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(`${TestTag}, tesIsComponentPresentWhenDragFalse end`);
        })

        /**
         * @tc.name   tesIsComponentPresentWhenSwipeTrue
         * @tc.number UiTest_API22_016
         * @tc.desc   isComponentPresentWhenSwipe test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('tesIsComponentPresentWhenSwipeTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(`${TestTag}, tesIsComponentPresentWhenSwipeTrue start`);
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            await driver.delayMs(waitUiReadyMs)
            let scrollBar = await driver.findComponent(ON.type('Scroll').id('parentScroll'))
            let rect = await scrollBar.getBounds()
            let center = await scrollBar.getBoundsCenter()
            let result = await driver.isComponentPresentWhenSwipe(ON.text('ShowSwipeEventCom'),
                { x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4) },
                { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4) })
            console.log(`${TestTag}, tesIsComponentPresentWhenSwipeTrue result, ${JSON.stringify(result)}`);
            expect(result).assertTrue();
            let text = await driver.findComponent(ON.text('toast'))
            expect(text == null).assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(`${TestTag}, tesIsComponentPresentWhenSwipeTrue end`);
        })


        /**
         * @tc.name   tesIsComponentPresentWhenSwipeFalse
         * @tc.number UiTest_API22_017
         * @tc.desc   isComponentPresentWhenSwipe test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('tesIsComponentPresentWhenSwipeFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(`${TestTag}, tesIsComponentPresentWhenSwipeFalse start`);
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            await driver.delayMs(waitUiReadyMs)
            let scrollBar = await driver.findComponent(ON.type('Scroll').id('parentScroll'))
            let rect = await scrollBar.getBounds()
            let center = await scrollBar.getBoundsCenter()
            let disPlay = display.getDefaultDisplaySync();
            console.log(`${TestTag}, tesIsComponentPresentWhenSwipeFalse disPlay is: ${JSON.stringify(disPlay)}`);
            let result = await driver.isComponentPresentWhenSwipe(ON.text('ShowSwipeEventComNot'),
                { x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4), displayId: disPlay.id },
                { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, 5000)
            console.log(`${TestTag}, tesIsComponentPresentWhenSwipeFalse result, ${JSON.stringify(result)}`);
            expect(result).assertFalse();
            let text = await driver.findComponent(ON.text('toast'))
            expect(text == null).assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(`${TestTag}, tesIsComponentPresentWhenSwipeFalse end`);
        })

        /**
         * @tc.name   tesKnuckleKnockSingle
         * @tc.number UiTest_API22_018
         * @tc.desc   isComponentPresentWhenLongClick test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('tesKnuckleKnockSingle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(`${TestTag}, tesKnuckleKnockSingle start`);
            try {
                let play = display.getDefaultDisplaySync();
                console.log(`${TestTag}, tesKnuckleKnockSingle play, ${JSON.stringify(play)}`);
                let points: Array<Point> = []
                let point: Point = {
                    x: play.width / 2,
                    y: play.height / 2,
                    displayId: play.id
                }
                points.push(point)
                await driver.delayMs(waitUiReadyMs)
                await driver.knuckleKnock(points, 2)
                await driver.delayMs(waitUiReadyMs * 2)
                let screenPng = await driver.findComponent(ON.id('SCREENSHOT_PICTURE_PREVIEWER_IMAGE'));
                expect(screenPng != null).assertTrue();
            } catch (error) {
                console.log(`${TestTag}, tesKnuckleKnockSingle error, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(17000005);
            }
            await driver.delayMs(waitUiReadyMs * 2);
            console.log(`${TestTag}, tesKnuckleKnockSingle end`);
        })

        /**
         * @tc.name   tesKnuckleKnockDouble
         * @tc.number UiTest_API22_019
         * @tc.desc   isComponentPresentWhenLongClick test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('tesKnuckleKnockDouble', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(`${TestTag}, tesKnuckleKnockDouble start`);
            try {
                let play = display.getDefaultDisplaySync();
                let points: Array<Point> = []
                let point: Point = {
                    x: play.width / 2,
                    y: play.height / 2,
                    displayId: play.id
                }
                points.push(point)
                points.push(point)
                await driver.knuckleKnock(points, 2);
                await driver.delayMs(waitUiReadyMs * 2)
                let screenPng = await driver.findComponent(ON.id('.hmos.screenrecorder__1000', MatchPattern.ENDS_WITH));
                expect(screenPng != null).assertTrue();
                await driver.knuckleKnock(points, 2);
                await driver.delayMs(waitUiReadyMs);
            } catch (error) {
                console.log(`${TestTag}, tesKnuckleKnockDouble error, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(17000005);
            }
            await driver.delayMs(waitUiReadyMs * 2);
            console.log(`${TestTag}, tesKnuckleKnockDouble end`);
        })

        /**
         * @tc.name   tesKnuckleKnockS
         * @tc.number UiTest_API22_020
         * @tc.desc   isComponentPresentWhenLongClick test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('tesKnuckleKnockS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(`${TestTag}, tesKnuckleKnockS start`);
            let window = await driver.findWindow({ bundleName: 'com.uitest.acts' });
            console.log(`${TestTag}, tesKnuckleKnockS window,${JSON.stringify(window)}`);
            if (window != null) {
                try {
                    let windowMode = await window.getWindowMode();
                    if (windowMode != WindowMode.FLOATING) {
                        await window.resume();
                        await driver.delayMs(8000);
                    }
                    await window.maximize();
                } catch (error) {
                    console.log(`${TestTag}, tesKnuckleKnockS maximize error,${JSON.stringify(error)}`);
                }
            }
            await driver.delayMs(3000);
            try {
                let play = display.getDefaultDisplaySync();
                let centerX = play.width / 2;
                let centY = play.height / 2;
                let fivePoint: Point = { x: centerX - 40, y: centY - 80 };
                let sixPoint: Point = { x: centerX - 40, y: centY - 60 };
                let sevPoint: Point = { x: centerX - 40, y: centY - 40 };
                let eigPoint: Point = { x: centerX - 40, y: centY - 20 };
                let niePoint: Point = { x: centerX - 40, y: centY };
                let tenPoint: Point = { x: centerX - 20, y: centY };
                let ten1Point: Point = { x: centerX, y: centY };
                let ten2Point: Point = { x: centerX + 20, y: centY };
                let ten3Point: Point = { x: centerX + 40, y: centY };
                let ten4Point: Point = { x: centerX + 40, y: centY + 20 };
                let ten5Point: Point = { x: centerX + 40, y: centY + 40 };
                let ten6Point: Point = { x: centerX + 40, y: centY + 60 };
                let ten7Point: Point = { x: centerX + 40, y: centY + 80 };
                let pointers = PointerMatrix.create(1, 13);
                pointers.setPoint(0, 0, fivePoint);
                pointers.setPoint(0, 1, sixPoint);
                pointers.setPoint(0, 2, sevPoint);
                pointers.setPoint(0, 3, eigPoint);
                pointers.setPoint(0, 4, niePoint);
                pointers.setPoint(0, 5, tenPoint);
                pointers.setPoint(0, 6, ten1Point);
                pointers.setPoint(0, 7, ten2Point);
                pointers.setPoint(0, 8, ten3Point);
                pointers.setPoint(0, 9, ten4Point);
                pointers.setPoint(0, 10, ten5Point);
                pointers.setPoint(0, 11, ten6Point);
                pointers.setPoint(0, 12, ten7Point);
                await driver.injectKnucklePointerAction(pointers);
                await driver.delayMs(waitUiReadyMs * 5);
                let screenPng = await driver.findComponent(ON.id('ScrollHandWriteBoxStack'));
                expect(screenPng != null).assertTrue();
                await driver.pressBack();
                await driver.delayMs(waitUiReadyMs * 2);
            } catch (error) {
                console.log(`${TestTag}, tesKnuckleKnockS error, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(17000005);
            }
            await driver.delayMs(waitUiReadyMs * 2);
            console.log(`${TestTag}, tesKnuckleKnockS end`);
        })

        /**
         * @tc.name   tesKnuckleKnockRect
         * @tc.number UiTest_API22_021
         * @tc.desc   isComponentPresentWhenLongClick test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('tesKnuckleKnockRect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(`${TestTag}, tesKnuckleKnockRect start`);
            try {
                let play = display.getDefaultDisplaySync();
                let centerX = play.width / 2;
                let centY = play.height / 2;
                let onePoint: Point = { x: centerX - 100, y: centY - 100 };
                let twoPoint: Point = { x: centerX - 100, y: centY };
                let threePoint: Point = { x: centerX - 100, y: centY + 100 };
                let fourPoint: Point = { x: centerX, y: centY + 100 };
                let fivePoint: Point = { x: centerX + 100, y: centY + 100 };
                let sixPoint: Point = { x: centerX + 100, y: centY };
                let sevPoint: Point = { x: centerX + 100, y: centY - 100 };
                let eigPoint: Point = { x: centerX, y: centY - 100 };
                let ninePoint: Point = { x: centerX - 100, y: centY - 100 };
                let pointers = PointerMatrix.create(1, 9);
                pointers.setPoint(0, 0, onePoint);
                pointers.setPoint(0, 1, twoPoint);
                pointers.setPoint(0, 2, threePoint);
                pointers.setPoint(0, 3, fourPoint);
                pointers.setPoint(0, 4, fivePoint);
                pointers.setPoint(0, 5, sixPoint);
                pointers.setPoint(0, 6, sevPoint);
                pointers.setPoint(0, 7, eigPoint);
                pointers.setPoint(0, 8, ninePoint);
                await driver.injectKnucklePointerAction(pointers);
                await driver.delayMs(waitUiReadyMs * 5);
                let screenPng = await driver.findComponent(ON.text('保存'));
                expect(screenPng != null).assertTrue();
                await driver.pressBack();
            } catch (error) {
                console.log(`${TestTag}, tesKnuckleKnockRect error, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(17000005);
            }
            await driver.delayMs(waitUiReadyMs * 2);
            console.log(`${TestTag}, tesKnuckleKnockRect end`);
        })

        /**
         * @tc.name   teTouchPadTwoFingersScrollVer
         * @tc.number UiTest_API22_022
         * @tc.desc   isComponentPresentWhenLongClick test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('teTouchPadTwoFingersScrollVer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(`${TestTag}, teTouchPadTwoFingersScrollVer start`);
            try {
                await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
                await driver.delayMs(waitUiReadyMs);
                let scrollBar = await driver.findComponent(ON.type('Scroll').id('parentScroll'));
                await driver.delayMs(waitUiReadyMs);
                let center = await scrollBar.getBoundsCenter();
                await driver.delayMs(waitUiReadyMs);
                await driver.touchPadTwoFingersScroll({ x: center.x, y: center.y }, UiDirection.UP, 300);
                await driver.delayMs(waitUiReadyMs);
                let text = await driver.findComponent(ON.text('toast'));
                await driver.delayMs(waitUiReadyMs);
                expect(text == null).assertTrue()
                await driver.touchPadTwoFingersScroll({ x: center.x, y: center.y }, UiDirection.DOWN, 400);
                let text1 = await driver.findComponent(ON.text('toast'));
                await driver.delayMs(waitUiReadyMs);
                expect(text1 != null).assertTrue()
            } catch (error) {
                console.log(`${TestTag}, teTouchPadTwoFingersScrollVer error, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(17000005);
            }
            await stopApplication('com.uitestScene.acts');
            console.log(`${TestTag}, teTouchPadTwoFingersScrollVer end`);
        })

        /**
         * @tc.name   teTouchPadTwoFingersScrollHor
         * @tc.number UiTest_API22_023
         * @tc.desc   isComponentPresentWhenLongClick test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('teTouchPadTwoFingersScrollHor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(`${TestTag}, teTouchPadTwoFingersScrollHor start`);
            try {
                await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
                await driver.delayMs(waitUiReadyMs);
                let to5Btn = await driver.findComponent(ON.id('to5'));
                if (to5Btn == null) {
                    let scroll = await driver.findComponent(ON.type('Scroll'))
                    to5Btn = await scroll.scrollSearch(ON.id('to5'))

                }
                await to5Btn.click();
                await driver.delayMs(waitUiReadyMs);
                let scrollBar = await driver.findComponent(ON.type('Scroll').id('horizontalScroll'))
                await driver.delayMs(waitUiReadyMs);
                let center = await scrollBar.getBoundsCenter();
                await driver.delayMs(waitUiReadyMs);
                await driver.touchPadTwoFingersScroll({ x: center.x, y: center.y },
                    UiDirection.LEFT, 600);
                await driver.delayMs(waitUiReadyMs);
                let scroll11 = await driver.findComponent(ON.text('1_hor'));
                await driver.delayMs(waitUiReadyMs);
                expect(scroll11 == null).assertTrue();
                await driver.delayMs(waitUiReadyMs);
                await driver.touchPadTwoFingersScroll({ x: center.x, y: center.y },
                    UiDirection.RIGHT, 800);
                let scroll22 = await driver.findComponent(ON.text('1_hor'));
                await driver.delayMs(waitUiReadyMs);
                expect(scroll22 != null).assertTrue();
            } catch (error) {
                console.log(`${TestTag}, teTouchPadTwoFingersScrollHor error, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(17000005);
            }
            await stopApplication('com.uitestScene.acts')
            console.log(`${TestTag}, teTouchPadTwoFingersScrollHor end`);
        })

    })
    describe('UiTest_API20', () => {
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
         * @tc.name   testDriverLongClickAt
         * @tc.number uiTest_20001
         * @tc.desc   LongClick on the specified location on the screen, the value of duration is 3000.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testDriverLongClickAt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(`${TestTag}, testDriverLongClickAt start`);
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let Button = await driver.findComponent(ON.text('next page'))
            let center = await Button.getBoundsCenter()
            await driver.longClickAt(center, 3000)
            await driver.delayMs(waitUiReadyMs)
            let newButton = await driver.findComponent(ON.text('longClick'))
            let text = await newButton.getText()
            expect(text == 'longClick').assertTrue()
            await newButton.click()
            await stopApplication('com.uitestScene.acts')
            console.log(`${TestTag}, testDriverLongClickAt end`);
        })
      
        /**
         * @tc.name   testNewMouseLongClick
         * @tc.number uiTest_20002
         * @tc.desc   longClick in the specified location on the screen by mouse, the value of speed and duration are 3000.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNewMouseLongClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testNewMouseLongClick start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let Button = await driver.findComponent(ON.text('next page'))
            let center = await Button.getBoundsCenter()
            await driver.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 0, 3000)
            await driver.delayMs(waitUiReadyMs)
            let newButton = await driver.findComponent(ON.text('longClick'))
            let text = await newButton.getText()
            expect(text == 'longClick').assertTrue()
            console.log(TestTag, 'testNewMouseLongClick over');
        })
      
        /**
         * @tc.name   testDriverInputText
         * @tc.number uiTest_20003
         * @tc.desc   enter '123',the values of both paste and addition are false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testDriverInputText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testDriverInputText start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(2000)
            let text = await driver.findComponent(ON.type('TextInput'))
            if (text == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                text = await scorll.scrollSearch(ON.type('TextInput'))
            }
            let center = await text.getBoundsCenter()
            await driver.delayMs(2000);
            await driver.inputText(center, '123', { paste: false, addition: false })
            await exitInputMethod();
            await driver.delayMs(2000);
            let text1 = await driver.findComponent(ON.type('TextInput'))
            if (text1 == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                text1 = await scorll.scrollSearch(ON.type('TextInput'))
            }
            expect(await text1.getText() == 'Hello 123World').assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'testDriverInputText over');
        })
      
        /**
         * @tc.name   testDriverInputText1
         * @tc.number uiTest_20004
         * @tc.desc   enter '长贵儿',the values of both paste and addition are false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testDriverInputText1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testDriverInputText1 start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(2000)
            let text = await driver.findComponent(ON.type('TextInput'))
            if (text == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                text = await scorll.scrollSearch(ON.type('TextInput'))
            }
            await driver.delayMs(2000);
            let center = await text.getBoundsCenter();
            await driver.inputText(center, '长贵儿', { paste: false, addition: false });
            await driver.delayMs(2000)
            await exitInputMethod()
            await driver.delayMs(2000)
            let text2 = await driver.findComponent(ON.type('TextInput'))
            if (text2 == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                text2 = await scorll.scrollSearch(ON.type('TextInput'))
            }
            expect(await text2.getText() == 'Hello 长贵儿World').assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'testDriverInputText1 over');
        })
      
        /**
         * @tc.name   testDriverInputText2
         * @tc.number uiTest_20005
         * @tc.desc   enter '123',the values of paste is true,the values of addition is false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testDriverInputText2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testDriverInputText2 start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(2000)
            let text = await driver.findComponent(ON.type('TextInput'))
            if (text == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                text = await scorll.scrollSearch(ON.type('TextInput'))
            }
            await driver.delayMs(1000)
            let center = await text.getBoundsCenter()
            await driver.inputText(center, '123', { paste: true, addition: false })
            await driver.delayMs(2000)
            await exitInputMethod()
            await driver.delayMs(2000)
            let text1 = await driver.findComponent(ON.type('TextInput'))
            if (text1 == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                text1 = await scorll.scrollSearch(ON.type('TextInput'))
            }
            expect(await text1.getText() == 'Hello 123World').assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'testDriverInputText2 over');
        })
      
        /**
         * @tc.name   testDriverInputText3
         * @tc.number uiTest_20006
         * @tc.desc   enter '123',the values of paste is false,the values of addition is true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testDriverInputText3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testDriverInputText3 start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(2000)
            let text = await driver.findComponent(ON.type('TextInput'))
            if (text == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                text = await scorll.scrollSearch(ON.type('TextInput'))
            }
            let center = await text.getBoundsCenter()
            await driver.delayMs(2000)
            await driver.inputText(center, '123', { paste: false, addition: true })
            await driver.delayMs(2000)
            await exitInputMethod()
            await driver.delayMs(2000)
            let text1 = await driver.findComponent(ON.type('TextInput'))
            if (text1 == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                text1 = await scorll.scrollSearch(ON.type('TextInput'))
            }
            expect(await text1.getText() == 'Hello World123').assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'testDriverInputText3 over');
        })
      
        /**
         * @tc.name   testDriverInputText4
         * @tc.number uiTest_20007
         * @tc.desc   enter '123',the values of paste is true,the values of addition is true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testDriverInputText4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testDriverInputText4 start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(2000)
            let text = await driver.findComponent(ON.type('TextInput'))
            if (text == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                text = await scorll.scrollSearch(ON.type('TextInput'))
            }
            let center = await text.getBoundsCenter()
            await driver.delayMs(2000)
            await driver.inputText(center, '123', { paste: true, addition: true })
            await driver.delayMs(2000)
            await exitInputMethod()
            await driver.delayMs(2000)
            let text1 = await driver.findComponent(ON.type('TextInput'))
            if (text1 == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                text1 = await scorll.scrollSearch(ON.type('TextInput'))
            }
            expect(await text1.getText() == 'Hello World123').assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'testDriverInputText4 over');
        })
      
        /**
         * @tc.name   testComponentInputText
         * @tc.number uiTest_20008
         * @tc.desc   enter '123',the values of both paste and addition are false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testComponentInputText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testComponentInputText start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(2000)
            let text = await driver.findComponent(ON.type('TextInput'))
            if (text == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                text = await scorll.scrollSearch(ON.type('TextInput'))
            }
            await text.inputText('123', { paste: false, addition: false })
            await driver.delayMs(2000)
            await exitInputMethod()
            await driver.delayMs(2000)
            let text1 = await driver.findComponent(ON.type('TextInput'))
            if (text1 == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                text1 = await scorll.scrollSearch(ON.type('TextInput'))
            }
            expect(await text1.getText() == '123').assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'testComponentInputText over');
        })
      
        /**
         * @tc.name   testComponentInputText1
         * @tc.number uiTest_20009
         * @tc.desc   enter '长贵儿',the values of both paste and addition are false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testComponentInputText1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testComponentInputText1 start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(2000)
            let text = await driver.findComponent(ON.type('TextInput'))
            if (text == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                text = await scorll.scrollSearch(ON.type('TextInput'))
            }
            await driver.delayMs(2000)
            await text.inputText('长贵儿', { paste: false, addition: false })
            await driver.delayMs(2000)
            await exitInputMethod()
            await driver.delayMs(2000)
            let text1 = await driver.findComponent(ON.type('TextInput'))
            if (text1 == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                text1 = await scorll.scrollSearch(ON.type('TextInput'))
            }
            expect(await text1.getText() == '长贵儿').assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'testComponentInputText1 over');
        })
      
        /**
         * @tc.name   testComponentInputText2
         * @tc.number uiTest_20010
         * @tc.desc   enter '123',the values of paste is true,the values of addition is false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testComponentInputText2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testComponentInputText2 start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(2000)
            let text = await driver.findComponent(ON.type('TextInput'))
            if (text == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                text = await scorll.scrollSearch(ON.type('TextInput'))
            }
            await driver.delayMs(2000)
            await text.inputText('123', { paste: true, addition: false })
            await driver.delayMs(2000)
            await exitInputMethod()
            await driver.delayMs(2000)
            let text1 = await driver.findComponent(ON.type('TextInput'))
            if (text1 == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                text1 = await scorll.scrollSearch(ON.type('TextInput'))
            }
            expect(await text1.getText() == '123').assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'testComponentInputText2 over');
        })
      
        /**
         * @tc.name   testComponentInputText3
         * @tc.number uiTest_20011
         * @tc.desc   enter '123',the values of paste is false,the values of addition is true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testComponentInputText3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testComponentInputText3 start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(2000)
            let text = await driver.findComponent(ON.type('TextInput'))
            if (text == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                text = await scorll.scrollSearch(ON.type('TextInput'))
            }
            await text.inputText('123', { paste: false, addition: true })
            await driver.delayMs(2000)
            await exitInputMethod()
            await driver.delayMs(2000)
            let text1 = await driver.findComponent(ON.type('TextInput'))
            if (text1 == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                text1 = await scorll.scrollSearch(ON.type('TextInput'))
            }
            expect(await text1.getText() == 'Hello World123').assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'testComponentInputText3 over');
        })
      
        /**
         * @tc.name   testComponentInputText4
         * @tc.number uiTest_20012
         * @tc.desc   enter '123',the values of paste is true,the values of addition is true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testComponentInputText4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testComponentInputText4 start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(2000)
            let text = await driver.findComponent(ON.type('TextInput'))
            if (text == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                text = await scorll.scrollSearch(ON.type('TextInput'))
            }
            await text.inputText('123', { paste: true, addition: true })
            await driver.delayMs(2000)
            await exitInputMethod()
            await driver.delayMs(2000)
            let text1 = await driver.findComponent(ON.type('TextInput'))
            if (text1 == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                text1 = await scorll.scrollSearch(ON.type('TextInput'))
            }
            expect(await text1.getText() == 'Hello World123').assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'testComponentInputText4 over');
        })
      
        /**
         * @tc.name   testCrownRotate
         * @tc.number uiTest_20013
         * @tc.desc   crownRotate test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testCrownRotate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testCrownRotate start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(1000)
            let button = await driver.findComponent(ON.text('wearList'))
            if (button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                button = await scorll.scrollSearch(ON.text('wearList'))
            }
            await driver.delayMs(waitUiReadyMs)
            await button.click()
            await driver.delayMs(waitUiReadyMs)
            try {
                await driver.crownRotate(250);
                await driver.delayMs(1000);
                let toastBtn = await driver.findComponent(ON.text('1'));
                await driver.delayMs(1000);
                expect(toastBtn == null).assertTrue();
                await driver.delayMs(1000);
                await driver.crownRotate(-350);
                await driver.delayMs(1000);
                let toastBtn1 = await driver.findComponent(ON.text('1'));
                await driver.delayMs(1000);
                expect(toastBtn1 != null).assertTrue();
            } catch (error) {
                console.log(`${TestTag}, testCrownRotate error is: ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(CapabilityCode);
            }
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'testCrownRotate over');
        })
      
        /**
         * @tc.name   testCrownRotateSpeed
         * @tc.number uiTest_20014
         * @tc.desc   crownRotate test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testCrownRotateSpeed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testCrownRotateSpeed start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(1000)
            let button = await driver.findComponent(ON.text('wearList'))
            if (button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                button = await scorll.scrollSearch(ON.text('wearList'))
            }
            await driver.delayMs(waitUiReadyMs)
            await button.click()
            await driver.delayMs(waitUiReadyMs)
            try {
                await driver.crownRotate(250, 30);
                await driver.delayMs(1000);
                let toastBtn = await driver.findComponent(ON.text('1'));
                await driver.delayMs(1000);
                expect(toastBtn == null).assertTrue();
                await driver.delayMs(1000);
                await driver.crownRotate(-350, 30);
                await driver.delayMs(1000);
                let toastBtn1 = await driver.findComponent(ON.text('1'));
                await driver.delayMs(1000);
                expect(toastBtn1 != null).assertTrue();
            } catch (error) {
                console.log(`${TestTag}, testCrownRotateSpeed error is: ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(CapabilityCode);
            }
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'testCrownRotateSpeed over');
        })
      
        /**
         * @tc.name   testBelongingDisplay
         * @tc.number uiTest_20015
         * @tc.desc   belongingDisplay test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testBelongingDisplay', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testBelongingDisplay start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(1000);
            let disPlay = display.getDefaultDisplaySync();
            console.log(`${TestTag}, testBelongingDisplay disPlay is: ${JSON.stringify(disPlay)}`);
            try {
                let mainPage = await driver.findComponent(ON.belongingDisplay(disPlay.id).text('MainPage'));
                let msg = await mainPage.getText();
                console.log(`${TestTag}, testBelongingDisplay msg is: ${JSON.stringify(msg)}`);
                expect(msg).assertEqual('MainPage')
            } catch (error) {
                console.log(`${TestTag}, testBelongingDisplay error is: ${JSON.stringify(error)}`);
                expect().assertFail();
            }
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'testBelongingDisplay over');
        })
      
        /**
         * @tc.name   testGetDisplayId
         * @tc.number uiTest_20016
         * @tc.desc   getDisplayId test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetDisplayId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testGetDisplayId start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(1000);
            let disPlay = display.getDefaultDisplaySync();
            console.log(`${TestTag}, testGetDisplayId disPlay is: ${JSON.stringify(disPlay)}`);
            try {
                let mainPage = await driver.findComponent(ON.belongingDisplay(disPlay.id).text('MainPage'));
                let disId = await mainPage.getDisplayId();
                console.log(`${TestTag}, testGetDisplayId disId is: ${JSON.stringify(disId)}`);
                expect(disId).assertEqual(disPlay.id)
            } catch (error) {
                console.log(`${TestTag}, testGetDisplayId error is: ${JSON.stringify(error)}`);
                expect().assertFail();
            }
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'testGetDisplayId over');
        })
      
        /**
         * @tc.name   testPressBackWithId
         * @tc.number uiTest_20017
         * @tc.desc   pressBack test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testPressBackWithId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testPressBackWithId start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let disPlay = display.getDefaultDisplaySync();
            console.log(`${TestTag}, testPressBackWithId disPlay is: ${JSON.stringify(disPlay)}`);
            let button = await driver.findComponent(ON.belongingDisplay(disPlay.id).text('next page'))
            await button.click()
            await driver.delayMs(waitUiReadyMs)
            await driver.pressBack(disPlay.id)
            await driver.delayMs(waitUiReadyMs)
            let button_ori = await driver.findComponent(ON.belongingDisplay(disPlay.id).text('next page'))
            expect(await button_ori.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'testPressBackWithId over');
        })
      
        /**
         * @tc.name   testTriggerKeyWithId
         * @tc.number uiTest_20018
         * @tc.desc   triggerKey test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testTriggerKeyWithId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testTriggerKeyWithId start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let disPlay = display.getDefaultDisplaySync();
            console.log(`${TestTag}, testTriggerKeyWithId disPlay is: ${JSON.stringify(disPlay)}`);
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.belongingDisplay(disPlay.id).text('next page'))
            await button.click()
            await driver.delayMs(waitUiReadyMs)
            let keyBack = 2
            await driver.triggerKey(keyBack, disPlay.id)
            await driver.delayMs(waitUiReadyMs)
            let button_ori = await driver.findComponent(ON.belongingDisplay(disPlay.id).text('next page'))
            expect(await button_ori.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'testTriggerKeyWithId over');
        })
      
        /**
         * @tc.name   testScreenCapWithId
         * @tc.number uiTest_20019
         * @tc.desc   screenCap test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testScreenCapWithId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testScreenCapWithId start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let disPlay = display.getDefaultDisplaySync();
            console.log(`${TestTag}, testScreenCapWithId disPlay is: ${JSON.stringify(disPlay)}`);
            await driver.delayMs(waitUiReadyMs)
            let savePath = '/data/storage/el2/base/cache/1.png'
            let success = await driver.screenCap(savePath, disPlay.id)
            expect(success == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'testScreenCapWithId over');
        })
      
        /**
         * @tc.name   testGetDisplaySizeWithId
         * @tc.number uiTest_20020
         * @tc.desc   getDisplaySize test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetDisplaySizeWithId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testGetDisplaySizeWithId start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let disPlay = display.getDefaultDisplaySync();
            console.log(`${TestTag}, testScreenCapWithId disPlay is: ${JSON.stringify(disPlay)}`);
            let s = await driver.getDisplaySize(disPlay.id)
            expect(s.x != 0).assertTrue()
            expect(s.y != 0).assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'testScreenCapWithId over');
        })
      
        /**
         * @tc.name   testGetDisplayDensityWithId
         * @tc.number uiTest_20021
         * @tc.desc   getDisplayDensity test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetDisplayDensityWithId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testGetDisplayDensityWithId start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let disPlay = display.getDefaultDisplaySync();
            console.log(`${TestTag}, testGetDisplayDensityWithId disPlay is: ${JSON.stringify(disPlay)}`);
            let s = await driver.getDisplayDensity(disPlay.id)
            expect(s.x != 0).assertTrue()
            expect(s.y != 0).assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'testGetDisplayDensityWithId over');
        })
      
      
        /**
         * @tc.name   testClickAt
         * @tc.number uiTest_20022
         * @tc.desc   clickAt test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testClickAt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testClickAt start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let Button = await driver.findComponent(ON.text('next page'))
            let center = await Button.getBoundsCenter()
            await driver.clickAt(center)
            await driver.delayMs(waitUiReadyMs)
            let newButton = await driver.findComponent(ON.text('back to index'))
            let text = await newButton.getText()
            expect(text == 'back to index').assertTrue()
            await newButton.click()
            console.log(TestTag, 'testClickAt over');
        })
      
        /**
         * @tc.name   testDoubleClickAt
         * @tc.number uiTest_20023
         * @tc.desc   doubleClickAt test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testDoubleClickAt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testDoubleClickAt start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let Button = await driver.findComponent(ON.text('Click twice'))
            if (Button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                Button = await scorll.scrollSearch(ON.text('Click twice'))
            }
            let center = await Button.getBoundsCenter()
            await driver.doubleClickAt(center)
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('doubleClick'))
            let text = await button.getText()
            expect(text == 'doubleClick').assertTrue()
            await button.click()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'testDoubleClickAt over');
        })
      
        /**
         * @tc.name   test_swipeBetween
         * @tc.number uiTest_20024
         * @tc.desc   swipeBetween test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_swipeBetween', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'test_swipeBetween start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let disPlay = display.getDefaultDisplaySync();
            console.log(`${TestTag}, test_swipeBetween disPlay is: ${JSON.stringify(disPlay)}`);
            let scoll = await driver.findComponent(ON.type('Scroll'))
            let rect = await scoll.getBounds()
            let center = await scoll.getBoundsCenter()
            await driver.swipeBetween({
                x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
            , displayId: disPlay.id
            },
                { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id })
            await driver.delayMs(waitUiReadyMs)
            let text = await driver.findComponent(ON.text('toast'))
            expect(text == null).assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'test_swipeBetween over');
        })
      
        /**
         * @tc.name   test_swipeBetweenspeednull
         * @tc.number uiTest_20025
         * @tc.desc   swipeBetween test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_swipeBetweenspeednull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'test_swipeBetween start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let disPlay = display.getDefaultDisplaySync();
            console.log(`${TestTag}, test_swipeBetween disPlay is: ${JSON.stringify(disPlay)}`);
            let scoll = await driver.findComponent(ON.type('Scroll'))
            let rect = await scoll.getBounds()
            let center = await scoll.getBoundsCenter()
            await driver.swipeBetween({
                x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
            , displayId: disPlay.id
            },
                { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, null)
            await driver.delayMs(waitUiReadyMs)
            let text = await driver.findComponent(ON.text('toast'))
            expect(text == null).assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'test_swipeBetween over');
        })
      
        /**
         * @tc.name   test_swipeBetweenspeedundefined
         * @tc.number uiTest_20026
         * @tc.desc   swipeBetween test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_swipeBetweenspeedundefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'test_swipeBetween start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let disPlay = display.getDefaultDisplaySync();
            console.log(`${TestTag}, test_swipeBetween disPlay is: ${JSON.stringify(disPlay)}`);
            let scoll = await driver.findComponent(ON.type('Scroll'))
            let rect = await scoll.getBounds()
            let center = await scoll.getBoundsCenter()
            await driver.swipeBetween({
                x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
            , displayId: disPlay.id
            },
                { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, undefined)
            await driver.delayMs(waitUiReadyMs)
            let text = await driver.findComponent(ON.text('toast'))
            expect(text == null).assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'test_swipeBetween over');
        })
      
        /**
         * @tc.name   test_swipeBetweenspeed199
         * @tc.number uiTest_20027
         * @tc.desc   swipeBetween test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_swipeBetweenspeed199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'test_swipeBetween start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let disPlay = display.getDefaultDisplaySync();
            console.log(`${TestTag}, test_swipeBetween disPlay is: ${JSON.stringify(disPlay)}`);
            let scoll = await driver.findComponent(ON.type('Scroll'))
            let rect = await scoll.getBounds()
            let center = await scoll.getBoundsCenter()
            await driver.swipeBetween({
                x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
            , displayId: disPlay.id
            },
                { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, 199)
            await driver.delayMs(waitUiReadyMs)
            let text = await driver.findComponent(ON.text('toast'))
            expect(text == null).assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'test_swipeBetween over');
        })
      
        /**
         * @tc.name   test_swipeBetweenspeed40001
         * @tc.number uiTest_20028
         * @tc.desc   swipeBetween test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_swipeBetweenspeed40001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'test_swipeBetween start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let disPlay = display.getDefaultDisplaySync();
            console.log(`${TestTag}, test_swipeBetween disPlay is: ${JSON.stringify(disPlay)}`);
            let scoll = await driver.findComponent(ON.type('Scroll'))
            let rect = await scoll.getBounds()
            let center = await scoll.getBoundsCenter()
            await driver.swipeBetween({
                x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
            , displayId: disPlay.id
            },
                { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, 40001)
            await driver.delayMs(waitUiReadyMs)
            let text = await driver.findComponent(ON.text('toast'))
            expect(text == null).assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'test_swipeBetween over');
        })
      
        /**
         * @tc.name   test_swipeBetweenspeed1000
         * @tc.number uiTest_20029
         * @tc.desc   swipeBetween test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_swipeBetweenspeed1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'test_swipeBetween start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let disPlay = display.getDefaultDisplaySync();
            console.log(`${TestTag}, test_swipeBetween disPlay is: ${JSON.stringify(disPlay)}`);
            let scoll = await driver.findComponent(ON.type('Scroll'))
            let rect = await scoll.getBounds()
            let center = await scoll.getBoundsCenter()
            await driver.swipeBetween({
                x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
            , displayId: disPlay.id
            },
                { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, 1000)
            await driver.delayMs(waitUiReadyMs)
            let text = await driver.findComponent(ON.text('toast'))
            expect(text == null).assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'test_swipeBetween over');
        })
      
        /**
         * @tc.name   testFlingWithId
         * @tc.number uiTest_20030
         * @tc.desc   fling test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testFlingWithId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testFlingWithId start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let allDisplayIds = await display.getAllDisplay()
            for (let d of allDisplayIds) {
                if (d.id == 999) {
                    console.info('Can not create full screen application scene')
                    return
                }
            }
            let disPlay = display.getDefaultDisplaySync();
            console.log(`${TestTag}, testFlingWithId disPlay is: ${JSON.stringify(disPlay)}`);
            let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
            await driver.delayMs(waitUiReadyMs);
            try {
                await maxUiWindow(driver, window);
            } catch (error) {
                console.info('It is already a Fullscreen window')
            }
            let button = await driver.findComponent(ON.text('wearList'))
            if (button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                button = await scorll.scrollSearch(ON.text('wearList'))
            }
            await driver.delayMs(waitUiReadyMs)
            await button.click()
            await driver.delayMs(waitUiReadyMs)
            await driver.fling(UiDirection.DOWN, 39000, disPlay.id)
            await driver.delayMs(waitUiReadyMs)
            let buttonCom = await driver.findComponents(ON.belongingDisplay(disPlay.id).text('1').inWindow('com.uitestScene.acts'))
            console.log(`${TestTag}, testFlingWithId buttonCom: ${JSON.stringify(buttonCom)}`);
            expect(buttonCom).assertNull()
            await driver.fling(UiDirection.LEFT, 39000, disPlay.id)
            await driver.delayMs(waitUiReadyMs)
            await driver.fling(UiDirection.RIGHT, 39000, disPlay.id)
            await driver.delayMs(waitUiReadyMs)
            await driver.fling(UiDirection.UP, 39000, disPlay.id)
            await driver.delayMs(2000)
            let button2 = await driver.findComponents(ON.belongingDisplay(disPlay.id).text('15').inWindow('com.uitestScene.acts'))
            console.log(`${TestTag}, testFlingWithId button2: ${JSON.stringify(button2)}`);
            expect(button2 == null).assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'testFlingWithId over');
        })
      
        /**
         * @tc.name   testTriggerCombineKeysWithId
         * @tc.number uiTest_20032
         * @tc.desc   triggerCombineKeys test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testTriggerCombineKeysWithId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'testTriggerCombineKeysWithId start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let disPlay = display.getDefaultDisplaySync();
            console.log(`${TestTag}, testTriggerCombineKeysWithId disPlay is: ${JSON.stringify(disPlay)}`);
            await driver.delayMs(1000);
            await exitInputMethod();
            await driver.delayMs(1000);
            let text = await driver.findComponent(ON.belongingDisplay(disPlay.id).type('TextInput'))
            if (text == null) {
                let scorll = await driver.findComponent(ON.belongingDisplay(disPlay.id).type('Scroll'))
                text = await scorll.scrollSearch(ON.belongingDisplay(disPlay.id).type('TextInput'))
            }
            // set pasteBoard data
            await text.inputText('123')
            await driver.delayMs(1000)
            await exitInputMethod()
            await driver.delayMs(1000)
            text = await driver.findComponent(ON.belongingDisplay(disPlay.id).type('TextInput'))
            if (text == null) {
                let scorll = await driver.findComponent(ON.belongingDisplay(disPlay.id).type('Scroll'))
                text = await scorll.scrollSearch(ON.belongingDisplay(disPlay.id).type('TextInput'))
            }
            let center = await text.getBoundsCenter()
            await driver.click(center.x, center.y)
            await driver.delayMs(waitUiReadyMs)
            await driver.triggerCombineKeys(2072, 2017, 0, disPlay.id)
            await driver.delayMs(waitUiReadyMs)
            await driver.triggerCombineKeys(2072, 2019, 0, disPlay.id)
            await driver.delayMs(waitUiReadyMs)
            await exitInputMethod()
            await driver.delayMs(1000)
            // clear and paste
            let text2 = await driver.findComponent(ON.belongingDisplay(disPlay.id).type('TextInput'))
            if (text2 == null) {
                let scorll = await driver.findComponent(ON.belongingDisplay(disPlay.id).type('Scroll'))
                text2 = await scorll.scrollSearch(ON.belongingDisplay(disPlay.id).type('TextInput'))
            }
            await text2.clearText()
            await driver.delayMs(waitUiReadyMs)
            await driver.triggerCombineKeys(2072, 2038, 0, disPlay.id)
            await driver.delayMs(1000)
            await exitInputMethod()
            await driver.delayMs(1000)
            let text3 = await driver.findComponent(ON.belongingDisplay(disPlay.id).type('TextInput'))
            if (text3 == null) {
                let scorll = await driver.findComponent(ON.belongingDisplay(disPlay.id).type('Scroll'))
                text3 = await scorll.scrollSearch(ON.belongingDisplay(disPlay.id).type('TextInput'))
            }
            expect(await text3.getText() == '123').assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'testTriggerCombineKeysWithId over');
        })
      
        /**
         * @tc.name   test_origin
         * @tc.number uiTest_20033
         * @tc.desc   specifies the string value match pattern.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_origin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'test_origin start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button1 = await driver.findComponent(ON.originalText('next page'))
            console.log(`${TestTag}, test_origin button1: ${JSON.stringify(button1)}`);
            let originText = await button1.getOriginalText();
            console.log(`${TestTag}, test_origin originText: ${JSON.stringify(originText)}`);
            expect(originText == 'next page').assertTrue()
            let button2 = await driver.findComponent(ON.originalText('next', MatchPattern.STARTS_WITH))
            console.log(`${TestTag}, test_origin button2: ${JSON.stringify(button2)}`);
            let originText1 = await button2.getOriginalText();
            console.log(`${TestTag}, test_origin originText1: ${JSON.stringify(originText1)}`);
            expect(originText1 == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
            console.log(TestTag, 'test_origin end');
        })
      
        /**
         * @tc.name   testWindowAttrWithId
         * @tc.number uiTest_20034
         * @tc.desc   find window by WindowFilter and get it's active status.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testWindowAttrWithId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let disPlay = display.getDefaultDisplaySync();
            console.log(`${TestTag}, testWindowAttrWithId disPlay is: ${JSON.stringify(disPlay)}`);
            let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts', focused: true, active: true, title: '', displayId: disPlay.id })
            await window.focus()
            await driver.delayMs(waitUiReadyMs)
            let isActive = await window.isActive()
            expect(isActive == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })
      
        /**
         * @tc.name   testScreenCaptureWithId
         * @tc.number uiTest_20035
         * @tc.desc   capture the specified area of current screen.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testScreenCaptureWithId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let disPlay = display.getDefaultDisplaySync();
            console.log(`${TestTag}, testScreenCaptureWithId disPlay is: ${JSON.stringify(disPlay)}`);
            let savePath = '/data/storage/el2/base/cache/testScreenCaptureWithId.png'
            let success = await driver.screenCapture(savePath, { left: 0, top: 0, right: 100, bottom: 100, displayId: disPlay.id })
            expect(success == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })
      })
    describe('UiTest_API16', () => {
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
         * @tc.name   test_touchPadMultiFingerSwipe_Up_Down_3
         * @tc.number UiTest_API16_001
         * @tc.desc   Swipe UP or Down with three point.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   test_touchPadMultiFingerSwipe_Up_Down_Stay_3
         * @tc.number UiTest_API16_002
         * @tc.desc   Swipe Up or Down with three point then  in more task statue
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_touchPadMultiFingerSwipe_Up_Down_Stay_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_Up_Down_Stay_3 start');
            try {
                await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
                await driver.delayMs(waitUiReadyMs);
                // 三指上划停留, 进入多任务中心。
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, { stay: true });
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

        /**
         * @tc.name   test_touchPadMultiFingerSwipe_other
         * @tc.number UiTest_API16_003
         * @tc.desc   Swipe Left, Swipe with four point
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   test_touchPadMultiFingerSwipe_fingers_verification_401
         * @tc.number UiTest_API16_004
         * @tc.desc   finger params 401 test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   test_touchPadMultiFingerSwipe_direction_verification_401
         * @tc.number UiTest_API16_005
         * @tc.desc   direction param 401 test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   test_touchPadMultiFingerSwipe_option_verification_Up
         * @tc.number UiTest_API16_006
         * @tc.desc   option param test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, { stay: false });
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
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, { stay: undefined });
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
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, { stay: null });
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
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, { speed: null });
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
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, { speed: 2000 });
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


        /**
         * @tc.name   test_penClick_function
         * @tc.number UiTest_API16_07
         * @tc.desc   penClick function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   test_penClick_function_401
         * @tc.number UiTest_API16_08
         * @tc.desc   penClick param 401 test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_penClick_function_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
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
                await driver.penClick({ x: -1, y: 100 });
                console.log(TestTag, `test_penClick_function_401_x`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penClick_function_401_x error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            try {
                await driver.penClick({ x: 100, y: -1 });
                console.log(TestTag, `test_penClick_function_401_y`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penClick_function_401_y error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            console.log(TestTag, 'test_penClick_function_401 end');
        })

        /**
         * @tc.name   test_penLongClick_function
         * @tc.number UiTest_API16_09
         * @tc.desc   penLongClick function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_penLongClick_function', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
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

        /**
         * @tc.name   test_penLongClick_function_401
         * @tc.number UiTest_API16_010
         * @tc.desc   penLongClick param 401 test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_penLongClick_function_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
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
                await driver.penLongClick({ x: -1, y: 100 });
                console.log(TestTag, `test_penLongClick_function_401_x`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penLongClick_function_401_x is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            try {
                await driver.penLongClick({ x: 100, y: -1 });
                console.log(TestTag, `test_penLongClick_function_401_y`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penLongClick_function_401_y is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            console.log(TestTag, 'test_penLongClick_function_401 end');
        })

        /**
         * @tc.name   test_penDoubleClick_function
         * @tc.number UiTest_API16_011
         * @tc.desc   penDoubleClick function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   test_penDoubleClick_function_401
         * @tc.number UiTest_API16_012
         * @tc.desc   penLongClick param 401 test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_penDoubleClick_function_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
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
                await driver.penDoubleClick({ x: -1, y: 100 });
                console.log(TestTag, `test_penDoubleClick_function_401_x`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penDoubleClick_function_401_x is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            try {
                await driver.penDoubleClick({ x: 100, y: -1 });
                console.log(TestTag, `test_penDoubleClick_function_401_y`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penDoubleClick_function_401_y is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            console.log(TestTag, 'test_penDoubleClick_function_401 end ');
        })

        /**
         * @tc.name   test_penSwipe_function
         * @tc.number UiTest_API16_013
         * @tc.desc   penSwipe function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_penSwipe_function', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
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
                console.log(TestTag, 'screenWidth:' + screenWidth + ', screenHeight:' + screenHeight);
                await driver.penSwipe({ x: Math.floor(screenWidth / 2), y: Math.floor(screenHeight / 2 + screenHeight / 4) },
                    { x: Math.floor(screenWidth / 2), y: Math.floor(screenHeight / 2 - screenHeight / 4) }, 600, 0.5);
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

        /**
         * @tc.name   test_penSwipe_function_pressure
         * @tc.number UiTest_API16_013
         * @tc.desc   penSwipe function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_penSwipe_function_pressure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
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
                console.log(TestTag, 'screenWidth:' + screenWidth + ', screenHeight:' + screenHeight);
                await driver.penSwipe({ x: Math.floor(screenWidth / 2), y: Math.floor(screenHeight / 2 + screenHeight / 4) },
                    { x: Math.floor(screenWidth / 2), y: Math.floor(screenHeight / 2 - screenHeight / 4) }, 600);
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

        /**
         * @tc.name   test_penSwipe_function_speed
         * @tc.number UiTest_API16_013
         * @tc.desc   penSwipe function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_penSwipe_function_speed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
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
                console.log(TestTag, 'screenWidth:' + screenWidth + ', screenHeight:' + screenHeight);
                await driver.penSwipe({ x: Math.floor(screenWidth / 2), y: Math.floor(screenHeight / 2 + screenHeight / 4) },
                    { x: Math.floor(screenWidth / 2), y: Math.floor(screenHeight / 2 - screenHeight / 4) });
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

        /**
         * @tc.name   test_penSwipe_function_401
         * @tc.number UiTest_API16_014
         * @tc.desc   penSwipe param 401  test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_penSwipe_function_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, 'test_penSwipe_function_401 start');
            try {
                await driver.penSwipe(null, { x: 100, y: 100 });
                console.log(TestTag, `test_penSwipe_function_401_startPoint_null`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penSwipe_function_401_startPoint_null is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            try {
                await driver.penSwipe({ x: 100, y: 100 }, null);
                console.log(TestTag, `test_penSwipe_function_401_endPoint_null`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penSwipe_function_401_endPoint_null is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                await driver.penSwipe({ x: -1, y: 100 }, { x: 100, y: 500 });
                console.log(TestTag, `test_penSwipe_function_401_startPoint_x`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penSwipe_function_401_endPointPoint_x is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                await driver.penSwipe({ x: 100, y: -1 }, { x: 100, y: 500 });
                console.log(TestTag, `test_penSwipe_function_401_startPoint_y`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penSwipe_function_401_startPoint_y is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                await driver.penSwipe({ x: 100, y: 100 }, { x: 100, y: 500 }, 600, -0.1);
                console.log(TestTag, `test_penSwipe_function_401_pressure_l`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penSwipe_function_401_pressure_l is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                await driver.penSwipe({ x: 100, y: 100 }, { x: 100, y: 500 }, 600, 1.1);
                console.log(TestTag, `test_penSwipe_function_401_pressure_r`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penSwipe_function_401_pressure_r is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            console.log(TestTag, 'test_penSwipe_function_401 end');
        })

        /**
         * @tc.name   test_injectPenPointAction_function
         * @tc.number UiTest_API16_015
         * @tc.desc   injectPenPointAction function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_injectPenPointAction_function', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            console.log(TestTag, `test_injectPenPointAction_function start`);
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            await driver.delayMs(waitUiReadyMs)
            let scroll = await driver.findComponent(ON.type('Scroll'))
            let scrollRect = await scroll.getBounds()
            let screenWidth = scrollRect.right - scrollRect.left;
            let screenHeight = scrollRect.bottom - scrollRect.top;
            console.log(TestTag, 'screenWidth:' + screenWidth + ', screenHeight:' + screenHeight);
            let pointer = PointerMatrix.create(1, 8);
            let stepLength = Math.floor((screenHeight / 4) * 2 / 8);
            console.log(TestTag, `stepLength is, ${stepLength}`);
            let startX = Math.floor(screenWidth / 2);
            for (let step = 0; step < 8; step++) {
                let startY = Math.floor((screenHeight / 2 + screenHeight / 4) - stepLength * step);
                console.log(TestTag, `startX is, ${startX}, startY is, ${startY}`);
                pointer.setPoint(0, step, { x: startX, y: startY });
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

        /**
         * @tc.name   test_injectPenPointAction_function_401
         * @tc.number UiTest_API16_016
         * @tc.desc   injectPenPointAction param 401 test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_injectPenPointAction_function_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
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
                points.setPoint(0, 1, { x: 100, y: 100 });
                points.setPoint(0, 2, { x: 100, y: 150 })
                await driver.injectPenPointerAction(points, 600, -0.1);
                console.log(TestTag, `test_injectPenPointAction_function_401_pressure_l`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_injectPenPointAction_function_401_pressure_l error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                let points = PointerMatrix.create(1, 2);
                points.setPoint(0, 1, { x: 100, y: 100 });
                points.setPoint(0, 2, { x: 100, y: 150 })
                await driver.injectPenPointerAction(points, 600, 1.1);
                console.log(TestTag, `test_injectPenPointAction_function_401_pressure_r`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_injectPenPointAction_function_401_pressure_r error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

        })

        /**
         * @tc.name   testScrollSearchVertical
         * @tc.number UiTest_API16_017
         * @tc.desc   scroll vertically on this UiComponent to find matched UiComponent.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
            console.log(TestTag, `testScrollSearchVertical 2 is , ${text2Msg}`);
            await driver.delayMs(waitUiReadyMs)
            expect(await text2.getText()).assertEqual('2')
            await driver.delayMs(waitUiReadyMs)
            let text3 = await scrollBar.scrollSearch(ON.text('8'));
            await driver.delayMs(waitUiReadyMs);
            let text3Msg = await text3.getText();
            console.log(TestTag, `testScrollSearchVertical 2 is , ${text3Msg}`);
            expect(await text3.getText()).assertEqual('8')
            await driver.delayMs(waitUiReadyMs)
            await stopApplication('com.uitestScene.acts');
            console.log(TestTag, 'testScrollSearchVertical end');
        })



        /**
         * @tc.name   testScrollSearchHorizontal_401
         * @tc.number UiTest_API16_019
         * @tc.desc   param 401 test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testMatchPatternIcase
         * @tc.number UiTest_API16_020
         * @tc.desc   find button component by Regular Expression ignore icase，and doubleClick button by mouse.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testMatchPatternRegExp
         * @tc.number UiTest_API16_021
         * @tc.desc   find button component by Regular Expression, and longClick button by mouse.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testGetHint
         * @tc.number UiTest_API16_022
         * @tc.desc   find button component by Regular Expression, and get Hint of the component.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testGetHint1
         * @tc.number UiTest_API16_023
         * @tc.desc   find button component by Hint.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
            await getInputMethodPermission()
            done()
        })

        beforeEach(async () => {
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testMouseDoubleClick
         * @tc.number uiTest_11001
         * @tc.desc   doubleClick in the specified location on the screen by mouse.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testMouseDoubleClick_1
         * @tc.number uiTest_11001
         * @tc.desc   doubleClick in the specified location on the screen by mouse.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testMouseDoubleClick_2
         * @tc.number uiTest_11001
         * @tc.desc   doubleClick in the specified location on the screen by mouse.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testMouseLongClick
         * @tc.number uiTest_11002
         * @tc.desc   longClick in the specified location on the screen by mouse.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testMouseLongClick_1
         * @tc.number uiTest_11002
         * @tc.desc   longClick in the specified location on the screen by mouse.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testMouseLongClick_2
         * @tc.number uiTest_11002
         * @tc.desc   longClick in the specified location on the screen by mouse.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testMouseMoveWithTrack
         * @tc.number uiTest_11004
         * @tc.desc   swipe on the screen between the specified points with mouse.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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


        /**
         * @tc.name   testDriverInputText
         * @tc.number uiTest_11005
         * @tc.desc   inject text on the specified location.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testDriverInputText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let inputText = await driver.findComponent(ON.type('TextInput'))
            if (inputText == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                inputText = await scorll.scrollSearch(ON.type('TextInput'))
            }
            await inputText.clearText()
            await driver.delayMs(2000)
            await exitInputMethod()
            await driver.delayMs(waitUiReadyMs)
            let input = await driver.findComponent(ON.type('TextInput'))
            if (input == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                input = await scorll.scrollSearch(ON.type('TextInput'))
            }
            let center = await input.getBoundsCenter()
            await driver.inputText(center, '123')
            await driver.delayMs(2000)
            await exitInputMethod()
            await driver.delayMs(2000)
            let input_new = await driver.findComponent(ON.type('TextInput'))
            if (input_new == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                input_new = await scorll.scrollSearch(ON.type('TextInput'))
            }
            let text = await input_new.getText()
            console.info("testInputText result :" + text)
            expect(text == '123').assertTrue()
        })

        /**
         * @tc.name   testMouseScroll
         * @tc.number uiTest_11006
         * @tc.desc   scroll the mouse wheel at the specified location to specify the cell.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
            await driver.mouseScroll(center1, false, 5, 2072, 0, 20)
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
            await driver.mouseScroll(center, true, 30)
            await driver.delayMs(waitUiReadyMs)
            let button1 = await driver.findComponent(ON.text('next page'))
            expect(button1 == null).assertTrue()
        })

        /**
         * @tc.name   testWindowAttr
         * @tc.number uiTest_11007
         * @tc.desc   find window by WindowFilter and get it's active status.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testWindowAttr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts', focused: true, active: true, title: '' })
            await window.focus()
            await driver.delayMs(waitUiReadyMs)
            let isActive = await window.isActive()
            expect(isActive == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testDescription
         * @tc.number uiTest_11008
         * @tc.desc   find UiComponent by description attribute and get it's description attribute.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

    describe('UiTest_API10', () => {
        let driver: Driver
        beforeAll(async (done: Function) => {
            driver = Driver.create()
            await driver.delayMs(1000)
            await getInputMethodPermission()
            done()
        })

        afterEach(async () => {
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testWithIn
         * @tc.number uiTest_10001
         * @tc.desc   find UiComponent inside of the given UiComponent.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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



        /**
         * @tc.name   testScreenCapture
         * @tc.number uiTest_10003
         * @tc.desc   capture the specified area of current screen.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testScreenCapture', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let savePath = '/data/storage/el2/base/cache/1.png'
            let success = await driver.screenCapture(savePath, { left: 0, top: 0, right: 100, bottom: 100 })
            expect(success == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testScreenCapture_default
         * @tc.number uiTest_10003
         * @tc.desc   capture the specified area of current screen.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testScreenCapture_default', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let savePath = '/data/storage/el2/base/cache/1.png'
            let success = await driver.screenCapture(savePath)
            expect(success == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testMouseClick
         * @tc.number uiTest_10004
         * @tc.desc   click in the specified location on the screen by mouse.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
            await driver.mouseClick({ x: center.x, y: center.y }, MouseButton.MOUSE_BUTTON_RIGHT)
            await driver.delayMs(waitUiReadyMs)
            let Button1 = await driver.findComponent(ON.text('right'))
            expect(Button1 != null).assertTrue()
            await driver.mouseClick({ x: center.x, y: center.y }, MouseButton.MOUSE_BUTTON_MIDDLE, 2072, 2045)
            await driver.delayMs(waitUiReadyMs)
            let Button2 = await driver.findComponent(ON.text('middle'))
            expect(Button2 != null).assertTrue()
            await driver.mouseClick({ x: center.x, y: center.y }, MouseButton.MOUSE_BUTTON_LEFT)
            await driver.delayMs(waitUiReadyMs)
            let Button3 = await driver.findComponent(ON.id('jump'))
            expect(Button3 == null).assertTrue()
            await driver.click(center.x, center.y)
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testMouseMoveTo
         * @tc.number uiTest_10005
         * @tc.desc   move the mouse cursor to the specified location.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testMouseScroll
         * @tc.number uiTest_10006
         * @tc.desc   scroll the mouse wheel at the specified location to specify the cell.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
            await driver.mouseScroll(center1, false, 5, 2072, 0)
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
            await driver.mouseScroll(center, true, 30)
            await driver.delayMs(waitUiReadyMs)
            let button1 = await driver.findComponent(ON.text('next page'))
            expect(button1 == null).assertTrue()
        })

        /**
         * @tc.name   testInWindow
         * @tc.number uiTest_10007
         * @tc.desc   scroll the mouse wheel at the specified location to specify the cell.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testInWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let btn = await driver.findComponent(ON.inWindow('com.uitestScene.acts').text('next page'))
            expect(btn != null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testMonitor1
         * @tc.number uiTest_10008
         * @tc.desc   monitor toast appearance.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testMonitor1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let observer = await driver.createUIEventObserver()
            let callback = (UiElementInfo: UIElementInfo) => {
                try {
                    console.info('UIElementInfo bundleName:' + UiElementInfo.bundleName)
                    console.info('UIElementInfo text:' + UiElementInfo.text)
                    console.info('UIElementInfo type:' + UiElementInfo.type)
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


        /**
         * @tc.name   testMonitor2
         * @tc.number testMonitor2
         * @tc.desc   testMonitor2
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testMonitor2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let observer = await driver.createUIEventObserver()
            let callback = (UiElementInfo: UIElementInfo) => {
                try {
                    console.info('UIElementInfo bundleName:' + UiElementInfo.bundleName)
                    console.info('UIElementInfo text:' + UiElementInfo.text)
                    console.info('UIElementInfo type:' + UiElementInfo.type)
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
            await getInputMethodPermission()
            done()
        })

        afterEach(async () => {
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testInputText
         * @tc.number uiTest_9001
         * @tc.desc   inject text to the target UiComponent
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
            if (input_new == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                input_new = await scorll.scrollSearch(ON.type('TextInput'))
            }
            let text = await input_new.getText()
            console.info("testInputText result :" + text)
            expect(text == '123').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testClearText
         * @tc.number uiTest_9002
         * @tc.desc   clear text of the target UiComponent
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
            if (input2 == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                input2 = await scorll.scrollSearch(ON.type('TextInput'))
            }
            await input2.clearText()
            await driver.delayMs(2000)
            await exitInputMethod()
            await driver.delayMs(waitUiReadyMs)
            let input_new = await driver.findComponent(ON.type('TextInput'))
            if (input_new == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                input_new = await scorll.scrollSearch(ON.type('TextInput'))
            }
            let text = await input_new.getText()
            console.info("testClearText result :" + text)
            expect(text).assertEqual('')
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testCheckable
         * @tc.number uiTest_9003
         * @tc.desc   find UiComponent by checkable attribute and get it's checkable attribute.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
            let button1 = await driver.findComponent(ON.checkable(false).type('Button'))
            if (button1 == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                button1 = await scorll.scrollSearch(ON.type('Checkbox').checkable(false))
            }
            let checkable1 = await button1.isCheckable()
            expect(checkable1 == false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testChecked
         * @tc.number uiTest_9004
         * @tc.desc   find UiComponent by checked attribute and get it's checked attribute.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testChecked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.checked().type('Checkbox').id('hi'))
            if (button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                button = await scorll.scrollSearch(ON.type('Checkbox').checked(false).id('hi'))
            }
            let checked = await button.isChecked()
            expect(checked == false).assertTrue()
            let button1 = await driver.findComponent(ON.checked(true).id('go'))
            if (button1 == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                button1 = await scorll.scrollSearch(ON.checked(true).id('go'))
            }
            let checked1 = await button1.isChecked()
            expect(checked1).assertTrue();
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testMatchPattern
         * @tc.number uiTest_9005
         * @tc.desc   specifies the string value match pattern.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testMatchPattern', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let Button1 = await driver.findComponent(ON.text('next page', MatchPattern.EQUALS))
            expect(await Button1.getText() == 'next page').assertTrue()
            let Button2 = await driver.findComponent(ON.text('next', MatchPattern.STARTS_WITH))
            expect(await Button2.getText() == 'next page').assertTrue()
            let Button3 = await driver.findComponent(ON.text('xt page', MatchPattern.ENDS_WITH))
            expect(await Button3.getText() == 'next page').assertTrue()
            let Button4 = await driver.findComponent(ON.text('ext', MatchPattern.CONTAINS))
            expect(await Button4.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testDriverClick
         * @tc.number uiTest_9006
         * @tc.desc   click in the specified location on the screen.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testDriverDoubleClick
         * @tc.number uiTest_9007
         * @tc.desc   doubleClick in the specified location on the screen.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testDriverLongClick
         * @tc.number uiTest_9008
         * @tc.desc   longClick in the specified location on the screen.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testUiComponentClick
         * @tc.number uiTest_9009
         * @tc.desc   click this UiComponentClick.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testUiComponentDoubleClick
         * @tc.number uiTest_9010
         * @tc.desc   doubleClick this UiComponentClick.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testUiComponentLongClick
         * @tc.number uiTest_9011
         * @tc.desc   longClick this UiComponentClick.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testKey
         * @tc.number uiTest_9012
         * @tc.desc   find UiComponent by key attribute and get it's key attribute.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.id('my-key'))
            expect(await button.getId() == 'my-key').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testType
         * @tc.number uiTest_9013
         * @tc.desc   find UiComponent by type attribute and get it's type attribute.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let text = await driver.findComponent(ON.type('Text'))
            let type = await text.getType()
            expect(type == 'Text').assertTrue()
            let text1 = await driver.findComponent(ON.type('Text', MatchPattern.EQUALS))
            let type1 = await text1.getType()
            expect(type1 == 'Text').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testClickable
         * @tc.number uiTest_9014
         * @tc.desc   find UiComponent by clickable attribute and get it's clickable attribute.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
            let button1 = await driver.findComponent(ON.text('toast').clickable(true))
            let clickable1 = await button1.isClickable()
            expect(clickable1 == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testLongClickable
         * @tc.number uiTest_9015
         * @tc.desc   find UiComponent by longClickable attribute and get it's longClickable attribute.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testLongClickable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('next page').longClickable())
            if (button == null) {
                button = await driver.findComponent(ON.text('next page').longClickable(false))
            }
            let longClickable = await button.isLongClickable()
            expect(longClickable == false).assertTrue()
            let button1 = await driver.findComponent(ON.type('Button').longClickable(true))
            let longClickable1 = await button1.isLongClickable()
            expect(longClickable1 == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testScrollable
         * @tc.number uiTest_9016
         * @tc.desc   find UiComponent by scrollable attribute and get it's scrollable attribute.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
            let scrollBar1 = await driver.findComponent(ON.type('Button').scrollable(false))
            let scrollable1 = await scrollBar1.isScrollable()
            expect(scrollable1 == false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testEnabled
         * @tc.number uiTest_9017
         * @tc.desc   find UiComponent by enabled attribute and get it's enabled attribute.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
            let button1 = await driver.findComponent(ON.text('enableFalse').enabled(false))
            if (button1 == null) {
                let scroll = await driver.findComponent(ON.type('Scroll'))
                button1 = await scroll.scrollSearch(ON.text('enableFalse').enabled(false))
            }
            let enable1 = await button1.isEnabled()
            expect(enable1 == false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testFocused
         * @tc.number uiTest_9018
         * @tc.desc   find UiComponent by focused attribute and get it's focused attribute.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
            let button1 = await driver.findComponent(ON.focused(true))
            let focused1 = await button1.isFocused()
            expect(focused1 == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testSelected
         * @tc.number uiTest_9019
         * @tc.desc   find UiComponent by selected attribute and get it's selected attribute.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
            let button1 = await driver.findComponent(ON.id('enableFalse').selected(true))
            if (button1 == null) {
                let scroll = await driver.findComponent(ON.type('Scroll'))
                button1 = await scroll.scrollSearch(ON.id('enableFalse').selected(true))
            }
            let selected1 = await button1.isSelected()
            expect(selected1).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testPressBack
         * @tc.number uiTest_9020
         * @tc.desc   Press the BACK key.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testFindComponents
         * @tc.number uiTest_9021
         * @tc.desc   find all the matched UiComponents on current UI
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testFindComponents', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let buttons = await driver.findComponents(ON.type('Button'))
            expect(await buttons[0].getText() != null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testTriggerKey
         * @tc.number uiTest_9022
         * @tc.desc   press the specified key.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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



        /**
         * @tc.name   testGetUiComponentBounds
         * @tc.number uiTest_9024
         * @tc.desc   get the bounds of this UiComponent.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testGetUiComponentBoundsCenter
         * @tc.number uiTest_9025
         * @tc.desc   get the boundsCenter of this @link UiComponent.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetUiComponentBoundsCenter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('next page'))
            let point = await button.getBoundsCenter()
            expect(point !== null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testWaitForComponent
         * @tc.number uiTest_9026
         * @tc.desc   Find the first matched UiComponent on current UI during the time given.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testWaitForComponent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.waitForComponent(ON.text('next page'), waitUiReadyMs)
            expect(button !== null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testScreenCap
         * @tc.number uiTest_9027
         * @tc.desc   capture current screen.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testScreenCap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let savePath = '/data/storage/el2/base/cache/1.png'
            let success = await driver.screenCap(savePath)
            expect(success == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testAssertComponentExist
         * @tc.number uiTest_9028
         * @tc.desc   Assert whether the matched UiComponent exists on current UI;.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testAssertComponentExist', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            await driver.assertComponentExist(ON.text('next page'))
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testIsBefore
         * @tc.number uiTest_9029
         * @tc.desc   find uiComponent which is before another UiComponent that specified by given.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testIsBefore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.isBefore(ON.text('next page')).type('Button'))
            expect(await button.getType() == 'Button').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testIsAfter
         * @tc.number uiTest_9030
         * @tc.desc   find uiComponent which is after another UiComponent that specified by given.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testIsAfter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.isAfter(ON.text('dialog')).type('Text'))
            expect(await button.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testSwipe
         * @tc.number uiTest_9031
         * @tc.desc   swipe on the screen between the specified points.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSwipe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs);
            let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' });
            await driver.delayMs(waitUiReadyMs);
            await maxUiWindow(driver, window);
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

        /**
         * @tc.name   testFling
         * @tc.number uiTest_9032
         * @tc.desc   inject fling on the device display.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testFling', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs);
            let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' });
            await driver.delayMs(waitUiReadyMs);
            await maxUiWindow(driver, window);
            let scoll = await driver.findComponent(ON.type('Scroll'))
            let rect = await scoll.getBounds()
            let center = await scoll.getBoundsCenter()
            await driver.fling({ x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4) },
                { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4) }, 20, 600)
            await driver.delayMs(1000)
            let text = await driver.findComponent(ON.text('toast'))
            expect(text == null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testScrollSearch
         * @tc.number uiTest_9033
         * @tc.desc   scroll on this UiComponent to find matched UiComponent.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testScrollSearch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let scrollBar = await driver.findComponent(ON.type('Scroll'))
            let button = await scrollBar.scrollSearch(ON.text('next page'))
            expect(await button.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testScrollToBottom
         * @tc.number uiTest_9034
         * @tc.desc   scroll on this UiComponent to the bottom.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testScrollToBottom_speed
         * @tc.number uiTest_9034
         * @tc.desc   scroll on this UiComponent to the bottom.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testScrollToTop
         * @tc.number uiTest_9035
         * @tc.desc   scroll on this UiComponent to the top.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
            let button = await driver.findComponent(ON.text('bottom'))
            expect(button == null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testScrollToTop_speed
         * @tc.number uiTest_9035
         * @tc.desc   scroll on this UiComponent to the top.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
            let button = await driver.findComponent(ON.text('bottom'))
            expect(button == null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })


        /**
         * @tc.name   testPinch
         * @tc.number uiTest_9036
         * @tc.desc   pinch enlarge this UiComponent to the target scale.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testInjectMultiPointerAction
         * @tc.number uiTest_9037
         * @tc.desc   inject multi-pointer action on the device display.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
            let width = (bounds1.right - bounds1.left) * 0.8
            let centerY = Math.floor((bounds1.top + bounds1.bottom) / 2)
            let pointer = PointerMatrix.create(2, 11)
            await driver.delayMs(300)
            for (let step = 0; step < 11; step++) {
                pointer.setPoint(0, step, { x: Math.floor(left + width - (step + 1) * (width / 10)), y: centerY })
            }
            for (let step = 0; step < 11; step++) {
                pointer.setPoint(1, step, { x: Math.floor(right - width + (step + 1) * (width / 10)), y: centerY })
            }
            let result = await driver.injectMultiPointerAction(pointer, 400)
            await driver.delayMs(3000)
            let image2 = await driver.findComponent(ON.id('test_pict'))
            let bounds2 = await image2.getBounds()
            expect(bounds2 != bounds1).assertTrue()
            expect(result).assertTrue();
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testGetDisplaySize
         * @tc.number uiTest_9047
         * @tc.desc   get the size of the device display.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetDisplaySize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let s = await driver.getDisplaySize()
            expect(s.x != 0).assertTrue()
            expect(s.y != 0).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testGetDisplayDensity
         * @tc.number uiTest_9048
         * @tc.desc   get the density of the device display.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetDisplayDensity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let s = await driver.getDisplayDensity()
            expect(s.x != 0).assertTrue()
            expect(s.y != 0).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testWakeUpDisplay
         * @tc.number uiTest_9051
         * @tc.desc   wake up the device display.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testWakeUpDisplay', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            await driver.wakeUpDisplay()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testWaitForIdle
         * @tc.number uiTest_9053
         * @tc.desc   wait for the UI become idle.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testWaitForIdle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(2000)
            let idled = await driver.waitForIdle(4000, 5000)
            expect(idled == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testWaitForIdleFalse
         * @tc.number uiTest_90536
         * @tc.desc   wait for the UI become idle.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testWaitForIdleFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(2000)
            let idled = await driver.waitForIdle(6000, 2000)
            expect(idled == false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

    })

    describe('UiTest_API8', () => {
        let driver: UiDriver
        beforeAll(async (done: Function) => {
            driver = UiDriver.create()
            await driver.delayMs(1000)
            await getInputMethodPermission()
            done()
        })

        afterEach(async () => {
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testInputText
         * @tc.number uiTest_8001
         * @tc.desc   inject text to the target UiComponent
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
            if (input_new == null) {
                let scorll = await driver.findComponent(BY.type('Scroll'))
                input_new = await scorll.scrollSearch(BY.type('TextInput'))
            }
            let text = await input_new.getText()
            console.info("testInputText result :" + text)
            expect(text == '123').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testMatchPattern
         * @tc.number uiTest_8002
         * @tc.desc   specifies the string value match pattern.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testUiComponentClick
         * @tc.number uiTest_8003
         * @tc.desc   click this UiComponentClick.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testUiComponentDoubleClick
         * @tc.number uiTest_8004
         * @tc.desc   doubleClick this UiComponentClick.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testUiComponentLongClick
         * @tc.number uiTest_8005
         * @tc.desc   longClick this UiComponentClick.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testKey
         * @tc.number uiTest_8006
         * @tc.desc   find UiComponent by key attribute and get it's key attribute.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.key('my-key'))
            expect(await button.getKey() == 'my-key').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testId
         * @tc.number uiTest_8007
         * @tc.desc   find UiComponent by id attribute and get it's id attribute.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testType
         * @tc.number uiTest_8008
         * @tc.desc   find UiComponent by type attribute and get it's type attribute.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let text = await driver.findComponent(BY.type('Text'))
            let type = await text.getType()
            expect(type == 'Text').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testClickable
         * @tc.number uiTest_8009
         * @tc.desc   find UiComponent by clickable attribute and get it's clickable attribute.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
            let button1 = await driver.findComponent(BY.text('toast').clickable(true))
            let clickable1 = await button1.isClickable()
            expect(clickable1 == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testScrollable
         * @tc.number uiTest_8010
         * @tc.desc   find UiComponent by scrollable attribute and get it's scrollable attribute.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
            let scrollBar1 = await driver.findComponent(BY.type('Button').scrollable(false))
            let scrollable1 = await scrollBar1.isScrollable()
            expect(scrollable1 == false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testEnabled
         * @tc.number uiTest_8011
         * @tc.desc   find UiComponent by enabled attribute and get it's enabled attribute.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
            let button1 = await driver.findComponent(BY.text('enableFalse').enabled(false))
            if (button1 == null) {
                let scroll = await driver.findComponent(BY.type('Scroll'))
                button1 = await scroll.scrollSearch(BY.text('enableFalse').enabled(false))
            }
            let enable1 = await button1.isEnabled()
            expect(enable1 == false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testFocused
         * @tc.number uiTest_8012
         * @tc.desc   find UiComponent by focused attribute and get it's focused attribute.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
            let button1 = await driver.findComponent(BY.focused(true))
            let focused1 = await button1.isFocused()
            expect(focused1 == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testSelected
         * @tc.number uiTest_8013
         * @tc.desc   find UiComponent by selected attribute and get it's selected attribute.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
            let button1 = await driver.findComponent(BY.key('enableFalse').selected(true))
            if (button1 == null) {
                let scroll = await driver.findComponent(BY.type('Scroll'))
                button1 = await scroll.scrollSearch(BY.key('enableFalse').selected(true))
            }
            let selected1 = await button1.isSelected()
            expect(selected1).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testPressBack
         * @tc.number uiTest_8014
         * @tc.desc   Press the BACK key.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testFindComponents
         * @tc.number uiTest_8015
         * @tc.desc   find all the matched UiComponents on current UI
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testFindComponents', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let buttons = await driver.findComponents(BY.type('Button'))
            expect(await buttons[0].getText() != null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testTriggerKey
         * @tc.number uiTest_8016
         * @tc.desc   press the specified key.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testScreenCap
         * @tc.number uiTest_8017
         * @tc.desc   capture current screen.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testScreenCap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let savePath = '/data/storage/el2/base/cache/1.png'
            let success = await driver.screenCap(savePath)
            expect(success == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testAssertComponentExist
         * @tc.number uiTest_8018
         * @tc.desc   Assert whether the matched UiComponent exists on current UI;.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testAssertComponentExist', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            await driver.assertComponentExist(BY.text('next page'))
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testIsBefore
         * @tc.number uiTest_8019
         * @tc.desc   find uiComponent which is before another UiComponent that specified by given.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testIsBefore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.isBefore(BY.text('next page')).type('Button'))
            expect(await button.getType() == 'Button').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testIsAfter
         * @tc.number uiTest_8020
         * @tc.desc   find uiComponent which is after another UiComponent that specified by given.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testIsAfter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.isAfter(BY.text('dialog')).type('Text'))
            expect(await button.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testSwipe
         * @tc.number uiTest_8021
         * @tc.desc   swipe on the screen between the specified points.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSwipe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            let driver1 = Driver.create();
            await driver.delayMs(waitUiReadyMs);
            let window = await driver1.findWindow({ bundleName: 'com.uitestScene.acts' });
            console.log(`${TestTag}, testSwipe window,${JSON.stringify(window)}`);
            if (window != null) {
                try {
                    let windowMode = await window.getWindowMode();
                    if (windowMode != WindowMode.FLOATING) {
                        await window.resume();
                        await driver.delayMs(8000);
                    }
                    await window.maximize();
                } catch (error) {
                    console.log(`${TestTag}, testSwipe maximize error,${JSON.stringify(error)}`);
                }
            }
            await driver.delayMs(waitUiReadyMs)
            let displayClass = await display.getDefaultDisplay();
            let screenWidth = displayClass.width
            let screenHeight = displayClass.height
            console.info('screenWidth:' + screenWidth + ', screenHeight:' + screenHeight)
            await driver.swipe(Math.floor(screenWidth / 2), Math.floor(screenHeight / 2 + screenHeight / 8),
                Math.floor(screenWidth / 2), Math.floor(screenHeight / 2 - screenHeight / 8))
            await driver.delayMs(waitUiReadyMs)
            let text = await driver.findComponent(BY.text('toast'))
            expect(text == null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testScrollSearch
         * @tc.number uiTest_8022
         * @tc.desc   scroll on this UiComponent to find matched UiComponent.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testScrollSearch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs)
            let scrollBar = await driver.findComponent(BY.type('Scroll'))
            let button = await scrollBar.scrollSearch(BY.text('next page'))
            expect(await button.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /**
         * @tc.name   testUiDriverClick
         * @tc.number uiTest_8023
         * @tc.desc   click in the specified location on the screen.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testUiDriverDoubleClick
         * @tc.number uiTest_8024
         * @tc.desc   doubleClick in the specified location on the screen.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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

        /**
         * @tc.name   testUiDriverLongClick
         * @tc.number uiTest_9008
         * @tc.desc   longClick in the specified location on the screen.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
