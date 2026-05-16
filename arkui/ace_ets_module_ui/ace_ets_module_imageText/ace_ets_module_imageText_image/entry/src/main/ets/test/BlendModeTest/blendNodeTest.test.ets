/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import { describe, Size, beforeEach, afterEach, TestType, it, expect, Level } from '@ohos/hypium';
import CommonFunc from '../../MainAbility/common/Common'

const SLEEP_TIME = 1000;

export default function blendNodeTest() {
  describe('blendNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('blendNodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BlendMode/blendMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get blendNodeTest state success ' + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!('blendMode' == pages.name)) {
          console.info('get blendNodeTest state success ' + JSON.stringify(pages.name));
          await CommonFunc.sleep(SLEEP_TIME);
          console.info('push blendNodeTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push blendNodeTest page error: ' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('blendNodeTest after each called');
    });

     /**
     * @tc.number test_blendMode_001
     * @tc.name   test_blendMode_001
     * @tc.desc   Set the value to Clear and return BlendMode.CLEAR.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_blendMode_001', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeClear');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(1).assertEqual(BlendMode.CLEAR);
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
    it('test_blendMode_002', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeSrc');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(2).assertEqual(BlendMode.SRC);
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
    it('test_blendMode_003', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeDST');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(3).assertEqual(BlendMode.DST);
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
    it('test_blendMode_004', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeSrcOver');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(4).assertEqual(BlendMode.SRC_OVER);
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
    it('test_blendMode_005', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeDstOver');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(5).assertEqual(BlendMode.DST_OVER);
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
    it('test_blendMode_006', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeSrcIn');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(6).assertEqual(BlendMode.SRC_IN);
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
    it('test_blendMode_007', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeDstIn');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(7).assertEqual(BlendMode.DST_IN);
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
    it('test_blendMode_008', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeSrcOut');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(8).assertEqual(BlendMode.SRC_OUT);
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
    it('test_blendMode_009', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeDstOut');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(9).assertEqual(BlendMode.DST_OUT);
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
    it('test_blendMode_010', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeSrcAtop');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(10).assertEqual(BlendMode.SRC_ATOP);
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
    it('test_blendMode_011', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeDtsAtop');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(11).assertEqual(BlendMode.DST_ATOP);
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
    it('test_blendMode_012', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeXor');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(12).assertEqual(BlendMode.XOR);
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
    it('test_blendMode_013', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModePlus');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(13).assertEqual(BlendMode.PLUS);
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
    it('test_blendMode_014', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeModulate');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(14).assertEqual(BlendMode.MODULATE);
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
    it('test_blendMode_015', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeScreen');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(15).assertEqual(BlendMode.SCREEN);
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
    it('test_blendMode_016', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeOverlay');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(16).assertEqual(BlendMode.OVERLAY);
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
    it('test_blendMode_017', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeDarken');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(17).assertEqual(BlendMode.DARKEN);
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
    it('test_blendMode_018', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeLighten');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(18).assertEqual(BlendMode.LIGHTEN);
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
    it('test_blendMode_019', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeColorDodge');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(19).assertEqual(BlendMode.COLOR_DODGE);
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
    it('test_blendMode_020', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeColorBurn');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(20).assertEqual(BlendMode.COLOR_BURN);
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
    it('test_blendMode_021', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeHardLight');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(21).assertEqual(BlendMode.HARD_LIGHT);
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
    it('test_blendMode_022', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeSoftLight');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(22).assertEqual(BlendMode.SOFT_LIGHT);
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
    it('test_blendMode_023', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeSoftLight');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(23).assertEqual(BlendMode.DIFFERENCE);
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
    it('test_blendMode_024', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeExclusion');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(24).assertEqual(BlendMode.EXCLUSION);
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
    it('test_blendMode_025', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeMultiply');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(25).assertEqual(BlendMode.MULTIPLY);
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
    it('test_blendMode_026', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeHue');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(26).assertEqual(BlendMode.HUE);
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
    it('test_blendMode_027', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeSaturation');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(27).assertEqual(BlendMode.SATURATION);
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
    it('test_blendMode_028', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeColor');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(28).assertEqual(BlendMode.COLOR);
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
    it('test_blendMode_029', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('blendModeLuminosity');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      expect(29).assertEqual(BlendMode.LUMINOSITY);
      done();
    });
  })
}