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

export default function menuItemUndefinedTest() {
  describe('menuItemUndefinedTest', () => {
    beforeAll(async ():Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.dialog.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("menuItemUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/menuItem/menuItemUndefined",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get menuItemUndefined state pages:" + JSON.stringify(pages));
        if (!("menuItemUndefined" == pages.name)) {
          console.info("get menuItemUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push menuItemUndefined page error:" + err);
      }
      console.info("menuItemUndefined beforeEach end");
    });

    /**
     * @tc.number    menuItemUndefinedTest_static_0100
     * @tc.name      menuItemUndefinedTest_static_0100
     * @tc.desc      menuItemUndefinedTest_static_0100
     * @tc.level     Level.LEVEL0
     */
    it('menuItemUndefinedTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuItemUndefinedTest_static_0100] START.');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let menuItem = await (driver.findComponent(ON.id('menuItem1')) as Promise<Component>);
      let re = await menuItem.isSelected();
      expect(re).assertEqual(true);
      await CommonFunc.sleep(2000);

      let btn = await driver.findComponent(ON.id('menuItem_selected')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      let menuItem1 = await (driver.findComponent(ON.id('menuItem1')) as Promise<Component>);
      let re1 = await menuItem.isSelected();
      expect(re1).assertEqual(false);

      console.info('[menuItemUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number    menuItemUndefinedTest_static_0200
     * @tc.name      menuItemUndefinedTest_static_0200
     * @tc.desc      menuItemUndefinedTest_static_0200
     * @tc.level     Level.LEVEL0
     */
    it('menuItemUndefinedTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuItemUndefinedTest_static_0200] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('menuItem1');
      let selectIconValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectIcon');
      console.info('$selectIcon: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectIcon')));
      expect(selectIconValue.asString()).assertEqual('true');

      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('menuItem_selectIcon')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('menuItem1');
      let selectIconValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('selectIcon');
      console.info('$selectIcon: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('selectIcon')));
      expect(selectIconValue1.asString()).assertEqual('true');

      console.info('[menuItemUndefinedTest_static_0200] END');
      done();
    });
    
    /**
     * @tc.number    menuItemUndefinedTest_static_0300
     * @tc.name      menuItemUndefinedTest_static_0300
     * @tc.desc      menuItemUndefinedTest_static_0300
     * @tc.level     Level.LEVEL0
     */
    it('menuItemUndefinedTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuItemUndefinedTest_static_0300] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('menuItem2');
      let contentFontValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('contentFont').getElement('size');
      console.info('$contentFont: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('contentFont').getElement('size')));
      expect(contentFontValue.asString()).assertEqual('20.00fp');

      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('menuItem_contentFont')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('menuItem2');
      let contentFontValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('contentFont').getElement('size');
      console.info('$contentFont: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('contentFont').getElement('size')));
      expect(contentFontValue1.asString()).assertEqual('16.00fp');

      console.info('[menuItemUndefinedTest_static_0300] END');
      done();
    });

    /**
     * @tc.number    menuItemUndefinedTest_static_0400
     * @tc.name      menuItemUndefinedTest_static_0400
     * @tc.desc      menuItemUndefinedTest_static_0400
     * @tc.level     Level.LEVEL0
     */
    it('menuItemUndefinedTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuItemUndefinedTest_static_0400] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('menuItem2');
      let contentFontColorValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('contentFontColor');
      console.info('$contentFontColor: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('contentFontColor')));
      expect(contentFontColorValue.asString()).assertEqual('#FFFF7777');

      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('menuItem_contentFontColor')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      let originJson = inspector.getInspectorByKey('menuItemOrigin');
      let origin = JSON.parseJsonElement(originJson);
      let originContentFontColor = JSON.stringifyJsonElement(origin.getElement('$attrs').getElement('contentFontColor'));

      let strJson1 = inspector.getInspectorByKey('menuItem2');
      console.info('$contentFontColor: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('contentFontColor')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('contentFontColor'))).assertEqual(originContentFontColor);

      console.info('[menuItemUndefinedTest_static_0400] END');
      done();
    });

    /**
     * @tc.number    menuItemUndefinedTest_static_0500
     * @tc.name      menuItemUndefinedTest_static_0500
     * @tc.desc      menuItemUndefinedTest_static_0500
     * @tc.level     Level.LEVEL0
     */
    it('menuItemUndefinedTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuItemUndefinedTest_static_0500] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('menuItem2');
      let labelFontValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('labelFont').getElement('size');
      console.info('$labelFont: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('labelFont').getElement('size')));
      expect(labelFontValue.asString()).assertEqual('20.00fp');

      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('menuItem_labelFont')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('menuItem2');
      let labelFontValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('labelFont').getElement('size');
      console.info('$labelFont: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('labelFont').getElement('size')));
      expect(labelFontValue1.asString()).assertEqual('16.00fp');

      console.info('[menuItemUndefinedTest_static_0500] END');
      done();
    });

    /**
     * @tc.number    menuItemUndefinedTest_static_0600
     * @tc.name      menuItemUndefinedTest_static_0600
     * @tc.desc      menuItemUndefinedTest_static_0600
     * @tc.level     Level.LEVEL0
     */
    it('menuItemUndefinedTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuItemUndefinedTest_static_0600] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('menuItem2');
      let labelFontColorValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('labelFontColor');
      console.info('$labelFontColor: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('labelFontColor')));
      expect(labelFontColorValue.asString()).assertEqual('#FFFF7777');

      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('menuItem_labelFontColor')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      let originJson = inspector.getInspectorByKey('menuItemOrigin');
      let origin = JSON.parseJsonElement(originJson);
      let originContentFontColor = JSON.stringifyJsonElement(origin.getElement('$attrs').getElement('labelFontColor'));

      let strJson1 = inspector.getInspectorByKey('menuItem2');
      console.info('$labelFontColor: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('labelFontColor')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('labelFontColor'))).assertEqual(originContentFontColor);

      console.info('[menuItemUndefinedTest_static_0600] END');
      done();
    });

    /**
     * @tc.number    menuItemUndefinedTest_static_0700
     * @tc.name      menuItemUndefinedTest_static_0700
     * @tc.desc      menuItemUndefinedTest_static_0700
     * @tc.level     Level.LEVEL0
     */
    it('menuItemUndefinedTest_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuItemUndefinedTest_static_0700] START.');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let menuItem = await (driver.findComponent(ON.id('menuItem2')) as Promise<Component>);
      await menuItem.click();
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('menuItem_OnChange1');
      let onChangeValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content');
      console.info('$onChange: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      expect(onChangeValue.asString()).assertEqual('itemOnChange: 1');

      let btn = await driver.findComponent(ON.id('menuItem_OnChange2')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);
      await menuItem.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('menuItem_OnChange1');
      let onChangeValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content');
      console.info('$onChange: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content')));
      expect(onChangeValue1.asString()).assertEqual('itemOnChange: 1');

      console.info('[menuItemUndefinedTest_static_0700] END');
      done();
    });
  })
}