'use static'
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from "../../../../hypium/index";
import router from '@ohos.router';
import drawing from '@ohos.graphics.drawing';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  PointerMatrix} from '@ohos.UiTest';
import { EnterKeyType } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import Utils from '../../../ets/MainAbility/common/Utils';
const SLEEP_TIME = 1000;

export default function blendNodeTest() {
  describe('blendNodeTest', () => {
    beforeAll(() => {
      console.info("blendNodeTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.image.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info('blendNodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/blendMode/blendMode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get blendNodeTest state pages:' + JSON.stringify(pages));
        if (!('blendMode' === pages.name)) {
          console.info('get blendNodeTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push blendNodeTest page error:' + err);
      }
      console.info('blendNodeTest beforeEach end');
    });
    /**
     * @tc.number test_blendMode_001
     * @tc.name   test_blendMode_001
     * @tc.desc   Set the value to Clear and return BlendMode.CLEAR.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('test_blendMode_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeClear');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(0).assertEqual(drawing.BlendMode.CLEAR);
      done();
    });

    /**
     * @tc.number test_blendMode_002
     * @tc.name   test_blendMode_002
     * @tc.desc   Set the value to SRC and return BlendMode.SRC.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeSrc');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(1).assertEqual(drawing.BlendMode.SRC);
      done();
    });

    /**
     * @tc.number test_blendMode_003
     * @tc.name   test_blendMode_003
     * @tc.desc   Set the value to DST and return BlendMode.DST.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeDST');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(2).assertEqual(drawing.BlendMode.DST);
      done();
    });

    /**
     * @tc.number test_blendMode_004
     * @tc.name   test_blendMode_004
     * @tc.desc   Set the value to SRC_OVER and return BlendMode.SRC_OVER.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeSrcOver');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(3).assertEqual(drawing.BlendMode.SRC_OVER);
      done();
    });

    /**
     * @tc.number test_blendMode_005
     * @tc.name   test_blendMode_005
     * @tc.desc   Set the value to DST_OVER and return BlendMode.DST_OVER.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeDstOver');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(4).assertEqual(drawing.BlendMode.DST_OVER);
      done();
    });

    /**
     * @tc.number test_blendMode_006
     * @tc.name   test_blendMode_006
     * @tc.desc   Set the value to SRC_IN and return BlendMode.SRC_IN.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeSrcIn');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(5).assertEqual(drawing.BlendMode.SRC_IN);
      done();
    });
    /**
     * @tc.number test_blendMode_007
     * @tc.name   test_blendMode_007
     * @tc.desc   Set the value to DST_IN and return BlendMode.DST_IN.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeDstIn');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(6).assertEqual(drawing.BlendMode.DST_IN);
      done();
    });

    /**
     * @tc.number test_blendMode_008
     * @tc.name   test_blendMode_008
     * @tc.desc   Set the value to SRC_OUT and return BlendMode.SRC_OUT.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeSrcOut');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(7).assertEqual(drawing.BlendMode.SRC_OUT);
      done();
    });

    /**
     * @tc.number test_blendMode_009
     * @tc.name   test_blendMode_009
     * @tc.desc   Set the value to DST_OUT and return BlendMode.DST_OUT.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeDstOut');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(8).assertEqual(drawing.BlendMode.DST_OUT);
      done();
    });

    /**
     * @tc.number test_blendMode_010
     * @tc.name   test_blendMode_010
     * @tc.desc   Set the value to SRC_ATOP and return BlendMode.SRC_ATOP.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeSrcAtop');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(9).assertEqual(drawing.BlendMode.SRC_ATOP);
      done();
    });

    /**
     * @tc.number test_blendMode_011
     * @tc.name   test_blendMode_011
     * @tc.desc   Set the value to DST_ATOP and return BlendMode.DST_ATOP.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeDtsAtop');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(10).assertEqual(drawing.BlendMode.DST_ATOP);
      done();
    });

    /**
     * @tc.number test_blendMode_012
     * @tc.name   test_blendMode_012
     * @tc.desc   Set the value to XOR and return BlendMode.XOR.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeXor');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(11).assertEqual(drawing.BlendMode.XOR);
      done();
    });

    /**
     * @tc.number test_blendMode_013
     * @tc.name   test_blendMode_013
     * @tc.desc   Set the value to PLUS and return BlendMode.PLUS.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModePlus');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(12).assertEqual(drawing.BlendMode.PLUS);
      done();
    });

    /**
     * @tc.number test_blendMode_014
     * @tc.name   test_blendMode_014
     * @tc.desc   Set the value to MODULATE and return BlendMode.MODULATE.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeModulate');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(13).assertEqual(drawing.BlendMode.MODULATE);
      done();
    });

    /**
     * @tc.number test_blendMode_015
     * @tc.name   test_blendMode_015
     * @tc.desc   Set the value to SCREEN and return BlendMode.SCREEN.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeScreen');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(14).assertEqual(drawing.BlendMode.SCREEN);
      done();
    });

    /**
     * @tc.number test_blendMode_016
     * @tc.name   test_blendMode_016
     * @tc.desc   Set the value to OVERLAY and return BlendMode.OVERLAY.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeOverlay');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(15).assertEqual(drawing.BlendMode.OVERLAY);
      done();
    });

    /**
     * @tc.number test_blendMode_017
     * @tc.name   test_blendMode_017
     * @tc.desc   Set the value to DARKEN and return BlendMode.DARKEN.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeDarken');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(16).assertEqual(drawing.BlendMode.DARKEN);
      done();
    });

    /**
     * @tc.number test_blendMode_018
     * @tc.name   test_blendMode_018
     * @tc.desc   Set the value to LIGHTEN and return BlendMode.LIGHTEN.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeLighten');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(17).assertEqual(drawing.BlendMode.LIGHTEN);
      done();
    });

    /**
     * @tc.number test_blendMode_019
     * @tc.name   test_blendMode_019
     * @tc.desc   Set the value to COLOR_DODGE and return BlendMode.COLOR_DODGE.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeColorDodge');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(18).assertEqual(drawing.BlendMode.COLOR_DODGE);
      done();
    });

    /**
     * @tc.number test_blendMode_020
     * @tc.name   test_blendMode_020
     * @tc.desc   Set the value to COLOR_BURN and return BlendMode.COLOR_BURN.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeColorBurn');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(19).assertEqual(drawing.BlendMode.COLOR_BURN);
      done();
    });

    /**
     * @tc.number test_blendMode_021
     * @tc.name   test_blendMode_021
     * @tc.desc   Set the value to HARD_LIGHT and return BlendMode.HARD_LIGHT.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeHardLight');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(20).assertEqual(drawing.BlendMode.HARD_LIGHT);
      done();
    });

    /**
     * @tc.number test_blendMode_022
     * @tc.name   test_blendMode_022
     * @tc.desc   Set the value to SOFT_LIGHT and return BlendMode.SOFT_LIGHT.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeSoftLight');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(21).assertEqual(drawing.BlendMode.SOFT_LIGHT);
      done();
    });

    /**
     * @tc.number test_blendMode_023
     * @tc.name   test_blendMode_023
     * @tc.desc   Set the value to DIFFERENCE and return BlendMode.DIFFERENCE.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeSoftLight');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(22).assertEqual(drawing.BlendMode.DIFFERENCE);
      done();
    });

    /**
     * @tc.number test_blendMode_024
     * @tc.name   test_blendMode_024
     * @tc.desc   Set the value to EXCLUSION and return BlendMode.EXCLUSION.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeExclusion');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(23).assertEqual(drawing.BlendMode.EXCLUSION);
      done();
    });

    /**
     * @tc.number test_blendMode_025
     * @tc.name   test_blendMode_025
     * @tc.desc   Set the value to MULTIPLY and return BlendMode.MULTIPLY.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeMultiply');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(24).assertEqual(drawing.BlendMode.MULTIPLY);
      done();
    });

    /**
     * @tc.number test_blendMode_026
     * @tc.name   test_blendMode_026
     * @tc.desc   Set the value to HUE and return BlendMode.HUE.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeHue');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(25).assertEqual(drawing.BlendMode.HUE);
      done();
    });

    /**
     * @tc.number test_blendMode_027
     * @tc.name   test_blendMode_027
     * @tc.desc   Set the value to SATURATION and return BlendMode.SATURATION.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeSaturation');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(26).assertEqual(drawing.BlendMode.SATURATION);
      done();
    });

    /**
     * @tc.number test_blendMode_028
     * @tc.name   test_blendMode_028
     * @tc.desc   Set the value to COLOR and return BlendMode.COLOR.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeColor');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(27).assertEqual(drawing.BlendMode.COLOR);
      done();
    });

    /**
     * @tc.number test_blendMode_029
     * @tc.name   test_blendMode_029
     * @tc.desc   Set the value to LUMINOSITY and return BlendMode.LUMINOSITY.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJsonNew = inspector.getInspectorByKey('blendModeLuminosity');
      let obj = JSON.parseJsonElement(strJsonNew);
      await Utils.sleep(SLEEP_TIME);
      expect(28).assertEqual(drawing.BlendMode.LUMINOSITY);
      done();
    });
  })
}