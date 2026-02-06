/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { KeyCode } from '@kit.InputKit';

export default function RichEditorStabillity003() {
  describe('RichEditorStabillity003', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorStabillity/RichEditorStabillity003',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorStabillity003 state pages: " + JSON.stringify(pages));
        if (!("RichEditorStabillity003" == pages.name)) {
          console.info("get RichEditorStabillity003 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorStabillity003 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorStabillity003 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0004
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0004
     * @tc.desc   Continuously click on RichEditor to test RichEditor Stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0004',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0004 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorStabillity003'));
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(200);
      await driver.click(getBounds.left + 30, getBounds.top + 30);
      await CommonFunc.sleep(200);
      let getPosition = await driver.findComponent(ON.id('getPosition'));
      await getPosition.click();
      await CommonFunc.sleep(200);
      let pointPosition = await driver.findComponent(ON.id('pointPosition'));
      let pointPositionText = await pointPosition.getText();
      await CommonFunc.sleep(200);
      await driver.click(getBounds.left + 60, getBounds.top + 30);
      await CommonFunc.sleep(200);
      await getPosition.click();
      await CommonFunc.sleep(200);
      pointPositionText = await pointPosition.getText();
      await CommonFunc.sleep(200);
      await driver.click(getBounds.left + 90, getBounds.top + 30);
      await CommonFunc.sleep(200);
      await getPosition.click();
      await CommonFunc.sleep(200);
      pointPositionText = await pointPosition.getText();
      await CommonFunc.sleep(200);
      await driver.click(getBounds.left + 120, getBounds.top + 30);
      await CommonFunc.sleep(200);
      await getPosition.click();
      await CommonFunc.sleep(200);
      pointPositionText = await pointPosition.getText();
      await CommonFunc.sleep(200);
      await driver.click(getBounds.left + 150, getBounds.top + 30);
      await CommonFunc.sleep(200);
      await getPosition.click();
      await CommonFunc.sleep(200);
      pointPositionText = await pointPosition.getText();
      await CommonFunc.sleep(200);
      await driver.click(getBounds.left + 180, getBounds.top + 30);
      await CommonFunc.sleep(200);
      await getPosition.click();
      await CommonFunc.sleep(200);
      pointPositionText = await pointPosition.getText();
      await CommonFunc.sleep(200);
      await driver.click(getBounds.left + 210, getBounds.top + 30);
      await CommonFunc.sleep(200);
      await getPosition.click();
      await CommonFunc.sleep(200);
      pointPositionText = await pointPosition.getText();
      await CommonFunc.sleep(200);
      expect(pointPositionText != '').assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0005
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0005
     * @tc.desc   Double click RichEditor continuously to test RichEditor Stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0005',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0005 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorStabillity003'));
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(200);
      await driver.doubleClick(getBounds.left + 30, getBounds.top + 30);
      await CommonFunc.sleep(400);
      let getPosition = await driver.findComponent(ON.id('getPosition'));
      await getPosition.click();
      await CommonFunc.sleep(300);
      let pointPosition = await driver.findComponent(ON.id('pointPosition'));
      let pointPositionText = await pointPosition.getText();
      await CommonFunc.sleep(300);
      await driver.doubleClick(getBounds.left + 60, getBounds.top + 30);
      await CommonFunc.sleep(400);
      await getPosition.click();
      await CommonFunc.sleep(300);
      pointPositionText = await pointPosition.getText();
      await CommonFunc.sleep(300);
      await driver.doubleClick(getBounds.left + 90, getBounds.top + 30);
      await CommonFunc.sleep(400);
      await getPosition.click();
      await CommonFunc.sleep(300);
      pointPositionText = await pointPosition.getText();
      await CommonFunc.sleep(300);
      await driver.doubleClick(getBounds.left + 120, getBounds.top + 30);
      await CommonFunc.sleep(400);
      await getPosition.click();
      await CommonFunc.sleep(300);
      pointPositionText = await pointPosition.getText();
      await CommonFunc.sleep(300);
      await driver.doubleClick(getBounds.left + 150, getBounds.top + 30);
      await CommonFunc.sleep(400);
      await getPosition.click();
      await CommonFunc.sleep(300);
      pointPositionText = await pointPosition.getText();
      await CommonFunc.sleep(300);
      await driver.doubleClick(getBounds.left + 180, getBounds.top + 30);
      await CommonFunc.sleep(400);
      await getPosition.click();
      await CommonFunc.sleep(300);
      pointPositionText = await pointPosition.getText();
      await CommonFunc.sleep(300);
      await driver.doubleClick(getBounds.left + 210, getBounds.top + 30);
      await CommonFunc.sleep(400);
      await getPosition.click();
      await CommonFunc.sleep(300);
      pointPositionText = await pointPosition.getText();
      await CommonFunc.sleep(300);
      expect(pointPositionText != '').assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0006
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0006
     * @tc.desc   Three consecutive clicks on RichEditor to test RichEditor Stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0006',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0006 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorStabillity003'));
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(200);
      await driver.click(getBounds.left + 90, getBounds.top + 30);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 90, getBounds.top + 30);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 90, getBounds.top + 30);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 190, getBounds.top + 30);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 190, getBounds.top + 30);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 190, getBounds.top + 30);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 190, getBounds.top + 90);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 190, getBounds.top + 90);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 190, getBounds.top + 90);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 190, getBounds.top + 190);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 190, getBounds.top + 190);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 190, getBounds.top + 190);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 190, getBounds.top + 190);
      await CommonFunc.sleep(300);
      let getPosition = await driver.findComponent(ON.id('getPosition'));
      await getPosition.click();
      await CommonFunc.sleep(300);
      let pointPosition = await driver.findComponent(ON.id('pointPosition'));
      let pointPositionText = await pointPosition.getText();
      await CommonFunc.sleep(300);
      expect(pointPositionText != '').assertTrue();
      done();
    });


    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0014
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0014
     * @tc.desc   Double click RichEditor continuously with the mouse to test RichEditor Stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0014',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0014 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorStabillity003'));
      let center = await rich.getBoundsCenter();
      await CommonFunc.sleep(200);
      await driver.doubleClick(center.x, center.y);
      await CommonFunc.sleep(500);
      await driver.doubleClick(center.x, center.y);
      await CommonFunc.sleep(500);
      await driver.doubleClick(center.x, center.y);
      await CommonFunc.sleep(500)
      await driver.doubleClick(center.x, center.y);
      await CommonFunc.sleep(500)
      await driver.doubleClick(center.x, center.y);
      await CommonFunc.sleep(500)
      let getPosition = await driver.findComponent(ON.id('getPosition'));
      await getPosition.click();
      await CommonFunc.sleep(300);
      let pointPosition = await driver.findComponent(ON.id('pointPosition'));
      let pointPositionText = await pointPosition.getText();
      await CommonFunc.sleep(300);
      expect(pointPositionText != '').assertTrue();
      done();
    });

  })
}


