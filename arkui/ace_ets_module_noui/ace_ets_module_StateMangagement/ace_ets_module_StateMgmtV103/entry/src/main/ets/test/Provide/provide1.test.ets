/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
  UiDriver,
  Component,
  Driver,
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


export default function provide1() {
  describe('provide1', () => {
    beforeEach(async (done: Function) => {
      console.info("provide1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Provide/provide1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get provide1 state pages: " + JSON.stringify(pages));
        if (!("provide1" == pages.name)) {
          console.info("get provide1 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push provide1 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push provide1 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.back()
    });

    /**
     * @tc.name   provide1_0100
     * @tc.number provide1_0100
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('provide1_0100', Level.LEVEL0, async (done: Function) => {
      console.info('provide1_0100 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('pBtn1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('pBtn1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[provide1_0100] component obj is: " + JSON.stringify(obj));
      console.info("[provide1_0100] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFC0CB');
      console.info('[provide1_0100] END');
      done();

    });

    /**
     * @tc.name   provide1_0200
     * @tc.number provide1_0200
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('provide1_0200', Level.LEVEL0, async (done: Function) => {
      console.info('provide1_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('pBtn2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('pBtn2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[provide1_0200] component obj is: " + JSON.stringify(obj));
      console.info("[provide1_0200] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFC0CB');
      console.info('[provide1_0200] END');
      done();

    });

    /**
     * @tc.name   provide1_0300
     * @tc.number provide1_0300
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('provide1_0300', Level.LEVEL0, async (done: Function) => {
      console.info('provide1_0300 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('pBtn3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('pBtn3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[provide1_0300] component obj is: " + JSON.stringify(obj));
      console.info("[provide1_0300] title: " + JSON.stringify(obj.$attrs.fontSize));
      expect(obj.$attrs.fontSize).assertEqual('100.00fp');
      console.info('[provide1_0300] END');
      done();

    });

    /**
     * @tc.name   provide1_0400
     * @tc.number provide1_0400
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('provide1_0400', Level.LEVEL0, async (done: Function) => {
      console.info('provide1_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('pBtn4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('pBtn4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[provide1_0400] component obj is: " + JSON.stringify(obj));
      console.info("[provide1_0400] title: " + JSON.stringify(obj.$attrs.fontSize));
      expect(obj.$attrs.fontSize).assertEqual('100.00fp');
      console.info('[provide1_0400] END');
      done();

    });

    /**
     * @tc.name   provide1_0500
     * @tc.number provide1_0500
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('provide1_0500', Level.LEVEL0, async (done: Function) => {
      console.info('provide1_0500 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('cBtn1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('cBtn1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[provide1_0500] component obj is: " + JSON.stringify(obj));
      console.info("[provide1_0500] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFC0CB');
      console.info('[provide1_0500] END');
      done();

    });

    /**
     * @tc.name   provide1_0600
     * @tc.number provide1_0600
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('provide1_0600', Level.LEVEL0, async (done: Function) => {
      console.info('provide1_0600 START');
      let driver = await UiDriver.create()
      await driver.swipe(100, 500, 100, 100)
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(BY.key('cBtn2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('cBtn2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[provide1_0600] component obj is: " + JSON.stringify(obj));
      console.info("[provide1_0600] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFC0CB');
      console.info('[provide1_0600] END');
      done();

    });

    /**
     * @tc.name   provide1_0700
     * @tc.number provide1_0700
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('provide1_0700', Level.LEVEL0, async (done: Function) => {
      console.info('provide1_0700 START');
      let driver = await UiDriver.create()
      await driver.swipe(100, 500, 100, 100)
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(BY.key('cBtn3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('cBtn3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[provide1_0700] component obj is: " + JSON.stringify(obj));
      console.info("[provide1_0700] title: " + JSON.stringify(obj.$attrs.fontSize));
      expect(obj.$attrs.fontSize).assertEqual('100.00fp');
      console.info('[provide1_0700] END');
      done();

    });

    /**
     * @tc.name   provide1_0800
     * @tc.number provide1_0800
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('provide1_0800', Level.LEVEL0, async (done: Function) => {
      console.info('provide1_0800 START');
      let driver = await UiDriver.create()
      await driver.swipe(100, 500, 100, 100)
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(BY.key('cBtn4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('cBtn4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[provide1_0800] component obj is: " + JSON.stringify(obj));
      console.info("[provide1_0800] title: " + JSON.stringify(obj.$attrs.fontSize));
      expect(obj.$attrs.fontSize).assertEqual('100.00fp');
      console.info('[provide1_0800] END');
      done();

    });


  })
}

