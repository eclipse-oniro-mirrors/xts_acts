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
import { Component, Driver, ON, On, MatchPattern,Point, Rect, MouseButton, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation } from '@ohos.UiTest'
import  hilog  from '@ohos.hilog'
import { Utils, startAbility, stopApplication } from './Util.test';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const waitUiReadyMs : number = 1000;
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


    /*
     * @tc.number: UiTest_API16_018
     * @tc.name: testScrollSearchHorizontal_static
     * @tc.desc: scroll horizontally on this UiComponent to find matched UiComponent.
     */
    it('testScrollSearchHorizontal_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testScrollSearchHorizontal_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.text('scroll'))
      await driver.delayMs(waitUiReadyMs);
      expect(button != null).assertTrue();
      if (button != null) {
        await button.click();
      }
      await driver.delayMs(waitUiReadyMs);
      let cover = await driver.findComponent(ON.text('Offset Start'))
      expect(cover != null).assertTrue();
      if (cover != null) {
        let coverRect = await cover.getBounds()
        let coverWidth = coverRect.right - coverRect.left;
        hilog.info(domain, tag, `testScrollSearchHorizontal_static coverWidth= ${coverWidth}`);
        let scrollBar = await driver.findComponent(ON.id('horizontalScroll'));
        expect(scrollBar != null).assertTrue();
        if (scrollBar != null) {
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
          expect(text3 != null).assertTrue();
          if (text3 != null) {
            let msg3 = await text3.getText();
            expect(msg3).assertEqual('2');
          }
          await driver.delayMs(waitUiReadyMs);
          let text4 = await scrollBar.scrollSearch(ON.text('8'), false, Math.floor(coverWidth * 1.2));
          await driver.delayMs(waitUiReadyMs);
          expect(text4 != null).assertTrue();
          if (text4 != null) {
            let msg4 = await text4.getText();
            expect(msg4).assertEqual('8');
          }
          await driver.delayMs(waitUiReadyMs);
        }
      }
      hilog.info(domain, tag, `testScrollSearchHorizontal_static end`);
      await stopApplication('com.uitestScene.acts');
    })

    /*
    * @tc.number: uitestComponentTest_0014
    * @tc.name: testDragTo_static
    * @tc.desc: drag this UiComponent to the bounds rect of target UiComponent.
    */
    it('testDragTo_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testDragTo_static start`);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let button = await driver.findComponent(ON.id('jump'));
        hilog.info(domain, tag, `testDragTo_static button, ${JSON.stringify(button)}`);
        expect(button != null).assertTrue()
        if (button != null) {
          await button.longClick();
          hilog.info(domain, tag, `testDragTo_static longClick`);
        }
        await driver.delayMs(1000);
        let text1 = await driver.findComponent(ON.text('one'));
        hilog.info(domain, tag, `testDragTo_static text1, ${JSON.stringify(text1)}`);
        expect(text1 != null).assertTrue()
        let text2 = await driver.findComponent(ON.text('two'));
        hilog.info(domain, tag, `testDragTo_static text2, ${JSON.stringify(text2)}`);
        expect(text2 != null).assertTrue()
        if (text1 != null && text2 != null) {
          await text1.dragTo(text2);
          hilog.info(domain, tag, `testDragTo_static dragTo`);
          let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
          hilog.info(domain, tag, `testDragTo_static text, ${JSON.stringify(text)}`);
          expect(text == null).assertTrue()
        }
        await driver.delayMs(1000);
      } catch(error) {
        hilog.info(domain, tag, `testDragTo_static error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testDragTo_static end`);
      await stopApplication('com.uitestScene.acts');
    })
  })
}