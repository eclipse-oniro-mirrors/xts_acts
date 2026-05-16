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
import { Component, Driver, ON, On, MatchPattern,Point, Rect, MouseButton, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation } from '@kit.TestKit'
import  hilog  from '@ohos.hilog'
import { Utils, startAbility, stopApplication } from './Util.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const waitUiReadyMs : int = 1000;
const DeviceErrorCode = 17000005;

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

export default function uitestComponentTest() {
  describe('uitestComponentTest', (): void => {
    beforeAll(async () : Promise<void> => {
      hilog.info(domain, tag, "uitestComponentTest loadup start!!!!!")
      await Utils.msSleep(1000)
      hilog.info(domain, tag, "uitestComponentTest loadup over!!!!!")
    })
    beforeEach(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testClearText_static
     * @tc.number uitestComponentTest_0001
     * @tc.desc   clear text of the target UiComponent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClearText_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testClearText_static start `);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let textInput = await driver.findComponent(ON.type("TextInput"));
        hilog.info(domain, tag, `testClearText_static textInput, ${JSON.stringify(textInput)} `);
        await driver.delayMs(1000);
        expect(textInput != null).assertTrue()
        if (textInput != null) {
          await textInput.clearText();
          hilog.info(domain, tag, `testClearText_static clearText`);
          await driver.delayMs(1000);
        }
        let textInput1 = await driver.findComponent(ON.type("TextInput"));
        hilog.info(domain, tag, `testClearText_static textInput1, ${JSON.stringify(textInput1)}`);
        await driver.delayMs(1000);
        expect(textInput1 != null).assertTrue()
        if (textInput1 != null) {
          let text1 = await textInput1.getText();
          hilog.info(domain, tag, `testClearText_static text1, ${JSON.stringify(text1)}`);
          expect(text1).assertEqual('');
        }
      } catch(error) {
        hilog.info(domain, tag, `testClearText_static error, ${JSON.stringify(error)} `);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testClearText_static end `);
    })

    /**
     * @tc.name   testScrollToBottom_static
     * @tc.number uitestComponentTest_0002
     * @tc.desc   scroll on this UiComponent to the bottom.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScrollToBottom_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        hilog.info(domain, tag, "testScrollToBottom_static Start!!!!!!!!!!!!!!!!!!!!!!!!!！")
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let scrollBar = await driver.findComponent(ON.type('Scroll'))
        hilog.info(domain, tag, `testScrollToBottom_static scrollBar, ${JSON.stringify(scrollBar)} `);
        expect(scrollBar != null).assertTrue()
        if (scrollBar != null) {
          await scrollBar.scrollToBottom();
          hilog.info(domain, tag, `testScrollToBottom_static scrollToBottom success`);
          await driver.delayMs(1000);
        }
        let bottom = await driver.findComponent(ON.text('bottom'));
        hilog.info(domain, tag, `testScrollToBottom_static bottom, ${JSON.stringify(bottom)} `);
        expect(bottom != null).assertTrue();
        if (bottom != null) {
          let msg = await bottom.getText();
          hilog.info(domain, tag, `testScrollToBottom_static msg, ${JSON.stringify(msg)} `);
        }
      } catch (error : Error) {
        hilog.info(domain, tag, `testScrollToBottom_static error, ${JSON.stringify(error)} `);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testScrollToBottom_static end !!!!!!!!!!!!!!!!!!!!!!!!!！");
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testScrollToBottom_speed_static
     * @tc.number uitestComponentTest_0003
     * @tc.desc   scroll on this UiComponent to the bottom.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScrollToBottom_speed_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        hilog.info(domain, tag, "testScrollToBottom_speed_static Start!!!!!!!!!!!!!!!!!!!!!!!!!！")
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let scrollBar = await driver.findComponent(ON.type('Scroll'))
        hilog.info(domain, tag, `testScrollToBottom_speed_static driver, ${JSON.stringify(scrollBar)} `);
        expect(scrollBar != null).assertTrue()
        if (scrollBar != null) {
          await scrollBar.scrollToBottom(2000);
          hilog.info(domain, tag, `testScrollToBottom_speed_static scrollToBottom success`);
        }
        await driver.delayMs(1000);
        let bottom = await driver.findComponent(ON.text('bottom'));
        hilog.info(domain, tag, `testScrollToBottom_speed_static bottom, ${JSON.stringify(bottom)} `);
        expect(bottom != null).assertTrue();
        if (bottom != null) {
          let msg = await bottom.getText();
          hilog.info(domain, tag, `testScrollToBottom_speed_static msg, ${JSON.stringify(msg)} `);
        }
      } catch (error : Error) {
        hilog.info(domain, tag, `testScrollToBottom_speed_static error, ${JSON.stringify(error)} `);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, "testScrollToBottom_speed_static end ")
    })

    /**
     * @tc.name   testScrollToTop_static
     * @tc.number uitestComponentTest_0004
     * @tc.desc   scroll on this UiComponent to the top.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScrollToTop_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        hilog.info(domain, tag, "testScrollToTop_static Start")
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let scrollBar = await driver.findComponent(ON.type('Scroll'))
        hilog.info(domain, tag, `testScrollToTop_static scrollBar, ${JSON.stringify(scrollBar)} `);
        expect(scrollBar != null).assertTrue()
        if (scrollBar != null) {
          await scrollBar.scrollToBottom(2000);
          hilog.info(domain, tag, `testScrollToTop_static scrollToBottom success`);
        }
        await driver.delayMs(1000);
        if (scrollBar != null) {
          await scrollBar.scrollToTop();
          hilog.info(domain, tag, `testScrollToTop_static scrollToTop success`);
          await driver.delayMs(1000);
        }
        await driver.delayMs(1000);
        let bottom = await driver.findComponent(ON.text('next page'));
        hilog.info(domain, tag, `testScrollToTop_static bottom, ${JSON.stringify(bottom)} `);
        expect(bottom != null).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, `testScrollToTop_static error, ${JSON.stringify(error)} `);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testScrollToTop_static end ");
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testScrollToTop_speed_static
     * @tc.number uitestComponentTest_0005
     * @tc.desc   scroll on this UiComponent to the top.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScrollToTop_speed_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        hilog.info(domain, tag, "testScrollToTop_speed_static Start")
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let scrollBar = await driver.findComponent(ON.type('Scroll'))
        expect(scrollBar != null).assertTrue()
        if (scrollBar != null) {
          await scrollBar.scrollToBottom(2000);
          hilog.info(domain, tag, `testScrollToTop_speed_static scrollToBottom success`);
        }
        await driver.delayMs(1000);
        if (scrollBar != null) {
          await scrollBar.scrollToTop(1500);
          hilog.info(domain, tag, `testScrollToTop_speed_static scrollToTop success`);
        }
        let bottom = await driver.findComponent(ON.text('next page'));
        hilog.info(domain, tag, `testScrollToTop_speed_static bottom, ${JSON.stringify(bottom)} `);
        expect(bottom != null).assertTrue();
      } catch (error : Error) {
        hilog.info(domain, tag, `testScrollToTop_speed_static error, ${JSON.stringify(error)} `);
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, "testScrollToTop_speed_static end");
    })

    /**
     * @tc.name   testScrollSearch_static
     * @tc.number uitestComponentTest_0006
     * @tc.desc   scroll on this UiComponent to find matched UiComponent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScrollSearch_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testScrollSearch_static start `);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let scrollBar = await driver.findComponent(ON.type('Scroll'));
        hilog.info(domain, tag, `testScrollSearch_static scrollBar, ${JSON.stringify(scrollBar)} `);
        expect(scrollBar != null).assertTrue()
        if (scrollBar != null) {
          let button = await scrollBar.scrollSearch(ON.text('next page'));
          hilog.info(domain, tag, `testScrollSearch_static button, ${JSON.stringify(button)} `);
          expect(button != null).assertTrue()
          if (button != null ) {
            let text = await button.getText();
            hilog.info(domain, tag, `testScrollSearch_static text, ${JSON.stringify(text)} `);
            expect(text).assertEqual('next page');
          }
        }
      } catch(error) {
        hilog.info(domain, tag, `testScrollSearch_static error, ${JSON.stringify(error)} `);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testScrollSearch_static end `);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testScrollSearchVertical_static
     * @tc.number uitestComponentTest_0007
     * @tc.desc   scroll vertically on this UiComponent to find matched UiComponent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScrollSearchVertical_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testScrollSearchVertical start `);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let button = await driver.findComponent(ON.text('scroll'));
        hilog.info(domain, tag, `testScrollSearchVertical_static button, ${JSON.stringify(button)} `);
        await driver.delayMs(1000);
        expect(button != null).assertTrue()
        if (button != null) {
          await button.click();
        }
        await driver.delayMs(1000);
        let scrollBar = await driver.findComponent(ON.id('verticalScroll'));
        hilog.info(domain, tag, `testScrollSearchVertical_static scrollBar, ${JSON.stringify(scrollBar)} `);
        await driver.delayMs(1000);
        expect(scrollBar != null).assertTrue()
        if (scrollBar != null) {
          let text1 = await scrollBar.scrollSearch(ON.text('1'), true, 80);
          await driver.delayMs(1000);
          hilog.info(domain, tag, `testScrollSearchVertical_static text1, ${JSON.stringify(text1)} `);
          expect(text1 != null).assertTrue()
          if (text1 != null) {
            let text1Msg = await text1.getText();
            hilog.info(domain, tag, `testScrollSearchVertical_static text1Msg, ${JSON.stringify(text1Msg)} `);
            expect(text1Msg).assertEqual('1');
          }
          let text2 = await scrollBar.scrollSearch(ON.text('2'), true);
          hilog.info(domain, tag, `testScrollSearchVertical_static text2, ${JSON.stringify(text2)} `);
          expect(text2 != null).assertTrue()
          if (text2 != null) {
            let text2Msg = await text2.getText();
            hilog.info(domain, tag, `testScrollSearchVertical_static text2Msg, ${JSON.stringify(text2Msg)} `);
            expect(text2Msg).assertEqual('2');
          }
          let text3 = await scrollBar.scrollSearch(ON.text('3'));
          hilog.info(domain, tag, `testScrollSearchVertical_static text3, ${JSON.stringify(text3)} `);
          expect(text3 != null).assertTrue()
          if (text3 != null) {
            let text3Msg = await text3.getText();
            hilog.info(domain, tag, `testScrollSearchVertical_static text3Msg, ${JSON.stringify(text3Msg)} `);
            expect(text3Msg).assertEqual('3');
          }
        }
      } catch(error) {
        hilog.info(domain, tag, `testScrollSearchVertical_static error, ${JSON.stringify(error)} `);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testScrollSearchVertical_static end `);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testPinch_static
     * @tc.number uitestComponentTest_0008
     * @tc.desc   pinch enlarge this UiComponent to the target scale.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPinch_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testPinch_static start `);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let button = await driver.findComponent(ON.id('jump'));
        if (button == null) {
          let scrollBar = await driver.findComponent(ON.type('Scroll'));
          if (scrollBar != null) {
            button = await scrollBar.scrollSearch(ON.id('jump'))
          }
        }
        hilog.info(domain, tag, `testPinch_static button, ${JSON.stringify(button)} `);
        expect(button != null).assertTrue()
        if (button != null) {
          await button.click();
        }
        await driver.delayMs(1000);
        let image1 = await driver.findComponent(ON.id('test_pict'));
        hilog.info(domain, tag, `testPinch_static image1, ${JSON.stringify(image1)} `);
        expect(image1 != null).assertTrue()
        if (image1 != null) {
          let bounds1 = await image1.getBounds();
          hilog.info(domain, tag, `testPinch_static bounds1, ${JSON.stringify(bounds1)} `);
          await image1.pinchIn(0.5);
          await driver.delayMs(1000);
          let image2 = await driver.findComponent(ON.id('test_pict'));
          hilog.info(domain, tag, `testPinch_static image2, ${JSON.stringify(image2)} `);
          expect(image2 != null).assertTrue()
          if (image2 != null) {
            let bounds2 = await image2.getBounds();
            hilog.info(domain, tag, `testPinch_static bounds2, ${JSON.stringify(bounds2)} `);
            expect(bounds1 != bounds2).assertTrue();
          }
        }
      } catch(error) {
        hilog.info(domain, tag, `testPinch_static error, ${JSON.stringify(error)} `);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testPinch_static end `);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testPinchOut_static
     * @tc.number uitestComponentTest_0009
     * @tc.desc   pinch enlarge this UiComponent to the target scale.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPinchOut_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testPinchOut_static start `);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let button = await driver.findComponent(ON.id('jump'));
        if (button == null) {
          let scrollBar = await driver.findComponent(ON.type('Scroll'));
          if (scrollBar != null) {
            button = await scrollBar.scrollSearch(ON.id('jump'))
          }
        }
        hilog.info(domain, tag, `testPinchOut_static button, ${JSON.stringify(button)} `);
        expect(button != null).assertTrue()
        if (button != null) {
          await button.click();
        }
        await driver.delayMs(1000);
        let image1 = await driver.findComponent(ON.id('test_pict'));
        hilog.info(domain, tag, `testPinchOut_static image1, ${JSON.stringify(image1)} `);
        expect(image1 != null).assertTrue()
        if (image1 != null) {
          let bounds1 = await image1.getBounds();
          hilog.info(domain, tag, `testPinchOut_static bounds1, ${JSON.stringify(bounds1)} `);
          await image1.pinchOut(1.2);
          await driver.delayMs(1000);
          let image2 = await driver.findComponent(ON.id('test_pict'));
          hilog.info(domain, tag, `testPinchOut_static image2, ${JSON.stringify(image2)} `);
          expect(image2 != null).assertTrue()
          if (image2 != null) {
            let bounds2 = await image2.getBounds();
            hilog.info(domain, tag, `testPinchOut_static bounds2, ${JSON.stringify(bounds2)} `);
            expect(bounds1 != bounds2).assertTrue();
          }
        }
      } catch(error) {
        hilog.info(domain, tag, `testPinchOut_static error, ${JSON.stringify(error)} `);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testPinchOut_static end `);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testUiComponentLongClick_static
     * @tc.number uitestComponentTest_0010
     * @tc.desc   longClick this ComponentClick.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUiComponentLongClick_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testUiComponentLongClick_static start `);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let nextPage = await driver.findComponent(ON.text('next page'));
        hilog.info(domain, tag, `testUiComponentLongClick_static error, ${JSON.stringify(nextPage)} `);
        expect(nextPage != null).assertTrue()
        if (nextPage != null) {
          let center = await nextPage.getBoundsCenter();
          let test = await nextPage.longClick();
          let newButton = await driver.findComponent(ON.text('longClick'));
          hilog.info(domain, tag, `testUiComponentLongClick_static newButton, ${JSON.stringify(newButton)} `);
          expect(newButton != null).assertTrue()
          await driver.delayMs(1000);
          if (newButton != null) {
            let text = await newButton.getText();
            hilog.info(domain, tag, `testUiComponentLongClick_static text, ${JSON.stringify(text)} `);
            expect(text == 'longClick').assertTrue();
          }
        }
      } catch (error) {
        hilog.info(domain, tag, `testUiComponentLongClick_static error, ${JSON.stringify(error)} `);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testUiComponentLongClick_static end `);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testInputText_static
     * @tc.number uitestComponentTest_0011
     * @tc.desc   inject text to the target UiComponent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testInputText_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testInputText_static start !!!!")
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let text = await driver.findComponent(ON.type('TextInput'));
        if (text == null) {
          let scrollBar = await driver.findComponent(ON.type('Scroll'));
          if (scrollBar != null) {
            text = await scrollBar.scrollSearch(ON.type('TextInput'))
          }
        }
        hilog.info(domain, tag, `testInputText_static text, ${ JSON.stringify(text) }`);
        expect(text != null).assertTrue()
        if (text != null) {
          await text.inputText('123');
        }

        await driver.delayMs(1000);
        await exitInputMethod()
        await driver.delayMs(2000)
        let text1 = await driver.findComponent(ON.type('TextInput'));
        hilog.info(domain, tag, `testInputText_static text1, ${ JSON.stringify(text1) }`);
        expect(text1 != null).assertTrue()
        if (text1 != null) {
          let inputText = await text1.getText();
          hilog.info(domain, tag, `testInputText_static inputText, ${ JSON.stringify(inputText) }`);
          expect(inputText).assertEqual('123');
        }
      } catch(error) {
        hilog.info(domain, tag, `testInputText_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testInputText_static end");
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testGetUiComponentBoundsCenter_static
     * @tc.number uitestComponentTest_0012
     * @tc.desc   get the boundsCenter of this @link UiComponent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetUiComponentBoundsCenter_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testGetUiComponentBoundsCenter_static start`);
      try {
        const driver1 = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver1.delayMs(1000);
        let button = await driver1.findComponent(ON.text('next page'));
        hilog.info(domain, tag, `testGetUiComponentBoundsCenter_static button, ${ JSON.stringify(button) }`);
        expect(button != null).assertTrue()
        if (button != null) {
          let center = await button.getBoundsCenter();
          hilog.info(domain, tag, `testGetUiComponentBoundsCenter_static center, ${ JSON.stringify(center) }`);
          expect(center instanceof Point).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testGetUiComponentBoundsCenter_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testGetUiComponentBoundsCenter_static end`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testGetUiComponentBounds_static
     * @tc.number uitestComponentTest_0013
     * @tc.desc   get the bounds of this UiComponent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetUiComponentBounds_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testGetUiComponentBounds_static start`);
      try {
        const driver1 = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver1.delayMs(1000);
        let button = await driver1.findComponent(ON.text('next page'));
        hilog.info(domain, tag, `testGetUiComponentBounds_static button, ${ JSON.stringify(button) }`);
        expect(button != null).assertTrue()
        if (button != null) {
          let center = await button.getBounds();
          hilog.info(domain, tag, `testGetUiComponentBounds_static center, ${ JSON.stringify(center) }`);
          expect(center instanceof Rect).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testGetUiComponentBounds_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testGetUiComponentBounds_static end`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testUiComponentDoubleClick_static
     * @tc.number uitestComponentTest_0015
     * @tc.desc   doubleClick this UiComponentClick.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUiComponentDoubleClick_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let button = await driver.findComponent(ON.text('Click twice'));
        hilog.info(domain, tag, `testUiComponentDoubleClick_static button, ${ JSON.stringify(button)}`);
        expect(button != null).assertTrue()
        if (button != null) {
          await button.doubleClick();
          hilog.info(domain, tag, `testUiComponentDoubleClick_static longClick`);
          let newButton = await driver.findComponent(ON.text('doubleClick'));
          hilog.info(domain, tag, `testUiComponentDoubleClick_static newButton, ${ JSON.stringify(newButton)} }`);
          expect(newButton != null).assertTrue();
          await driver.delayMs(1000);
          if (newButton) {
            let text = await newButton.getText();
            hilog.info(domain, tag, `testUiComponentDoubleClick_static text, ${ JSON.stringify(text)} }`);
            expect(text == 'doubleClick').assertTrue();
          }
        }
      } catch(error) {
        hilog.info(domain, tag, `testUiComponentDoubleClick_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testUiComponentDoubleClick_static over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testUiComponentClick_static
     * @tc.number uitestComponentTest_0016
     * @tc.desc   click this UiComponentClick.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUiComponentClick_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testUiComponentClick_static start`);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let button = await driver.findComponent(ON.text('next page'));
        expect(button != null).assertTrue()
        // 点击页面中的next page 按钮。
        if (button != null) {
          await button.click();
        }
        let newButton = await driver.findComponent(ON.text('back to index'));
        hilog.info(domain, tag, `testUiComponentClick_static newButton, ${ JSON.stringify(newButton) }`);
        expect(newButton != null);
        if (newButton != null) {
          let text = await newButton.getText();
          hilog.info(domain, tag, `testUiComponentClick_static text, ${ JSON.stringify(text) }`);
          expect(text == 'back to index').assertTrue()
        }
      } catch(error) {
        hilog.info(domain, tag, `testUiComponentClick_static error, ${ error }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testUiComponentClick_static end`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testComponentInputText_static
     * @tc.number uitestComponentTest_0017
     * @tc.desc   enter '123',the values of both paste and addition are false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentInputText_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testComponentInputText_static start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver.delayMs(2000)
        let text = await driver.findComponent(ON.type('TextInput'))
        if (text == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'))
          if (scorll != null) {
            text = await scorll.scrollSearch(ON.type('TextInput'))
          }
        }
        hilog.info(domain, tag, `testComponentInputText_static text, ${JSON.stringify(text)}`);
        expect(text != null).assertTrue()
        if (text != null) {
          await text.inputText('123', {paste:false, addition:false})
        }
        await driver.delayMs(2000)
        await exitInputMethod()
        await driver.delayMs(2000)
        let text1 = await driver.findComponent(ON.type('TextInput'))
        if (text1 == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'))
          if (scorll != null) {
            text1 = await scorll.scrollSearch(ON.type('TextInput'))
          }
        }
        hilog.info(domain, tag, `testComponentInputText_static text1, ${JSON.stringify(text1)}`);
        expect(text1 != null).assertTrue()
        if (text1 != null) {
          let msg = await text1.getText();
          hilog.info(domain, tag, `testComponentInputText_static msg, ${JSON.stringify(msg)}`);
          expect(msg == '123').assertTrue()
        }
      } catch(error) {
        hilog.info(domain, tag, `testComponentInputText_static error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, `testComponentInputText_static end`);
    })

    /**
     * @tc.name   testComponentInputText1_static
     * @tc.number uitestComponentTest_0018
     * @tc.desc   enter '长贵儿',the values of both paste and addition are false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentInputText1_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testComponentInputText1_static start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver.delayMs(2000)
        let text = await driver.findComponent(ON.type('TextInput'))
        if (text == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'))
          if (scorll != null) {
            text = await scorll.scrollSearch(ON.type('TextInput'))
          }
        }
        hilog.info(domain, tag, `testComponentInputText1_static text, ${JSON.stringify(text)}`);
        expect(text != null).assertTrue()
        if (text != null) {
          await text.clearText()
        }
        await driver.delayMs(2000)
        await exitInputMethod()
        await driver.delayMs(2000)
        text = await driver.findComponent(ON.type('TextInput'))
        if (text == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'))
          if (scorll != null) {
            text = await scorll.scrollSearch(ON.type('TextInput'))
          }
        }
        hilog.info(domain, tag, `testComponentInputText1_static text, ${JSON.stringify(text)}`);
        expect(text != null).assertTrue()
        if (text != null) {
          await text.inputText('长贵儿', {paste:false, addition:false})
        }
        await driver.delayMs(2000)
        await exitInputMethod()
        await driver.delayMs(2000)
        let text1 = await driver.findComponent(ON.type('TextInput'))
        if (text1 == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'))
          if (scorll != null) {
            text1 = await scorll.scrollSearch(ON.type('TextInput'))
          }
        }
        hilog.info(domain, tag, `testComponentInputText1_static text1, ${JSON.stringify(text1)}`);
        expect(text1 != null).assertTrue()
        if (text1 != null) {
          let msg = await text1.getText();
          hilog.info(domain, tag, `testComponentInputText1_static msg, ${JSON.stringify(msg)}`);
          expect(msg == '长贵儿').assertTrue()
        }
      } catch(error) {
        hilog.info(domain, tag, `testComponentInputText1_static error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, `testComponentInputText1_static end`);
    })

    /**
     * @tc.name   testComponentInputText2_static
     * @tc.number uitestComponentTest_0019
     * @tc.desc   enter '123',the values of paste is true,the values of addition is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentInputText2_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testComponentInputText2_static start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver.delayMs(2000)
        let text = await driver.findComponent(ON.type('TextInput'))
        if (text == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'))
          if (scorll != null) {
            text = await scorll.scrollSearch(ON.type('TextInput'))
          }
        }
        hilog.info(domain, tag, `testComponentInputText2_static text, ${JSON.stringify(text)}`);
        expect(text != null).assertTrue()
        if (text != null) {
          await text.clearText()
        }
        await driver.delayMs(2000)
        await exitInputMethod()
        await driver.delayMs(2000)
        text = await driver.findComponent(ON.type('TextInput'))
        if (text == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'))
          if (scorll != null) {
            text = await scorll.scrollSearch(ON.type('TextInput'))
          }
        }
        hilog.info(domain, tag, `testComponentInputText2_static text, ${JSON.stringify(text)}`);
        expect(text != null).assertTrue()
        if (text != null) {
          await text.inputText('123', {paste:true, addition:false})
          await driver.delayMs(2000)
        }
        await exitInputMethod()
        await driver.delayMs(2000)
        let text1 = await driver.findComponent(ON.type('TextInput'))
        if (text1 == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'))
          if (scorll != null) {
            text1 = await scorll.scrollSearch(ON.type('TextInput'))
          }
        }
        hilog.info(domain, tag, `testComponentInputText2_static text1, ${JSON.stringify(text1)}`);
        expect(text1 != null).assertTrue()
        if (text1 != null) {
          let msg = await text1.getText();
          hilog.info(domain, tag, `testComponentInputText2_static msg, ${JSON.stringify(msg)}`);
          expect(msg == '123').assertTrue()
        }
      } catch(error) {
        hilog.info(domain, tag, `testComponentInputText2_static error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, `testComponentInputText2_static end`);
    })

    /**
     * @tc.name   testComponentInputText3_static
     * @tc.number uitestComponentTest_0020
     * @tc.desc   enter '123',the values of paste is false,the values of addition is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentInputText3_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testComponentInputText3_static start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver.delayMs(2000)
        let text = await driver.findComponent(ON.type('TextInput'))
        if (text == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'))
          if (scorll != null) {
            text = await scorll.scrollSearch(ON.type('TextInput'))
          }
        }
        hilog.info(domain, tag, `testComponentInputText3_static text, ${JSON.stringify(text)}`);
        expect(text != null).assertTrue()
        if (text != null) {
          await text.inputText('123', {paste:false, addition:true})
        }
        await driver.delayMs(2000)
        await exitInputMethod()
        await driver.delayMs(2000)
        let text1 = await driver.findComponent(ON.type('TextInput'))
        if (text1 == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'))
          if (scorll != null) {
            text1 = await scorll.scrollSearch(ON.type('TextInput'))
          }
        }
        hilog.info(domain, tag, `testComponentInputText3_static text1, ${JSON.stringify(text1)}`);
        expect(text1 != null).assertTrue()
        if (text1 != null) {
          let msg = await text1.getText();
          hilog.info(domain, tag, `testComponentInputText3_static msg, ${JSON.stringify(msg)}`);
          expect(msg == 'Hello World123').assertTrue()
        }
      } catch(error) {
        hilog.info(domain, tag, `testComponentInputText3_static error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, `testComponentInputText3_static end`);
    })

    /**
     * @tc.name   testComponentInputText4_static
     * @tc.number uitestComponentTest_0021
     * @tc.desc   enter '123',the values of paste is true,the values of addition is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentInputText4_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testComponentInputText4_static start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver.delayMs(2000)
        let text = await driver.findComponent(ON.type('TextInput'))
        if (text == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'))
          if (scorll != null) {
            text = await scorll.scrollSearch(ON.type('TextInput'))
          }
        }
        hilog.info(domain, tag, `testComponentInputText4_static text, ${JSON.stringify(text)}`);
        expect(text != null).assertTrue()
        if (text != null) {
          await text.inputText('123', {paste:true, addition:true})
        }
        await driver.delayMs(2000)
        await exitInputMethod()
        await driver.delayMs(2000)
        let text1 = await driver.findComponent(ON.type('TextInput'))
        if (text1 == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'))
          if (scorll != null) {
            text1 = await scorll.scrollSearch(ON.type('TextInput'))
          }
        }
        hilog.info(domain, tag, `testComponentInputText4_static text1, ${JSON.stringify(text1)}`);
        expect(text1 != null).assertTrue()
        if (text1 != null) {
          let msg = await text1.getText();
          hilog.info(domain, tag, `testComponentInputText4_static msg, ${JSON.stringify(msg)}`);
          expect(msg == 'Hello World123').assertTrue()
        }
      } catch(error) {
        hilog.info(domain, tag, `testComponentInputText4_static error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, `testComponentInputText4_static end`);
    })
  })
}