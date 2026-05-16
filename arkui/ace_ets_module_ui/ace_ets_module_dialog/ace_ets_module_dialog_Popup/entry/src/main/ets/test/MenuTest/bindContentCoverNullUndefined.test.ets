/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, On, ON, Component, Point } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function bindContentCoverNullUndefined(){
  describe('bindContentCoverNullUndefined', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/bindContentCoverNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get bindContentCoverNullUndefined state pages: " + JSON.stringify(pages));
        if (!("bindContentCoverNullUndefined" == pages.name)) {
          console.info("get bindContentCoverNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push bindContentCoverNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push bindContentCoverNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    // ========== bindContentCover isShown tests tests ==========
    /**
     * @tc.name   bindContentCoverNullUndefined_0100
     * @tc.number bindContentCoverNullUndefined_0100
     * @tc.desc   Test bindContentCover isShown builder property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContentCoverNullUndefined_0100', Level.LEVEL1, async (done: Function) => {
      console.info('bindContentCoverNullUndefined_0100 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let strJson = getInspectorByKey('bindContentCover_builder_null');
      console.info("[bindContentCoverNullUndefined_0100] bindContentCover is: " + JSON.stringify(JSON.parse(strJson).$attrs.bindContentCover));
      expect(JSON.parse(strJson).$attrs.bindContentCover).assertEqual(undefined);
      await CommonFunc.sleep(1000);
      console.info('[bindContentCoverNullUndefined_0100] END');
      done();
    });

    /**
     * @tc.name   bindContentCoverNullUndefined_0200
     * @tc.number bindContentCoverNullUndefined_0200
     * @tc.desc   Test bindContentCover isShown builder property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContentCoverNullUndefined_0200', Level.LEVEL1, async (done: Function) => {
      console.info('bindContentCoverNullUndefined_0200 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let strJson = getInspectorByKey('bindContentCover_builder_undefined');
      console.info("[bindContentCoverNullUndefined_0200] bindContentCover is: " + JSON.stringify(JSON.parse(strJson).$attrs.bindContentCover));
      expect(JSON.parse(strJson).$attrs.bindContentCover).assertEqual(undefined);
      await CommonFunc.sleep(1000);
      console.info('[bindContentCoverNullUndefined_0200] END');
      done();
    });

    /**
     * @tc.name   bindContentCoverNullUndefined_0300
     * @tc.number bindContentCoverNullUndefined_0300
     * @tc.desc   Test bindContentCover options property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContentCoverNullUndefined_0300', Level.LEVEL1, async (done: Function) => {
      console.info('bindContentCoverNullUndefined_0300 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContentCover_options_null'));
      await button.click();
      console.info('[bindContentCoverNullUndefined_0300] button click');
      await CommonFunc.sleep(1500);

      let closeText = await driver.findComponent(ON.id('bindContentCover_close_nullNu'));
      console.info("bindContentCoverNullUndefined_0300 closeText: " + JSON.stringify(closeText));
      expect(closeText != null).assertEqual(true);
      await closeText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContentCoverNullUndefined_0300] END');
      done();
    });

    /**
     * @tc.name   bindContentCoverNullUndefined_0400
     * @tc.number bindContentCoverNullUndefined_0400
     * @tc.desc   Test bindContentCover options property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContentCoverNullUndefined_0400', Level.LEVEL1, async (done: Function) => {
      console.info('bindContentCoverNullUndefined_0400 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContentCover_options_undefined'));
      await button.click();
      console.info('[bindContentCoverNullUndefined_0400] button click');
      await CommonFunc.sleep(1500);

      let closeText = await driver.findComponent(ON.id('bindContentCover_close_nullNu'));
      console.info("bindContentCoverNullUndefined_0400 closeText: " + JSON.stringify(closeText));
      expect(closeText != null).assertEqual(true);
      await closeText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContentCoverNullUndefined_0400] END');
      done();
    });

    /**
     * @tc.name   bindContentCoverNullUndefined_0500
     * @tc.number bindContentCoverNullUndefined_0500
     * @tc.desc   Test bindContentCover enableSafeArea property set true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContentCoverNullUndefined_0500', Level.LEVEL1, async (done: Function) => {
      console.info('bindContentCoverNullUndefined_0500 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContentCover_enableSafeArea_true'));
      await button.click();
      console.info('[bindContentCoverNullUndefined_0500] button click');
      await CommonFunc.sleep(1500);

      let closeText = await driver.findComponent(ON.id('bindContentCover_close_nullNu'));
      console.info("bindContentCoverNullUndefined_0500 closeText: " + JSON.stringify(closeText));
      expect(closeText != null).assertEqual(true);
      await closeText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContentCoverNullUndefined_0500] END');
      done();
    });

    /**
     * @tc.name   bindContentCoverNullUndefined_0600
     * @tc.number bindContentCoverNullUndefined_0600
     * @tc.desc   Test bindContentCover enableSafeArea property set false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('bindContentCoverNullUndefined_0600', Level.LEVEL1, async (done: Function) => {
      console.info('bindContentCoverNullUndefined_0600 START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('bindContentCover_enableSafeArea_false'));
      await button.click();
      console.info('[bindContentCoverNullUndefined_0600] button click');
      await CommonFunc.sleep(1500);

      let closeText = await driver.findComponent(ON.id('bindContentCover_close_nullNu'));
      console.info("bindContentCoverNullUndefined_0600 closeText: " + JSON.stringify(closeText));
      expect(closeText != null).assertEqual(true);
      await closeText?.click();
      await CommonFunc.sleep(2000);
      console.info('[bindContentCoverNullUndefined_0600] END');
      done();
    });
  })
}