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
import CommonFunc from '../../MainAbility/common/Common'


export default function PropDate2Jsunit() {
  describe('PropDate2Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("PropDate2Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/PropDate2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PropDate2Jsunit state pages: " + JSON.stringify(pages));
        if (!("PropDate2" == pages.name)) {
          console.info("get PropDate2Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PropDate2Jsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PropDate2Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('PropDate2Jsunit_0010', 0, async (done: Function) => {
      console.info('PropDate2Jsunit_0010 START');
      let strJson = getInspectorByKey('setTime1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0010] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0010] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the Time by 11628380800000");
      console.info('[PropDate2Jsunit_0010] END');
      done();
    });

    it('PropDate2Jsunit_0020', 0, async (done: Function) => {
      console.info('PropDate2Jsunit_0020 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setTime1'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PropDate2Jsunit_0020 START');
      let strJson = getInspectorByKey('setTime1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0020] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0020] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the Time by 11628380800001");
      console.info('[PropDate2Jsunit_0020] END');
      done();
    });

    it('PropDate2Jsunit_0030', 0, async (done: Function) => {

      let strJson = getInspectorByKey('setUTCFullYear1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0030] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0030] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCFullYear by 12021");
      console.info('[PropDate2Jsunit_0030] END');
      done();
    });

    it('PropDate2Jsunit_0040', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0040 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCFullYear1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('setUTCFullYear1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0040] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0040] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCFullYear by 12022");
      console.info('[PropDate2Jsunit_0040] END');
      done();
    });

    it('PropDate2Jsunit_0050', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0050 START');
      let strJson = getInspectorByKey('setUTCMonth1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0050] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0050] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCMonth by 17");
      console.info('[PropDate2Jsunit_0050] END');
      done();
    });

    it('PropDate2Jsunit_0060', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0060 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCMonth1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('setUTCMonth1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0060] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0060] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCMonth by 18");
      console.info('[PropDate2Jsunit_0060] END');
      done();
    });

    it('PropDate2Jsunit_0070', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0070 START');
      let strJson = getInspectorByKey('getUTCDate1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0070] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0070] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCDate by 18");
      console.info('[PropDate2Jsunit_0070] END');
      done();
    });

    it('PropDate2Jsunit_0080', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0080 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('getUTCDate1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('getUTCDate1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0080] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0080] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCDate by 19");
      console.info('[PropDate2Jsunit_0080] END');
      done();
    });
    it('PropDate2Jsunit_0090', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0090 START');
      let strJson = getInspectorByKey('setUTCHours1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0090] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0090] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCHour by 10");
      console.info('[PropDate2Jsunit_0090] END');
      done();
    });
    it('PropDate2Jsunit_0100', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0100 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCHours1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('setUTCHours1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0100] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCHour by 11");
      console.info('[PropDate2Jsunit_0100] END');
      done();
    });

    it('PropDate2Jsunit_0110', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0110 START');
      let strJson = getInspectorByKey('setUTCMinutes1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0110] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0110] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCMinute by 10");
      console.info('[PropDate2Jsunit_0110] END');
      done();
    });

    it('PropDate2Jsunit_0120', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0120 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCMinutes1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('setUTCMinutes1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0120] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0120] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCMinute by 11");
      console.info('[PropDate2Jsunit_0120] END');
      done();
    });

    it('PropDate2Jsunit_0130', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_01430 START');
      let strJson = getInspectorByKey('setUTCSeconds1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0130] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0130] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCSecond by 10");
      console.info('[PropDate2Jsunit_0130] END');
      done();
    });

    it('PropDate2Jsunit_0140', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0140 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCSeconds1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('setUTCSeconds1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0140] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0140] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCSecond by 11");
      console.info('[PropDate2Jsunit_0140] END');
      done();
    });
    it('PropDate2Jsunit_0150', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0150 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('ChildDate2_reset'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('setUTCMilliseconds1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0150] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0150] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCMillisecond by 10");
      console.info('[PropDate2Jsunit_0150] END');
      done();
    });

    it('PropDate2Jsunit_0160', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0160 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCMilliseconds1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('setUTCMilliseconds1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0160] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0160] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCMillisecond by 11");
      console.info('[PropDate2Jsunit_0160] END');
      done();
    });

    it('PropDate2Jsunit_0170', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0170 START');
      let strJson = getInspectorByKey('setTime002');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0170] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0170] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the Time by 11628380800000");
      console.info('[PropDate2Jsunit_0170] END');
      done();
    });

    it('PropDate2Jsunit_0180', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0180 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setTime002'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('setTime002');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0180] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0180] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the Time by 11628380800001");
      console.info('[PropDate2Jsunit_0180] END');
      done();
    });

    it('PropDate2Jsunit_0190', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0190 START');
      let strJson = getInspectorByKey('setUTCFullYear');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0190] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0190] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCFullYear by 12021");
      console.info('[PropDate2Jsunit_0190] END');
      done();
    });

    it('PropDate2Jsunit_0200', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0200 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCFullYear'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('setUTCFullYear');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0200] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCFullYear by 12022");
      console.info('[PropDate2Jsunit_0200] END');
      done();
    });

    it('PropDate2Jsunit_0210', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0210 START');
      let strJson = getInspectorByKey('setUTCMonth');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0210] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0210] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCMonth by 17");
      console.info('[PropDate2Jsunit_0210] END');
      done();
    });

    it('PropDate2Jsunit_0220', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0220 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCMonth'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('setUTCMonth');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0220] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0220] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCMonth by 18");
      console.info('[PropDate2Jsunit_0220] END');
      done();
    });

    it('PropDate2Jsunit_0230', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0230 START');
      let strJson = getInspectorByKey('setUTCDate');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0230] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0230] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCDate by 18");
      console.info('[PropDate2Jsunit_0230] END');
      done();
    });

    it('PropDate2Jsunit_0240', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0240 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCDate'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('setUTCDate');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0240] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0240] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCDate by 19");
      console.info('[PropDate2Jsunit_0240] END');
      done();
    });

    it('PropDate2Jsunit_0250', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0250 START');
      let strJson = getInspectorByKey('setUTCHours');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0250] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0250] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCHour by 10");
      console.info('[PropDate2Jsunit_0250] END');
      done();
    });
    it('PropDate2Jsunit_0260', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0260 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCHours'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('setUTCHours');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0260] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0260] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCHour by 11");
      console.info('[PropDate2Jsunit_0260] END');
      done();
    });

    it('PropDate2Jsunit_0270', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0270 START');
      let strJson = getInspectorByKey('setUTCMinutes');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0270] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0270] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCMinute by 10");
      console.info('[PropDate2Jsunit_0270] END');
      done();
    });

    it('PropDate2Jsunit_0280', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0280 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCMinutes'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('setUTCMinutes');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0280] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0280] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCMinute by 11");
      console.info('[PropDate2Jsunit_0280] END');
      done();
    });

    it('PropDate2Jsunit_0290', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0290 START');
      let strJson = getInspectorByKey('setUTCSeconds');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0290] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0290] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCSecond by 10");
      console.info('[PropDate2Jsunit_0290] END');
      done();
    });

    it('PropDate2Jsunit_0300', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0300 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCSeconds'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('setUTCSeconds');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0300] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCSecond by 11");
      console.info('[PropDate2Jsunit_0300] END');
      done();
    });

    it('PropDate2Jsunit_0310', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0310 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('PropDate2_reset'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('setUTCMilliseconds');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0310] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0310] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCMillisecond by 10");
      console.info('[PropDate2Jsunit_0310] END');
      done();
    });

    it('PropDate2Jsunit_0320', 0, async (done: Function) => {

      console.info('PropDate2Jsunit_0320 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCMilliseconds'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('setUTCMilliseconds');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropDate2Jsunit_0320] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_0320] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("increase the UTCMillisecond by 11");
      console.info('[PropDate2Jsunit_0320] END');
      done();
    });
  })
}

