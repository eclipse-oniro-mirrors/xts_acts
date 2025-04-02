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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
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
import CommonFunc from '../../MainAbility/utils/Common';
import { MessageManager, Callback } from '../../MainAbility/utils/MessageManager';


export default function StateDate2Jsunit() {
  describe('StateDate2Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("StateDate2Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/StateDate2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StateDate2Jsunit state pages: " + JSON.stringify(pages));
        if (!("StateDate2" == pages.name)) {
          console.info("get StateDate2Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StateDate2Jsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StateDate2Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('StateDatePicker2_reset'));
      await button.click();
      console.log('reset button click succ')
      await CommonFunc.sleep(1000);
    });

    it('StateDate1Jsunit_0100', 0, async (done: Function) => {

      console.info('StateDate1Jsunit_0100 START');
      let strJson = getInspectorByKey('date2');
      let obj = JSON.parse(strJson);
      console.info("[StateDate1Jsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[StateDate1Jsunit_0100] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("\"2021-08-08T00:00:00.000Z\"");
      console.info('[StateDate1Jsunit_0100] END');
      done();
    });

    it('StateDate2Jsunit_0200', 0, async (done: Function) => {

      console.info('StateDate2Jsunit_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('setTime'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('date2');
      let obj = JSON.parse(strJson);
      console.info("[StateDate2Jsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[StateDate1Jsunit_0200] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("\"2021-08-08T00:00:00.001Z\"");
      console.info('[StateDate2Jsunit_0200] END');
      done();
    });

    it('StateDate2Jsunit_0300', 0, async (done: Function) => {

      console.info('StateDate2Jsunit_0300 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('UTCFullYear'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('date2');
      let obj = JSON.parse(strJson);
      console.info("[StateDate2Jsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[StateDate1Jsunit_0300] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("\"2022-08-08T00:00:00.000Z\"");
      console.info('[StateDate2Jsunit_0300] END');
      done();
    });

    it('StateDate2Jsunit_0400', 0, async (done: Function) => {

      console.info('StateDate2Jsunit_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('UTCMonth'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('date2');
      let obj = JSON.parse(strJson);
      console.info("[StateDate2Jsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[StateDate1Jsunit_0400] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("\"2021-09-08T00:00:00.000Z\"");
      console.info('[StateDate2Jsunit_0400] END');
      done();
    });

    it('StateDate2Jsunit_0500', 0, async (done: Function) => {

      console.info('StateDate2Jsunit_0500 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('UTCDate'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('date2');
      let obj = JSON.parse(strJson);
      console.info("[StateDate2Jsunit_0500] component obj is: " + JSON.stringify(obj));
      console.info("[StateDate1Jsunit_0500] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("\"2021-08-09T00:00:00.000Z\"");
      console.info('[StateDate2Jsunit_0500] END');
      done();
    });

    it('StateDate2Jsunit_0600', 0, async (done: Function) => {

      console.info('StateDate2Jsunit_0600 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('UTCHours'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('date2');
      let obj = JSON.parse(strJson);
      console.info("[StateDate2Jsunit_0600] component obj is: " + JSON.stringify(obj));
      console.info("[StateDate1Jsunit_0600] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("\"2021-08-08T01:00:00.000Z\"");
      console.info('[StateDate2Jsunit_0600] END');
      done();
    });

    it('StateDate2Jsunit_0700', 0, async (done: Function) => {

      console.info('StateDate2Jsunit_0700 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('UTCMinutes'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('date2');
      let obj = JSON.parse(strJson);
      console.info("[StateDate2Jsunit_0700] component obj is: " + JSON.stringify(obj));
      console.info("[StateDate1Jsunit_0700] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("\"2021-08-08T00:01:00.000Z\"");
      console.info('[StateDate2Jsunit_0700] END');
      done();
    });

    it('StateDate2Jsunit_0800', 0, async (done: Function) => {

      console.info('StateDate2Jsunit_0800 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('UTCSeconds'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('date2');
      let obj = JSON.parse(strJson);
      console.info("[StateDate2Jsunit_0800] component obj is: " + JSON.stringify(obj));
      console.info("[StateDate1Jsunit_0800] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("\"2021-08-08T00:00:01.000Z\"");
      console.info('[StateDate2Jsunit_0800] END');
      done();
    });

    it('StateDate2Jsunit_0900', 0, async (done: Function) => {

      console.info('StateDate2Jsunit_0900 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('UTCMilliseconds'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('date2');
      let obj = JSON.parse(strJson);
      console.info("[StateDate2Jsunit_0900] component obj is: " + JSON.stringify(obj));
      console.info("[StateDate1Jsunit_0900] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("\"2021-08-08T00:00:00.001Z\"");
      console.info('[StateDate2Jsunit_0900] END');
      done();
    });
  })
}

