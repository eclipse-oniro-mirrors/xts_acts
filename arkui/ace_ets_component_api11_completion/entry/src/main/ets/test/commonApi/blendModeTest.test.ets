/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
export default function blendModeTest() {
  describe('blendModeTest', function () {
    beforeEach(async function (done) {
      console.info("blendModeTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/commonApi/blendMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get blendModeTest state pages: " + JSON.stringify(pages));
        if (!("blendMode" == pages.name)) {
          console.info("get blendModeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push blendModeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push blendModeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0100
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0100', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column0');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0100] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0100] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(0);
      console.info('[blendModeTest_0100] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0200
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0200', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column1');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0200] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0200] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0200] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(1);
      console.info('[blendModeTest_0200] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0300
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0300', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column2');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0300] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0300] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0300] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(2);
      console.info('[blendModeTest_0300] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0400
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0400', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column3');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0400] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0400] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0400] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(3);
      console.info('[blendModeTest_0400] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0500
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0500', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column4');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0500] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0500] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0500] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(4);
      console.info('[blendModeTest_0500] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0600
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0600', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column5');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0600] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0600] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0600] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(5);
      console.info('[blendModeTest_0600] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0700
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0700', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column6');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0700] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0700] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0700] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(6);
      console.info('[blendModeTest_0700] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0800
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0800', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column7');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0800] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0800] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0800] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(7);
      console.info('[blendModeTest_0800] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0900
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0900', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column8');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0900] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0900] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0900] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(8);
      console.info('[blendModeTest_0900] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0100
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0110', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column9');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0100] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0100] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(9);
      console.info('[blendModeTest_0100] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0110
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0110', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column10');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0110] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0110] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0110] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(10);
      console.info('[blendModeTest_0110] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0120
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0120', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column11');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0120] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0120] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0120] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(11);
      console.info('[blendModeTest_0120] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0130
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0130', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column12');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0130] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0130] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0130] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(12);
      console.info('[blendModeTest_0130] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0140
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0140', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column13');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0140] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0140] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0140] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(13);
      console.info('[blendModeTest_0140] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0150
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0150', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column14');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0150] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0150] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0150] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(14);
      console.info('[blendModeTest_0150] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0160
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0160', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column15');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0160] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0160] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0160] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(15);
      console.info('[blendModeTest_0160] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0170
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0170', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column16');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0170] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0170] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0170] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(16);
      console.info('[blendModeTest_0170] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0180
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0180', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column17');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0180] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0180] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0180] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(17);
      console.info('[blendModeTest_0180] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0190
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0190', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column18');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0190] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0190] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0190] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(18);
      console.info('[blendModeTest_0190] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0200
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0200', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column19');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0200] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0200] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0200] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(19);
      console.info('[blendModeTest_0200] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0210
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0210', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column20');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0210] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0210] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0210] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(20);
      console.info('[blendModeTest_0210] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0220
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0220', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column21');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0220] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0220] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0220] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(21);
      console.info('[blendModeTest_0220] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0230
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0230', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column22');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0230] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0230] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0230] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(22);
      console.info('[blendModeTest_0230] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0240
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0240', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column23');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0240] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0240] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0240] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(23);
      console.info('[blendModeTest_0240] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0250
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0250', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column24');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0250] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0250] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0250] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(24);
      console.info('[blendModeTest_0250] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0260
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0260', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column25');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0260] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0260] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0260] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(25);
      console.info('[blendModeTest_0260] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0270
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0270', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column26');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0270] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0270] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0270] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(26);
      console.info('[blendModeTest_0270] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0280
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0280', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column27');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0280] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0280] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0280] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(27);
      console.info('[blendModeTest_0280] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0290
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0290', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column28');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0290] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0290] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0290] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(28);
      console.info('[blendModeTest_0290] END');
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name blendModeTest_0300
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendModeTest_0300', 0, async function (done) {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column29');
      let obj = JSON.parse(strJson);
      console.info("[blendModeTest_0300] component obj is: " + JSON.stringify(obj));
      console.info("[blendModeTest_0300] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[blendModeTest_0300] text: " + JSON.stringify(obj.$attrs.blendMode));
      expect(obj.$attrs.blendMode).assertEqual(29);
      console.info('[blendModeTest_0300] END');
      done();
    });
  })
  }

