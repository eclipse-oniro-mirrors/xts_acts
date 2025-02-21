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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'
import ability_featureAbility from '@ohos.ability.featureAbility';
import { BusinessError } from '@ohos.base';
import display from '@ohos.display';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator : AbilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName : string = abilityDelegatorRegistry.getArguments().bundleName;
const waitUiReadyMs : number = 1000;

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

export default function UiTest() {
    describe('UiTest_API11', () => {
        beforeEach(async () => {
            await stopApplication('com.uitestScene.acts')
        })

        /*
        * @tc.number: uiTest_11001
        * @tc.name: testMouseDoubleClick
        * @tc.desc: doubleClick in the specified location on the screen by mouse.
        */
        it('testMouseDoubleClick', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver : Driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let Button = await driver.findComponent(ON.text('Click twice'))
            let center = await Button.getBoundsCenter()
            await driver.mouseDoubleClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 0);
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
        it('testMouseLongClick', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
        * @tc.number: uiTest_11003
        * @tc.name: testMouseDrag
        * @tc.desc: drag on the screen between the specified points by mouse.
        */
        it('testMouseDrag', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.id('jump'))
            let center = await button.getBoundsCenter();
            await driver.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT)
            await driver.delayMs(waitUiReadyMs)
            let text1 = await driver.findComponent(ON.text('two'))
            let text2 = await driver.findComponent(ON.text('three'))
            let point1 = await text1.getBoundsCenter()
            let point2 = await text2.getBoundsCenter()
            await driver.mouseDrag(point1, point2, 600)
            await driver.delayMs(2000)
            let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
            expect(text == null).assertTrue()
        })

        /*
         * @tc.number: uiTest_11004
         * @tc.name: testMouseMoveWithTrack
         * @tc.desc: swipe on the screen between the specified points with mouse.
         */
        it('testMouseMoveWithTrack', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let Button1 = await driver.findComponent(ON.id('jump'))
            let Button2 = await driver.findComponent(ON.text('next page'))
            let center1 = await Button1.getBoundsCenter()
            let center2 = await Button2.getBoundsCenter()
            await driver.mouseMoveTo(center1)
            await driver.delayMs(waitUiReadyMs)
            await driver.mouseMoveWithTrack(center1, center2, 600)
            await driver.delayMs(waitUiReadyMs)
            let newButton = await driver.findComponent(ON.text('jump'))
            expect(newButton == null).assertTrue()
        })

        /*
         * @tc.number: uiTest_11005
         * @tc.name: testDriverInputText
         * @tc.desc: inject text on the specified location.
         */
        it('testDriverInputText', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let inputText = await driver.findComponent(ON.type('TextInput'))
            await inputText.click()
            await driver.delayMs(waitUiReadyMs)
            let permissionBtn = await driver.findComponent(ON.text('同意'))
            if (permissionBtn != null) {
                await permissionBtn.click()
                await driver.delayMs(waitUiReadyMs)
            }
            let input = await driver.findComponent(ON.type('TextInput'))
            await input.clearText()
            await driver.delayMs(waitUiReadyMs)
            let center = await input.getBoundsCenter()
            await driver.inputText(center, '123')
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
        it('testMouseScroll', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let btn = await driver.findComponent(ON.id('jump'))
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
            let Scroll = await driver.findComponent(ON.text('1'))
            let center = await Scroll.getBoundsCenter()
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
        it('testWindowAttr', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let window = await driver.findWindow({bundleName:'com.uitestScene.acts',focused:true,active:true,title:''})
            await window.focus()
            let isActive = await window.isActive()
            expect(isActive == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_11008
         * @tc.name: testDescription
         * @tc.desc: find UiComponent by description attribute and get it's description attribute.
         */
        it('testDescription', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let text = await driver.findComponent(ON.type('Text').description(''))
            let description = await text.getDescription()
            expect(description == '').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })
    })

    describe('UiTest_API10', () =>  {
        afterEach(async () => {
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_10001
         * @tc.name: testWithIn
         * @tc.desc: find UiComponent inside of the given UiComponent.
         */
        it('testWithIn', 0, async () => {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let scroll = await driver.findComponent(ON.type('Scroll'))
            let btn = await driver.findComponent(ON.within(ON.type('Scroll')).text('next page'))
            let bounds1 = await scroll.getBounds()
            let bounds2 = await btn.getBounds()
            expect(bounds1.top < bounds2.top).assertTrue()
            expect(bounds1.bottom > bounds2.bottom).assertTrue()
            expect(bounds1.left < bounds2.right).assertTrue()
            expect(bounds1.right > bounds2.right).assertTrue()
        })

        /*
         * @tc.number: uiTest_10002
         * @tc.name: testFling
         * @tc.desc: inject fling on the device display.
         */
        it('testFling', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'})
            try {
                await window.maximize()
                await driver.delayMs(500)
            } catch (error) {
                console.info('It is already a Fullscreen window')
            }
            await driver.fling(UiDirection.DOWN, 39000)
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponents(ON.text('next page'))
            expect (button).assertNull()
            await driver.fling(UiDirection.LEFT, 39000)
            await driver.delayMs(waitUiReadyMs)
            let text = await driver.findComponents(ON.text('1'))
            expect (text).assertNull()
            await driver.fling(UiDirection.RIGHT, 39000)
            await driver.delayMs(waitUiReadyMs)
            let text2 = await driver.findComponents(ON.text('2'))
            expect (text2).assertNull()
            await driver.fling(UiDirection.UP, 39000)
            await driver.delayMs(2000)
            let button2 = await driver.findComponents(ON.text('next page'))
            expect (button2 != null).assertTrue()
        })

        /*
         * @tc.number: uiTest_10003
         * @tc.name: testScreenCapture
         * @tc.desc: capture the specified area of current screen.
         */
        it('testScreenCapture', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let savePath = '/data/storage/el2/base/cache/1.png'
            let success = await driver.screenCapture(savePath, {left: 0, top: 0, right: 100, bottom: 100})
            expect(success == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_10004
         * @tc.name: testMouseClick
         * @tc.desc: click in the specified location on the screen by mouse.
         */
        it('testMouseClick', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let Button = await driver.findComponent(ON.id('jump'))
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
        it('testMouseMoveTo', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let Button = await driver.findComponent(ON.id('jump'))
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
        it('testMouseScroll', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let btn = await driver.findComponent(ON.id('jump'))
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
            let Scroll = await driver.findComponent(ON.text('1'))
            let center = await Scroll.getBoundsCenter()
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
        it('testInWindow', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
        it('testMonitor1', 0, async () => {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        let driver = Driver.create()
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

        it('testMonitor2', 0, async () => {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        let driver = Driver.create()
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

    describe('UiTest_API8', () => {
        afterEach(async () => {
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8001
         * @tc.name: testInputText
         * @tc.desc: inject text to the target UiComponent
         */
        it('testInputText', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let input = await driver.findComponent(BY.type('TextInput'))
            await input.inputText('123')
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
        it('testMatchPattern', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
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
        it('testUiComponentClick', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
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
        it('testUiComponentDoubleClick', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('Click twice'))
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
        it('testUiComponentLongClick', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
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
        it('testKey', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
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
        it('testId', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
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
        it('testType', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
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
        it('testClickable', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('next page').clickable(false))
            let clickable = await button.isClickable()
            expect(clickable == false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8010
         * @tc.name: testScrollable
         * @tc.desc: find UiComponent by scrollable attribute and get it's scrollable attribute.
         */
        it('testScrollable', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let scrollBar = await driver.findComponent(BY.type('Scroll'))
            let scrollable = await scrollBar.isScrollable()
            expect(scrollable == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8011
         * @tc.name: testEnabled
         * @tc.desc: find UiComponent by enabled attribute and get it's enabled attribute.
         */
        it('testEnabled', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('next page').enabled(true))
            let enable = await button.isEnabled()
            expect(enable == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8012
         * @tc.name: testFocused
         * @tc.desc: find UiComponent by focused attribute and get it's focused attribute.
         */
        it('testFocused', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('next page').focused(false))
            let focused = await button.isFocused()
            expect(focused == false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8013
         * @tc.name: testSelected
         * @tc.desc: find UiComponent by selected attribute and get it's selected attribute.
         */
        it('testSelected', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('next page').selected(false))
            let selected = await button.isSelected()
            expect(selected == false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8014
         * @tc.name: testPressBack
         * @tc.desc: Press the BACK key.
         */
        it('testPressBack', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
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
        it('testFindComponents', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
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
        it('testTriggerKey', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
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
        it('testScreenCap', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
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
        it('testAssertComponentExist', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            await driver.assertComponentExist(BY.text('next page'))
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8019
         * @tc.name: testIsBefore
         * @tc.desc: find uiComponent which is before another UiComponent that specified by given.
         */
        it('testIsBefore', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.isBefore(BY.text('Click twice')).type('Button'))
            expect(await button.getType() == 'Button').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8020
         * @tc.name: testIsAfter
         * @tc.desc: find uiComponent which is after another UiComponent that specified by given.
         */
        it('testIsAfter', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.isAfter(BY.text('next page')).type('Text'))
            expect(await button.getText() == 'Click twice').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8021
         * @tc.name: testSwipe
         * @tc.desc: swipe on the screen between the specified points.
         */
        it('testSwipe', 0, async () => {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let displayClass = await display.getDefaultDisplay();
            let screenWidth = displayClass.width
            let screenHeight = displayClass.height
            console.info('screenWidth:' + screenWidth + ', screenHeight:' +screenHeight)
            await driver.swipe(Math.floor(screenWidth / 2), Math.floor(screenHeight / 2 + screenHeight / 4),
              Math.floor(screenWidth / 2), Math.floor(screenHeight / 2 - screenHeight / 4))
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
        it('testScrollSearch', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let scrollBar = await driver.findComponent(BY.type('Scroll'))
            let button = await scrollBar.scrollSearch(BY.text('next page'))
            expect(await button.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })
    })

    describe('UiTest_API9', () => {
        afterEach(async () => {
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9001
         * @tc.name: testInputText
         * @tc.desc: inject text to the target UiComponent
         */
        it('testInputText', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let input = await driver.findComponent(ON.type('TextInput'))
            await input.inputText('123')
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
        it('testClearText', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let input1 = await driver.findComponent(ON.type('TextInput'))
            await input1.inputText('abc')
            await driver.delayMs(2000)
            let input2 = await driver.findComponent(ON.type('TextInput'))
            await input2.clearText()
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
        it('testCheckable', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.checkable(true).type('Checkbox'))
            let checkable = await button.isCheckable()
            expect(checkable == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9004
         * @tc.name: testChecked
         * @tc.desc: find UiComponent by checked attribute and get it's checked attribute.
         */
        it('testChecked', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.checked(false).type('Checkbox'))
            let checked = await button.isChecked()
            expect(checked == false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9005
         * @tc.name: testMatchPattern
         * @tc.desc: specifies the string value match pattern.
         */
        it('testMatchPattern', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
        it('testDriverClick', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
        it('testDriverDoubleClick', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let Button = await driver.findComponent(ON.text('Click twice'))
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
        it('testDriverLongClick', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
        it('testUiComponentClick', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
        it('testUiComponentDoubleClick', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('Click twice'))
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
        it('testUiComponentLongClick', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
        it('testKey', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
        it('testType', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
        it('testClickable', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('next page').clickable(false))
            let clickable = await button.isClickable()
            expect(clickable == false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9015
         * @tc.name: testLongClickable
         * @tc.desc: find UiComponent by longClickable attribute and get it's longClickable attribute.
         */
        it('testLongClickable', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('next page').longClickable(false))
            let longClickable = await button.isLongClickable()
            expect(longClickable== false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9016
         * @tc.name: testScrollable
         * @tc.desc: find UiComponent by scrollable attribute and get it's scrollable attribute.
         */
        it('testScrollable', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let scrollBar = await driver.findComponent(ON.type('Scroll'))
            let scrollable = await scrollBar.isScrollable()
            expect(scrollable == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9017
         * @tc.name: testEnabled
         * @tc.desc: find UiComponent by enabled attribute and get it's enabled attribute.
         */
        it('testEnabled', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('next page').enabled(true))
            let enable = await button.isEnabled()
            expect(enable == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9018
         * @tc.name: testFocused
         * @tc.desc: find UiComponent by focused attribute and get it's focused attribute.
         */
        it('testFocused', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('next page').focused(false))
            let focused = await button.isFocused()
            expect(focused == false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9019
         * @tc.name: testSelected
         * @tc.desc: find UiComponent by selected attribute and get it's selected attribute.
         */
        it('testSelected', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('next page').selected(false))
            let selected = await button.isSelected()
            expect(selected == false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9020
         * @tc.name: testPressBack
         * @tc.desc: Press the BACK key.
         */
        it('testPressBack', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
        it('testFindComponents', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
        it('testTriggerKey', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
         * @tc.number: uiTest_9023
         * @tc.name: testTriggerCombineKeys
         * @tc.desc: press two or three key combinations
         */
        it('testTriggerCombineKeys', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(2000)
            let text = await driver.findComponent(ON.type('TextInput'))
            let center = await text.getBoundsCenter()
            // set pasteBoard data
            await text.inputText('123')
            await driver.delayMs(2000)
            await driver.click(center.x, center.y)
            await driver.delayMs(waitUiReadyMs)
            await driver.triggerCombineKeys(2072, 2017)
            await driver.delayMs(waitUiReadyMs)
            await driver.triggerCombineKeys(2072, 2019)
            await driver.delayMs(waitUiReadyMs)
            // clear and paste
            let text2 = await driver.findComponent(ON.type('TextInput'))
            await text2.clearText()
            await driver.delayMs(waitUiReadyMs)
            await driver.triggerCombineKeys(2072, 2038)
            await driver.delayMs(4000)
            let text3 = await driver.findComponent(ON.type('TextInput'))
            expect(await text3.getText() == '123').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9024
         * @tc.name: testGetUiComponentBounds
         * @tc.desc: get the bounds of this UiComponent.
         */
        it('testGetUiComponentBounds', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
        it('testGetUiComponentBoundsCenter', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
        it('testWaitForComponent', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
        it('testScreenCap', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
        it('testAssertComponentExist', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            await driver.assertComponentExist(ON.text('next page'))
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9029
         * @tc.name: testIsBefore
         * @tc.desc: find uiComponent which is before another UiComponent that specified by given.
         */
        it('testIsBefore', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.isBefore(ON.text('Click twice')).type('Button'))
            expect(await button.getType() == 'Button').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9030
         * @tc.name: testIsAfter
         * @tc.desc: find uiComponent which is after another UiComponent that specified by given.
         */
        it('testIsAfter', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.isAfter(ON.text('next page')).type('Text'))
            expect(await button.getText() == 'Click twice').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9031
         * @tc.name: testSwipe
         * @tc.desc: swipe on the screen between the specified points.
         */
        it('testSwipe', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
        it('testFling', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let scoll = await driver.findComponent(ON.type('Scroll'))
            let rect = await scoll.getBounds()
            let center = await scoll.getBoundsCenter()
            await driver.fling({x: center.x, y:Math.floor(center.y + (rect.bottom - rect.top) / 4)},
              {x: center.x, y:Math.floor(center.y - (rect.bottom - rect.top) / 4)}, 20, 600)
            await driver.delayMs(1000)
            let text = await driver.findComponent(ON.text('next page'))
            expect(text == null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9033
         * @tc.name: testScrollSearch
         * @tc.desc: scroll on this UiComponent to find matched UiComponent.
         */
        it('testScrollSearch', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
        it('testScrollToBottom', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let scrollBar = await driver.findComponent(ON.type('Scroll'))
            expect(scrollBar != null).assertTrue()
            await scrollBar.scrollToBottom()
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
        it('testScrollToTop', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let scrollBar = await driver.findComponent(ON.type('Scroll'))
            expect(scrollBar !== null).assertTrue()
            await scrollBar.scrollToBottom()
            await scrollBar.scrollToTop()
            let button = await driver.findComponent(ON.text('next page'))
            expect(await button.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9036
         * @tc.name: testPinch
         * @tc.desc: pinch enlarge this UiComponent to the target scale.
         */
        it('testPinch', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.id('jump'))
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
        it('testInjectMultiPointerAction', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.id('jump'))
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
        it('testGetWindowMode', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
        it('testGetBundleName', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
        it('testGetTitle', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
        it('testWindowMoveTo', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
        it('testWindowResizeA', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
                let window3 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
                let bounds3= await window3.getBounds()
                expect(bounds3 != bounds2).assertTrue()
                await window3.resize(300,300,ResizeDirection.LEFT_DOWN)
                let window4 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
                let bounds4= await window4.getBounds()
                expect(bounds4 != bounds3).assertTrue()

                await window4.resize(500,500,ResizeDirection.LEFT_UP)
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

        it('testWindowResizeB', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
                let window6 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
                let bounds6= await window6.getBounds()
                expect(bounds6 != bounds5).assertTrue()

                await window6.resize(bounds6.right - bounds6.left,500,ResizeDirection.UP)
                let window7 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
                let bounds7 = await window7.getBounds()
                expect(bounds7 != bounds6).assertTrue()

                await window7.resize(300,bounds7.bottom - bounds7.top,ResizeDirection.LEFT)
                let window8 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
                let bounds8 = await window8.getBounds()
                expect(bounds8 != bounds7).assertTrue()

                await window8.resize(500,bounds8.bottom - bounds8.top,ResizeDirection.RIGHT)
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
        it('testWindowAttr', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let window = await driver.findWindow({bundleName:'com.uitestScene.acts',focused:true,actived:true,title:''})
            await window.focus()
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
            let driver = Driver.create()
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
        it('testWindowMinimize', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
        it('testWindowClose', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
        it('testGetDisplaySize', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
        it('testGetDisplayDensity', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let s = await driver.getDisplayDensity()
            expect(s.x != 0).assertTrue()
            expect(s.y != 0).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9049
         * @tc.name: testDisplayRotation
         * @tc.desc: get the rotation of the device display and set it.
         */
        it('testDisplayRotation', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            await driver.setDisplayRotation(DisplayRotation.ROTATION_0)
            await driver.delayMs(waitUiReadyMs)
            let rotation = await driver.getDisplayRotation()
            if (rotation == DisplayRotation.ROTATION_90) {
                console.info('The device is displayed in horizontal on default')
                await driver.setDisplayRotation(DisplayRotation.ROTATION_90)
                await driver.delayMs(waitUiReadyMs)
                let rotation1 = await driver.getDisplayRotation()
                expect(rotation1 == DisplayRotation.ROTATION_0)

                await driver.setDisplayRotation(DisplayRotation.ROTATION_180)
                await driver.delayMs(waitUiReadyMs)
                let rotation2 = await driver.getDisplayRotation()
                expect(rotation2 == DisplayRotation.ROTATION_270)

                await driver.setDisplayRotation(DisplayRotation.ROTATION_270)
                await driver.delayMs(waitUiReadyMs)
                let rotation3 = await driver.getDisplayRotation()
                expect(rotation3 == DisplayRotation.ROTATION_180)

                await driver.setDisplayRotation(DisplayRotation.ROTATION_90)
            } else if (rotation == DisplayRotation.ROTATION_0) {
                console.info('The device is displayed in vertical on default')
                await driver.setDisplayRotation(DisplayRotation.ROTATION_90)
                await driver.delayMs(waitUiReadyMs)
                let rotation1 = await driver.getDisplayRotation()
                expect(rotation1 == DisplayRotation.ROTATION_90)

                await driver.setDisplayRotation(DisplayRotation.ROTATION_180)
                await driver.delayMs(waitUiReadyMs)
                let rotation2 = await driver.getDisplayRotation()
                expect(rotation2 == DisplayRotation.ROTATION_180)

                await driver.setDisplayRotation(DisplayRotation.ROTATION_270)
                await driver.delayMs(waitUiReadyMs)
                let rotation3 = await driver.getDisplayRotation()
                expect(rotation3 == DisplayRotation.ROTATION_270)

                await driver.setDisplayRotation(DisplayRotation.ROTATION_0)
            }
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9050
         * @tc.name: testSetDisplayRotationEnabled
         * @tc.desc: enable/disable the rotation of device display.
         */
        it('testSetDisplayRotationEnabled', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.setDisplayRotationEnabled(true)
            await driver.delayMs(waitUiReadyMs)
            await driver.setDisplayRotation(DisplayRotation.ROTATION_0)
            await driver.delayMs(waitUiReadyMs)
            let rotation = await driver.getDisplayRotation()
            if (rotation == DisplayRotation.ROTATION_90) {
                console.info('The device is displayed in horizontal on default')
                await driver.setDisplayRotation(DisplayRotation.ROTATION_90)
            } else {
                console.info('The device is displayed in vertical on default')
            }
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9051
         * @tc.name: testWakeUpDisplay
         * @tc.desc: wake up the device display.
         */
        it('testWakeUpDisplay', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            await driver.wakeUpDisplay()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9052
         * @tc.name: testPressHome
         * @tc.desc: press the home key.
         */
        it('testPressHome', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            await driver.pressHome()
            await driver.delayMs(1000)
            let button = await driver.findComponent(ON.text('next page'))
            expect(button == null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9053
         * @tc.name: testWaitForIdle
         * @tc.desc: wait for the UI become idle.
         */
        it('testWaitForIdle', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(2000)
            let idled = await driver.waitForIdle(4000,5000)
            expect(idled = true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9054
         * @tc.name: testDrag
         * @tc.desc: drag on the screen between the specified points.
         */
        it('testDrag', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.id('jump'))
            await button.longClick()
            await driver.delayMs(waitUiReadyMs)
            let text1 = await driver.findComponent(ON.text('one'))
            let text2 = await driver.findComponent(ON.text('two'))
            let point1 = await text1.getBoundsCenter()
            let point2 = await text2.getBoundsCenter()
            await driver.drag(point1.x, point1.y, point2.x, point2.y)
            await driver.delayMs(waitUiReadyMs)
            let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
            expect(text == null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9055
         * @tc.name: testDragTos
         * @tc.desc: drag this UiComponent to the bounds rect of target UiComponent.
         */
        it('testDragTo', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.id('jump'))
            await button.longClick()
            await driver.delayMs(waitUiReadyMs)
            let text1 = await driver.findComponent(ON.text('one'))
            let text2 = await driver.findComponent(ON.text('two'))
            await text1.dragTo(text2)
            await driver.delayMs(waitUiReadyMs)
            let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
            expect(text == null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_9056
         * @tc.name: testSplit
         * @tc.desc: change this UiWindow into split screen mode.
         */
        it('testSplit', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
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
}