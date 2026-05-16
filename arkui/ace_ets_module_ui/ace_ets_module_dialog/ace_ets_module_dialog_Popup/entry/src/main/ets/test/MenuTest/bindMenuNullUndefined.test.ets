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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, On, ON, Component, Point } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function bindMenuNullUndefined(){
  describe('bindMenuNullUndefined', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/bindMenuNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get bindMenuNullUndefined state pages: " + JSON.stringify(pages));
        if (!("bindMenuNullUndefined" == pages.name)) {
          console.info("get bindMenuNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);

          let driver: Driver = Driver.create();
          let menuText = await driver.findComponent(ON.text('菜单1'));
          console.info("bindMenuNullUndefined beforeEach menuText: " + menuText);
          await menuText?.click();
          await CommonFunc.sleep(2000);
          console.info("push bindMenuNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push bindMenuNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });

    // ========== bindMenu tests ==========
    /**
     * @tc.name   bindMenuNullUndefined_0100
     * @tc.number bindMenuNullUndefined_0100
     * @tc.desc   Test bindMenu content property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindMenuNullUndefined_0100', Level.LEVEL1, async (done: Function) => {
      console.info('bindMenuNullUndefined_0100 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let strJson = getInspectorByKey('bindMenu_content_null');
      console.info("[bindMenuNullUndefined_0100] bindMenu is: " + JSON.stringify(JSON.parse(strJson).$attrs.bindMenu));
      expect(JSON.parse(strJson).$attrs.bindMenu).assertEqual(undefined);
      await CommonFunc.sleep(1000);
      console.info('[bindMenuNullUndefined_0100] END');
      done();
    });

    /**
     * @tc.name   bindMenuNullUndefined_0200
     * @tc.number bindMenuNullUndefined_0200
     * @tc.desc   Test bindMenu content property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindMenuNullUndefined_0200', Level.LEVEL1, async (done: Function) => {
      console.info('bindMenuNullUndefined_0200 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let strJson = getInspectorByKey('bindMenu_content_undefined');
      console.info("[bindMenuNullUndefined_0200] bindMenu is: " + JSON.stringify(JSON.parse(strJson).$attrs.bindMenu));
      expect(JSON.parse(strJson).$attrs.bindMenu).assertEqual(undefined);
      await CommonFunc.sleep(1000);
      console.info('[bindMenuNullUndefined_0200] END');
      done();
    });
    
    /**
     * @tc.name   bindMenuNullUndefined_0300
     * @tc.number bindMenuNullUndefined_0300
     * @tc.desc   Test bindMenu content property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindMenuNullUndefined_0300', Level.LEVEL1, async (done: Function) => {
      console.info('bindMenuNullUndefined_0300 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindMenu_options_null'));
      await button.click();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('menuItem_nullUn_1'));
      console.info("bindMenuNullUndefined_0300 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindMenuNullUndefined_0300] END');
      done();
    });

    /**
     * @tc.name   bindMenuNullUndefined_0400
     * @tc.number bindMenuNullUndefined_0400
     * @tc.desc   Test bindMenu content property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindMenuNullUndefined_0400', Level.LEVEL1, async (done: Function) => {
      console.info('bindMenuNullUndefined_0400 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindMenu_options_undefined'));
      await button.click();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('menuItem_nullUn_1'));
      console.info("bindMenuNullUndefined_0400 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindMenuNullUndefined_0400] END');
      done();
    });
    
    /**
     * @tc.name   bindMenuNullUndefined_0500
     * @tc.number bindMenuNullUndefined_0500
     * @tc.desc   Test bindMenu isShow property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindMenuNullUndefined_0500', Level.LEVEL1, async (done: Function) => {
      console.info('bindMenuNullUndefined_0500 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindMenu_isShow_null'));
      await button.click();
      await CommonFunc.sleep(1500);
      let menuText = await driver.findComponent(ON.text('菜单1'));
      console.info("[bindMenuNullUndefined_0500] menuText is: " + JSON.stringify(menuText));
      expect(menuText).assertEqual(null);
      await CommonFunc.sleep(2000);
      console.info('[bindMenuNullUndefined_0500] END');
      done();
    });

    /**
     * @tc.name   bindMenuNullUndefined_0600
     * @tc.number bindMenuNullUndefined_0600
     * @tc.desc   Test bindMenu isShow property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindMenuNullUndefined_0600', Level.LEVEL1, async (done: Function) => {
      console.info('bindMenuNullUndefined_0600 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindMenu_isShow_undefined'));
      await button.click();
      await CommonFunc.sleep(1500);
      let menuText = await driver.findComponent(ON.text('菜单1'));
      console.info("[bindMenuNullUndefined_0600] menuText is: " + JSON.stringify(menuText));
      expect(menuText).assertEqual(null);
      await CommonFunc.sleep(2000);
      console.info('[bindMenuNullUndefined_0600] END');
      done();
    });

    /**
     * @tc.name   bindMenuNullUndefined_0700
     * @tc.number bindMenuNullUndefined_0700
     * @tc.desc   Test bindMenu content property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindMenuNullUndefined_0700', Level.LEVEL1, async (done: Function) => {
      console.info('bindMenuNullUndefined_0700 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindMenu_content_null_2'));
      await button.click();
      await CommonFunc.sleep(1500);
      let menuText = await driver.findComponent(ON.text('菜单1'));
      console.info("[bindMenuNullUndefined_0700] menuText is: " + JSON.stringify(menuText));
      expect(menuText).assertEqual(null);
      await CommonFunc.sleep(2000);
      console.info('[bindMenuNullUndefined_0700] END');
      done();
    });

    /**
     * @tc.name   bindMenuNullUndefined_0800
     * @tc.number bindMenuNullUndefined_0800
     * @tc.desc   Test bindMenu content property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindMenuNullUndefined_0800', Level.LEVEL1, async (done: Function) => {
      console.info('bindMenuNullUndefined_0800 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindMenu_content_undefined_2'));
      await button.click();
      await CommonFunc.sleep(1500);
      let menuText = await driver.findComponent(ON.text('菜单1'));
      console.info("[bindMenuNullUndefined_0800] menuText is: " + JSON.stringify(menuText));
      expect(menuText).assertEqual(null);
      await CommonFunc.sleep(2000);
      console.info('[bindMenuNullUndefined_0800] END');
      done();
    });

    /**
     * @tc.name   bindMenuNullUndefined_0900
     * @tc.number bindMenuNullUndefined_0900
     * @tc.desc   Test bindMenu options property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindMenuNullUndefined_0900', Level.LEVEL1, async (done: Function) => {
      console.info('bindMenuNullUndefined_0900 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindMenu_options_null_3'));
      await button.click();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('menuItem_nullUn_2'));
      console.info("bindMenuNullUndefined_0900 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindMenuNullUndefined_0900] END');
      done();
    });

    /**
     * @tc.name   bindMenuNullUndefined_1000
     * @tc.number bindMenuNullUndefined_1000
     * @tc.desc   Test bindMenu options property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindMenuNullUndefined_1000', Level.LEVEL1, async (done: Function) => {
      console.info('bindMenuNullUndefined_1000 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindMenu_options_undefined_3'));
      await button.click();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('menuItem_nullUn_2'));
      console.info("bindMenuNullUndefined_1000 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindMenuNullUndefined_1000] END');
      done();
    });

    /**
     * @tc.name   bindMenuNullUndefined_1100
     * @tc.number bindMenuNullUndefined_1100
     * @tc.desc   Test bindMenu showInSubWindow property with true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindMenuNullUndefined_1100', Level.LEVEL1, async (done: Function) => {
      console.info('bindMenuNullUndefined_1100 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindMenu_showInSubWindow_true'));
      await button.click();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('menuItem_nullUn_2'));
      console.info("bindMenuNullUndefined_1100 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindMenuNullUndefined_1100] END');
      done();
    });

    /**
     * @tc.name   bindMenuNullUndefined_1200
     * @tc.number bindMenuNullUndefined_1200
     * @tc.desc   Test bindMenu showInSubWindow property with false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindMenuNullUndefined_1200', Level.LEVEL1, async (done: Function) => {
      console.info('bindMenuNullUndefined_1200 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindMenu_showInSubWindow_false'));
      await button.click();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('menuItem_nullUn_2'));
      console.info("bindMenuNullUndefined_1200 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindMenuNullUndefined_1200] END');
      done();
    });
  })
}