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

export default function BackgroundBlurStyleTest() {
  describe('BackgroundBlurStyleTest', () => {
    beforeAll(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/nullandundefinedTest/BackgroundBlurStyleTest',
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!('BackgroundBlurStyleTest' === pages.name)) {
          await router.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error('push BackgroundBlurStyleTest page error:' + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('BackdropBlurTest after each called');
    });


    /**
     * @tc.name   backgroundBlurStyleRegular_0100
     * @tc.number SUB_ARKUI_BACKGROUND_BLUR_STYLE_REGULAR_0100
     * @tc.desc   Test backgroundBlurStyle with Regular enum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backgroundBlurStyleRegular_0100', Level.LEVEL0, async () => {
      console.info('[backgroundBlurStyleRegular_0100] START');

      let strJson: string = getInspectorByKey('backgroundBlurStyle_Regular');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backgroundBlurStyleRegular_0100] Regular obj is: " + JSON.stringify(obj.$attrs));

      // Check that Regular enum is applied
      expect(obj.$attrs.backgroundBlurStyle.value).assertEqual('BlurStyle.Regular');
      console.info('[backgroundBlurStyleRegular_0100] END');
    });

    /**
     * @tc.name   backgroundBlurStyleNONE_0100
     * @tc.number SUB_ARKUI_BACKGROUND_BLUR_STYLE_NONE_0100
     * @tc.desc   Test backgroundBlurStyle with NONE enum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backgroundBlurStyleNONE_0100', Level.LEVEL0, async () => {
      console.info('[backgroundBlurStyleNONE_0100] START');

      let strJson: string = getInspectorByKey('backgroundBlurStyle_NONE');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backgroundBlurStyleNONE_0100] NONE obj is: " + JSON.stringify(obj.$attrs));

      // Check that NONE enum is applied
      expect(obj.$attrs.backgroundBlurStyle.value).assertEqual('BlurStyle.NONE');
      console.info('[backgroundBlurStyleNONE_0100] END');
    });

    /**
     * @tc.name   backgroundBlurStyleComponentUltraThin_0100
     * @tc.number SUB_ARKUI_BACKGROUND_BLUR_STYLE_COMPONENT_ULTRA_THIN_0100
     * @tc.desc   Test backgroundBlurStyle with COMPONENT_ULTRA_THIN enum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backgroundBlurStyleComponentUltraThin_0100', Level.LEVEL0, async () => {
      console.info('[backgroundBlurStyleComponentUltraThin_0100] START');

      let strJson: string = getInspectorByKey('backgroundBlurStyle_COMPONENT_ULTRA_THIN');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backgroundBlurStyleComponentUltraThin_0100] COMPONENT_ULTRA_THIN obj is: " + JSON.stringify(obj.$attrs));

      // Check that COMPONENT_ULTRA_THIN enum is applied
      expect(obj.$attrs.backgroundBlurStyle.value).assertEqual('BlurStyle.COMPONENT_ULTRA_THIN');
      console.info('[backgroundBlurStyleComponentUltraThin_0100] END');
    });

    /**
     * @tc.name   backgroundBlurStyleComponentThin_0100
     * @tc.number SUB_ARKUI_BACKGROUND_BLUR_STYLE_COMPONENT_THIN_0100
     * @tc.desc   Test backgroundBlurStyle with COMPONENT_THIN enum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backgroundBlurStyleComponentThin_0100', Level.LEVEL0, async () => {
      console.info('[backgroundBlurStyleComponentThin_0100] START');

      let strJson: string = getInspectorByKey('backgroundBlurStyle_COMPONENT_THIN');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backgroundBlurStyleComponentThin_0100] COMPONENT_THIN obj is: " + JSON.stringify(obj.$attrs));

      // Check that COMPONENT_THIN enum is applied
      expect(obj.$attrs.backgroundBlurStyle.value).assertEqual('BlurStyle.COMPONENT_THIN');
      console.info('[backgroundBlurStyleComponentThin_0100] END');
    });

    /**
     * @tc.name   backgroundBlurStyleComponentRegular_0100
     * @tc.number SUB_ARKUI_BACKGROUND_BLUR_STYLE_COMPONENT_REGULAR_0100
     * @tc.desc   Test backgroundBlurStyle with COMPONENT_REGULAR enum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backgroundBlurStyleComponentRegular_0100', Level.LEVEL0, async () => {
      console.info('[backgroundBlurStyleComponentRegular_0100] START');

      let strJson: string = getInspectorByKey('backgroundBlurStyle_COMPONENT_REGULAR');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backgroundBlurStyleComponentRegular_0100] COMPONENT_REGULAR obj is: " + JSON.stringify(obj.$attrs));

      // Check that COMPONENT_REGULAR enum is applied
      expect(obj.$attrs.backgroundBlurStyle.value).assertEqual('BlurStyle.COMPONENT_REGULAR');
      console.info('[backgroundBlurStyleComponentRegular_0100] END');
    });

    /**
     * @tc.name   backgroundBlurStyleComponentThick_0100
     * @tc.number SUB_ARKUI_BACKGROUND_BLUR_STYLE_COMPONENT_THICK_0100
     * @tc.desc   Test backgroundBlurStyle with COMPONENT_THICK enum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backgroundBlurStyleComponentThick_0100', Level.LEVEL0, async () => {
      console.info('[backgroundBlurStyleComponentThick_0100] START');

      let strJson: string = getInspectorByKey('backgroundBlurStyle_COMPONENT_THICK');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backgroundBlurStyleComponentThick_0100] COMPONENT_THICK obj is: " + JSON.stringify(obj.$attrs));

      // Check that COMPONENT_THICK enum is applied
      expect(obj.$attrs.backgroundBlurStyle.value).assertEqual('BlurStyle.COMPONENT_THICK');
      console.info('[backgroundBlurStyleComponentThick_0100] END');
    });

    /**
     * @tc.name   backgroundBlurStyleComponentUltraThick_0100
     * @tc.number SUB_ARKUI_BACKGROUND_BLUR_STYLE_COMPONENT_ULTRA_THICK_0100
     * @tc.desc   Test backgroundBlurStyle with COMPONENT_ULTRA_THICK enum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backgroundBlurStyleComponentUltraThick_0100', Level.LEVEL0, async () => {
      console.info('[backgroundBlurStyleComponentUltraThick_0100] START');

      let strJson: string = getInspectorByKey('backgroundBlurStyle_COMPONENT_ULTRA_THICK');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backgroundBlurStyleComponentUltraThick_0100] COMPONENT_ULTRA_THICK obj is: " + JSON.stringify(obj.$attrs));

      // Check that COMPONENT_ULTRA_THICK enum is applied
      expect(obj.$attrs.backgroundBlurStyle.value).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      console.info('[backgroundBlurStyleComponentUltraThick_0100] END');
    });

    /**
     * @tc.name   backgroundBlurStyleNull_0100
     * @tc.number SUB_ARKUI_BACKGROUND_BLUR_STYLE_NULL_0100
     * @tc.desc   Test backgroundBlurStyle with null parameter, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backgroundBlurStyleNull_0100', Level.LEVEL0, async () => {
      console.info('[backgroundBlurStyleNull_0100] START');

      let strJsonCompare: string = getInspectorByKey('backgroundBlurStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('backgroundBlurStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backgroundBlurStyleNull_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[backgroundBlurStyleNull_0100] null obj is: " + JSON.stringify(obj.$attrs));

      // null should restore to default value
      expect(obj.$attrs.blurStyle).assertEqual(objCompare.$attrs.blurStyle);
      console.info('[backgroundBlurStyleNull_0100] END');
    });

    /**
     * @tc.name   backgroundBlurStyleUndefined_0100
     * @tc.number SUB_ARKUI_BACKGROUND_BLUR_STYLE_UNDEFINED_0100
     * @tc.desc   Test backgroundBlurStyle with undefined parameter, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backgroundBlurStyleUndefined_0100', Level.LEVEL0, async () => {
      console.info('[backgroundBlurStyleUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('backgroundBlurStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('backgroundBlurStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backgroundBlurStyleUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[backgroundBlurStyleUndefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

      // undefined should restore to default value
      expect(obj.$attrs.blurStyle).assertEqual(objCompare.$attrs.blurStyle);
      console.info('[backgroundBlurStyleUndefined_0100] END');
    });

    /**
     * @tc.name   backgroundBlurStyleAlwaysInactive_0100
     * @tc.number SUB_ARKUI_BACKGROUND_BLUR_STYLE_ALWAYS_INACTIVE_0100
     * @tc.desc   Test backgroundBlurStyle with options containing ALWAYS_INACTIVE policy
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backgroundBlurStyleAlwaysInactive_0100', Level.LEVEL0, async () => {
      console.info('[backgroundBlurStyleAlwaysInactive_0100] START');

      let strJson: string = getInspectorByKey('backgroundBlurStyle_ALWAYS_INACTIVE');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backgroundBlurStyleAlwaysInactive_0100] ALWAYS_INACTIVE obj is: " + JSON.stringify(obj.$attrs));

      // Check that the object exists and has the expected properties
      expect(obj.$attrs.backgroundBlurStyle.value).assertEqual('BlurStyle.Regular'); // Check that the object exists but has no specific properties
      console.info('[backgroundBlurStyleAlwaysInactive_0100] END');
    });

    // ========== backgroundBlurStyle(style: Optional<BlurStyle>, options?: BackgroundBlurStyleOptions): T; tests ==========

    /**
     * @tc.name   backgroundBlurStyleOptionalNull_0100
     * @tc.number SUB_ARKUI_BACKGROUND_BLUR_STYLE_OPTIONAL_NULL_0100
     * @tc.desc   Test backgroundBlurStyle Optional with null parameter, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backgroundBlurStyleOptionalNull_0100', Level.LEVEL0, async () => {
      console.info('[backgroundBlurStyleOptionalNull_0100] START');

      let strJsonCompare: string = getInspectorByKey('backgroundBlurStyle_Optional_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('backgroundBlurStyle_Optional_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backgroundBlurStyleOptionalNull_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[backgroundBlurStyleOptionalNull_0100] null obj is: " + JSON.stringify(obj.$attrs));

      // null should restore to default value
      expect(obj.$attrs.blurStyle).assertEqual(objCompare.$attrs.blurStyle);
      console.info('[backgroundBlurStyleOptionalNull_0100] END');
    });

    /**
     * @tc.name   backgroundBlurStyleOptionalUndefined_0100
     * @tc.number SUB_ARKUI_BACKGROUND_BLUR_STYLE_OPTIONAL_UNDEFINED_0100
     * @tc.desc   Test backgroundBlurStyle Optional with undefined parameter, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backgroundBlurStyleOptionalUndefined_0100', Level.LEVEL0, async () => {
      console.info('[backgroundBlurStyleOptionalUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('backgroundBlurStyle_Optional_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('backgroundBlurStyle_Optional_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backgroundBlurStyleOptionalUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[backgroundBlurStyleOptionalUndefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

      // undefined should restore to default value
      expect(obj.$attrs.blurStyle).assertEqual(objCompare.$attrs.blurStyle);
      console.info('[backgroundBlurStyleOptionalUndefined_0100] END');
    });

    /**
     * @tc.name   backgroundBlurStyleOptionalAlwaysInactive_0100
     * @tc.number SUB_ARKUI_BACKGROUND_BLUR_STYLE_OPTIONAL_ALWAYS_INACTIVE_0100
     * @tc.desc   Test backgroundBlurStyle Optional with options containing ALWAYS_INACTIVE policy
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backgroundBlurStyleOptionalAlwaysInactive_0100', Level.LEVEL0, async () => {
      console.info('[backgroundBlurStyleOptionalAlwaysInactive_0100] START');

      let strJson: string = getInspectorByKey('backgroundBlurStyle_Optional_ALWAYS_INACTIVE');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backgroundBlurStyleOptionalAlwaysInactive_0100] ALWAYS_INACTIVE obj is: " + JSON.stringify(obj.$attrs));

      // Check that the object exists and has the expected properties
      expect(obj.$attrs.backgroundBlurStyle.value).assertEqual('BlurStyle.Regular'); // Check that the object exists but has no specific properties
      console.info('[backgroundBlurStyleOptionalAlwaysInactive_0100] END');
    });

    // ========== backgroundBlurStyle(style: Optional<BlurStyle>, options?: BackgroundBlurStyleOptions, sysOptions?: SystemAdaptiveOptions): T; tests ==========

    /**
     * @tc.name   backgroundBlurStyleThreeNull_0100
     * @tc.number SUB_ARKUI_BACKGROUND_BLUR_STYLE_THREE_NULL_0100
     * @tc.desc   Test backgroundBlurStyle Three parameters with null style, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backgroundBlurStyleThreeNull_0100', Level.LEVEL0, async () => {
      console.info('[backgroundBlurStyleThreeNull_0100] START');

      let strJsonCompare: string = getInspectorByKey('backgroundBlurStyle_Three_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('backgroundBlurStyle_Three_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backgroundBlurStyleThreeNull_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[backgroundBlurStyleThreeNull_0100] null obj is: " + JSON.stringify(obj.$attrs));

      // null should restore to default value
      expect(obj.$attrs.blurStyle).assertEqual(objCompare.$attrs.blurStyle);
      console.info('[backgroundBlurStyleThreeNull_0100] END');
    });

    /**
     * @tc.name   backgroundBlurStyleThreeUndefined_0100
     * @tc.number SUB_ARKUI_BACKGROUND_BLUR_STYLE_THREE_UNDEFINED_0100
     * @tc.desc   Test backgroundBlurStyle Three parameters with undefined style, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backgroundBlurStyleThreeUndefined_0100', Level.LEVEL0, async () => {
      console.info('[backgroundBlurStyleThreeUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('backgroundBlurStyle_Three_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('backgroundBlurStyle_Three_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backgroundBlurStyleThreeUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[backgroundBlurStyleThreeUndefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

      // undefined should restore to default value
      expect(obj.$attrs.blurStyle).assertEqual(objCompare.$attrs.blurStyle);
      console.info('[backgroundBlurStyleThreeUndefined_0100] END');
    });

    /**
     * @tc.name   backgroundBlurStyleThreeOptionsNull_0100
     * @tc.number SUB_ARKUI_BACKGROUND_BLUR_STYLE_THREE_OPTIONS_NULL_0100
     * @tc.desc   Test backgroundBlurStyle Three parameters with null options
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backgroundBlurStyleThreeOptionsNull_0100', Level.LEVEL0, async () => {
      console.info('[backgroundBlurStyleThreeOptionsNull_0100] START');

      let strJson: string = getInspectorByKey('backgroundBlurStyle_Three_options_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backgroundBlurStyleThreeOptionsNull_0100] options null obj is: " + JSON.stringify(obj.$attrs));

      // Check that the object exists
      expect(obj.$attrs.backgroundBlurStyle.value).assertEqual('BlurStyle.Regular'); ;
      console.info('[backgroundBlurStyleThreeOptionsNull_0100] END');
    });

    /**
     * @tc.name   backgroundBlurStyleThreeOptionsUndefined_0100
     * @tc.number SUB_ARKUI_BACKGROUND_BLUR_STYLE_THREE_OPTIONS_UNDEFINED_0100
     * @tc.desc   Test backgroundBlurStyle Three parameters with undefined options
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backgroundBlurStyleThreeOptionsUndefined_0100', Level.LEVEL0, async () => {
      console.info('[backgroundBlurStyleThreeOptionsUndefined_0100] START');

      let strJson: string = getInspectorByKey('backgroundBlurStyle_Three_options_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backgroundBlurStyleThreeOptionsUndefined_0100] options undefined obj is: " + JSON.stringify(obj.$attrs));

      // Check that the object exists
      expect(obj.$attrs.backgroundBlurStyle.value).assertEqual('BlurStyle.Regular'); ;
      console.info('[backgroundBlurStyleThreeOptionsUndefined_0100] END');
    });

    /**
     * @tc.name   backgroundBlurStyleThreeAlwaysInactive_0100
     * @tc.number SUB_ARKUI_BACKGROUND_BLUR_STYLE_THREE_ALWAYS_INACTIVE_0100
     * @tc.desc   Test backgroundBlurStyle Three parameters with options containing ALWAYS_INACTIVE policy
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backgroundBlurStyleThreeAlwaysInactive_0100', Level.LEVEL0, async () => {
      console.info('[backgroundBlurStyleThreeAlwaysInactive_0100] START');

      let strJson: string = getInspectorByKey('backgroundBlurStyle_Three_ALWAYS_INACTIVE');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backgroundBlurStyleThreeAlwaysInactive_0100] ALWAYS_INACTIVE obj is: " + JSON.stringify(obj.$attrs));

      // Check that the object exists and has the expected properties
      expect(obj.$attrs.backgroundBlurStyle.value).assertEqual('BlurStyle.Regular'); ;
      console.info('[backgroundBlurStyleThreeAlwaysInactive_0100] END');
    });

    /**
     * @tc.name   backgroundBlurStyleThreeSysOptionsNull_0100
     * @tc.number SUB_ARKUI_BACKGROUND_BLUR_STYLE_THREE_SYS_OPTIONS_NULL_0100
     * @tc.desc   Test backgroundBlurStyle Three parameters with null sysOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backgroundBlurStyleThreeSysOptionsNull_0100', Level.LEVEL0, async () => {
      console.info('[backgroundBlurStyleThreeSysOptionsNull_0100] START');

      let strJson: string = getInspectorByKey('backgroundBlurStyle_Three_sysOptions_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backgroundBlurStyleThreeSysOptionsNull_0100] sysOptions null obj is: " + JSON.stringify(obj.$attrs));

      // Check that the object exists
      expect(obj.$attrs.backgroundBlurStyle.value).assertEqual('BlurStyle.Regular'); ;
      console.info('[backgroundBlurStyleThreeSysOptionsNull_0100] END');
    });

    /**
     * @tc.name   backgroundBlurStyleThreeSysOptionsUndefined_0100
     * @tc.number SUB_ARKUI_BACKGROUND_BLUR_STYLE_THREE_SYS_OPTIONS_UNDEFINED_0100
     * @tc.desc   Test backgroundBlurStyle Three parameters with undefined sysOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backgroundBlurStyleThreeSysOptionsUndefined_0100', Level.LEVEL0, async () => {
      console.info('[backgroundBlurStyleThreeSysOptionsUndefined_0100] START');

      let strJson: string = getInspectorByKey('backgroundBlurStyle_Three_sysOptions_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backgroundBlurStyleThreeSysOptionsUndefined_0100] sysOptions undefined obj is: " + JSON.stringify(obj.$attrs));

      // Check that the object exists
      expect(obj.$attrs.backgroundBlurStyle.value).assertEqual('BlurStyle.Regular'); ;
      console.info('[backgroundBlurStyleThreeSysOptionsUndefined_0100] END');
    });

    /**
     * @tc.name   backgroundBlurStyleThreeSysOptionsTrue_0100
     * @tc.number SUB_ARKUI_BACKGROUND_BLUR_STYLE_THREE_SYS_OPTIONS_TRUE_0100
     * @tc.desc   Test backgroundBlurStyle Three parameters with sysOptions containing true for disableSystemAdaptation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backgroundBlurStyleThreeSysOptionsTrue_0100', Level.LEVEL0, async () => {
      console.info('[backgroundBlurStyleThreeSysOptionsTrue_0100] START');

      let strJson: string = getInspectorByKey('backgroundBlurStyle_Three_sysOptions_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backgroundBlurStyleThreeSysOptionsTrue_0100] sysOptions true obj is: " + JSON.stringify(obj.$attrs));

      // Check that the object exists
      expect(obj.$attrs.backgroundBlurStyle.value).assertEqual('BlurStyle.Regular'); ;
      console.info('[backgroundBlurStyleThreeSysOptionsTrue_0100] END');
    });

    /**
     * @tc.name   backgroundBlurStyleThreeSysOptionsFalse_0100
     * @tc.number SUB_ARKUI_BACKGROUND_BLUR_STYLE_THREE_SYS_OPTIONS_FALSE_0100
     * @tc.desc   Test backgroundBlurStyle Three parameters with sysOptions containing false for disableSystemAdaptation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backgroundBlurStyleThreeSysOptionsFalse_0100', Level.LEVEL0, async () => {
      console.info('[backgroundBlurStyleThreeSysOptionsFalse_0100] START');

      let strJson: string = getInspectorByKey('backgroundBlurStyle_Three_sysOptions_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backgroundBlurStyleThreeSysOptionsFalse_0100] sysOptions false obj is: " + JSON.stringify(obj.$attrs));

      // Check that the object exists
      expect(obj.$attrs.backgroundBlurStyle.value).assertEqual('BlurStyle.Regular'); ;
      console.info('[backgroundBlurStyleThreeSysOptionsFalse_0100] END');
    });
  });
}