/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
 


export default function StateArrayJsunit() {
  describe('StateArrayJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("StateArrayJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/StateArray010',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StateArrayJsunit state pages: " + JSON.stringify(pages));
        if (!("StateArray010" == pages.name)) {
          console.info("get StateArrayJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StateArrayJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StateArrayJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.log('afterEach succ')
    });

    /**
     * @tc.name   StateArrayJsunit_0100
     * @tc.number StateArrayJsunit_0100
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StateArrayJsunit_0100', Level.LEVEL1, async (done: Function) => {

      console.info('StateArrayJsunit_0100 START');
      let strJson = getInspectorByKey('text_Array');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StateArrayJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[StateArrayJsunit_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('title：[{"value":11},{"value":1}]');
      console.info('[StateArrayJsunit_0100] END');
      done();
    });

    /**
     * @tc.name   StateArrayJsunit_0200
     * @tc.number StateArrayJsunit_0200
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StateArrayJsunit_0200', Level.LEVEL1, async (done: Function) => {

      console.info('StateArrayJsunit_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('change_Array'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_Array');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StateArrayJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[StateArrayJsunit_0200] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('title：[{"value":8},{"value":1}]');
      await CommonFunc.sleep(500);
      let button002 = await driver.findComponent(BY.key('StateArray_reset'));
      await button002.click();
      await CommonFunc.sleep(500);
      console.info('[StateArrayJsunit_0200] END');
      done();
    });

    /**
     * @tc.name   StateArrayJsunit_0300
     * @tc.number StateArrayJsunit_0300
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StateArrayJsunit_0300', Level.LEVEL1, async (done: Function) => {

      console.info('StateArrayJsunit_0300 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('delete_Array'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_Array');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StateArrayJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[StateArrayJsunit_0300] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('title：[{"value":11}]');
      await CommonFunc.sleep(500);
      let button002 = await driver.findComponent(BY.key('StateArray_reset'));
      await button002.click();
      await CommonFunc.sleep(500);
      console.info('[StateArrayJsunit_0300] END');
      done();
    });

    /**
     * @tc.name   StateArrayJsunit_0400
     * @tc.number StateArrayJsunit_0400
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StateArrayJsunit_0400', Level.LEVEL1, async (done: Function) => {

      console.info('StateArrayJsunit_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('add_Array'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_Array');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StateArrayJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[StateArrayJsunit_0400] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('title：[{"value":11},{"value":1},{"value":12}]');
      await CommonFunc.sleep(500);
      let button002 = await driver.findComponent(BY.key('StateArray_reset'));
      await button002.click();
      await CommonFunc.sleep(500);
      console.info('[StateArrayJsunit_0400] END');
      done();
    });

    /**
     * @tc.name   StateArrayJsunit_0500
     * @tc.number StateArrayJsunit_0500
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StateArrayJsunit_0500', Level.LEVEL1, async (done: Function) => {

      console.info('StateArrayJsunit_0500 START');
      let strJson = getInspectorByKey('text_ClassA');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StateArrayJsunit_0500] component obj is: " + JSON.stringify(obj));
      console.info("[StateArrayJsunit_0500] ClassA: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('ClassA：{"value":"Hello","data":{"value":6}}');
      console.info('[StateArrayJsunit_0500] END');
      done();
    });

    /**
     * @tc.name   StateArrayJsunit_0600
     * @tc.number StateArrayJsunit_0600
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StateArrayJsunit_0600', Level.LEVEL1, async (done: Function) => {

      console.info('StateArrayJsunit_0600 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('change_Parent'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_ClassA');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StateArrayJsunit_0600] component obj is: " + JSON.stringify(obj));
      console.info("[StateArrayJsunit_0600] ClassA: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('ClassA：{"value":"World","data":{"value":6}}');
      await CommonFunc.sleep(500);
      let button002 = await driver.findComponent(BY.key('StateArray_reset'));
      await button002.click();
      await CommonFunc.sleep(500);
      console.info('[StateArrayJsunit_0600] END');
      done();
    });

    /**
     * @tc.name   StateArrayJsunit_0700
     * @tc.number StateArrayJsunit_0700
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StateArrayJsunit_0700', Level.LEVEL1, async (done: Function) => {

      console.info('StateArrayJsunit_0700 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('change_Self'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_ClassA');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StateArrayJsunit_0700] component obj is: " + JSON.stringify(obj));
      console.info("[StateArrayJsunit_0700] ClassA: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('ClassA：{"value":"Hello","data":{"value":8}}');
      await CommonFunc.sleep(500);
      let button002 = await driver.findComponent(BY.key('StateArray_reset'));
      await button002.click();
      await CommonFunc.sleep(500);
      console.info('[StateArrayJsunit_0700] END');
      done();
    });
  })
}

