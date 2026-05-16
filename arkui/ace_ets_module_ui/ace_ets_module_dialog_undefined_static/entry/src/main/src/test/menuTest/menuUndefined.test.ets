'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, ON, Point, UiWindow, WindowMode } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';
import window from '@ohos.window';
import common from '@ohos.app.ability.common';

export default function menuUndefinedTest() {
  describe('menuUndefinedTest', () => {
    beforeAll(async ():Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.dialog.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("menuUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/menu/menuUndefined",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get menuUndefined state pages:" + JSON.stringify(pages));
        if (!("menuUndefined" == pages.name)) {
          console.info("get menuUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push menuUndefined page error:" + err);
      }
      console.info("menuUndefined beforeEach end");
    });

    /**
     * @tc.number    menuUndefinedTest_static_0100
     * @tc.name      menuUndefinedTest_static_0100
     * @tc.desc      menuUndefinedTest_static_0100
     * @tc.level     Level.LEVEL0
     */
    it('menuUndefinedTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuUndefinedTest_static_0100] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('menu');
      let menuItemDividerValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('itemDivider').getElement('strokeWidth');
      console.info('$menuItemDivider: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('itemDivider').getElement('strokeWidth')));
      expect(menuItemDividerValue.asString()).assertEqual('1.50vp');

      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('menu_menuItemDivider')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('menu');
      let menuItemDividerValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('itemDivider').getElement('strokeWidth');
      console.info('$menuItemDivider: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('itemDivider').getElement('strokeWidth')));
      expect(menuItemDividerValue1.asString()).assertEqual('0.00px');

      console.info('[menuUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number    menuUndefinedTest_static_0200
     * @tc.name      menuUndefinedTest_static_0200
     * @tc.desc      menuUndefinedTest_static_0200
     * @tc.level     Level.LEVEL0
     */
    it('menuUndefinedTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuUndefinedTest_static_0200] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('menu');
      let menuItemGroupDividerValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('itemGroupDivider').getElement('strokeWidth');
      console.info('$menuItemGroupDivider: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('itemGroupDivider').getElement('strokeWidth')));
      expect(menuItemGroupDividerValue.asString()).assertEqual('7.00vp');

      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('menu_menuItemGroupDivider')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('menu');
      let menuItemGroupDividerValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('itemGroupDivider').getElement('strokeWidth');
      console.info('$menuItemGroupDivider: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('itemGroupDivider').getElement('strokeWidth')));
      expect(menuItemGroupDividerValue1.asString()).assertEqual('0.00px');

      console.info('[menuUndefinedTest_static_0200] END');
      done();
    });

    /**
     * @tc.number    menuUndefinedTest_static_0300
     * @tc.name      menuUndefinedTest_static_0300
     * @tc.desc      menuUndefinedTest_static_0300
     * @tc.level     Level.LEVEL0
     */
    it('menuUndefinedTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuUndefinedTest_static_0300] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('menu');
      let subMenuExpandingModeValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('subMenuExpandingMode');
      console.info('$subMenuExpandingMode: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('subMenuExpandingMode')));
      expect(subMenuExpandingModeValue.asString()).assertEqual('SubMenuExpandingMode.EMBEDDED');

      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('menu_subMenuExpandingMode')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('menu');
      let subMenuExpandingModeValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('subMenuExpandingMode');
      console.info('$subMenuExpandingMode: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('subMenuExpandingMode')));
      expect(subMenuExpandingModeValue1.asString()).assertEqual('SubMenuExpandingMode.SIDE');

      console.info('[menuUndefinedTest_static_0300] END');
      done();
    });

    /**
     * @tc.number    menuUndefinedTest_static_0400
     * @tc.name      menuUndefinedTest_static_0400
     * @tc.desc      menuUndefinedTest_static_0400
     * @tc.level     Level.LEVEL0
     */
    it('menuUndefinedTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuUndefinedTest_static_0400] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('menu');
      let radiusValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('borderRadius').getElement('topLeft');
      console.info('$radius: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('borderRadius').getElement('topLeft')));
      expect(radiusValue.asString()).assertEqual('10.00vp');

      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('menu_radius')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('menu');
      let radiusValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('borderRadius').getElement('topLeft');
      console.info('$radius: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('borderRadius').getElement('topLeft')));
      expect(radiusValue1.asString()).assertEqual('10.00vp');

      console.info('[menuUndefinedTest_static_0400] END');
      done();
    });

    /**
     * @tc.number    menuUndefinedTest_static_0500
     * @tc.name      menuUndefinedTest_static_0500
     * @tc.desc      menuUndefinedTest_static_0500
     * @tc.level     Level.LEVEL0
     */
    it('menuUndefinedTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuUndefinedTest_static_0500] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('menu');
      let fontValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('font').getElement('size');
      console.info('$font: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('font').getElement('size')));
      expect(fontValue.asString()).assertEqual('16.00fp');

      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('menu_font')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('menu');
      let fontValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('font').getElement('size');
      console.info('$font: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('font').getElement('size')));
      expect(fontValue1.asString()).assertEqual('20.00fp');

      console.info('[menuUndefinedTest_static_0500] END');
      done();
    });

    /**
     * @tc.number    menuUndefinedTest_static_0600
     * @tc.name      menuUndefinedTest_static_0600
     * @tc.desc      menuUndefinedTest_static_0600
     * @tc.level     Level.LEVEL0
     */
    it('menuUndefinedTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuUndefinedTest_static_0600] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('menu');
      let fontColor = JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor');

      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('menu_fontColor')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      strJson = inspector.getInspectorByKey('menu');
      let fontColorValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fontColor');
      console.info('$fontColor: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fontColor')));
      expect(fontColorValue.asString()).assertEqual('#FFFF7777');

      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('menu');
      let fontColorValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('fontColor');
      console.info('$fontColor: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('fontColor')));
      expect(fontColorValue1.asString()).assertEqual(fontColor);

      console.info('[menuUndefinedTest_static_0600] END');
      done();
    });
  })
}