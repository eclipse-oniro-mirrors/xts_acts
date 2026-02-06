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
    * @tc.name: testWakeUpDisplay_static
    * @tc.desc: wake up the device display.
    */
    it('testWakeUpDisplay_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWakeUpDisplay_static Start`);
      try {
       let driver = Driver.create();
       await driver.wakeUpDisplay();
      } catch (error : Error) {
        hilog.info(domain, tag, `testWakeUpDisplay_static error: ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testWakeUpDisplay_static end`);
    })

    /*
    * @tc.number: uitestDriverTest_0002
    * @tc.name: testWaitForComponent_static
    * @tc.desc: Find the first matched UiComponent on current UI during the time given.
    */
    it('testWaitForComponent_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testWaitForComponent_static Start!!!");
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(1000);
      let button = await driver.waitForComponent(ON.text('next page'), 1000);
      hilog.info(domain, tag, `testWaitForComponent_static button: ${ JSON.stringify(button) }`);
      expect(button != null).assertTrue()
      if (button != null) {
        let msg = await button.getText();
        hilog.info(domain, tag, `testWaitForComponent_static msg: ${ JSON.stringify(msg) }`);
        expect(msg).assertEqual('next page');
      }
      hilog.info(domain, tag, "testWaitForComponent_static over!!!!!!!!!!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
    * @tc.number: uitestDriverTest_0003
    * @tc.name: testPressBack_static
    * @tc.desc: Press the BACK key.
    */
    it('testPressBack_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testPressBack_static Start!!!");
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.text('next page'));
      if (button != null) {
        await button.click();
      }
      await driver.delayMs(waitUiReadyMs);
      await driver.pressBack();
      await driver.delayMs(waitUiReadyMs);
      let button_ori = await driver.findComponent(ON.text('next page'));
      expect(button_ori != null).assertTrue();
      if (button_ori != null) {
        let btnMsg = await button_ori.getText();
        expect(btnMsg == 'next page').assertTrue();
      }

      hilog.info(domain, tag, "testPressBack_static over!!!!!!!!!!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
    * @tc.number: uitestDriverTest_0005
    * @tc.name: testFindComponent_static
    * @tc.desc: findComponent test.
    */
    it('testFindComponent_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testFindComponent_static Start!!!");
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('next page'));
        hilog.info(domain, tag, `testFindComponent_static button, ${ JSON.stringify(button) }`);
        expect(button != null).assertTrue();
        if (button != null) {
          let msg = await button.getText();
          hilog.info(domain, tag, `testFindComponent_static msg, ${ JSON.stringify(msg) }`);
          expect(msg == 'next page').assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testFindComponent_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testFindComponent_static over!!!!!!!!!!!!!");
      await stopApplication('com.uitestScene.acts')
    })

    /*
    * @tc.number: uitestDriverTest_0006
    * @tc.name: testFindComponents_static
    * @tc.desc: find all the matched UiComponents on current UI.
    */
    it('testFindComponents_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testFindComponents_static Start!!!");
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let buttons:Array<Component>|null = await driver.findComponents(ON.type('Button'));
      hilog.info(domain, tag, `testFindComponents_static buttons , ${ JSON.stringify(buttons)  }`);
      expect(buttons != null).assertTrue();
      if (buttons != null) {
        let btn = buttons[0] as Component;
        let msg = await btn.getText();
        expect(msg != null).assertTrue();
      }
      hilog.info(domain, tag, "testFindComponents_static over!!!!!!!!!!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
    * @tc.number: uitestDriverTest_0007
    * @tc.name: test_penLongClick_function_static
    * @tc.desc: penLongClick function test.
    */
    it('test_penLongClick_function_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "test_penLongClick_function_static start!!!!");
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      // 点击页面中的next page 按钮。
      try {
        let button = await driver.findComponent(ON.text('next page'));
        hilog.info(domain, tag, `test_penLongClick_function_static button, ${  JSON.stringify(button) }`);
        expect(button != null).assertTrue();
        if (button != null) {
          let btnPoint = await button.getBoundsCenter();
          hilog.info(domain, tag, `test_penLongClick_function_static btnPoint, ${  JSON.stringify(btnPoint) }`);
          await driver.penLongClick(btnPoint, 0.5);
          await driver.delayMs(waitUiReadyMs);
          let newButton = await driver.findComponent(ON.text('longClick'));
          expect(newButton != null).assertTrue();
          if (newButton != null) {
            let text = await newButton.getText();
            expect(text == 'longClick').assertTrue();
            await newButton.click();
            await driver.delayMs(waitUiReadyMs);
          }
        }
        let button1 = await driver.findComponent(ON.text('next page'));
        hilog.info(domain, tag, `test_penLongClick_function_static button1, ${  JSON.stringify(button1) }`);
        expect(button1 != null).assertTrue();
        if (button1 != null) {
          let btnPoint1 = await button1.getBoundsCenter();
          hilog.info(domain, tag, `test_penLongClick_function_static btnPoint1, ${  JSON.stringify(btnPoint1) }`);
          await driver.penLongClick(btnPoint1);
          await driver.delayMs(waitUiReadyMs);
          let newButton1 = await driver.findComponent(ON.text('longClick'));
          expect(newButton1 != null).assertTrue();
          if (newButton1 != null) {
            let text1 = await newButton1.getText();
            expect(text1 == 'longClick').assertTrue();
            await newButton1.click();
            await driver.delayMs(waitUiReadyMs);
          }
        }
      } catch(error) {
        hilog.info(domain, tag, `test_penLongClick_function_static error, ${ JSON.stringify(error)} `);
        expect().assertFail();
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      hilog.info(domain, tag, "test_penLongClick_function_static end!!!!");
    })

    /*
    * @tc.number: uitestDriverTest_0008
    * @tc.name: test_penDoubleClick_function_static
    * @tc.desc: penDoubleClick function test.
    */
    it('test_penDoubleClick_function_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_penDoubleClick_function_static start`);
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      // 点击页面中的next page 按钮。
      try {
        let btnCom = await driver.findComponent(ON.text('Click twice'));
        await driver.delayMs(1000);
        expect(btnCom != null).assertTrue();
        if (btnCom != null) {
          let btnPoint = await btnCom.getBoundsCenter();
          hilog.info(domain, tag, `test_penDoubleClick_function_static btnPoint, ${ JSON.stringify(btnPoint)}`);
          await driver.penDoubleClick(btnPoint);
        }
        await driver.delayMs(1000);
        let newButton = await driver.findComponent(ON.text('doubleClick'));
        expect(newButton != null).assertTrue();
        if (newButton != null) {
          hilog.info(domain, tag, `test_penDoubleClick_function_static newButton, ${ JSON.stringify(newButton)}`);
          let text = await newButton.getText();
          hilog.info(domain, tag, `test_penDoubleClick_function_static text, ${ JSON.stringify(text)}`);
          expect(text == 'doubleClick').assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `test_penDoubleClick_function_static error, ${ JSON.stringify(error)} }`);
        expect().assertFail();
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      hilog.info(domain, tag, "test_penDoubleClick_function_static over!!!!")
    })

    /*
    * @tc.number: uitestDriverTest_0009
    * @tc.name: test_penClick_function_static
    * @tc.desc: penClick function test.
    */
    it('test_penClick_function_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "test_penClick_function_static start!!!!")
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      // 点击页面中的next page 按钮。
      try {
        let btnCom = await driver.findComponent(ON.text('next page'));
        await driver.delayMs(waitUiReadyMs);
        expect(btnCom != null).assertTrue();
        if (btnCom != null) {
          let btnPoint = await btnCom.getBoundsCenter();
          await driver.penClick(btnPoint);
          await driver.delayMs(waitUiReadyMs);
        }
        let strCom = await driver.findComponent(ON.text('back to index'));
        await driver.delayMs(waitUiReadyMs);
        expect(strCom != null).assertTrue();
        if (strCom != null) {
          let strText = await strCom.getText();
          await driver.delayMs(waitUiReadyMs);
          expect(strText).assertEqual('back to index');
          await strCom.click();
          await driver.delayMs(waitUiReadyMs);
        }
      } catch(error: Error) {
        hilog.info(domain, tag, `test_penClick_function_static error, ${ JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      hilog.info(domain, tag, "testPenClick over!!!!")
    })

    /*
    * @tc.number: uitestDriverTest_0071
    * @tc.name: testMouseScroll_default_static
    * @tc.desc: scroll the mouse wheel at the specified location to specify the cell.
    */
    it('testMouseScroll_default_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      try {
        let scrollBar = await driver.findComponent(ON.type('Scroll'))
        hilog.info(domain, tag, `testMouseScroll_default_static scrollBar, ${  JSON.stringify(scrollBar) }`);
        expect(scrollBar != null).assertTrue();
        if (scrollBar != null) {
          let center = await scrollBar.getBoundsCenter();
          hilog.info(domain, tag, `testMouseScroll_default_static center, ${  JSON.stringify(center) }`);
          await driver.mouseScroll(center,true,30);
          await driver.delayMs(1000);
        }
        let button1 = await driver.findComponent(ON.text('next page'));
        hilog.info(domain, tag, `testMouseScroll_default_static button1 , ${  JSON.stringify(button1) }`);
        expect(button1 == null).assertTrue();
      } catch(error) {
        hilog.info(domain, tag, `testMouseScroll_default_static error, ${ JSON.stringify(error)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testMouseScroll_default_static over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
    * @tc.number: uitestDriverTest_0010
    * @tc.name: testMouseScroll_key_static
    * @tc.desc: scroll the mouse wheel at the specified location to specify the cell.
    */
    it('testMouseScroll_key_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      try {
        let btn = await driver.findComponent(ON.id('jump'));
        if (btn == null) {
          let scrollBar = await driver.findComponent(ON.type('Scroll'))
          if (scrollBar != null) {
            btn = await scrollBar.scrollSearch(ON.id('jump'))
          }
        }
        hilog.info(domain, tag, `testMouseScroll_key_static btn, ${  JSON.stringify(btn) }`);
        expect(btn != null).assertTrue();
        if (btn != null) {
          await btn.click();
        }
        await driver.delayMs(1000);
        let img1 = await driver.findComponent(ON.type('Image').inWindow('com.uitestScene.acts'));
        hilog.info(domain, tag, `testMouseScroll_key_static img1, ${  JSON.stringify(img1) }`);
        expect(img1 != null).assertTrue();
        if (img1 != null) {
          let bounds1 = await img1.getBounds();
          hilog.info(domain, tag, `testMouseScroll_key_static bounds1, ${  JSON.stringify(bounds1) }`);
          let center1 = await img1.getBoundsCenter();
          hilog.info(domain, tag, `testMouseScroll_key_static center1, ${  JSON.stringify(center1) }`);
          await driver.click(center1.x, center1.y);
          await driver.delayMs(1000);
          await driver.mouseScroll(center1,false,5,2072);
          hilog.info(domain, tag, `testMouseScroll_key_static mouseScroll`);
          await driver.delayMs(1000);
          let img2 = await driver.findComponent(ON.type('Image').inWindow('com.uitestScene.acts'));
          hilog.info(domain, tag, `testMouseScroll_static img2, ${  JSON.stringify(img2) }`);
          expect(img2 != null).assertTrue();
          if (img2 != null) {
            let bounds2 = await img2.getBounds();
            hilog.info(domain, tag, `testMouseScroll_key_static bounds2, ${  JSON.stringify(bounds2) }`);
            expect(bounds1 != bounds2).assertTrue()
          }
        }
      } catch(error) {
        hilog.info(domain, tag, `testMouseScroll_key_static error, ${ JSON.stringify(error)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testMouseScroll_key_static over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
    * @tc.number: uitestDriverTest_0073
    * @tc.name: testMouseScroll_key2_static
    * @tc.desc: scroll the mouse wheel at the specified location to specify the cell.
    */
    it('testMouseScroll_key2_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      try {
        let btn = await driver.findComponent(ON.id('jump'));
        if (btn == null) {
          let scrollBar = await driver.findComponent(ON.type('Scroll'))
          if (scrollBar != null) {
            btn = await scrollBar.scrollSearch(ON.id('jump'))
          }
        }
        hilog.info(domain, tag, `testMouseScroll_key2_static btn, ${  JSON.stringify(btn) }`);
        expect(btn != null).assertTrue();
        if (btn != null) {
          await btn.click();
        }
        await driver.delayMs(1000);
        let img1 = await driver.findComponent(ON.type('Image').inWindow('com.uitestScene.acts'));
        hilog.info(domain, tag, `testMouseScroll_key2_static img1, ${  JSON.stringify(img1) }`);
        expect(img1 != null).assertTrue();
        if (img1 != null) {
          let bounds1 = await img1.getBounds();
          hilog.info(domain, tag, `testMouseScroll_key2_static bounds1, ${  JSON.stringify(bounds1) }`);
          let center1 = await img1.getBoundsCenter();
          hilog.info(domain, tag, `testMouseScroll_key2_static center1, ${  JSON.stringify(center1) }`);
          await driver.click(center1.x, center1.y);
          await driver.delayMs(1000);
          await driver.mouseScroll(center1,false,5,2072, 0);
          hilog.info(domain, tag, `testMouseScroll_key2_static mouseScroll`);
          await driver.delayMs(1000);
          let img2 = await driver.findComponent(ON.type('Image').inWindow('com.uitestScene.acts'));
          hilog.info(domain, tag, `testMouseScroll_key2_static img2, ${  JSON.stringify(img2) }`);
          expect(img2 != null).assertTrue();
          if (img2 != null) {
            let bounds2 = await img2.getBounds();
            hilog.info(domain, tag, `testMouseScroll_key2_static bounds2, ${  JSON.stringify(bounds2) }`);
            expect(bounds1 != bounds2).assertTrue()
          }
        }
      } catch(error) {
        hilog.info(domain, tag, `testMouseScroll_key2_static error, ${ JSON.stringify(error)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testMouseScroll_key2_static over!!!!");
      await stopApplication('com.uitestScene.acts');
    })


    /*
    * @tc.number: uitestDriverTest_0075
    * @tc.name: testMouseScroll_speed_static
    * @tc.desc: scroll the mouse wheel at the specified location to specify the cell.
    */
    it('testMouseScroll_speed_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      try {
        let btn = await driver.findComponent(ON.id('jump'));
        if (btn == null) {
          let scrollBar = await driver.findComponent(ON.type('Scroll'))
          if (scrollBar != null) {
            btn = await scrollBar.scrollSearch(ON.id('jump'))
          }
        }
        hilog.info(domain, tag, `testMouseScroll_speed_static btn, ${  JSON.stringify(btn) }`);
        expect(btn != null).assertTrue();
        if (btn != null) {
          await btn.click();
        }
        await driver.delayMs(1000);
        let img1 = await driver.findComponent(ON.type('Image').inWindow('com.uitestScene.acts'));
        hilog.info(domain, tag, `testMouseScroll_speed_static img1, ${  JSON.stringify(img1) }`);
        expect(img1 != null).assertTrue();
        if (img1 != null) {
          let bounds1 = await img1.getBounds();
          hilog.info(domain, tag, `testMouseScroll_speed_static bounds1, ${  JSON.stringify(bounds1) }`);
          let center1 = await img1.getBoundsCenter();
          hilog.info(domain, tag, `testMouseScroll_speed_static center1, ${  JSON.stringify(center1) }`);
          await driver.click(center1.x, center1.y);
          await driver.delayMs(1000);
          await driver.mouseScroll(center1,false,5,2072, 0, 30);
          hilog.info(domain, tag, `testMouseScroll_speed_static mouseScroll`);
          await driver.delayMs(1000);
          let img2 = await driver.findComponent(ON.type('Image').inWindow('com.uitestScene.acts'));
          hilog.info(domain, tag, `testMouseScroll_speed_static img2, ${  JSON.stringify(img2) }`);
          expect(img2 != null).assertTrue();
          if (img2 != null) {
            let bounds2 = await img2.getBounds();
            hilog.info(domain, tag, `testMouseScroll_speed_static bounds2, ${  JSON.stringify(bounds2) }`);
            expect(bounds1 != bounds2).assertTrue()
          }
        }
      } catch(error) {
        hilog.info(domain, tag, `testMouseScroll_speed_static error, ${ JSON.stringify(error)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testMouseScroll_speed_static over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
    * @tc.number: uitestDriverTest_0011
    * @tc.name: testDriverClick_static
    * @tc.desc: click in the specified location on the screen.
    */
    it('testDriverClick_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testDriverClick_static start!!!!")
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs)
      let Button = await driver.findComponent(ON.text('next page'))
      expect(Button != null).assertTrue();
      if (Button != null) {
        let center = await Button.getBoundsCenter()
        await driver.click(center.x, center.y)
        await driver.delayMs(waitUiReadyMs)
      }
      let newButton = await driver.findComponent(ON.text('back to index'))
      expect(newButton != null).assertTrue();
      if (newButton != null) {
        let text = await newButton.getText()
        expect(text == 'back to index').assertTrue()
        await newButton.click()
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, "testDriverClick_static end!!!!")
    })

    /*
    * @tc.number: uitestDriverTest_0012
    * @tc.name: testUiDriverDoubleClick_static
    * @tc.desc: doubleClick in the specified location on the screen.
    */
    it('testUiDriverDoubleClick_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      const driver = Driver.create();
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('Click twice'))
      if (button == null) {
        let scorll = await driver.findComponent(ON.type('Scroll'))
        if (scorll != null) {
          button = await scorll.scrollSearch(ON.text('Click twice'))
        }
      }
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter()
        await driver.doubleClick(center.x, center.y)
        await driver.delayMs(waitUiReadyMs)
      }

      let button1 = await driver.findComponent(ON.text('doubleClick'))
      expect(button1 != null).assertTrue();
      if (button1 != null) {
        let text = await button1.getText()
        expect(text == 'doubleClick').assertTrue()
        await button1.click()
      }
      await stopApplication('com.uitestScene.acts')
    })

    /*
    * @tc.number: uitestDriverTest_0013
    * @tc.name: testUiDriverLongClick_static
    * @tc.desc: longClick in the specified location on the screen.
    */
    it('testUiDriverLongClick_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.text('next page'));
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter();
        await driver.longClick(center.x, center.y)
        await driver.delayMs(waitUiReadyMs);
        let newButton = await driver.findComponent(ON.text('longClick'));
        expect(newButton != null).assertTrue();
        if (newButton != null) {
          let text = await newButton.getText();
          expect(text == 'longClick').assertTrue();
          await newButton.click();
        }
      }
      hilog.info(domain, tag, "testUiDriverLongClick_static over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
    * @tc.number: uitestDriverTest_0014
    * @tc.name: testMouseClick_RIGHT
    * @tc.desc: longClick in the specified location on the screen.
    */
    it('testMouseClick_RIGHT',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (): Promise<void> => {
      hilog.info(domain, tag, `testMouseClick_RIGHT start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs);

      // 点击页面中的jump 按钮。
      try {
        let button = await driver.findComponent(ON.id('jump'));
        if (button == null) {
          let scrollBar = await driver.findComponent(ON.type('Scroll'))
          if (scrollBar != null) {
            button = await scrollBar.scrollSearch(ON.id('jump'))
          }
        }
        hilog.info(domain, tag, `testMouseClick_RIGHT button, ${ JSON.stringify(button)}`);
        expect(button != null).assertTrue();
        if (button != null) {
          let center = await button.getBoundsCenter();
          await driver.mouseClick({x:center.x, y:center.y}, MouseButton.MOUSE_BUTTON_RIGHT);
          await driver.delayMs(waitUiReadyMs);
        }
        await driver.delayMs(waitUiReadyMs);
        let button1 = await driver.findComponent(ON.text('right'));
        hilog.info(domain, tag, `testMouseClick_RIGHT button1, ${ JSON.stringify(button1)}`);
        expect(button1 != null).assertTrue();
      } catch(error) {
        hilog.info(domain, tag, `testMouseClick_RIGHT error, ${ JSON.stringify(error)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testMouseClick_RIGHT over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
    * @tc.number: uitestDriverTest_0015
    * @tc.name: testMouseClick_MIDDLE
    * @tc.desc: mouseClick test.
    */
    it('testMouseClick_MIDDLE',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      // 点击页面中的jump 按钮。
      try {
        let button = await driver.findComponent(ON.id('jump'));
        hilog.info(domain, tag, `testMouseClick_MIDDLE button, ${ JSON.stringify(button)}`);
        expect(button != null).assertTrue();
        if (button != null) {
          let center = await button.getBoundsCenter();
          await driver.mouseClick({x:center.x, y:center.y}, MouseButton.MOUSE_BUTTON_MIDDLE,2072,2045);
          await driver.delayMs(waitUiReadyMs);
          let button2 = await driver.findComponent(ON.text('middle'));
          hilog.info(domain, tag, `testMouseClick_MIDDLE button2, ${ JSON.stringify(button2)}`);
          expect(button2 != null).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testMouseClick_MIDDLE mouseClick error, ${ JSON.stringify(error)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testMouseClick_MIDDLE over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
    * @tc.number: uitestDriverTest_0016
    * @tc.name: testMouseClick_LEFT
    * @tc.desc: mouseClick test.
    */
    it('testMouseClick_LEFT',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testMouseClick_LEFT start!!!!");
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      // 点击页面中的jump 按钮。
      try {
        let button = await driver.findComponent(ON.id('jump'));
        hilog.info(domain, tag, `testMouseClick_LEFT button, ${ JSON.stringify(button)}`);
        expect(button != null).assertTrue();
        if (button != null) {
          let center = await button.getBoundsCenter();
          await driver.mouseClick({x:center.x, y:center.y}, MouseButton.MOUSE_BUTTON_LEFT, 2072);
          await driver.delayMs(waitUiReadyMs * 3);
          let Button3 = await driver.findComponent(ON.id('jump'));
          hilog.info(domain, tag, `testMouseClick_LEFT Button3, ${ JSON.stringify(Button3)}`);
          expect(Button3 == null).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testMouseClick_LEFT error, ${ JSON.stringify(error)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testMouseClick_LEFT over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0017
     * @tc.name: testMouseDoubleClick_static
     * @tc.desc: doubleClick in the specified location on the screen by mouse.
     */
    it('testMouseDoubleClick_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let Button = await driver.findComponent(ON.text('Click twice'));
      if (Button == null) {
        let scrollBar = await driver.findComponent(ON.type('Scroll'))
        if (scrollBar != null) {
          Button = await scrollBar.scrollSearch(ON.text('Click twice'))
        }
      }
      expect(Button != null).assertTrue();
      if (Button != null) {
        let center = await Button.getBoundsCenter();
        await driver.mouseDoubleClick(center, MouseButton.MOUSE_BUTTON_LEFT,0 , 0);
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('doubleClick'));
        expect(button != null).assertTrue();
        if (button != null) {
          let text = await button.getText();
          expect(text == 'doubleClick').assertTrue();
        }
      }
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0018
     * @tc.name: testMouseDoubleClick_1_static
     * @tc.desc: doubleClick in the specified location on the screen by mouse.
     */
    it('testMouseDoubleClick_1_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let Button = await driver.findComponent(ON.text('Click twice'));
      if (Button == null) {
        let scrollBar = await driver.findComponent(ON.type('Scroll'))
        if (scrollBar != null) {
          Button = await scrollBar.scrollSearch(ON.text('Click twice'))
        }
      }
      expect(Button != null).assertTrue();
      if (Button != null) {
        let center = await Button.getBoundsCenter();
        await driver.mouseDoubleClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0);
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('doubleClick'));
        expect(button != null).assertTrue();
        if (button != null) {
          let text = await button.getText();
          expect(text == 'doubleClick').assertTrue();
        }
      }
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0019
     * @tc.name: testMouseDoubleClick_2_static
     * @tc.desc: doubleClick in the specified location on the screen by mouse.
     */
    it('testMouseDoubleClick_2_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let Button = await driver.findComponent(ON.text('Click twice'));
      if (Button == null) {
        let scrollBar = await driver.findComponent(ON.type('Scroll'))
        if (scrollBar != null) {
          Button = await scrollBar.scrollSearch(ON.text('Click twice'))
        }
      }
      expect(Button != null).assertTrue();
      if (Button != null) {
        let center = await Button.getBoundsCenter();
        await driver.mouseDoubleClick(center, MouseButton.MOUSE_BUTTON_LEFT);
        await driver.delayMs(waitUiReadyMs)
        let button = await driver.findComponent(ON.text('doubleClick'));
        expect(button != null).assertTrue();
        if (button != null) {
          let text = await button.getText();
          expect(text == 'doubleClick').assertTrue();
        }
      }
      await stopApplication('com.uitestScene.acts');
    })

    /*
    * @tc.number: uitestDriverTest_0020
    * @tc.name: testMouseLongClick_static
    * @tc.desc: longClick in the specified location on the screen by mouse.
    */
    it('testMouseLongClick_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let Button = await driver.findComponent(ON.text('next page'));
      expect(Button != null).assertTrue();
      if (Button != null) {
        let center = await Button.getBoundsCenter();
        await driver.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 0);
        await driver.delayMs(waitUiReadyMs);
        let newButton = await driver.findComponent(ON.text('longClick'));
        expect(newButton != null).assertTrue();
        if (newButton != null) {
          let text = await newButton.getText();
          expect(text == 'longClick').assertTrue();
        }
      }
      await stopApplication('com.uitestScene.acts');
    })

    /*
    * @tc.number: uitestDriverTest_0021
    * @tc.name: testMouseLongClick_1_static
    * @tc.desc: longClick in the specified location on the screen by mouse.
    */
    it('testMouseLongClick_1_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let Button = await driver.findComponent(ON.text('next page'));
      expect(Button != null).assertTrue();
      if (Button != null) {
        let center = await Button.getBoundsCenter();
        await driver.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0);
        await driver.delayMs(waitUiReadyMs);
      }
      let newButton = await driver.findComponent(ON.text('longClick'));
      expect(newButton != null).assertTrue();
      if (newButton != null) {
        let text = await newButton.getText();
        expect(text == 'longClick').assertTrue();
      }
      await stopApplication('com.uitestScene.acts');
    })

    /*
   * @tc.number: uitestDriverTest_0022
   * @tc.name: testMouseLongClick_2_static
   * @tc.desc: longClick in the specified location on the screen by mouse.
   */
    it('testMouseLongClick_2_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let Button = await driver.findComponent(ON.text('next page'));
      expect(Button != null).assertTrue();
      if (Button != null) {
        let center = await Button.getBoundsCenter();
        await driver.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT);
        await driver.delayMs(waitUiReadyMs);
      }
      let newButton = await driver.findComponent(ON.text('longClick'));
      expect(newButton != null).assertTrue();
      if (newButton != null) {
        let text = await newButton.getText();
        expect(text == 'longClick').assertTrue();
      }
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0026
     * @tc.name: testAssertComponentExist_static
     * @tc.desc: Assert whether the matched UiComponent exists on current UI.
     */
    it('testAssertComponentExist_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      try {
        let driver = Driver.create();
        await driver.delayMs(waitUiReadyMs)
        await driver.assertComponentExist(ON.text('next page'))
      } catch(error) {
        hilog.info(domain, tag, `testAssertComponentExist_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts')
    })

    /*
     * @tc.number: uitestDriverTest_0027
     * @tc.name: testGetDisplayRotation
     * @tc.desc: getDisplayRotation test.
     */
    it('testGetDisplayRotation',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      try {
        let rotation = await driver.getDisplayRotation();
        hilog.info(domain, tag, `testGetDisplayRotation success, ${JSON.stringify(rotation)}`);
        expect(rotation != null).assertTrue();
      }catch( error) {
        hilog.info(domain, tag, `testGetDisplayRotation error is, ${ JSON.stringify(error)} `);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testGetDisplayRotation over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0028
     * @tc.name: testGetDisplayDensity_static
     * @tc.desc: get the density of the device display.
     */
    it('testGetDisplayDensity_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testGetDisplayDensity_static start !!!!");
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      try {
        let density = await driver.getDisplayDensity();
        hilog.info(domain, tag, `testGetDisplayDensity getDisplayRotation success, ${JSON.stringify(density)}`);
        expect(density.x != 0).assertTrue()
        expect(density.y != 0).assertTrue()
      }catch( error) {
        hilog.info(domain, tag, `testGetDisplayDensity_static error is, ${ JSON.stringify(error)} `);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testGetDisplayDensity_static over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0029
     * @tc.name: testMonitor1_static
     * @tc.desc: monitor toast appearance.
     */
    it('testMonitor1_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let callback = (uiElementInfo : UIElementInfo): void => {
          try {
            hilog.info(domain, tag, `testMonitor1_static UIElementInfo, ${ JSON.stringify(uiElementInfo) }`);
            hilog.info(domain, tag, `testMonitor1_static UIElementInfo bundleName , ${ uiElementInfo.bundleName }`);
            hilog.info(domain, tag, `testMonitor1_static UIElementInfo bundleName length , ${ uiElementInfo.bundleName.length }`);
            expect(uiElementInfo.bundleName == "com.uitestScene.acts").assertTrue();
            hilog.info(domain, tag, `testMonitor1_static  text , ${ uiElementInfo.text }`);
            expect(uiElementInfo.text == 'toastShow').assertTrue();
            hilog.info(domain, tag, `testMonitor1_static  type , ${ uiElementInfo.type }`);
            expect(uiElementInfo.type == 'Toast').assertTrue();
          } catch (err) {
            hilog.info(domain, tag, `testMonitor1_static  error, ${ JSON.stringify(err) }`);
          }
        }
        let observer = driver.createUIEventObserver();
        hilog.info(domain, tag, `testMonitor1_static observer, ${JSON.stringify(observer)}`);
        observer.once('toastShow', callback);
        hilog.info(domain, tag, `testMonitor1_static once toastShow success`);
        // 点击toast按钮
        let btn = await driver.findComponent(ON.text('toast'));
        expect(btn != null).assertTrue();
        if (btn != null) {
          await btn.click()
        }
        await driver.delayMs(3000);
      } catch(error) {
        hilog.info(domain, tag, `testMonitor1_static error, ${ JSON.stringify(error) }`);
        expect().assertFail()
      }
      hilog.info(domain, tag, "testMonitor1_static over!!!!")
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0030
     * @tc.name: testMonitor2_static
     * @tc.desc: monitor toast appearance.
     */
    it('testMonitor2_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let callback = (uiElementInfo : UIElementInfo): void => {
          try {
            hilog.info(domain, tag, `testMonitor2_static UIElementInfo, ${ JSON.stringify(uiElementInfo) }`);
            hilog.info(domain, tag, `testMonitor2_static bundleName , ${ uiElementInfo.bundleName }`);
            expect(uiElementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
            hilog.info(domain, tag, `testMonitor2_static text , ${ uiElementInfo.text }`);
            expect(uiElementInfo.type == 'AlertDialog').assertTrue()
            hilog.info(domain, tag, `testMonitor2_static UIElementInfo type , ${ uiElementInfo.type }`);
            expect(uiElementInfo.text == 'dialogShow').assertTrue()
          } catch (err) {
            hilog.info(domain, tag, `testMonitor2_static callback error, ${ JSON.stringify(err) }`);
          }
        }
        let observer = driver.createUIEventObserver();
        hilog.info(domain, tag, `testMonitor2_static observer, ${JSON.stringify(observer)}`);
        observer.once('dialogShow', callback);
        hilog.info(domain, tag, `testMonitor2_static dialogShow success`);
        // 点击toast按钮
        let btn = await driver.findComponent(ON.text('dialog'));
        expect(btn != null).assertTrue();
        if (btn != null) {
          await btn.click()
        }
        await driver.delayMs(3000);
        hilog.info(domain, tag, `testMonitor2_static click success`);
      } catch(error) {
        hilog.info(domain, tag, `testMonitor2_static error, ${ JSON.stringify(error) }`);
      }
      hilog.info(domain, tag, "testMonitor2_static over!!!!")
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0031
     * @tc.name: test_penSwipe_function_static
     * @tc.desc: penSwipe function test.
     */
    it('test_penSwipe_function_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "test_penSwipe_function_static start !!!!")
      try {
        let driver = Driver.create()
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver.delayMs(waitUiReadyMs)
        // 垂直滑动
        let scroll = await driver.findComponent(ON.type('Scroll'));
        expect(scroll != null).assertTrue();
        if (scroll != null) {
          let scrollRect = await scroll.getBounds()
          let screenWidth = scrollRect.right - scrollRect.left;
          let screenHeight = scrollRect.bottom - scrollRect.top;
          await driver.penSwipe({x: Math.floor(screenWidth / 2), y: Math.floor(screenHeight / 2 + screenHeight / 4)},
            {x: Math.floor(screenWidth / 2), y: Math.floor(screenHeight / 2 - screenHeight / 4) },600, 0.5);
          let text = await driver.findComponent(ON.text('toast'));
          await driver.delayMs(waitUiReadyMs);
          expect(text == null).assertTrue();
          await driver.delayMs(waitUiReadyMs);
          let pressureCom = await driver.findComponent(ON.id('pressure'));
          await driver.delayMs(waitUiReadyMs);
          expect(pressureCom != null).assertTrue();
          if (pressureCom != null) {
            let pressure = await pressureCom.getText();
            await driver.delayMs(waitUiReadyMs);
            expect(pressure).assertEqual('0.5');
          }
        }
      } catch(error) {
        hilog.info(domain, tag, `test_penSwipe_function_static error, ${ JSON.stringify(error) }`);
        expect().assertFail()
      }
      hilog.info(domain, tag, "test_penSwipe_function_static over!!!!")
      await stopApplication('com.uitestScene.acts')
    })

    /*
     * @tc.number: uitestDriverTest_0057
     * @tc.name: test_penSwipe_function_pressure_static
     * @tc.desc: penSwipe function test.
     */
    it('test_penSwipe_function_pressure_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "test_penSwipe_function_pressure_static start !!!!")
      try {
        let driver = Driver.create()
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver.delayMs(waitUiReadyMs)
        // 垂直滑动
        let scroll = await driver.findComponent(ON.type('Scroll'));
        expect(scroll != null).assertTrue();
        if (scroll != null) {
          let scrollRect = await scroll.getBounds()
          let screenWidth = scrollRect.right - scrollRect.left;
          let screenHeight = scrollRect.bottom - scrollRect.top;
          await driver.penSwipe({x: Math.floor(screenWidth / 2), y: Math.floor(screenHeight / 2 + screenHeight / 4)},
            {x: Math.floor(screenWidth / 2), y: Math.floor(screenHeight / 2 - screenHeight / 4) },600);
          let text = await driver.findComponent(ON.text('toast'));
          await driver.delayMs(waitUiReadyMs);
          expect(text == null).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `test_penSwipe_function_pressure_static error, ${ JSON.stringify(error) }`);
        expect().assertFail()
      }
      hilog.info(domain, tag, "test_penSwipe_function_pressure_static over!!!!")
      await stopApplication('com.uitestScene.acts')
    })

    /*
     * @tc.number: uitestDriverTest_0059
     * @tc.name: test_penSwipe_function_speed_static
     * @tc.desc: penSwipe function test.
     */
    it('test_penSwipe_function_speed_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "test_penSwipe_function_speed_static start !!!!")
      try {
        let driver = Driver.create()
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver.delayMs(waitUiReadyMs)
        // 垂直滑动
        let scroll = await driver.findComponent(ON.type('Scroll'));
        expect(scroll != null).assertTrue();
        if (scroll != null) {
          let scrollRect = await scroll.getBounds()
          let screenWidth = scrollRect.right - scrollRect.left;
          let screenHeight = scrollRect.bottom - scrollRect.top;
          await driver.penSwipe({x: Math.floor(screenWidth / 2), y: Math.floor(screenHeight / 2 + screenHeight / 4)},
            {x: Math.floor(screenWidth / 2), y: Math.floor(screenHeight / 2 - screenHeight / 4) });
          let text = await driver.findComponent(ON.text('toast'));
          await driver.delayMs(waitUiReadyMs);
          expect(text == null).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `test_penSwipe_function_speed_static error, ${ JSON.stringify(error) }`);
        expect().assertFail()
      }
      hilog.info(domain, tag, "test_penSwipe_function_speed_static over!!!!")
      await stopApplication('com.uitestScene.acts')
    })

    /*
     * @tc.number: uitestDriverTest_0032
     * @tc.name: testFling_static
     * @tc.desc: inject fling on the device display.
     */
    it('testFling_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testFling_static start !!!!");
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        // 垂直滑动
        let scroll = await driver.findComponent(ON.type('Scroll'));
        expect(scroll != null).assertTrue();
        if (scroll != null) {
          let rect = await scroll.getBounds()
          let center = await scroll.getBoundsCenter()
          await driver.fling({x: center.x, y:Math.floor(center.y + (rect.bottom - rect.top) / 4)},
            {x: center.x, y:Math.floor(center.y - (rect.bottom - rect.top) / 4)}, 20, 600)
          await driver.delayMs(waitUiReadyMs);
          let text = await driver.findComponent(ON.text('toast'));
          expect(text == null).assertTrue();
          hilog.info(domain, tag, `testFling_static fling success`);
        }
      } catch(error) {
        hilog.info(domain, tag, `testFling_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testFling_static over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0035
     * @tc.name: testScreenCap_static
     * @tc.desc: capture current screen.
     */
    it('testScreenCap_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testScreenCap_static start !!!!");
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        let driver = Driver.create()
        await driver.delayMs(1000);
        let savePath = '/data/storage/el2/base/cache/1.png';
        let success = await driver.screenCap(savePath);
        hilog.info(domain, tag, `testScreenCap screenCap , ${ success }`);
        expect(success == true).assertTrue();
      } catch(error) {
        hilog.info(domain, tag, `testScreenCap_static error, ${ JSON.stringify(error) }`);
        expect().assertFail()
      }
      hilog.info(domain, tag, "testScreenCap_static over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0036
     * @tc.name: testGetDisplaySize_static
     * @tc.desc: get the size of the device display.
     */
    it('testGetDisplaySize_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testGetDisplaySize start`);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let test = await driver.getDisplaySize();
        hilog.info(domain, tag, `testGetDisplaySize test, ${JSON.stringify(test)}`);
        expect(test.x != 0).assertTrue();
        expect(test.y != 0).assertTrue();
      } catch (error : Error) {
        hilog.info(domain, tag, `testGetDisplaySize error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testGetDisplaySize end`);
    })

    /*
     * @tc.number: uitestDriverTest_0037
     * @tc.name: testFindWindowBundleName
     * @tc.desc: get the size of the device display.
     */
    it('testFindWindowBundleName',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testFindWindowBundleName start !!!!");
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({bundleName:'com.uitestScene.acts'});
        hilog.info(domain, tag, `testFindWindowBundleName window , ${ JSON.stringify(window) }`);
        expect(window != null).assertTrue();
        if (window != null) {
          let name = await window.getBundleName();
          hilog.info(domain, tag, `testFindWindowBundleName name , ${ name }`);
          expect(name == 'com.uitestScene.acts').assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testFindWindowBundleName error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testFindWindow over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0038
     * @tc.name: testFindWindowActive
     * @tc.desc: get the size of the device display.
     */
    it('testFindWindowActive',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testFindWindowActive start !!!!");
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({active: true});
        hilog.info(domain, tag, `testFindWindowActive window , ${ JSON.stringify(window) }`);
        expect(window != null).assertTrue();
        if (window != null) {
          let isActive = await window.isActive();
          hilog.info(domain, tag, `testFindWindowActive isActive , ${ isActive }`);
          expect(isActive).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testFindWindowActive error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testFindWindowActive over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0039
     * @tc.name: testFindWindowFocused
     * @tc.desc: get the size of the device display.
     */
    it('testFindWindowFocused',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testFindWindowFocused start !!!!");
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({focused: true});
        hilog.info(domain, tag, `testFindWindowFocused window , ${ JSON.stringify(window) }`);
        expect(window != null).assertTrue();
        if (window != null) {
          let isFocused = await window.isFocused();
          hilog.info(domain, tag, `testFindWindowFocused isFocused , ${ isFocused }`);
          expect(isFocused).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testFindWindowFocused error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testFindWindowFocused over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0040
     * @tc.name: test_touchPadMultiFingerSwipe_Up_Down_3_static
     * @tc.desc: Swipe UP or Down with three point.
     */
    it('test_touchPadMultiFingerSwipe_Up_Down_3_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (): Promise<void> => {
      hilog.info(domain, tag, `test_touchPadMultiFingerSwipe_Up_Down_3_static start`);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        // 三指上划返回桌面。
        await driver.touchPadMultiFingerSwipe(3, UiDirection.UP);
        hilog.info(domain, tag, `test_touchPadMultiFingerSwipe_Up_Down_3_static UiDirection.UP success`);
        await driver.delayMs(1000);
        let mainPageCom = await driver.findComponent(ON.text('MainPage'));
        hilog.info(domain, tag, `test_touchPadMultiFingerSwipe_Up_Down_3_static mainPageCom, ${JSON.stringify(mainPageCom)}`);
        expect(mainPageCom == null).assertTrue();
        // 三指下划,应用返回前台
        await driver.touchPadMultiFingerSwipe(3, UiDirection.DOWN);
        await driver.delayMs(1000);
        let mainPageCom1 = await driver.findComponent(ON.text('MainPage'));
        hilog.info(domain, tag, `test_touchPadMultiFingerSwipe_Up_Down_3_static mainPageCom1, ${JSON.stringify(mainPageCom1)}`);
        expect(mainPageCom1 != null).assertTrue();
      } catch (error: BusinessError ) {
        hilog.info(domain, tag, `test_touchPadMultiFingerSwipe_Up_Down_3_static error, ${JSON.stringify(error)}`);
        expect(error.code == 17000005).assertTrue();
      }
      hilog.info(domain, tag, `test_touchPadMultiFingerSwipe_Up_Down_3_static end`);
      await stopApplication('com.uitestScene.acts');

    })


    /*
     * @tc.number: UiTest_API16_002
     * @tc.name: test_touchPadMultiFingerSwipe_Up_Down_Stay_3_static
     * @tc.desc: Swipe Up or Down with three point then  in more task statue
     */
    it('test_touchPadMultiFingerSwipe_Up_Down_Stay_3_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(domain, tag, `test_touchPadMultiFingerSwipe_Up_Down_Stay_3_static start`);
      let driver = Driver.create();
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        // 三指上划停留, 进入多任务中心。
        await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, {stay: true, speed: 3000});
        let mainPageCom = await driver.findComponent(ON.text('MainPage'));
        await driver.delayMs(1000);
        expect(mainPageCom).assertNull();
      } catch (error: BusinessError) {
        hilog.info(domain, tag, `test_touchPadMultiFingerSwipe_Up_Down_Stay_3_static up, error is, ${JSON.stringify(error)}`);
        expect(error.code == 17000005).assertTrue();
      }
      await driver.delayMs(1000);
      try {
        // 三指下划,应用返回前台。
        await driver.touchPadMultiFingerSwipe(3, UiDirection.DOWN, {stay: true, speed: 3000});
        await driver.delayMs(1000);
        let mainPageCom = await driver.findComponent(ON.text('MainPage'));
        await driver.delayMs(1000);
        expect(mainPageCom).not().assertNull();
      } catch (error: BusinessError) {
        hilog.info(domain, tag, `test_touchPadMultiFingerSwipe_Up_Down_Stay_3_static down, error is, ${JSON.stringify(error)}`);
        expect(error.code == 17000005).assertTrue();
      }
      await driver.delayMs(1000);
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `test_touchPadMultiFingerSwipe_Up_Down_Stay_3_static end`);
    })
    /*
     * @tc.number: uitestDriverTest_0041
     * @tc.name: testMouseMoveWithTrack_static
     * @tc.desc: swipe on the screen between the specified points with mouse.
     */
    it('testMouseMoveWithTrack_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testMouseMoveWithTrack_static start !!!!");
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        let driver = Driver.create()
        await driver.delayMs(waitUiReadyMs);
         let button = await driver.findComponent(ON.id('jump'));
        if (button == null) {
          let scrollBar = await driver.findComponent(ON.type('Scroll'))
          if (scrollBar != null) {
            button = await scrollBar.scrollSearch(ON.id('jump'))
          }
        }
        expect(button != null).assertTrue();
        if (button != null ) {
          let center1 = await button.getBoundsCenter();
          // jump 按钮 349, 472
          await driver.mouseMoveTo(center1);
          hilog.info(domain, tag, `testMouseMoveWithTrack_static mouseMoveTo success`);
          await driver.delayMs(1000);
          let checkBox = await driver.findComponent(ON.type('Checkbox'));
          expect(checkBox != null).assertTrue();
          if (checkBox != null) {
            let center2 = await checkBox.getBoundsCenter();
            await driver.mouseMoveWithTrack(center1, center2, 600);
            await driver.delayMs(1000);
            await driver.mouseMoveWithTrack(center1, center2);
          }
        }
         let newButton = await driver.findComponent(ON.text('jump'));
         hilog.info(domain, tag, `testMouseMoveWithTrack_static newButton, ${ JSON.stringify(newButton) }`);
        expect(newButton == null).assertTrue();
      } catch(error) {
        hilog.info(domain, tag, `testMouseMoveWithTrack_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testMouseMoveWithTrack_static over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0042
     * @tc.name: testMouseMoveTo_static
     * @tc.desc: move the mouse cursor to the specified location.
     */
    it('testMouseMoveTo_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testMouseMoveTo_static start !!!!");
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(1000);
      try {
        let button = await driver.findComponent(ON.id('jump'));
        if (button == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            button = await scroll.scrollSearch(ON.id('jump'))
          }
        }
        hilog.info(domain, tag, `testMouseMoveTo_static button,${JSON.stringify(button)}`);
        await driver.delayMs(1000);
        expect(button != null).assertTrue();
        if (button != null) {
          let center = await button.getBoundsCenter();
          hilog.info(domain, tag, `testMouseMoveTo_static center,${JSON.stringify(center)}`);
          // jump 按钮 349, 472
          await driver.mouseMoveTo(center);
          await driver.delayMs(2000);
          let newButton = await driver.findComponent(ON.text('hover'));
          hilog.info(domain, tag, `testMouseMoveTo_static newButton,${JSON.stringify(newButton)}`);
          expect(newButton != null).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testMouseMoveTo_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testMouseMoveTo_static over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0044
     * @tc.name: testInjectMultiPointerAction_static
     * @tc.desc: inject multi-pointer action on the device display.
     */
    it('testInjectMultiPointerAction_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): Promise<void> => {
      hilog.info(domain, tag, "testInjectMultiPointerAction_static start !!!!");
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.id('jump'))
        if (button == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            button = await scroll.scrollSearch(ON.id('jump'))
          }
        }
        expect(button != null).assertTrue();
        if (button != null) {
          await button.click()
          await driver.delayMs(waitUiReadyMs)
        }
        let image1 = await driver.findComponent(ON.id('test_pict'))
        expect(image1 != null).assertTrue();
        if (image1 != null) {
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
          expect(image2 != null).assertTrue()
          if (image2 != null) {
            let bounds2= await image2.getBounds()
            expect(bounds2 != bounds1).assertTrue()
          }
        }
      } catch(error) {
        hilog.info(domain, tag, `testInjectMultiPointerAction_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }finally {
        await stopApplication('com.uitestScene.acts');
      }
      hilog.info(domain, tag, "testInjectMultiPointerAction_static over!!!!")
    })

    /*
     * @tc.number: uitestDriverTest_0066
     * @tc.name: testInjectMultiPointerAction_speed_static
     * @tc.desc: inject multi-pointer action on the device display.
     */
    it('testInjectMultiPointerAction_speed_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): Promise<void> => {
      hilog.info(domain, tag, "testInjectMultiPointerAction_speed_static start !!!!");
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.id('jump'))
        if (button == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            button = await scroll.scrollSearch(ON.id('jump'))
          }
        }
        expect(button != null).assertTrue();
        if (button != null) {
          await button.click()
          await driver.delayMs(waitUiReadyMs)
        }
        let image1 = await driver.findComponent(ON.id('test_pict'))
        expect(image1 != null).assertTrue();
        if (image1 != null) {
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
          await driver.injectMultiPointerAction(pointer)
          await driver.delayMs(3000)
          let image2 = await driver.findComponent(ON.id('test_pict'))
          expect(image2 != null).assertTrue()
          if (image2 != null) {
            let bounds2= await image2.getBounds()
            expect(bounds2 != bounds1).assertTrue()
          }
        }
      } catch(error) {
        hilog.info(domain, tag, `testInjectMultiPointerAction_speed_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, "testInjectMultiPointerAction_speed_static over!!!!")
    })

    /*
     * @tc.number: uitestDriverTest_0045
     * @tc.name: test_injectPenPointAction_function_static
     * @tc.desc: injectPenPointAction function test.
     */
    it('test_injectPenPointAction_function_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "test_injectPenPointAction_function_static start !!!!");
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      try {
        let driver = Driver.create();
        await driver.delayMs(waitUiReadyMs);
        let scroll = await driver.findComponent(ON.type('Scroll'))
        expect(scroll != null).assertTrue();
        if (scroll != null) {
          let scrollRect = await scroll.getBounds()
          let screenWidth = scrollRect.right - scrollRect.left;
          let screenHeight = scrollRect.bottom - scrollRect.top;
          let stepLength = Math.floor((screenHeight / 4) * 2 / 8);
          let startX = Math.floor(screenWidth / 2);
          let pointer = PointerMatrix.create(1,8);
          for (let step = 0; step < 8; step++) {
            let startY = Math.floor((screenHeight / 2 + screenHeight / 4) - stepLength * step);
            pointer.setPoint(0, step, {x: startX, y: startY });
          }
          await driver.injectPenPointerAction(pointer, 600, 0.5);
          await driver.delayMs(2000);
          let text = await driver.findComponent(ON.text('toast'));
          hilog.info(domain, tag, `test_injectPenPointAction_function_static text, ${ JSON.stringify(text)}`);
          expect(text == null).assertTrue();
          await driver.delayMs(waitUiReadyMs);
          let pressureCom = await driver.findComponent(ON.id('pressure'));
          hilog.info(domain, tag, `test_injectPenPointAction_function_static pressureCom, ${ JSON.stringify(pressureCom)}`);
          await driver.delayMs(waitUiReadyMs);
          if (pressureCom != null) {
            let pressure = await pressureCom.getText();
            await driver.delayMs(waitUiReadyMs);
            expect(pressure).assertEqual('0.5');
          }
        }
      } catch(error) {
        hilog.info(domain, tag, `test_injectPenPointAction_function_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "test_injectPenPointAction_function_static over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0061
     * @tc.name: test_injectPenPointAction_speed_function_static
     * @tc.desc: injectPenPointAction function test.
     */
    it('test_injectPenPointAction_speed_function_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "test_injectPenPointAction_speed_function_static start !!!!");
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      try {
        let driver = Driver.create();
        await driver.delayMs(waitUiReadyMs);
        let scroll = await driver.findComponent(ON.type('Scroll'))
        expect(scroll != null).assertTrue();
        if (scroll != null) {
          let scrollRect = await scroll.getBounds()
          let screenWidth = scrollRect.right - scrollRect.left;
          let screenHeight = scrollRect.bottom - scrollRect.top;
          let stepLength = Math.floor((screenHeight / 4) * 2 / 8);
          let startX = Math.floor(screenWidth / 2);
          let pointer = PointerMatrix.create(1,8);
          for (let step = 0; step < 8; step++) {
            let startY = Math.floor((screenHeight / 2 + screenHeight / 4) - stepLength * step);
            pointer.setPoint(0, step, {x: startX, y: startY });
          }
          await driver.injectPenPointerAction(pointer, 600);
          await driver.delayMs(2000);
          let text = await driver.findComponent(ON.text('toast'));
          hilog.info(domain, tag, `test_injectPenPointAction_speed_function_static text, ${ JSON.stringify(text)}`);
          expect(text == null).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `test_injectPenPointAction_speed_function_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "test_injectPenPointAction_speed_function_static over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0063
     * @tc.name: test_injectPenPointAction_static
     * @tc.desc: injectPenPointAction function test.
     */
    it('test_injectPenPointAction_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "test_injectPenPointAction_static start !!!!");
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      try {
        let driver = Driver.create();
        await driver.delayMs(waitUiReadyMs);
        let scroll = await driver.findComponent(ON.type('Scroll'))
        expect(scroll != null).assertTrue();
        if (scroll != null) {
          let scrollRect = await scroll.getBounds()
          let screenWidth = scrollRect.right - scrollRect.left;
          let screenHeight = scrollRect.bottom - scrollRect.top;
          let stepLength = Math.floor((screenHeight / 4) * 2 / 8);
          let startX = Math.floor(screenWidth / 2);
          let pointer = PointerMatrix.create(1,8);
          for (let step = 0; step < 8; step++) {
            let startY = Math.floor((screenHeight / 2 + screenHeight / 4) - stepLength * step);
            pointer.setPoint(0, step, {x: startX, y: startY });
          }
          await driver.injectPenPointerAction(pointer);
          await driver.delayMs(2000);
          let text = await driver.findComponent(ON.text('toast'));
          hilog.info(domain, tag, `test_injectPenPointAction_static text, ${ JSON.stringify(text)}`);
          expect(text == null).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `test_injectPenPointAction_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "test_injectPenPointAction_static over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0046
     * @tc.name: testWaitForIdle_static
     * @tc.desc: wait for the UI become idle.
     */
    it('testWaitForIdle_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testWaitForIdle_static start !!!!")
      try {
        let driver = Driver.create();
        let idled = await driver.waitForIdle(4000,5000);
        hilog.info(domain, tag, `testWaitForIdle_static idled, ${ idled }`);
        expect(idled).assertTrue();
      } catch(error) {
        hilog.info(domain, tag, `testWaitForIdle_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testWaitForIdle_static over!!!!");
    })

    /*
     * @tc.number: uitestDriverTest_0047
     * @tc.name: testTriggerKey_static
     * @tc.desc: press the specified key.
     */
    it('testTriggerKey_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testTriggerKey_static start !!!!")
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        // 点击进入next page
        let keyBack = 2;
        await driver.triggerKey(keyBack);
        await driver.delayMs(1000);
        let button = await driver.findComponent(ON.text('next page'));
        hilog.info(domain, tag, `testTriggerKey_static button, ${ JSON.stringify(button) }`);
        expect(button == null).assertTrue();
      } catch(error) {
        hilog.info(domain, tag, `testTriggerKey_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testTriggerKey_static over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0049
     * @tc.name: testDelayMs
     * @tc.desc: delayMs test.
     */
    it('testDelayMs',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testDelayMs start !!!!")
      try {
        let driver = Driver.create();
        await driver.delayMs(2000);
        hilog.info(domain, tag, `testDelayMs create delayMs success`);
      } catch(error) {
        hilog.info(domain, tag, `testDelayMs error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testDelayMs over!!!!")
    })

    /*
     * @tc.number: uitestDriverTest_0050
     * @tc.name: testDriverInputText_static
     * @tc.desc: inject text on the specified location.
     */
    it('testDriverInputText_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testDriverInputText_static start !!!!");
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      try {
        let driver = Driver.create();
        await driver.delayMs(1000);
        let text = await driver.findComponent(ON.type('TextInput'));
        if (text == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            text = await scroll.scrollSearch(ON.type('TextInput'))
          }
        }
        hilog.info(domain, tag, `testDriverInputText_static text, ${ JSON.stringify(text) }`);
        expect(text != null).assertTrue();
        if (text != null) {
          await text.clearText();
          await driver.delayMs(1000);
          await exitInputMethod()
          let center = await text.getBoundsCenter();
          hilog.info(domain, tag, `testDriverInputText_static center, ${ JSON.stringify(center) }`);
          await driver.inputText(center, '123');
        }
        await driver.delayMs(1000);
        let text1 = await driver.findComponent(ON.type('TextInput'));
        hilog.info(domain, tag, `testDriverInputText_static text1 success, ${ JSON.stringify(text1) }`);
        expect(text1 != null).assertTrue();
        if (text1 != null) {
          let inputText = await text1.getText();
          hilog.info(domain, tag, `testDriverInputText_static inputText success, ${ JSON.stringify(inputText) }`);
          expect(inputText).assertEqual('123');
        }
      } catch(error) {
        hilog.info(domain, tag, `testDriverInputText_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "tesInputText over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0052
     * @tc.name: testSwipe_static
     * @tc.desc: swipe on the screen between the specified points.
     */
    it('testSwipe_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testSwipe_static start`);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        await driver.delayMs(1000);
        let scroll = await driver.findComponent(ON.type('Scroll'));
        hilog.info(domain, tag, `testSwipe scroll success, ${JSON.stringify(scroll)}`);
        expect(scroll != null).assertTrue();
        if (scroll != null ) {
          let rect = await scroll.getBounds();
          let center = await scroll.getBoundsCenter();
          await driver.swipe(center.x, Math.floor(center.y + (rect.bottom - rect.top) / 4),
            center.x, Math.floor(center.y - (rect.bottom - rect.top) / 4))
          await driver.delayMs(1000);
          let text = await driver.findComponent(ON.text('toast'));
          expect(text == null).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testSwipe error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testSwipe end !!!`);
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0056
     * @tc.name: testSwipe_speed_static
     * @tc.desc: swipe on the screen between the specified points.
     */
    it('testSwipe_speed_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testSwipe_speed_static start`);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        await driver.delayMs(1000);
        let scroll = await driver.findComponent(ON.type('Scroll'));
        hilog.info(domain, tag, `testSwipe_speed_static scroll success, ${JSON.stringify(scroll)}`);
        expect(scroll != null).assertTrue();
        if (scroll != null ) {
          let rect = await scroll.getBounds();
          let center = await scroll.getBoundsCenter();
          await driver.swipe(center.x, Math.floor(center.y + (rect.bottom - rect.top) / 4),
            center.x, Math.floor(center.y - (rect.bottom - rect.top) / 4), 3000)
          await driver.delayMs(1000);
          let text = await driver.findComponent(ON.text('toast'));
          expect(text == null).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testSwipe_speed_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testSwipe_speed_static end !!!`);
      await stopApplication('com.uitestScene.acts');
    })

    /*
     * @tc.number: uitestDriverTest_0055
     * @tc.name: testScreenCapture_static
     * @tc.desc: capture the specified area of current screen.
     */
    it('testScreenCapture_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testScreenCapture_static start`);
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        let driver = Driver.create();
        await driver.delayMs(1000);
        await driver.delayMs(1000);
        let savePath = '/data/storage/el2/base/cache/testScreenCapture_1.png'
        let success = await driver.screenCapture(savePath, {left: 0, top: 0, right: 100, bottom: 100});
        hilog.info(domain, tag, `testScreenCapture_static  success, ${ JSON.stringify(success) }`);
        expect(success == true).assertTrue();
        let savePath1 = '/data/storage/el2/base/cache/testScreenCapture_2.png'
        let success1 = await driver.screenCapture(savePath1);
        hilog.info(domain, tag, `testScreenCapture_static  success1, ${ JSON.stringify(success1) }`);
        expect(success1 == true).assertTrue();
      } catch(error) {
        hilog.info(domain, tag, `testScreenCapture_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testScreenCapture_static end`);
      await stopApplication('com.uitestScene.acts');
    })
  })
}