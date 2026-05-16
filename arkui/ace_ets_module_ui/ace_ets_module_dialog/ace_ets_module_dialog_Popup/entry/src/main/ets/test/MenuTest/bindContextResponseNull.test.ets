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

export default function bindContextResponseNull(){
  describe('bindContextResponseNull', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/bindContextResponseNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get bindContextResponseNull state pages: " + JSON.stringify(pages));
        if (!("bindContextResponseNull" == pages.name)) {
          console.info("get bindContextResponseNull state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push bindContextResponseNull success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push bindContextResponseNull page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    // ========== bindContextMenuWithResponse tests ==========
    /**
     * @tc.name   bindContextMenuWithResponseNull_0100
     * @tc.number bindContextMenuWithResponseNull_0100
     * @tc.desc   Test bindContextMenuWithResponse content property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuWithResponseNull_0100', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuWithResponseNull_0100 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let strJson = getInspectorByKey('bindContextMenuWithResponse_content_null');
      console.info("[bindContextMenuWithResponseNull_0100] bindContextMenuWithResponse is: " + JSON.stringify(JSON.parse(strJson).$attrs.bindContextMenuWithResponse));
      expect(JSON.parse(strJson).$attrs.bindContextMenuWithResponse).assertEqual(undefined);
      await CommonFunc.sleep(1000);
      console.info('[bindContextMenuWithResponseNull_0100] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuWithResponseNull_0200
     * @tc.number bindContextMenuWithResponseNull_0200
     * @tc.desc   Test bindContextMenuWithResponse content property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuWithResponseNull_0200', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuWithResponseNull_0200 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let strJson = getInspectorByKey('bindContextMenuWithResponse_content_undefined');
      console.info("[bindContextMenuWithResponseNull_0200] bindContextMenuWithResponse is: " + JSON.stringify(JSON.parse(strJson).$attrs.bindContextMenuWithResponse));
      expect(JSON.parse(strJson).$attrs.bindContextMenuWithResponse).assertEqual(undefined);
      await CommonFunc.sleep(1000);
      console.info('[bindContextMenuWithResponseNull_0200] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuWithResponseNull_0300
     * @tc.number bindContextMenuWithResponseNull_0300
     * @tc.desc   Test bindContextMenuWithResponse options property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuWithResponseNull_0300', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuWithResponseNull_0300 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenuWithResponse_options_null'));
      await button.longClick();
      console.info('[bindContextMenuWithResponseNull_0300] long click');
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('longTextId_withParam_un'));
      console.info("bindContextMenuWithResponseNull_0300 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuWithResponseNull_0300] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuWithResponseNull_0400
     * @tc.number bindContextMenuWithResponseNull_0400
     * @tc.desc   Test bindContextMenuWithResponse options property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuWithResponseNull_0400', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuWithResponseNull_0400 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenuWithResponse_options_undefined'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('longTextId_withParam_un'));
      console.info("bindContextMenuWithResponseNull_0400 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuWithResponseNull_0400] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuWithResponseNull_0500
     * @tc.number bindContextMenuWithResponseNull_0500
     * @tc.desc   Test bindContextMenuWithResponse enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuWithResponseNull_0500', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuWithResponseNull_0500 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenuWithResponse_enum_1'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('longTextId_withParam_un'));
      console.info("bindContextMenuWithResponseNull_0500 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuWithResponseNull_0500] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuWithResponseNull_0600
     * @tc.number bindContextMenuWithResponseNull_0600
     * @tc.desc   Test bindContextMenuWithResponse enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuWithResponseNull_0600', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuWithResponseNull_0600 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenuWithResponse_enum_2'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('longTextId_withParam_un'));
      console.info("bindContextMenuWithResponseNull_0600 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuWithResponseNull_0600] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuWithResponseNull_0700
     * @tc.number bindContextMenuWithResponseNull_0700
     * @tc.desc   Test bindContextMenuWithResponse enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuWithResponseNull_0700', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuWithResponseNull_0700 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenuWithResponse_enum_3'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('longTextId_withParam_un'));
      console.info("bindContextMenuWithResponseNull_0700 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuWithResponseNull_0700] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuWithResponseNull_0800
     * @tc.number bindContextMenuWithResponseNull_0800
     * @tc.desc   Test bindContextMenuWithResponse enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuWithResponseNull_0800', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuWithResponseNull_0800 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenuWithResponse_enum_4'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('longTextId_withParam_un'));
      console.info("bindContextMenuWithResponseNull_0800 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuWithResponseNull_0800] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuWithResponseNull_0900
     * @tc.number bindContextMenuWithResponseNull_0900
     * @tc.desc   Test bindContextMenuWithResponse enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuWithResponseNull_0900', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuWithResponseNull_0900 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenuWithResponse_enum_5'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('longTextId_withParam_un'));
      console.info("bindContextMenuWithResponseNull_0900 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuWithResponseNull_0900] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuWithResponseNull_1000
     * @tc.number bindContextMenuWithResponseNull_1000
     * @tc.desc   Test bindContextMenuWithResponse enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuWithResponseNull_1000', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuWithResponseNull_1000 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenuWithResponse_enum_6'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('longTextId_withParam_un'));
      console.info("bindContextMenuWithResponseNull_1000 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuWithResponseNull_1000] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuWithResponseNull_1100
     * @tc.number bindContextMenuWithResponseNull_1100
     * @tc.desc   Test bindContextMenuWithResponse enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuWithResponseNull_1100', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuWithResponseNull_1100 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenuWithResponse_enum_7'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('longTextId_withParam_un'));
      console.info("bindContextMenuWithResponseNull_1100 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuWithResponseNull_1100] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuWithResponseNull_1200
     * @tc.number bindContextMenuWithResponseNull_1200
     * @tc.desc   Test bindContextMenuWithResponse enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuWithResponseNull_1200', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuWithResponseNull_1200 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenuWithResponse_enum_8'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('longTextId_withParam_un'));
      console.info("bindContextMenuWithResponseNull_1200 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuWithResponseNull_1200] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuWithResponseNull_1300
     * @tc.number bindContextMenuWithResponseNull_1300
     * @tc.desc   Test bindContextMenuWithResponse enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuWithResponseNull_1300', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuWithResponseNull_1300 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenuWithResponse_enum_9'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('longTextId_withParam_un'));
      console.info("bindContextMenuWithResponseNull_1300 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuWithResponseNull_1300] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuWithResponseNull_1400
     * @tc.number bindContextMenuWithResponseNull_1400
     * @tc.desc   Test bindContextMenuWithResponse enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuWithResponseNull_1400', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuWithResponseNull_1400 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenuWithResponse_enum_10'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('longTextId_withParam_un'));
      console.info("bindContextMenuWithResponseNull_1400 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuWithResponseNull_1400] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuWithResponseNull_1500
     * @tc.number bindContextMenuWithResponseNull_1500
     * @tc.desc   Test bindContextMenuWithResponse enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuWithResponseNull_1500', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuWithResponseNull_1500 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenuWithResponse_enum_11'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('longTextId_withParam_un'));
      console.info("bindContextMenuWithResponseNull_1500 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuWithResponseNull_1500] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuWithResponseNull_1600
     * @tc.number bindContextMenuWithResponseNull_1600
     * @tc.desc   Test bindContextMenuWithResponse enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuWithResponseNull_1600', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuWithResponseNull_1600 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenuWithResponse_enum_12'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('longTextId_withParam_un'));
      console.info("bindContextMenuWithResponseNull_1600 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuWithResponseNull_1600] END');
      done();
    });

    /**
     * @tc.name   bindContextMenuWithResponseNull_1700
     * @tc.number bindContextMenuWithResponseNull_1700
     * @tc.desc   Test bindContextMenuWithResponse enum property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContextMenuWithResponseNull_1700', Level.LEVEL1, async (done: Function) => {
      console.info('bindContextMenuWithResponseNull_1700 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContextMenuWithResponse_enum_13'));
      await button.longClick();
      await CommonFunc.sleep(1500);

      let menuText = await driver.findComponent(ON.id('longTextId_withParam_un'));
      console.info("bindContextMenuWithResponseNull_1700 menuText: " + JSON.stringify(menuText));
      expect(menuText != null).assertEqual(true);
      await menuText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContextMenuWithResponseNull_1700] END');
      done();
    });
  })
}