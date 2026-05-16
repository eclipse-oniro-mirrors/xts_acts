/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function SelectionMenuOptionsTest() {
  describe('SelectionMenuOptionsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SelectionMenuOptions beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi15/SelectionMenuOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SelectionMenuOptions state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("SelectionMenuOptions" == pages.name)) {
          console.info("get SelectionMenuOptions state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push SelectionMenuOptions page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SelectionMenuOptions page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SelectionMenuOptions after each called");
    });

    /**
     * @tc.name   SelectionMenuOptions0001
     * @tc.number SelectionMenuOptions0001
     * @tc.desc   Test Text by mouseClick
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SelectionMenuOptions0001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('SelectionMenuOptions SelectionMenuOptions0001 START');
      await CommonFunc.sleep(1000);
      let update = await driver.findComponent(ON.id('update'))
      await CommonFunc.sleep(500);
      await update.click();
      await CommonFunc.sleep(500);
      let richEditor = await driver.findComponent(ON.id('richEditor_SelectionMenu'))
      await CommonFunc.sleep(500);
      let point = await richEditor.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT);
      await CommonFunc.sleep(500);
      await driver.assertComponentExist(ON.text('自定义菜单'));
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('richEditor_SelectionMenu');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SelectionMenuOptions0001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(500);
      expect(obj.$type).assertEqual('RichEditor');
      console.info("[SelectionMenuOptions0001] end");
      done();
    });

    /**
     * @tc.name   SelectionMenuOptions0002
     * @tc.number SelectionMenuOptions0002
     * @tc.desc   Test Text by longClick
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SelectionMenuOptions0002', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('SelectionMenuOptions SelectionMenuOptions0002 START');
      await CommonFunc.sleep(1000);
      let update = await driver.findComponent(ON.id('update'))
      await CommonFunc.sleep(500);
      await update.click();
      await CommonFunc.sleep(500);
      let richEditor = await driver.findComponent(ON.id('richEditor_SelectionMenu'))
      await CommonFunc.sleep(500);
      await richEditor.longClick();
      await CommonFunc.sleep(500);
      await driver.assertComponentExist(ON.text('自定义菜单'));
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('richEditor_SelectionMenu');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SelectionMenuOptions0002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(500);
      expect(obj.$type).assertEqual('RichEditor');
      console.info("[SelectionMenuOptions0002] end");
      done();
    });


    /**
     * @tc.name   SelectionMenuOptions0004
     * @tc.number SelectionMenuOptions0004
     * @tc.desc   Test image text by mouseClick
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SelectionMenuOptions0004', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('SelectionMenuOptions SelectionMenuOptions0004 START');
      await CommonFunc.sleep(1000);
      let update = await driver.findComponent(ON.id('update'))
      await CommonFunc.sleep(500);
      await update.click();
      await CommonFunc.sleep(500);
      let image = await driver.findComponent(ON.id('image'))
      await CommonFunc.sleep(500);
      let point = await image.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT);
      await CommonFunc.sleep(500);
      await driver.assertComponentExist(ON.text('自定义菜单'));
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('image');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SelectionMenuOptions0004] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(500);
      expect(obj.$type).assertEqual('RichEditor');
      console.info("[SelectionMenuOptions0004] end");
      done();
    });

    /**
     * @tc.name   SelectionMenuOptions0005
     * @tc.number SelectionMenuOptions0005
     * @tc.desc   Test image text by longClick
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SelectionMenuOptions0005', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('SelectionMenuOptions0005 START');
      await CommonFunc.sleep(1000);
      let update = await driver.findComponent(ON.id('update'))
      await CommonFunc.sleep(500);
      await update.click();
      await CommonFunc.sleep(500);
      let image = await driver.findComponent(ON.id('image'))
      await CommonFunc.sleep(500);
      await image.longClick();
      await CommonFunc.sleep(500);
      await driver.assertComponentExist(ON.text('自定义菜单'));
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('image');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SelectionMenuOptions0005] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(500);
      expect(obj.$type).assertEqual('RichEditor');
      console.info("[SelectionMenuOptions0005] end");
      done();
    });

    /**
     * @tc.name   SelectionMenuOptions0007
     * @tc.number SelectionMenuOptions0007
     * @tc.desc   Test mixed Text by mouseClick
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SelectionMenuOptions0007', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('SelectionMenuOptions SelectionMenuOptions0007 START');
      await CommonFunc.sleep(1000);
      let update = await driver.findComponent(ON.id('update'))
      await CommonFunc.sleep(500);
      await update.click();
      await CommonFunc.sleep(500);
      let mixed = await driver.findComponent(ON.id('mixed'))
      await CommonFunc.sleep(500);
      let point = await mixed.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT);
      await CommonFunc.sleep(500);
      await driver.assertComponentExist(ON.text('自定义菜单'));
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('image');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SelectionMenuOptions0007] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(500);
      expect(obj.$type).assertEqual('RichEditor');
      console.info("[SelectionMenuOptions0007] end");
      done();
    });

    /**
     * @tc.name   SelectionMenuOptions0008
     * @tc.number SelectionMenuOptions0008
     * @tc.desc   Test mixed Text by longClick
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SelectionMenuOptions0008', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('SelectionMenuOptions SelectionMenuOptions0008 START');
      await CommonFunc.sleep(1000);
      let update = await driver.findComponent(ON.id('update'))
      await CommonFunc.sleep(500);
      await update.click();
      await CommonFunc.sleep(500);
      let mixed = await driver.findComponent(ON.id('mixed'))
      await CommonFunc.sleep(500);
      await mixed.longClick();
      await CommonFunc.sleep(500);
      await driver.assertComponentExist(ON.text('自定义菜单'));
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('mixed');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SelectionMenuOptions0008] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(500);
      expect(obj.$type).assertEqual('RichEditor');
      console.info("[SelectionMenuOptions0008] end");
      done();
    });
  })
}