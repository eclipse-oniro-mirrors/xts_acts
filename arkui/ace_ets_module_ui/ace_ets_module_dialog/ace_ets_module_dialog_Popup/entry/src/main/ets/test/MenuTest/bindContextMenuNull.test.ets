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

export default function bindContextMenuNull(){
  describe('bindContextMenuNull', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/bindContextMenuNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get bindContextMenuNull state pages: " + JSON.stringify(pages));
        if (!("bindContextMenuNull" == pages.name)) {
          console.info("get bindContextMenuNull state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push bindContextMenuNull success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push bindContextMenuNull page error: " + err);
        expect().assertFail();
      }
      done();
    });

    // ========== bindContextMenu tests ==========
    /**
     * @tc.name   bindContextMenuNullUndefined_0100
     * @tc.number bindContextMenuNullUndefined_0100
     * @tc.desc   Test bindContextMenu content property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuNullUndefined_0100', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuNullUndefined_0100 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let strJson = getInspectorByKey('bindContextMenu_content_null');
      console.info("[bindContextMenuNullUndefined_0100] bindContextMenu is: " + JSON.stringify(JSON.parse(strJson).$attrs.bindContextMenu));
      expect(JSON.parse(strJson).$attrs.bindContextMenu).assertEqual(undefined);
      await CommonFunc.sleep(1000);
      console.info('[bindContextMenuNullUndefined_0100] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuNullUndefined_0200
     * @tc.number bindContextMenuNullUndefined_0200
     * @tc.desc   Test bindContextMenu content property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuNullUndefined_0200', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuNullUndefined_0200 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let strJson = getInspectorByKey('bindContextMenu_content_undefined');
      console.info("[bindContextMenuNullUndefined_0200] bindContextMenu is: " + JSON.stringify(JSON.parse(strJson).$attrs.bindContextMenu));
      expect(JSON.parse(strJson).$attrs.bindContextMenu).assertEqual(undefined);
      await CommonFunc.sleep(1000);
      console.info('[bindContextMenuNullUndefined_0200] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuNullUndefined_0300
     * @tc.number bindContextMenuNullUndefined_0300
     * @tc.desc   Test bindContextMenu responseType property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuNullUndefined_0300', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuNullUndefined_0300 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenu_responseType_null'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('bindContextMenu_nullUn'));
      console.info("bindContextMenuNullUndefined_0300 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuNullUndefined_0300] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuNullUndefined_0400
     * @tc.number bindContextMenuNullUndefined_0400
     * @tc.desc   Test bindContextMenu responseType property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuNullUndefined_0400', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuNullUndefined_0400 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenu_responseType_undefined'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('bindContextMenu_nullUn'));
      console.info("bindContextMenuNullUndefined_0400 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuNullUndefined_0400] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuNullUndefined_0500
     * @tc.number bindContextMenuNullUndefined_0500
     * @tc.desc   Test bindContextMenu options property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuNullUndefined_0500', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuNullUndefined_0500 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenu_options_null'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('bindContextMenu_nullUn'));
      console.info("bindContextMenuNullUndefined_0500 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuNullUndefined_0500] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuNullUndefined_0600
     * @tc.number bindContextMenuNullUndefined_0600
     * @tc.desc   Test bindContextMenu options property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuNullUndefined_0600', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuNullUndefined_0600 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenu_options_undefined'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('bindContextMenu_nullUn'));
      console.info("bindContextMenuNullUndefined_0600 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuNullUndefined_0600] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuNullUndefined_0700
     * @tc.number bindContextMenuNullUndefined_0700
     * @tc.desc   Test bindContextMenu enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuNullUndefined_0700', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuNullUndefined_0700 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenu_enum_1'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('bindContextMenu_nullUn'));
      console.info("bindContextMenuNullUndefined_0700 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuNullUndefined_0700] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuNullUndefined_0800
     * @tc.number bindContextMenuNullUndefined_0800
     * @tc.desc   Test bindContextMenu enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuNullUndefined_0800', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuNullUndefined_0800 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenu_enum_2'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('bindContextMenu_nullUn'));
      console.info("bindContextMenuNullUndefined_0800 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuNullUndefined_0800] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuNullUndefined_0900
     * @tc.number bindContextMenuNullUndefined_0900
     * @tc.desc   Test bindContextMenu enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuNullUndefined_0900', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuNullUndefined_0900 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenu_enum_3'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('bindContextMenu_nullUn'));
      console.info("bindContextMenuNullUndefined_0900 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuNullUndefined_0900] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuNullUndefined_1000
     * @tc.number bindContextMenuNullUndefined_1000
     * @tc.desc   Test bindContextMenu enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuNullUndefined_1000', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuNullUndefined_1000 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenu_enum_4'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('bindContextMenu_nullUn'));
      console.info("bindContextMenuNullUndefined_1000 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuNullUndefined_1000] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuNullUndefined_1100
     * @tc.number bindContextMenuNullUndefined_1100
     * @tc.desc   Test bindContextMenu enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuNullUndefined_1100', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuNullUndefined_1100 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenu_enum_5'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('bindContextMenu_nullUn'));
      console.info("bindContextMenuNullUndefined_1100 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuNullUndefined_1100] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuNullUndefined_1200
     * @tc.number bindContextMenuNullUndefined_1200
     * @tc.desc   Test bindContextMenu enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuNullUndefined_1200', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuNullUndefined_1200 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenu_enum_6'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('bindContextMenu_nullUn'));
      console.info("bindContextMenuNullUndefined_1200 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuNullUndefined_1200] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuNullUndefined_1300
     * @tc.number bindContextMenuNullUndefined_1300
     * @tc.desc   Test bindContextMenu enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuNullUndefined_1300', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuNullUndefined_1300 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenu_enum_7'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('bindContextMenu_nullUn'));
      console.info("bindContextMenuNullUndefined_1300 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuNullUndefined_1300] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuNullUndefined_1400
     * @tc.number bindContextMenuNullUndefined_1400
     * @tc.desc   Test bindContextMenu enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuNullUndefined_1400', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuNullUndefined_1400 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenu_enum_8'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('bindContextMenu_nullUn'));
      console.info("bindContextMenuNullUndefined_1400 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuNullUndefined_1400] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuNullUndefined_1500
     * @tc.number bindContextMenuNullUndefined_1500
     * @tc.desc   Test bindContextMenu enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuNullUndefined_1500', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuNullUndefined_1500 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenu_enum_9'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('bindContextMenu_nullUn'));
      console.info("bindContextMenuNullUndefined_1500 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuNullUndefined_1500] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuNullUndefined_1600
     * @tc.number bindContextMenuNullUndefined_1600
     * @tc.desc   Test bindContextMenu enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuNullUndefined_1600', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuNullUndefined_1600 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenu_enum_10'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('bindContextMenu_nullUn'));
      console.info("bindContextMenuNullUndefined_1600 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuNullUndefined_1600] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuNullUndefined_1700
     * @tc.number bindContextMenuNullUndefined_1700
     * @tc.desc   Test bindContextMenu enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuNullUndefined_1700', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuNullUndefined_1700 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenu_enum_11'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('bindContextMenu_nullUn'));
      console.info("bindContextMenuNullUndefined_1700 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuNullUndefined_1700] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuNullUndefined_1800
     * @tc.number bindContextMenuNullUndefined_1800
     * @tc.desc   Test bindContextMenu enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuNullUndefined_1800', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuNullUndefined_1800 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenu_enum_12'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('bindContextMenu_nullUn'));
      console.info("bindContextMenuNullUndefined_1800 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuNullUndefined_1800] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuNullUndefined_1900
     * @tc.number bindContextMenuNullUndefined_1900
     * @tc.desc   Test bindContextMenu enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuNullUndefined_1900', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuNullUndefined_1900 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenu_enum_13'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('bindContextMenu_nullUn'));
      console.info("bindContextMenuNullUndefined_1900 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuNullUndefined_1900] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuNullUndefined_2000
     * @tc.number bindContextMenuNullUndefined_2000
     * @tc.desc   Test bindContextMenu enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuNullUndefined_2000', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuNullUndefined_2000 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenu_enum_14'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('bindContextMenu_nullUn'));
      console.info("bindContextMenuNullUndefined_2000 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuNullUndefined_2000] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuNullUndefined_2100
     * @tc.number bindContextMenuNullUndefined_2100
     * @tc.desc   Test bindContextMenu enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuNullUndefined_2100', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuNullUndefined_2100 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenu_enum_15'));
      await button.longClick();
      await CommonFunc.sleep(2000);

      let menuText = await driver.findComponent(ON.id('bindContextMenu_nullUn'));
      console.info("bindContextMenuNullUndefined_2100 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuNullUndefined_2100] END');
      done();
    });
  })
}