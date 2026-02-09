/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { beforeAll, beforeEach, describe, it, expect,TestType, Size, Level } from "../../../hypium/index"
import { Component, Driver, ON, On, MatchPattern, MouseButton,ResizeDirection, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation, Rect } from '@kit.TestKit'
import  hilog  from '@ohos.hilog'
import display from '@ohos.display';
import { BusinessError } from '@ohos.base';

import { Utils, startAbility, stopApplication, getInputMethodPermission } from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const TestTag = 'uitestTag';
const waitUiReadyMs : int = 1000;

async function exitInputMethod() {
  let driver = Driver.create()
  let softKeyBoard = await driver.findComponent(ON.type('Canvas'))
  if (softKeyBoard != null) {
    await driver.pressBack()
  }
}

export default function uitestEnumTest() {
  describe('uitestTest_Api20', (): void => {
    let driver: Driver | undefined;
    beforeAll(async () : Promise<void> => {
      hilog.info(domain, tag, "uitestEnumTest loadup start!!!!!");
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      driver = Driver.create();
      await Utils.msSleep(1000);
      await getInputMethodPermission(driver!);
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, "uitestEnumTest loadup over!!!!!");
    })

    beforeEach(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.number UitestTest_Api20_001
     * @tc.name testGetDisplayId_static
     * @tc.desc getDisplayId test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetDisplayId_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testGetDisplayId_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(1000);
      let disPlay = display.getDefaultDisplaySync();
      hilog.info(domain, tag, `testGetDisplayId_static is: ${JSON.stringify(disPlay)}`);
      try {
        let mainPage = await driver!.findComponent(ON.belongingDisplay(disPlay.id.toInt()).text('MainPage'));
        expect(mainPage != null).assertTrue()
        if(mainPage != null) {
          let disId = await mainPage.getDisplayId();
          hilog.info(domain, tag, `testGetDisplayId_static disId is: ${JSON.stringify(disId)}`);
          expect(disId).assertEqual(disPlay.id)
        }
      } catch (error) {
        hilog.info(domain, tag, `testGetDisplayId_static error is: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testGetDisplayId_static end`);
    })

    /**
     * @tc.number UitestTest_Api20_002
     * @tc.name test_origin_static
     * @tc.desc specifies the string value match pattern.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_origin_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_origin_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button1 = await driver!.findComponent(ON.originalText('next page'))
      expect(button1 != null).assertTrue()
      if(button1 != null) {
        let originText = await button1.getOriginalText();
        hilog.info(domain, tag, `test_origin_static originText: ${JSON.stringify(originText)}`);
        expect(originText == 'next page').assertTrue()
      }
      let button2 = await driver!.findComponent(ON.originalText('next',MatchPattern.STARTS_WITH))
      expect(button2 != null).assertTrue()
      if(button2 != null) {
        let originText1 = await button2.getOriginalText();
        hilog.info(domain, tag, `test_origin_static originText1: ${JSON.stringify(originText1)}`);
        expect(originText1 == 'next page').assertTrue()
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `test_origin_static end`);
    })

    /**
     * @tc.number UitestTest_Api20_003
     * @tc.name testTriggerCombineKeysWithId_static
     * @tc.desc triggerCombineKeys test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTriggerCombineKeysWithId_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testTriggerCombineKeysWithId_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let disPlay = display.getDefaultDisplaySync();
      await driver!.delayMs(1000);
      await exitInputMethod();
      await driver!.delayMs(1000);
      let text = await driver!.findComponent(ON.belongingDisplay(disPlay.id.toInt()).type('TextInput'));
      if (text == null) {
        let scorll = await driver!.findComponent(ON.belongingDisplay(disPlay.id.toInt()).type('Scroll'));
        if(scorll != null) {
          text = await scorll.scrollSearch(ON.belongingDisplay(disPlay.id.toInt()).type('TextInput'));
        }
      }
      // set pasteBoard data
      if(text != null) {
        await text.inputText('123');
      }
      await driver!.delayMs(1000);
      await exitInputMethod();
      await driver!.delayMs(1000);
      text = await driver!.findComponent(ON.belongingDisplay(disPlay.id.toInt()).type('TextInput'));
      if (text == null) {
        let scorll = await driver!.findComponent(ON.belongingDisplay(disPlay.id.toInt()).type('Scroll'));
        if(scorll != null) {
          text = await scorll.scrollSearch(ON.belongingDisplay(disPlay.id.toInt()).type('TextInput'));
        }
      }
      if(text != null) {
        let center = await text.getBoundsCenter();
        await driver!.click(center.x, center.y);
        await driver!.delayMs(waitUiReadyMs);
        await driver!.triggerCombineKeys(2072, 2017);
        await driver!.delayMs(waitUiReadyMs);
        await driver!.triggerCombineKeys(2072, 2019, 0);
        await driver!.delayMs(waitUiReadyMs);
      }
      await exitInputMethod();
      await driver!.delayMs(1000);
      // clear and paste
      let text2 = await driver!.findComponent(ON.belongingDisplay(disPlay.id.toInt()).type('TextInput'));
      if (text2 == null) {
        let scorll = await driver!.findComponent(ON.belongingDisplay(disPlay.id.toInt()).type('Scroll'));
        if(scorll != null) {
          text2 = await scorll.scrollSearch(ON.belongingDisplay(disPlay.id.toInt()).type('TextInput'));
        }
      }
      if(text2 != null) {
        await text2.clearText();
      }
      await driver!.delayMs(waitUiReadyMs);
      await driver!.triggerCombineKeys(2072, 2038, 0, disPlay.id.toInt());
      await driver!.delayMs(1000);
      await exitInputMethod();
      await driver!.delayMs(1000);
      let text3 = await driver!.findComponent(ON.belongingDisplay(disPlay.id.toInt()).type('TextInput'));
      if (text3 == null) {
        let scorll = await driver!.findComponent(ON.belongingDisplay(disPlay.id.toInt()).type('Scroll'));
        if(scorll != null) {
          text3 = await scorll.scrollSearch(ON.belongingDisplay(disPlay.id.toInt()).type('TextInput'));
        }
      }
      expect(text3 != null).assertTrue();
      if(text3 != null) {
        let msg = await text3.getText();
        expect(msg == '123').assertTrue();
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testTriggerCombineKeysWithId_static end`);
    })

    /**
     * @tc.number UitestTest_Api20_004
     * @tc.name testClickAt_static
     * @tc.desc clickAt test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClickAt_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testClickAt_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = await driver!.findComponent(ON.text('next page'));
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter();
        await driver!.clickAt(center);
        await driver!.delayMs(waitUiReadyMs);
      }
      let newButton = await driver!.findComponent(ON.text('back to index'));
      expect(newButton != null).assertTrue();
      if (newButton != null) {
        let text = await newButton.getText();
        expect(text == 'back to index').assertTrue();
        await newButton.click();
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testClickAt_static end`);
    })

    /**
     * @tc.number UitestTest_Api20_005
     * @tc.name testDoubleClickAt_static
     * @tc.desc doubleClickAt test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDoubleClickAt_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testDoubleClickAt_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let Button = await driver!.findComponent(ON.text('Click twice'));
      if (Button == null) {
        let scorll = await driver!.findComponent(ON.type('Scroll'));
        if (scorll != null) {
          Button = await scorll.scrollSearch(ON.text('Click twice'));
        }
      }
      expect(Button != null).assertTrue();
      if (Button != null) {
        let center = await Button.getBoundsCenter();
        await driver!.doubleClickAt(center);
      }
      await driver!.delayMs(waitUiReadyMs);
      let button = await driver!.findComponent(ON.text('doubleClick'));
      expect(button != null).assertTrue();
      if (button != null) {
        let text = await button.getText();
        expect(text == 'doubleClick').assertTrue();
        await button.click();
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testDoubleClickAt_static end`);
    })

    /**
     * @tc.number UitestTest_Api20_006
     * @tc.name testDriverLongClickAt_static
     * @tc.desc LongClick on the specified location on the screen, the value of duration is 3000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAt_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testDriverLongClickAt_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let Button = await driver!.findComponent(ON.text('next page'));
      expect(Button != null).assertTrue();
      if (Button != null) {
        let center = await Button.getBoundsCenter();
        await driver!.longClickAt(center);
      }
      await driver!.delayMs(waitUiReadyMs);
      let newButton = await driver!.findComponent(ON.text('longClick'));
      expect(newButton != null).assertTrue();
      if (newButton != null) {
        let text = await newButton.getText();
        expect(text == 'longClick').assertTrue();
        await newButton.click();
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testDriverLongClickAt_static end`);
    })

    /**
     * @tc.number UitestTest_Api20_0061
     * @tc.name testDriverLongClickAt_duration_static
     * @tc.desc LongClick on the specified location on the screen, the value of duration is 3000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAt_duration_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testDriverLongClickAt_duration_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let Button = await driver!.findComponent(ON.text('next page'));
      expect(Button != null).assertTrue();
      if (Button != null) {
        let center = await Button.getBoundsCenter();
        await driver!.longClickAt(center);
      }
      await driver!.delayMs(waitUiReadyMs);
      let newButton = await driver!.findComponent(ON.text('longClick'));
      expect(newButton != null).assertTrue();
      if (newButton != null) {
        let text = await newButton.getText();
        expect(text == 'longClick').assertTrue();
        await newButton.click();
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testDriverLongClickAt_duration_static end`);
    })

    /**
     * @tc.number UitestTest_Api20_007
     * @tc.name test_swipeBetween_static
     * @tc.desc swipeBetween test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_swipeBetween_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_swipeBetween_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let disPlay = display.getDefaultDisplaySync();
      let scoll = await driver!.findComponent(ON.type('Scroll'));
      expect(scoll != null).assertTrue();
      if (scoll != null) {
        let rect = await scoll.getBounds();
        let center = await scoll.getBoundsCenter();
        await driver!.swipeBetween({x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()
        , displayId: disPlay.id.toInt()},
          {x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt(), displayId: disPlay.id.toInt()});
      }
      await driver!.delayMs(waitUiReadyMs);
      let text = await driver!.findComponent(ON.text('toast'));
      expect(text == null).assertTrue();
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `test_swipeBetween_static end`);
    })

    /**
     * @tc.number UitestTest_Api20_0071
     * @tc.name test_swipeBetween_speed_static
     * @tc.desc swipeBetween test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_swipeBetween_speed_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_swipeBetween_speed_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let disPlay = display.getDefaultDisplaySync();
      let scoll = await driver!.findComponent(ON.type('Scroll'));
      expect(scoll != null).assertTrue();
      if (scoll != null) {
        let rect = await scoll.getBounds();
        let center = await scoll.getBoundsCenter();
        await driver!.swipeBetween({x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()
        , displayId: disPlay.id.toInt()},
          {x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt(), displayId: disPlay.id.toInt()}, 600);
      }
      await driver!.delayMs(waitUiReadyMs);
      let text = await driver!.findComponent(ON.text('toast'));
      expect(text == null).assertTrue();
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `test_swipeBetween_speed_static end`);
    })

    /**
     * @tc.number UitestTest_Api20_008
     * @tc.name testDragBetween_static
     * @tc.desc drag this UiComponent to the bounds rect of target UiComponent, the value of duration is 3000, the value of speed is 3000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDragBetween_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testDragBetween_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = await driver!.findComponent(ON.id('jump'));
      expect(button != null).assertTrue();
      if (button != null) {
        await button.longClick();
      }
      await driver!.delayMs(waitUiReadyMs);
      let text1 = await driver!.findComponent(ON.text('one'));
      let text2 = await driver!.findComponent(ON.text('two'));
      expect(text1 != null).assertTrue();
      expect(text2 != null).assertTrue();
      if (text1 != null && text2 != null) {
        let center1 = await text1.getBoundsCenter();
        let center2 = await text2.getBoundsCenter();
        await driver!.dragBetween(center1, center2);
      }
      await driver!.delayMs(waitUiReadyMs);
      let text = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text == null).assertTrue();
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testDragBetween_static end`);
    })

    /**
     * @tc.number UitestTest_Api20_0081
     * @tc.name testDragBetween_speed_static
     * @tc.desc drag this UiComponent to the bounds rect of target UiComponent, the value of duration is 3000, the value of speed is 3000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDragBetween_speed_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testDragBetween_speed_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = await driver!.findComponent(ON.id('jump'));
      expect(button != null).assertTrue();
      if (button != null) {
        await button.longClick();
      }
      await driver!.delayMs(waitUiReadyMs);
      let text1 = await driver!.findComponent(ON.text('one'));
      let text2 = await driver!.findComponent(ON.text('two'));
      expect(text1 != null).assertTrue();
      expect(text2 != null).assertTrue();
      if (text1 != null && text2 != null) {
        let center1 = await text1.getBoundsCenter();
        let center2 = await text2.getBoundsCenter();
        await driver!.dragBetween(center1, center2, 3000);
      }
      await driver!.delayMs(waitUiReadyMs);
      let text = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text == null).assertTrue();
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testDragBetween_speed_static end`);
    })

    /**
     * @tc.number UitestTest_Api20_0082
     * @tc.name testDragBetween_duration_static
     * @tc.desc drag this UiComponent to the bounds rect of target UiComponent, the value of duration is 3000, the value of speed is 3000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDragBetween_duration_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testDragBetween_duration_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = await driver!.findComponent(ON.id('jump'));
      expect(button != null).assertTrue();
      if (button != null) {
        await button.longClick();
      }
      await driver!.delayMs(waitUiReadyMs);
      let text1 = await driver!.findComponent(ON.text('one'));
      let text2 = await driver!.findComponent(ON.text('two'));
      expect(text1 != null).assertTrue();
      expect(text2 != null).assertTrue();
      if (text1 != null && text2 != null) {
        let center1 = await text1.getBoundsCenter();
        let center2 = await text2.getBoundsCenter();
        await driver!.dragBetween(center1, center2, 3000, 3000);
      }
      await driver!.delayMs(waitUiReadyMs);
      let text = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text == null).assertTrue();
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testDragBetween_duration_static end`);
    })

    /**
     * @tc.name testScreenCaptureWithId_static
     * @tc.number UitestTest_Api20_009
     * @tc.desc capture the specified area of current screen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScreenCaptureWithId_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testScreenCaptureWithId_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let disPlay = display.getDefaultDisplaySync();
      let savePath = '/data/storage/el2/base/cache/testScreenCaptureWithId_static.png'
      let success = await driver!.screenCapture(savePath, {left: 0, top: 0, right: 100, bottom: 100, displayId: disPlay.id.toInt()})
      expect(success == true).assertTrue()
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, `testScreenCaptureWithId_static end`);
    })

    /**
     * @tc.number UitestTest_Api20_010
     * @tc.name testGetDisplayRotationWithId_static
     * @tc.desc getDisplayRotation test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetDisplayRotationWithId_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testGetDisplayRotationWithId_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let disPlay = display.getDefaultDisplaySync();
      await driver!.setDisplayRotation(DisplayRotation.ROTATION_0);
      await driver!.delayMs(waitUiReadyMs);
      let rotation = await driver!.getDisplayRotation(disPlay.id.toInt());
      if (rotation == DisplayRotation.ROTATION_90) {
        console.info('The device is displayed in horizontal on default');
        await driver!.setDisplayRotation(DisplayRotation.ROTATION_90);
        await driver!.delayMs(waitUiReadyMs);
        let rotation1 = await driver!.getDisplayRotation(disPlay.id.toInt());
        expect(rotation1 == DisplayRotation.ROTATION_0).assertTrue();

        await driver!.setDisplayRotation(DisplayRotation.ROTATION_180);
        await driver!.delayMs(waitUiReadyMs);
        let rotation2 = await driver!.getDisplayRotation(disPlay.id.toInt());
        expect(rotation2 == DisplayRotation.ROTATION_270).assertTrue();

        await driver!.setDisplayRotation(DisplayRotation.ROTATION_270);
        await driver!.delayMs(waitUiReadyMs);
        let rotation3 = await driver!.getDisplayRotation(disPlay.id.toInt());
        expect(rotation3 == DisplayRotation.ROTATION_180).assertTrue();

        await driver!.setDisplayRotation(DisplayRotation.ROTATION_90);
      } else if (rotation == DisplayRotation.ROTATION_0) {
        console.info('The device is displayed in vertical on default');
        await driver!.setDisplayRotation(DisplayRotation.ROTATION_90);
        await driver!.delayMs(waitUiReadyMs)
        let rotation1 = await driver!.getDisplayRotation(disPlay.id.toInt());
        expect(rotation1 == DisplayRotation.ROTATION_90).assertTrue();

        await driver!.setDisplayRotation(DisplayRotation.ROTATION_180);
        await driver!.delayMs(waitUiReadyMs);
        let rotation2 = await driver!.getDisplayRotation(disPlay.id.toInt());
        expect(rotation2 == DisplayRotation.ROTATION_180).assertTrue();

        await driver!.setDisplayRotation(DisplayRotation.ROTATION_270);
        await driver!.delayMs(waitUiReadyMs);
        let rotation3 = await driver!.getDisplayRotation(disPlay.id.toInt());
        expect(rotation3 == DisplayRotation.ROTATION_270).assertTrue();

        await driver!.setDisplayRotation(DisplayRotation.ROTATION_0);
        await driver!.delayMs(waitUiReadyMs);
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testGetDisplayRotationWithId_static end`);
    })

    /**
     * @tc.number UitestTest_Api20_011
     * @tc.name testGetDisplayDensityWithId_static
     * @tc.desc getDisplayDensity test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetDisplayDensityWithId_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testGetDisplayDensityWithId_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let disPlay = display.getDefaultDisplaySync();
      let s = await driver!.getDisplayDensity(disPlay.id.toInt())
      expect(s.x != 0).assertTrue()
      expect(s.y != 0).assertTrue()
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, `testGetDisplayDensityWithId_static end`);
    })

    /**
     * @tc.number UitestTest_Api20_012
     * @tc.name testMouseLongClick_static
     * @tc.desc longClick in the specified location on the screen by mouse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMouseLongClick_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testMouseLongClick_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let Button = await driver!.findComponent(ON.text('next page'));
      expect(Button != null).assertTrue();
      if (Button != null) {
        let center = await Button.getBoundsCenter();
        await driver!.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT);
      }
      await driver!.delayMs(waitUiReadyMs);
      let newButton = await driver!.findComponent(ON.text('longClick'));
      expect(newButton != null).assertTrue();
      if (newButton != null) {
        let text = await newButton.getText();
        expect(text == 'longClick').assertTrue();
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testMouseLongClick_static end`);
    })

    /**
     * @tc.name testMouseLongClick_key1_static
     * @tc.number UitestTest_Api20_0121
     * @tc.desc longClick in the specified location on the screen by mouse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMouseLongClick_key1_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testMouseLongClick_key1_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let Button = await driver!.findComponent(ON.text('next page'));
      expect(Button != null).assertTrue();
      if (Button != null) {
        let center = await Button.getBoundsCenter();
        await driver!.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0);
      }
      await driver!.delayMs(waitUiReadyMs);
      let newButton = await driver!.findComponent(ON.text('longClick'));
      expect(newButton != null).assertTrue();
      if (newButton != null) {
        let text = await newButton.getText();
        expect(text == 'longClick').assertTrue();
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testMouseLongClick_key1_static end`);
    })

    /**
     * @tc.name testMouseLongClick_key2_static
     * @tc.number UitestTest_Api20_0122
     * @tc.desc longClick in the specified location on the screen by mouse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMouseLongClick_key2_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testMouseLongClick_key2_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let Button = await driver!.findComponent(ON.text('next page'));
      expect(Button != null).assertTrue();
      if (Button != null) {
        let center = await Button.getBoundsCenter();
        await driver!.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 0);
      }
      await driver!.delayMs(waitUiReadyMs);
      let newButton = await driver!.findComponent(ON.text('longClick'));
      expect(newButton != null).assertTrue();
      if (newButton != null) {
        let text = await newButton.getText();
        expect(text == 'longClick').assertTrue();
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testMouseLongClick_key2_static end`);
    })

    /**
     * @tc.name testMouseLongClick_duration_static
     * @tc.number UitestTest_Api20_0123
     * @tc.desc longClick in the specified location on the screen by mouse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMouseLongClick_duration_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testMouseLongClick_duration_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let Button = await driver!.findComponent(ON.text('next page'));
      expect(Button != null).assertTrue();
      if (Button != null) {
        let center = await Button.getBoundsCenter();
        await driver!.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 0, 1500);
      }
      await driver!.delayMs(waitUiReadyMs);
      let newButton = await driver!.findComponent(ON.text('longClick'));
      expect(newButton != null).assertTrue();
      if (newButton != null) {
        let text = await newButton.getText();
        expect(text == 'longClick').assertTrue();
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testMouseLongClick_duration_static end`);
    })

    /**
     * @tc.name testNewMouseDrag_static
     * @tc.number UitestTest_Api20_013
     * @tc.desc drag on the screen between the specified points by mouse, the value of speed and duration are 3000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNewMouseDrag_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(domain, tag, `testNewMouseDrag_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = await driver!.findComponent(ON.id('jump'));
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter();
        await driver!.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 2072, 3000);
      }
      await driver!.delayMs(waitUiReadyMs);
      let text1 = await driver!.findComponent(ON.text('one'));
      let text2 = await driver!.findComponent(ON.text('two'));
      expect(text1 != null).assertTrue();
      expect(text2 != null).assertTrue();
      if (text1 != null && text2 != null) {
        let point1 = await text1.getBoundsCenter();
        let point2 = await text2.getBoundsCenter();
        await driver!.mouseDrag(point1, point2);
      }
      await driver!.delayMs(2000);
      let text = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text == null).assertTrue();
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testNewMouseDrag_static end`);
    })

    /**
     * @tc.name testNewMouseDrag_speed_static
     * @tc.number UitestTest_Api20_0131
     * @tc.desc drag on the screen between the specified points by mouse, the value of speed and duration are 3000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNewMouseDrag_speed_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(domain, tag, `testNewMouseDrag_speed_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = await driver!.findComponent(ON.id('jump'));
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter();
        await driver!.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 2072, 3000);
      }
      await driver!.delayMs(waitUiReadyMs);
      let text1 = await driver!.findComponent(ON.text('one'));
      let text2 = await driver!.findComponent(ON.text('two'));
      expect(text1 != null).assertTrue();
      expect(text2 != null).assertTrue();
      if (text1 != null && text2 != null) {
        let point1 = await text1.getBoundsCenter();
        let point2 = await text2.getBoundsCenter();
        await driver!.mouseDrag(point1, point2, 600);
      }
      await driver!.delayMs(2000);
      let text = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text == null).assertTrue();
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testNewMouseDrag_speed_static end`);
    })

    /**
     * @tc.name testNewMouseDrag_duration_static
     * @tc.number UitestTest_Api20_0132
     * @tc.desc drag on the screen between the specified points by mouse, the value of speed and duration are 3000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNewMouseDrag_duration_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(domain, tag, `testNewMouseDrag_duration_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = await driver!.findComponent(ON.id('jump'));
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter();
        await driver!.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 2072, 3000);
      }
      await driver!.delayMs(waitUiReadyMs);
      let text1 = await driver!.findComponent(ON.text('one'));
      let text2 = await driver!.findComponent(ON.text('two'));
      expect(text1 != null).assertTrue();
      expect(text2 != null).assertTrue();
      if (text1 != null && text2 != null) {
        let point1 = await text1.getBoundsCenter();
        let point2 = await text2.getBoundsCenter();
        await driver!.mouseDrag(point1, point2, 600, 3000);
      }
      await driver!.delayMs(2000);
      let text = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text == null).assertTrue();
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testNewMouseDrag_duration_static end`);
    })

    /**
     * @tc.name testCrownRotate_static
     * @tc.number UitestTest_Api20_014
     * @tc.desc crownRotate test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCrownRotate_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(domain, tag, `testCrownRotate_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(1000)
      let button = await driver!.findComponent(ON.text('wearList'))
      if (button == null) {
        let scorll = await driver!.findComponent(ON.type('Scroll'))
        if (scorll != null) {
          button = await scorll.scrollSearch(ON.text('wearList'))
        }
      }
      await driver!.delayMs(waitUiReadyMs)
      expect(button != null).assertTrue();
      if (button != null) {
        await button.click()
      }
      await driver!.delayMs(waitUiReadyMs)
      try {
        await driver!.crownRotate(250);
        await driver!.delayMs(1000);
        let toastBtn = await driver!.findComponent(ON.text('1'));
        await driver!.delayMs(1000);
        expect(toastBtn == null).assertTrue();
        await driver!.delayMs(1000);
        await driver!.crownRotate(-350, 20);
        await driver!.delayMs(1000);
        let toastBtn1 = await driver!.findComponent(ON.text('1'));
        await driver!.delayMs(1000);
        expect(toastBtn1 != null).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, `testCrownRotate_static error is: ${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(801);
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, `testCrownRotate_static end`);
    })

    /**
     * @tc.name testBelongingDisplay_static
     * @tc.number UitestTest_Api20_015
     * @tc.desc belongingDisplay test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBelongingDisplay_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async ():Promise<void> => {
      hilog.info(domain, tag, "testBelongingDisplay_static Start!!!!!");
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(1000);
      let disPlay = display.getDefaultDisplaySync();
      try {
        let mainPage = await driver!.findComponent(ON.belongingDisplay(disPlay.id.toInt()).text('MainPage'));
        expect(mainPage != null).assertTrue();
        if(mainPage != null) {
          let msg = await mainPage.getText();
          hilog.info(domain, tag, `testBelongingDisplay msg is: ${JSON.stringify(msg)}`);
          expect(msg).assertEqual('MainPage')
        }
      } catch (error) {
        hilog.info(domain, tag, `testBelongingDisplay error is: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, `testBelongingDisplay over`);
    })

    /**
     * @tc.name testWindowAttrWithId_static
     * @tc.number UitestTest_Api20_016
     * @tc.desc find window by WindowFilter and get it's active status.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowAttrWithId_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async ():Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let disPlay = display.getDefaultDisplaySync();
      console.log(`${TestTag}, testWindowAttrWithId disPlay is: ${JSON.stringify(disPlay)}`);
      let window = await driver!.findWindow({bundleName:'com.uitestScene.acts',focused:true,active:true,title:'',displayId: disPlay.id.toInt()});
      expect(window != null).assertTrue();
      if (window != null) {
        let bounds: Rect = await window.getBounds();
        await driver!.delayMs(waitUiReadyMs);
        console.log(`${TestTag}, testWindowAttrWithId bounds is: ${JSON.stringify(bounds)}`);
        expect(bounds.displayId == disPlay.id).assertTrue();
      }
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name testScreenCapId_static
     * @tc.desc capture the specified area of current screen.
     * @tc.number UitestTest_Api20_017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScreenCapId_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testScreenCapId_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs)
      let disPlay = display.getDefaultDisplaySync();
      let savePath = '/data/storage/el2/base/cache/testScreenCapId_static.png';
      let success = await driver!.screenCap(savePath, disPlay.id.toInt());
      console.log(`${TestTag}, testScreenCapId_static success: ${JSON.stringify(success)}`);
      expect(success).assertTrue();
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testScreenCapId_static end`);
    })
  })
}