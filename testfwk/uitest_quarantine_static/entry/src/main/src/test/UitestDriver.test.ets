/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Component, Driver, ON, On, MatchPattern, MouseButton, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation } from '@ohos.UiTest'
import  hilog  from '@ohos.hilog'
import { Utils, startAbility, stopApplication } from './Util.test';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const waitUiReadyMs: int = 1000;
const DeviceErrorCode: string = "17000005";

async function exitInputMethod() {
  let driver = Driver.create()
  let softKeyBoard = await driver.findComponent(ON.type('Canvas'))
  if (softKeyBoard != null) {
    await driver.pressBack()
  }
}

function sleep(numberMillis: int) {
  const exitTime = new Date().getTime() + numberMillis;
  while (new Date().getTime() < exitTime) { }
  return
}

export default function uitestDriverTest() {
  describe('uitestDriverTest', (): void => {
    beforeAll(async () : Promise<void> => {
      hilog.info(domain, tag, "uitestDriverTest loadup start!!!!!")
      await Utils.msSleep(2000)
      hilog.info(domain, tag, "uitestDriverTest loadup over!!!!!")
    })
    beforeEach(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0001
     * @tc.name: testMouseDrag_static
     * @tc.desc: drag on the screen between the specified points by mouse.
     */
    it('testMouseDrag_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testMouseDrag_static start !!!!");
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(1000);
      try {
        let button = await driver.findComponent(ON.id('jump'));
        hilog.info(domain, tag, `testMouseDrag_static button,${JSON.stringify(button)}`);
        expect(button != null).assertTrue();
        if (button != null) {
          await button.longClick();
        }
        await driver.delayMs(1000);
        let text1 = await driver.findComponent(ON.text('one'));
        hilog.info(domain, tag, `testMouseDrag_static text1,${JSON.stringify(text1)}`);
        let text2 = await driver.findComponent(ON.text('two'));
        hilog.info(domain, tag, `testMouseDrag_static text2,${JSON.stringify(text2)}`);
        expect(text1 != null).assertTrue();
        expect(text2 != null).assertTrue();
        if (text1 != null && text2 != null) {
          let center1 = await text1.getBoundsCenter();
          hilog.info(domain, tag, `testMouseDrag_static center1,${JSON.stringify(center1)}`);
          let center2 = await text2.getBoundsCenter();
          hilog.info(domain, tag, `testMouseDrag_static center2,${JSON.stringify(center2)}`);
          await driver.mouseDrag(center1, center2, 600);
          await driver.delayMs(1000);
          let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
          expect(text == null).assertTrue();
          await driver.mouseDrag(center1, center2);
        }
      } catch(error) {
        hilog.info(domain, tag, `testMouseDrag_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testMouseDrag_static over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0002
     * @tc.name: testFling_static
     * @tc.desc: inject fling on the device display.
     */
    it('testFling_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);

      let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'})

      await driver.fling(UiDirection.DOWN, 39000)
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponents(ON.text('next page'))
      expect (button == null).assertTrue();
      await driver.fling(UiDirection.LEFT, 39000)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponents(ON.text('1'))
      expect (text == null).assertTrue();
      await driver.fling(UiDirection.RIGHT, 39000)
      await driver.delayMs(waitUiReadyMs)
      let text2 = await driver.findComponents(ON.text('1'))
      expect (text2 == null).assertTrue();
      await driver.fling(UiDirection.UP, 39000)
      await driver.delayMs(2000)
      let button2 = await driver.findComponents(ON.text('bottom'))
      expect (button2 == null).assertTrue();
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0048
     * @tc.name: testTriggerCombineKeys_static
     * @tc.desc: press the specified key.
     */
    it('testTriggerCombineKeys_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testTriggerCombineKeys_static start !!!!")
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let text = await driver.findComponent(ON.type('TextInput'));
        if (text == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            text = await scroll.scrollSearch(ON.type('TextInput'))
          }
        }
        hilog.info(domain, tag, `testTriggerCombineKeys_static text, ${ JSON.stringify(text) }`);
        expect(text != null).assertTrue();
        if (text != null) {
          await text.clearText();
          await driver.delayMs(1000);
          await text.inputText('123');
          let boundsCenter = await text.getBoundsCenter();
          hilog.info(domain, tag, `testTriggerCombineKeys_static boundsCenter, ${ JSON.stringify(boundsCenter) }`);
          // 点击输入框中心 360 702
          await driver.click(boundsCenter.x, boundsCenter.y);
        }
        await driver.delayMs(1000);
        await driver.triggerCombineKeys(2072, 2017);
        await driver.delayMs(1000);
        await driver.triggerCombineKeys(2072, 2019, 0);
        let text2 = await driver.findComponent(ON.type('TextInput'));
        hilog.info(domain, tag, `testTriggerCombineKeys_static text2, ${ JSON.stringify(text2) }`);
        expect(text2 != null).assertTrue();
        if (text2 != null) {
          await text2.clearText();
        }
        await driver.delayMs(1000);
        await driver.triggerCombineKeys(2072, 2038);
        await driver.delayMs(1000);
        let text3 = await driver.findComponent(ON.type('TextInput'));
        hilog.info(domain, tag, `testTriggerCombineKeys_static text3, ${ JSON.stringify(text3) }`);
        expect(text3 != null).assertTrue();
        if (text3 != null) {
          let text3Msg = await text3.getText();
          hilog.info(domain, tag, `testTriggerCombineKeys_static text3Msg, ${ JSON.stringify(text3Msg) }`);
          expect(text3Msg == '123').assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testTriggerCombineKeys_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testTriggerCombineKeys_static over!!!!");
      await stopApplication('com.uitestScene.acts');
    })


    /*
     * @tc.number: uiTest_9049
     * @tc.name: testDisplayRotation_static
     * @tc.desc: get the rotation of the device display and set it.
     */
    it('testDisplayRotation_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs)
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0)
      await driver.delayMs(waitUiReadyMs)
      let rotation = await driver.getDisplayRotation()
      expect(rotation instanceof DisplayRotation).assertTrue();		  
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
     * @tc.number: uitestDriverTest_0053
     * @tc.name: testSetDisplayRotationEnabled_static
     * @tc.desc: setDisplayRotationEnabled test.
     */
    it('testSetDisplayRotationEnabled_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testSetDisplayRotationEnabled_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      try {
        let driver = Driver.create();
        await driver.delayMs(1000);
        await driver.setDisplayRotationEnabled(true);
        await driver.delayMs(1000);
        await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
        await driver.delayMs(1000);
        let rotation = await driver.getDisplayRotation();
        hilog.info(domain, tag, `testSetDisplayRotationEnabled_static getDisplayRotation,${JSON.stringify(rotation)}`);
        await driver.delayMs(1000);
        if (rotation == DisplayRotation.ROTATION_90) {
          await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
          hilog.info(domain, tag, `testSetDisplayRotationEnabled_static setDisplayRotation success`);
        } else {
          hilog.info(domain, tag, `testSetDisplayRotationEnabled_static The device is displayed in vertical on default`);
        }
      } catch(error) {
        hilog.info(domain, tag, `testSetDisplayRotationEnabled_static error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testSetDisplayRotationEnabled_static end`);
    })

    /*
    * @tc.number: uitestDriverTest_0004
    * @tc.name: testPressHome_static
    * @tc.desc: Press the BACK key.
    */
    it('testPressHome_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testPressHome_static Start!!!");
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        await driver.pressHome();
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('next page'))
        expect(button == null).assertTrue();
      }catch(error) {
        hilog.info(domain, tag, `testPressHome_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }

      hilog.info(domain, tag, "testPressHome_static over!!!!!!!!!!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0034
     * @tc.name: testDrag_static
     * @tc.desc: drag on the screen between the specified points.
     */
    it('testDrag_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.id('jump'))
      expect(button != null).assertTrue();
      if (button != null) {
        await button.longClick();
        await driver.delayMs(waitUiReadyMs);
      }
      let text1 = await driver.findComponent(ON.text('one'))
      let text2 = await driver.findComponent(ON.text('two'))
      expect(text1 != null).assertTrue();
      expect(text2 != null).assertTrue();
      if (text1 != null && text2 != null) {
        let point1 = await text1.getBoundsCenter()
        let point2 = await text2.getBoundsCenter()
        await driver.drag(point1.x, point1.y, point2.x, point2.y)
        await driver.delayMs(waitUiReadyMs)
      }
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text == null).assertTrue();
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0036
     * @tc.name: testDrag_speed_static
     * @tc.desc: drag on the screen between the specified points.
     */
    it('testDrag_speed_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.id('jump'))
      expect(button != null).assertTrue();
      if (button != null) {
        await button.longClick();
        await driver.delayMs(waitUiReadyMs);
      }
      let text1 = await driver.findComponent(ON.text('one'))
      let text2 = await driver.findComponent(ON.text('two'))
      expect(text1 != null).assertTrue();
      expect(text2 != null).assertTrue();
      if (text1 != null && text2 != null) {
        let point1 = await text1.getBoundsCenter()
        let point2 = await text2.getBoundsCenter()
        await driver.drag(point1.x, point1.y, point2.x, point2.y, 1500)
        await driver.delayMs(waitUiReadyMs)
      }
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text == null).assertTrue();
      await stopApplication('com.uitestScene.acts');
    })
  })
}