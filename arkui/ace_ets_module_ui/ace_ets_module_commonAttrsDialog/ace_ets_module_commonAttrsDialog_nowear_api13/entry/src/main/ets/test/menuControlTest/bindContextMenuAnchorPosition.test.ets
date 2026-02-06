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
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';

export default function bindContextMenuAnchorPosition() {
  describe('bindContextMenuAnchorPosition', () => {
    beforeEach(async (done: Function) => {
      console.info("bindContextMenuAnchorPosition beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/menuControl/bindContextMenuAnchorPosition',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get bindContextMenuAnchorPosition state pages: " + JSON.stringify(pages));
        if (!("bindContextMenuAnchorPosition" == pages.name)) {
          console.info("get bindContextMenuAnchorPosition state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push bindContextMenuAnchorPosition success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push bindContextMenuAnchorPosition page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   bindContextMenuAnchorPosition_0100
     * @tc.number SUB_ACE_bindContextMenuAnchorPosition_0100
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('bindContextMenuAnchorPosition_0100', Level.LEVEL0, async (done: Function) => {
      console.info('bindContextMenuAnchorPosition_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('bindContextMenuAnchorPosition1'));
      await button.longClick();
      await CommonFunc.sleep(3000);

      let menu = await driver.findComponent(ON.id('Options'));
      await menu.click();
      await CommonFunc.sleep(2000);
      let text1 = await driver.findComponent(ON.id('menuPositionX'));
      let menuPositionX = Number.parseFloat(await text1.getText());

      let text2 = await driver.findComponent(ON.id('menuPositionY'));
      let menuPositionY = Number.parseFloat(await text2.getText());

      let text3 = await driver.findComponent(ON.id('textPositionX1'));
      let textPositionX = Number.parseFloat(await text3.getText());

      let text4 = await driver.findComponent(ON.id('textPositionY1'));
      let textPositionY = Number.parseFloat(await text4.getText());
      expect(textPositionX).assertLess(menuPositionX)
      expect(textPositionY).assertLess(menuPositionY)
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuAnchorPosition_0100] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuAnchorPosition_0200
     * @tc.number SUB_ACE_bindContextMenuAnchorPosition_0200
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('bindContextMenuAnchorPosition_0200', Level.LEVEL0, async (done: Function) => {
      console.info('bindContextMenuAnchorPosition_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('bindContextMenuAnchorPosition2'));
      await button.longClick();
      await CommonFunc.sleep(3000);

      let menu = await driver.findComponent(ON.id('Options'));
      await menu.click();
      await CommonFunc.sleep(2000);

      let text1 = await driver.findComponent(ON.id('menuPositionX'));
      let menuPositionX = Number.parseFloat(await text1.getText());

      let text2 = await driver.findComponent(ON.id('menuPositionY'));
      let menuPositionY = Number.parseFloat(await text2.getText());

      let text3 = await driver.findComponent(ON.id('textPositionX2'));
      let textPositionX = Number.parseFloat(await text3.getText());

      let text4 = await driver.findComponent(ON.id('textPositionY2'));
      let textPositionY = Number.parseFloat(await text4.getText());
      expect(textPositionY).assertLess(menuPositionY)

      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuAnchorPosition_0200] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuAnchorPosition_0300
     * @tc.number SUB_ACE_bindContextMenuAnchorPosition_0300
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('bindContextMenuAnchorPosition_0300', Level.LEVEL0, async (done: Function) => {
      console.info('bindContextMenuAnchorPosition_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('bindContextMenuAnchorPosition3'));
      await button.longClick();
      await CommonFunc.sleep(3000);

      let menu = await driver.findComponent(ON.id('Options'));
      await menu.click();
      await CommonFunc.sleep(2000);
      let text1 = await driver.findComponent(ON.id('menuPositionX'));
      let menuPositionX = Number.parseFloat(await text1.getText());

      let text2 = await driver.findComponent(ON.id('menuPositionY'));
      let menuPositionY = Number.parseFloat(await text2.getText());

      let text3 = await driver.findComponent(ON.id('textPositionX3'));
      let textPositionX = Number.parseFloat(await text3.getText());

      let text4 = await driver.findComponent(ON.id('textPositionY3'));
      let textPositionY = Number.parseFloat(await text4.getText());
      expect(menuPositionX).assertLess(textPositionX)
      expect(textPositionY).assertLess(menuPositionY)

      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuAnchorPosition_0300] END');
      done();
    });
  })
}

