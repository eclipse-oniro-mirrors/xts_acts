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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function ImageBlurTest() {
  describe('ImageBlurTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageBlurTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/nullandundefinedTest/ImageBlurTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageBlurTest state pages: ' + JSON.stringify(pages));
        if (!('ImageBlurTest' == pages.name)) {
          console.info('get ImageBlurTest  state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(3000);
          console.info('push ImageBlurTest  success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageBlurTest page error:' + err);
      }
      console.info('ImageBlurTest beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ImageBlurTest after each called');
    });

    // ========== blur(value: number, options?: BlurOptions): T tests ==========

    /**
     * @tc.name   blurValuePositive_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_VALUE_POSITIVE_0100
     * @tc.desc   Test blur with positive value parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('blurValuePositive_0100', Level.LEVEL0, async () => {
      console.info('[blurValuePositive_0100] START');

      let strJson: string = getInspectorByKey('blur_value_positive');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurValuePositive_0100] Positive obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur value is applied
      expect(obj.$attrs.blur).assertEqual(10);
      console.info('[blurValuePositive_0100] END');
    });

    /**
     * @tc.name   blurValueZero_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_VALUE_ZERO_0100
     * @tc.desc   Test blur with zero value parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('blurValueZero_0100', Level.LEVEL0, async () => {
      console.info('[blurValueZero_0100] START');

      let strJson: string = getInspectorByKey('blur_value_zero');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurValueZero_0100] Zero obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur value is 0
      expect(obj.$attrs.blur).assertEqual(0);
      console.info('[blurValueZero_0100] END');
    });

    /**
     * @tc.name   blurValueLarge_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_VALUE_LARGE_0100
     * @tc.desc   Test blur with large value parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('blurValueLarge_0100', Level.LEVEL0, async () => {
      console.info('[blurValueLarge_0100] START');

      let strJson: string = getInspectorByKey('blur_value_large');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurValueLarge_0100] Large obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur value is 100
      expect(obj.$attrs.blur).assertEqual(100);
      console.info('[blurValueLarge_0100] END');
    });

    /**
     * @tc.name   blurValueNull_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_VALUE_NULL_0100
     * @tc.desc   Test blur with null value parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('blurValueNull_0100', Level.LEVEL1, async () => {
      console.info('[blurValueNull_0100] START');

      let strJson: string = getInspectorByKey('blur_value_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurValueNull_0100] Null obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur value is 0 when set to null
      expect(obj.$attrs.blur).assertEqual(0);
      console.info('[blurValueNull_0100] END');
    });

    /**
     * @tc.name   blurValueUndefined_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_VALUE_UNDEFINED_0100
     * @tc.desc   Test blur with undefined value parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('blurValueUndefined_0100', Level.LEVEL1, async () => {
      console.info('[blurValueUndefined_0100] START');

      let strJson: string = getInspectorByKey('blur_value_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurValueUndefined_0100] Undefined obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur value is 0 when set to undefined
      expect(obj.$attrs.blur).assertEqual(0);
      console.info('[blurValueUndefined_0100] END');
    });

    /**
     * @tc.name   blurValueOptions_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_VALUE_OPTIONS_0100
     * @tc.desc   Test blur with value and options parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('blurValueOptions_0100', Level.LEVEL0, async () => {
      console.info('[blurValueOptions_0100] START');

      let strJson: string = getInspectorByKey('blur_value_options');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurValueOptions_0100] Value and options obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur value is 5
      expect(obj.$attrs.blur).assertEqual(5);
      console.info('[blurValueOptions_0100] END');
    });

    /**
     * @tc.name   blurValueOptionsNull_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_VALUE_OPTIONS_NULL_0100
     * @tc.desc   Test blur with value and null options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('blurValueOptionsNull_0100', Level.LEVEL1, async () => {
      console.info('[blurValueOptionsNull_0100] START');

      let strJson: string = getInspectorByKey('blur_value_options_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurValueOptionsNull_0100] Value and null options obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur value is 5
      expect(obj.$attrs.blur).assertEqual(5);
      console.info('[blurValueOptionsNull_0100] END');
    });

    /**
     * @tc.name   blurValueOptionsUndefined_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_VALUE_OPTIONS_UNDEFINED_0100
     * @tc.desc   Test blur with value and undefined options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('blurValueOptionsUndefined_0100', Level.LEVEL1, async () => {
      console.info('[blurValueOptionsUndefined_0100] START');

      let strJson: string = getInspectorByKey('blur_value_options_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurValueOptionsUndefined_0100] Value and undefined options obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur value is 5
      expect(obj.$attrs.blur).assertEqual(5);
      console.info('[blurValueOptionsUndefined_0100] END');
    });

    // ========== blur(blurRadius: Optional<number>, options?: BlurOptions): T tests ==========

    /**
     * @tc.name   blurBlurRadiusPositive_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_BLURRADIUS_POSITIVE_0100
     * @tc.desc   Test blur with positive blurRadius parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('blurBlurRadiusPositive_0100', Level.LEVEL0, async () => {
      console.info('[blurBlurRadiusPositive_0100] START');

      let strJson: string = getInspectorByKey('blur_blurRadius_positive');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurBlurRadiusPositive_0100] Positive obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur radius is 10
      expect(obj.$attrs.blur).assertEqual(10);
      console.info('[blurBlurRadiusPositive_0100] END');
    });

    /**
     * @tc.name   blurBlurRadiusZero_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_BLURRADIUS_ZERO_0100
     * @tc.desc   Test blur with zero blurRadius parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('blurBlurRadiusZero_0100', Level.LEVEL0, async () => {
      console.info('[blurBlurRadiusZero_0100] START');

      let strJson: string = getInspectorByKey('blur_blurRadius_zero');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurBlurRadiusZero_0100] Zero obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur radius is 0
      expect(obj.$attrs.blur).assertEqual(0);
      console.info('[blurBlurRadiusZero_0100] END');
    });

    /**
     * @tc.name   blurBlurRadiusNull_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_BLURRADIUS_NULL_0100
     * @tc.desc   Test blur with null blurRadius parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('blurBlurRadiusNull_0100', Level.LEVEL1, async () => {
      console.info('[blurBlurRadiusNull_0100] START');

      let strJson: string = getInspectorByKey('blur_blurRadius_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurBlurRadiusNull_0100] Null obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur radius is 0 when set to null
      expect(obj.$attrs.blur).assertEqual(0);
      console.info('[blurBlurRadiusNull_0100] END');
    });

    /**
     * @tc.name   blurBlurRadiusUndefined_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_BLURRADIUS_UNDEFINED_0100
     * @tc.desc   Test blur with undefined blurRadius parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('blurBlurRadiusUndefined_0100', Level.LEVEL1, async () => {
      console.info('[blurBlurRadiusUndefined_0100] START');

      let strJson: string = getInspectorByKey('blur_blurRadius_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurBlurRadiusUndefined_0100] Undefined obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur radius is 0 when set to undefined
      expect(obj.$attrs.blur).assertEqual(0);
      console.info('[blurBlurRadiusUndefined_0100] END');
    });

    /**
     * @tc.name   blurBlurRadiusOptionsPositive_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_BLURRADIUS_OPTIONS_POSITIVE_0100
     * @tc.desc   Test blur with blurRadius and positive options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('blurBlurRadiusOptionsPositive_0100', Level.LEVEL0, async () => {
      console.info('[blurBlurRadiusOptionsPositive_0100] START');

      let strJson: string = getInspectorByKey('blur_blurRadius_options_positive');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurBlurRadiusOptionsPositive_0100] Positive obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur radius is 5
      expect(obj.$attrs.blur).assertEqual(5);
      console.info('[blurBlurRadiusOptionsPositive_0100] END');
    });

    /**
     * @tc.name   blurBlurRadiusOptionsNull_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_BLURRADIUS_OPTIONS_NULL_0100
     * @tc.desc   Test blur with blurRadius and null options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('blurBlurRadiusOptionsNull_0100', Level.LEVEL1, async () => {
      console.info('[blurBlurRadiusOptionsNull_0100] START');

      let strJson: string = getInspectorByKey('blur_blurRadius_options_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurBlurRadiusOptionsNull_0100] Null obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur radius is 5
      expect(obj.$attrs.blur).assertEqual(0);
      console.info('[blurBlurRadiusOptionsNull_0100] END');
    });

    /**
     * @tc.name   blurBlurRadiusOptionsUndefined_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_BLURRADIUS_OPTIONS_UNDEFINED_0100
     * @tc.desc   Test blur with blurRadius and undefined options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('blurBlurRadiusOptionsUndefined_0100', Level.LEVEL1, async () => {
      console.info('[blurBlurRadiusOptionsUndefined_0100] START');

      let strJson: string = getInspectorByKey('blur_blurRadius_options_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurBlurRadiusOptionsUndefined_0100] Undefined obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur radius is 5
      expect(obj.$attrs.blur).assertEqual(0);
      console.info('[blurBlurRadiusOptionsUndefined_0100] END');
    });

    /**
     * @tc.name   blurBlurRadiusOptionsBothNull_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_BLURRADIUS_OPTIONS_BOTH_NULL_0100
     * @tc.desc   Test blur with null blurRadius and null options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('blurBlurRadiusOptionsBothNull_0100', Level.LEVEL1, async () => {
      console.info('[blurBlurRadiusOptionsBothNull_0100] START');

      let strJson: string = getInspectorByKey('blur_blurRadius_options_both_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurBlurRadiusOptionsBothNull_0100] Both null obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur radius is 0 when both are null
      expect(obj.$attrs.blur).assertEqual(0);
      console.info('[blurBlurRadiusOptionsBothNull_0100] END');
    });

    /**
     * @tc.name   blurBlurRadiusOptionsBothUndefined_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_BLURRADIUS_OPTIONS_BOTH_UNDEFINED_0100
     * @tc.desc   Test blur with undefined blurRadius and undefined options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('blurBlurRadiusOptionsBothUndefined_0100', Level.LEVEL1, async () => {
      console.info('[blurBlurRadiusOptionsBothUndefined_0100] START');

      let strJson: string = getInspectorByKey('blur_blurRadius_options_both_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurBlurRadiusOptionsBothUndefined_0100] Both undefined obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur radius is 0 when both are undefined
      expect(obj.$attrs.blur).assertEqual(0);
      console.info('[blurBlurRadiusOptionsBothUndefined_0100] END');
    });

    // ========== blur(blurRadius: Optional<number>, options?: BlurOptions, sysOptions?: SystemAdaptiveOptions): T tests ==========

    /**
     * @tc.name   blurThreePositive_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_THREE_POSITIVE_0100
     * @tc.desc   Test blur with positive blurRadius parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('blurThreePositive_0100', Level.LEVEL0, async () => {
      console.info('[blurThreePositive_0100] START');

      let strJson: string = getInspectorByKey('blur_three_positive');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurThreePositive_0100] Positive obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur radius is 10
      expect(obj.$attrs.blur).assertEqual(10);
      console.info('[blurThreePositive_0100] END');
    });

    /**
     * @tc.name   blurThreeZero_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_THREE_ZERO_0100
     * @tc.desc   Test blur with zero blurRadius parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('blurThreeZero_0100', Level.LEVEL0, async () => {
      console.info('[blurThreeZero_0100] START');

      let strJson: string = getInspectorByKey('blur_three_zero');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurThreeZero_0100] Zero obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur radius is 0
      expect(obj.$attrs.blur).assertEqual(0);
      console.info('[blurThreeZero_0100] END');
    });

    /**
     * @tc.name   blurThreeNull_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_THREE_NULL_0100
     * @tc.desc   Test blur with null blurRadius parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('blurThreeNull_0100', Level.LEVEL1, async () => {
      console.info('[blurThreeNull_0100] START');

      let strJson: string = getInspectorByKey('blur_three_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurThreeNull_0100] Null obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur radius is 0 when set to null
      expect(obj.$attrs.blur).assertEqual(0);
      console.info('[blurThreeNull_0100] END');
    });

    /**
     * @tc.name   blurThreeUndefined_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_THREE_UNDEFINED_0100
     * @tc.desc   Test blur with undefined blurRadius parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('blurThreeUndefined_0100', Level.LEVEL1, async () => {
      console.info('[blurThreeUndefined_0100] START');

      let strJson: string = getInspectorByKey('blur_three_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurThreeUndefined_0100] Undefined obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur radius is 0 when set to undefined
      expect(obj.$attrs.blur).assertEqual(0);
      console.info('[blurThreeUndefined_0100] END');
    });

    /**
     * @tc.name   blurThreeOptionsPositive_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_THREE_OPTIONS_POSITIVE_0100
     * @tc.desc   Test blur with blurRadius and positive options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('blurThreeOptionsPositive_0100', Level.LEVEL0, async () => {
      console.info('[blurThreeOptionsPositive_0100] START');

      let strJson: string = getInspectorByKey('blur_three_options_positive');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurThreeOptionsPositive_0100] Positive obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur radius is 5
      expect(obj.$attrs.blur).assertEqual(5);
      console.info('[blurThreeOptionsPositive_0100] END');
    });

    /**
     * @tc.name   blurThreeOptionsNull_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_THREE_OPTIONS_NULL_0100
     * @tc.desc   Test blur with blurRadius and null options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('blurThreeOptionsNull_0100', Level.LEVEL1, async () => {
      console.info('[blurThreeOptionsNull_0100] START');

      let strJson: string = getInspectorByKey('blur_three_options_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurThreeOptionsNull_0100] Null obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur radius is 5
      expect(obj.$attrs.blur).assertEqual(0);
      console.info('[blurThreeOptionsNull_0100] END');
    });

    /**
     * @tc.name   blurThreeOptionsUndefined_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_THREE_OPTIONS_UNDEFINED_0100
     * @tc.desc   Test blur with blurRadius and undefined options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('blurThreeOptionsUndefined_0100', Level.LEVEL1, async () => {
      console.info('[blurThreeOptionsUndefined_0100] START');

      let strJson: string = getInspectorByKey('blur_three_options_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurThreeOptionsUndefined_0100] Undefined obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur radius is 5
      expect(obj.$attrs.blur).assertEqual(0);
      console.info('[blurThreeOptionsUndefined_0100] END');
    });

    /**
     * @tc.name   blurThreeAllPositive_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_THREE_ALL_POSITIVE_0100
     * @tc.desc   Test blur with all positive parameters and disableSystemAdaptation: true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('blurThreeAllPositive_0100', Level.LEVEL0, async () => {
      console.info('[blurThreeAllPositive_0100] START');

      let strJson: string = getInspectorByKey('blur_three_all_positive');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurThreeAllPositive_0100] All positive obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur radius is 5
      expect(obj.$attrs.blur).assertEqual(5);
      console.info('[blurThreeAllPositive_0100] END');
    });

    /**
     * @tc.name   blurThreeDisableFalse_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_THREE_DISABLE_FALSE_0100
     * @tc.desc   Test blur with disableSystemAdaptation: false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('blurThreeDisableFalse_0100', Level.LEVEL0, async () => {
      console.info('[blurThreeDisableFalse_0100] START');

      let strJson: string = getInspectorByKey('blur_three_disable_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurThreeDisableFalse_0100] Disable false obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur radius is 5
      expect(obj.$attrs.blur).assertEqual(5);
      console.info('[blurThreeDisableFalse_0100] END');
    });

    /**
     * @tc.name   blurThreeAllNull_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_THREE_ALL_NULL_0100
     * @tc.desc   Test blur with all null parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('blurThreeAllNull_0100', Level.LEVEL1, async () => {
      console.info('[blurThreeAllNull_0100] START');

      let strJson: string = getInspectorByKey('blur_three_all_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurThreeAllNull_0100] All null obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur radius is 0 when all are null
      expect(obj.$attrs.blur).assertEqual(0);
      console.info('[blurThreeAllNull_0100] END');
    });

    /**
     * @tc.name   blurThreeAllUndefined_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_THREE_ALL_UNDEFINED_0100
     * @tc.desc   Test blur with all undefined parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('blurThreeAllUndefined_0100', Level.LEVEL1, async () => {
      console.info('[blurThreeAllUndefined_0100] START');

      let strJson: string = getInspectorByKey('blur_three_all_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurThreeAllUndefined_0100] All undefined obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur radius is 0 when all are undefined
      expect(obj.$attrs.blur).assertEqual(0);
      console.info('[blurThreeAllUndefined_0100] END');
    });

    /**
     * @tc.name   blurThreeSysOptionsTrue_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_THREE_SYS_OPTIONS_TRUE_0100
     * @tc.desc   Test blur with blurRadius and sysOptions with disableSystemAdaptation: true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('blurThreeSysOptionsTrue_0100', Level.LEVEL0, async () => {
      console.info('[blurThreeSysOptionsTrue_0100] START');

      let strJson: string = getInspectorByKey('blur_three_sysOptions_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurThreeSysOptionsTrue_0100] Sys options true obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur radius is 5
      expect(obj.$attrs.blur).assertEqual(5);
      console.info('[blurThreeSysOptionsTrue_0100] END');
    });

    /**
     * @tc.name   blurThreeSysOptionsFalse_0100
     * @tc.number SUB_ARKUI_IMAGE_BLUR_THREE_SYS_OPTIONS_FALSE_0100
     * @tc.desc   Test blur with blurRadius and sysOptions with disableSystemAdaptation: false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('blurThreeSysOptionsFalse_0100', Level.LEVEL0, async () => {
      console.info('[blurThreeSysOptionsFalse_0100] START');

      let strJson: string = getInspectorByKey('blur_three_sysOptions_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blurThreeSysOptionsFalse_0100] Sys options false obj is: " + JSON.stringify(obj.$attrs));

      // Check that blur radius is 5
      expect(obj.$attrs.blur).assertEqual(5);
      console.info('[blurThreeSysOptionsFalse_0100] END');
    });
  });
}
