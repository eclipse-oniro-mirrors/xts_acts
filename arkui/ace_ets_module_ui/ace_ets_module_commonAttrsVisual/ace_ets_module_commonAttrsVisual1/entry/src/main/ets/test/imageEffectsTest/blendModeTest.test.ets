/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function blendModeTest() {
  describe('blendModeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('blendModeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/blendMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get blendModeTest state pages: ' + JSON.stringify(pages));
        if (!('blendMode' == pages.name)) {
          console.info('get blendModeTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push blendModeTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push blendModeTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   blendModeTest_0010
     * @tc.number blendModeTest_0010
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column0');
      console.info('[blendModeTest_0010] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0010] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0010] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(0);
      console.info('[blendModeTest_0010] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0020
     * @tc.number blendModeTest_0020
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0020 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column1');
      console.info('[blendModeTest_0020] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0020] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0020] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(1);
      console.info('[blendModeTest_0020] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0300
     * @tc.number blendModeTest_0300
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0300', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column2');
      console.info('[blendModeTest_0300] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0300] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0300] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(2);
      console.info('[blendModeTest_0300] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0400
     * @tc.number blendModeTest_0400
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0400', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column3');
      console.info('[blendModeTest_0400] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0400] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0400] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(3);
      console.info('[blendModeTest_0400] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0500
     * @tc.number blendModeTest_0500
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0500', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column4');
      console.info('[blendModeTest_0500] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0500] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0500] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(4);
      console.info('[blendModeTest_0500] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0600
     * @tc.number blendModeTest_0600
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0600', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column5');
      console.info('[blendModeTest_0600] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0600] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0600] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(5);
      console.info('[blendModeTest_0600] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0700
     * @tc.number blendModeTest_0700
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0700', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column6');
      console.info('[blendModeTest_0700] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0700] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0700] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(6);
      console.info('[blendModeTest_0700] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0800
     * @tc.number blendModeTest_0800
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0800', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column7');
      console.info('[blendModeTest_0800] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0800] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0800] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(7);
      console.info('[blendModeTest_0800] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0900
     * @tc.number blendModeTest_0900
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0900', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0900 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column8');
      console.info('[blendModeTest_0900] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0900] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0900] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(8);
      console.info('[blendModeTest_0900] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0100
     * @tc.number blendModeTest_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column9');
      console.info('[blendModeTest_0100] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0100] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0100] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(9);
      console.info('[blendModeTest_0100] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0110
     * @tc.number blendModeTest_0110
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0110', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column10');
      console.info('[blendModeTest_0110] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0110] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0110] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(10);
      console.info('[blendModeTest_0110] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0120
     * @tc.number blendModeTest_0120
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0120', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0120 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column11');
      console.info('[blendModeTest_0120] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0120] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0120] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(11);
      console.info('[blendModeTest_0120] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0130
     * @tc.number blendModeTest_0130
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0130', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0130 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column12');
      console.info('[blendModeTest_0130] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0130] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0130] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(12);
      console.info('[blendModeTest_0130] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0140
     * @tc.number blendModeTest_0140
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0140', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0140 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column13');
      console.info('[blendModeTest_0140] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0140] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0140] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(13);
      console.info('[blendModeTest_0140] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0150
     * @tc.number blendModeTest_0150
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0150', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0150 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column14');
      console.info('[blendModeTest_0150] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0150] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0150] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(14);
      console.info('[blendModeTest_0150] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0160
     * @tc.number blendModeTest_0160
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0160', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0160 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column15');

      console.info('[blendModeTest_0160] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0160] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0160] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(15);
      console.info('[blendModeTest_0160] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0170
     * @tc.number blendModeTest_0170
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0170', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0170 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column16');

      console.info('[blendModeTest_0170] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0170] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0170] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(16);
      console.info('[blendModeTest_0170] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0180
     * @tc.number blendModeTest_0180
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0180', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0180 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column17');

      console.info('[blendModeTest_0180] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0180] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0180] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(17);
      console.info('[blendModeTest_0180] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0190
     * @tc.number blendModeTest_0190
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0190', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0190 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column18');

      console.info('[blendModeTest_0190] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0190] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0190] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(18);
      console.info('[blendModeTest_0190] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0200
     * @tc.number blendModeTest_0200
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column19');

      console.info('[blendModeTest_0200] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0200] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0200] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(19);
      console.info('[blendModeTest_0200] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0210
     * @tc.number blendModeTest_0210
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0210', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0210 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column20');

      console.info('[blendModeTest_0210] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0210] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0210] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(20);
      console.info('[blendModeTest_0210] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0220
     * @tc.number blendModeTest_0220
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0220', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0220 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column21');

      console.info('[blendModeTest_0220] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0220] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0220] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(21);
      console.info('[blendModeTest_0220] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0230
     * @tc.number blendModeTest_0230
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0230', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0230 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column22');

      console.info('[blendModeTest_0230] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0230] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0230] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(22);
      console.info('[blendModeTest_0230] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0240
     * @tc.number blendModeTest_0240
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0240', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0240 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column23');

      console.info('[blendModeTest_0240] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0240] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0240] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(23);
      console.info('[blendModeTest_0240] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0250
     * @tc.number blendModeTest_0250
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0250', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0250 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column24');

      console.info('[blendModeTest_0250] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0250] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0250] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(24);
      console.info('[blendModeTest_0250] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0260
     * @tc.number blendModeTest_0260
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0260', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0260 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column25');

      console.info('[blendModeTest_0260] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0260] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0260] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(25);
      console.info('[blendModeTest_0260] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0270
     * @tc.number blendModeTest_0270
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0270', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0270 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column26');

      console.info('[blendModeTest_0270] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0270] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0270] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(26);
      console.info('[blendModeTest_0270] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0280
     * @tc.number blendModeTest_0280
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0280', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0280 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column27');

      console.info('[blendModeTest_0280] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0280] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0280] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(27);
      console.info('[blendModeTest_0280] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0290
     * @tc.number blendModeTest_0290
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0290', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0290 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column28');

      console.info('[blendModeTest_0290] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0290] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0290] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(28);
      console.info('[blendModeTest_0290] END');
      done();
    });
    /**
     * @tc.name   blendModeTest_0310
     * @tc.number blendModeTest_0310
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('blendModeTest_0310', Level.LEVEL2, async (done: Function) => {
      console.info('blendModeTest_0310 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blend_column29');

      console.info('[blendModeTest_0310] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[blendModeTest_0310] component JSON.parse(strJson).$attrs is: ' + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info('[blendModeTest_0310] text: ' + JSON.stringify(JSON.parse(strJson).$attrs.blendMode));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(29);
      console.info('[blendModeTest_0310] END');
      done();
    });
  })
}

