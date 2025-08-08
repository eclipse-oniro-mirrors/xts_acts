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

    /*
     * @tc.number: uiTest_20002
     * @tc.name: testDragBetween
     * @tc.desc: drag this UiComponent to the bounds rect of target UiComponent, the value of duration is 3000, the value of speed is 3000.
     */
    it('testDragBetween', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TestTag, 'testDragBetween start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.id('jump'))
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      let text1 = await driver.findComponent(ON.text('one'))
      let text2 = await driver.findComponent(ON.text('two'))
      let center1 = await text1.getBoundsCenter()
      let center2 = await text2.getBoundsCenter()
      await driver.dragBetween(center1, center2, 3000, 3000)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text == null).assertTrue()
      await stopApplication('com.uitestScene.acts')
      console.log(TestTag, 'testDragBetween over');
    })

    /*
    * @tc.number: uiTest_20003
    * @tc.name: testNewMouseDrag
    * @tc.desc: drag on the screen between the specified points by mouse, the value of speed and duration are 3000.
    */
    it('testNewMouseDrag', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TestTag, 'testNewMouseDrag start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.id('jump'))
      let center = await button.getBoundsCenter();
      await driver.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 2072, 3000)
      console.log(TestTag, 'mouseLongClick successful');
      await driver.delayMs(waitUiReadyMs)
      let text1 = await driver.findComponent(ON.text('one'))
      let text2 = await driver.findComponent(ON.text('two'))
      let point1 = await text1.getBoundsCenter()
      let point2 = await text2.getBoundsCenter()
      await driver.mouseDrag(point1, point2, 600, 3000)
      await driver.delayMs(2000)
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text == null).assertTrue()
      console.log(TestTag, 'testNewMouseDrag over');
    })

    /*
     * @tc.number: uiTest_20021
     * @tc.name: testPressHomeWithId
     * @tc.desc: pressHome test
     */
    it('testPressHomeWithId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TestTag, 'testPressHomeWithId start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = display.getDefaultDisplaySync();
      console.log(`${TestTag}, testPressHomeWithId disPlay is: ${JSON.stringify(disPlay)}`);
      await driver.pressHome(disPlay.id)
      await driver.delayMs(1000)
      let button = await driver.findComponent(ON.belongingDisplay(disPlay.id).text('next page'))
      expect(button == null).assertTrue()
      await stopApplication('com.uitestScene.acts')
      console.log(TestTag, 'testPressHomeWithId over');
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

    /*
    * @tc.number: UiTest_API16_018
    * @tc.name: testScrollSearchHorizontal
    * @tc.desc: scroll horizontally on this UiComponent to find matched UiComponent.
    */
    it('testScrollSearchHorizontal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TestTag, 'testScrollSearchHorizontal start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.text('scroll'))
      await driver.delayMs(waitUiReadyMs);
      await button.click();
      await driver.delayMs(waitUiReadyMs);
      let cover = await driver.findComponent(ON.text('Offset Start'))
      let coverRect = await cover.getBounds()
      let coverWidth = coverRect.right - coverRect.left;
      console.log(TestTag, `coverWidth = ${coverWidth}`);
      let scrollBar = await driver.findComponent(ON.id('horizontalScroll'));
      await driver.delayMs(waitUiReadyMs);
      let text1 = await scrollBar.scrollSearch(ON.text('8'), false, Math.floor(coverWidth * 0.5));
      await driver.delayMs(waitUiReadyMs);
      expect(text1 == null).assertTrue();
      await driver.delayMs(waitUiReadyMs);
      let text2 = await scrollBar.scrollSearch(ON.text('11'), false, Math.floor(coverWidth * 1.2));
      await driver.delayMs(waitUiReadyMs);
      expect(text2 == null).assertTrue();
      await driver.delayMs(waitUiReadyMs);
      let text3 = await scrollBar.scrollSearch(ON.text('2'), false, Math.floor(coverWidth * 1.2));
      await driver.delayMs(waitUiReadyMs);
      expect(await text3.getText()).assertEqual('2');
      await driver.delayMs(waitUiReadyMs);
      let text4 = await scrollBar.scrollSearch(ON.text('8'), false, Math.floor(coverWidth * 1.2));
      await driver.delayMs(waitUiReadyMs);
      expect(await text4.getText()).assertEqual('8');
      await driver.delayMs(waitUiReadyMs);
      console.log(TestTag, 'testScrollSearchHorizontal end');
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

    /*
    * @tc.number: uiTest_11003
    * @tc.name: testMouseDrag
    * @tc.desc: drag on the screen between the specified points by mouse.
    */
    it('testMouseDrag', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.id('jump'))
      let center = await button.getBoundsCenter();
      await driver.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT)
      await driver.delayMs(waitUiReadyMs)
      let text1 = await driver.findComponent(ON.text('one'))
      let text2 = await driver.findComponent(ON.text('two'))
      let point1 = await text1.getBoundsCenter()
      let point2 = await text2.getBoundsCenter()
      await driver.mouseDrag(point1, point2, 600)
      await driver.delayMs(2000)
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text == null).assertTrue()
	  await driver.mouseDrag(point1, point2)
    })

  })

  describe('UiTest_API10', () =>  {
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

    /*
     * @tc.number: uiTest_10002
     * @tc.name: testFling
     * @tc.desc: inject fling on the device display.
     */
    it('testFling', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let allDisplayIds = await display.getAllDisplay()
        for (let d of allDisplayIds) {
        if (d.id == 999) {
          console.info('Can not create full screen application scene')
          return
        }
      }
      let d = await display.getDefaultDisplaySync()
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
      let text2 = await driver.findComponents(ON.text('1'))
      expect (text2).assertNull()
      await driver.fling(UiDirection.UP, 39000)
      await driver.delayMs(2000)
      let button2 = await driver.findComponents(ON.text('bottom'))
      expect (button2 == null).assertTrue()
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

    /*
     * @tc.number: uiTest_9023
     * @tc.name: testTriggerCombineKeys
     * @tc.desc: press two or three key combinations
     */
    it('testTriggerCombineKeys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(2000)
      let text = await driver.findComponent(ON.type('TextInput'))
      if (text == null) {
        let scorll = await driver.findComponent(ON.type('Scroll'))
        text = await scorll.scrollSearch(ON.type('TextInput'))
      }
      let center = await text.getBoundsCenter()
      // set pasteBoard data
      await text.inputText('123')
      await driver.delayMs(2000)
      await exitInputMethod()
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
      await driver.delayMs(2000)
      await exitInputMethod()
      await driver.delayMs(4000)
      let text3 = await driver.findComponent(ON.type('TextInput'))
      expect(await text3.getText() == '123').assertTrue()
      await stopApplication('com.uitestScene.acts')
    })

    /*
     * @tc.number: uiTest_9049
     * @tc.name: testDisplayRotation
     * @tc.desc: get the rotation of the device display and set it.
     */
    it('testDisplayRotation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
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
        await driver.delayMs(waitUiReadyMs)
      }
      await stopApplication('com.uitestScene.acts')
    })

    /*
     * @tc.number: uiTest_9050
     * @tc.name: testSetDisplayRotationEnabled
     * @tc.desc: enable/disable the rotation of device display.
     */
    it('testSetDisplayRotationEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
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
     * @tc.number: uiTest_9052
     * @tc.name: testPressHome
     * @tc.desc: press the home key.
     */
    it('testPressHome', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      await driver.pressHome()
      await driver.delayMs(1000)
      let button = await driver.findComponent(ON.text('next page'))
      expect(button == null).assertTrue()
      await stopApplication('com.uitestScene.acts')
    })

    /*
     * @tc.number: uiTest_9054
     * @tc.name: testDrag
     * @tc.desc: drag on the screen between the specified points.
     */
    it('testDrag', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
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
    it('testDragTo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
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
  })
}
