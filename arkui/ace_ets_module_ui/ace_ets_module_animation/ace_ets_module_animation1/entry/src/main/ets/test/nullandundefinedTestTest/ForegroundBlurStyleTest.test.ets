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

export default function ForegroundBlurStyleTest() {
  describe('ForegroundBlurStyleTest', () => {
    beforeAll(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/nullandundefinedTest/ForegroundBlurStyleTest',
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!('ForegroundBlurStyleTest' === pages.name)) {
          await router.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error('push ForegroundBlurStyleTest page error:' + err);
      }
    });

    beforeEach(() => {
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('BackdropBlurTest after each called');
    });

    // ========== foregroundBlurStyle(value: BlurStyle, options?: ForegroundBlurStyleOptions): T; tests ==========

    /**
     * @tc.name   foregroundBlurStyleRegular_0100
     * @tc.number SUB_ARKUI_FOREGROUND_BLUR_STYLE_REGULAR_0100
     * @tc.desc   Test foregroundBlurStyle with Regular enum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('foregroundBlurStyleRegular_0100', Level.LEVEL0, async () => {
      console.info('[foregroundBlurStyleRegular_0100] START');

      let strJson: string = getInspectorByKey('foregroundBlurStyle_Regular');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[foregroundBlurStyleRegular_0100] Regular obj is: " + JSON.stringify(obj.$attrs));

      // Check that Regular enum is applied
      expect(obj.$attrs.borderColor).assertEqual('#FF000000');
      console.info('[foregroundBlurStyleRegular_0100] END');
    });

    /**
     * @tc.name   foregroundBlurStyleThick_0100
     * @tc.number SUB_ARKUI_FOREGROUND_BLUR_STYLE_THICK_0100
     * @tc.desc   Test foregroundBlurStyle with Thick enum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('foregroundBlurStyleThick_0100', Level.LEVEL0, async () => {
      console.info('[foregroundBlurStyleThick_0100] START');

      let strJson: string = getInspectorByKey('foregroundBlurStyle_Thick');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[foregroundBlurStyleThick_0100] Thick obj is: " + JSON.stringify(obj.$attrs));

      // Check that Thick enum is applied
      expect(obj.$attrs.borderColor).assertEqual('#FF000000');
      console.info('[foregroundBlurStyleThick_0100] END');
    });

    /**
     * @tc.name   foregroundBlurStyleBackgroundThin_0100
     * @tc.number SUB_ARKUI_FOREGROUND_BLUR_STYLE_BACKGROUND_THIN_0100
     * @tc.desc   Test foregroundBlurStyle with BACKGROUND_THIN enum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('foregroundBlurStyleBackgroundThin_0100', Level.LEVEL0, async () => {
      console.info('[foregroundBlurStyleBackgroundThin_0100] START');

      let strJson: string = getInspectorByKey('foregroundBlurStyle_BACKGROUND_THIN');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[foregroundBlurStyleBackgroundThin_0100] BACKGROUND_THIN obj is: " + JSON.stringify(obj.$attrs));

      // Check that BACKGROUND_THIN enum is applied
      expect(obj.$attrs.borderColor).assertEqual('#FF000000');
      console.info('[foregroundBlurStyleBackgroundThin_0100] END');
    });

    /**
     * @tc.name   foregroundBlurStyleBackgroundRegular_0100
     * @tc.number SUB_ARKUI_FOREGROUND_BLUR_STYLE_BACKGROUND_REGULAR_0100
     * @tc.desc   Test foregroundBlurStyle with BACKGROUND_REGULAR enum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('foregroundBlurStyleBackgroundRegular_0100', Level.LEVEL0, async () => {
      console.info('[foregroundBlurStyleBackgroundRegular_0100] START');

      let strJson: string = getInspectorByKey('foregroundBlurStyle_BACKGROUND_REGULAR');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[foregroundBlurStyleBackgroundRegular_0100] BACKGROUND_REGULAR obj is: " + JSON.stringify(obj.$attrs));

      // Check that BACKGROUND_REGULAR enum is applied
      expect(obj.$attrs.borderColor).assertEqual('#FF000000');
      console.info('[foregroundBlurStyleBackgroundRegular_0100] END');
    });

    /**
     * @tc.name   foregroundBlurStyleBackgroundThick_0100
     * @tc.number SUB_ARKUI_FOREGROUND_BLUR_STYLE_BACKGROUND_THICK_0100
     * @tc.desc   Test foregroundBlurStyle with BACKGROUND_THICK enum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('foregroundBlurStyleBackgroundThick_0100', Level.LEVEL0, async () => {
      console.info('[foregroundBlurStyleBackgroundThick_0100] START');

      let strJson: string = getInspectorByKey('foregroundBlurStyle_BACKGROUND_THICK');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[foregroundBlurStyleBackgroundThick_0100] BACKGROUND_THICK obj is: " + JSON.stringify(obj.$attrs));

      // Check that BACKGROUND_THICK enum is applied
      expect(obj.$attrs.borderColor).assertEqual('#FF000000');
      console.info('[foregroundBlurStyleBackgroundThick_0100] END');
    });

    /**
     * @tc.name   foregroundBlurStyleBackgroundUltraThick_0100
     * @tc.number SUB_ARKUI_FOREGROUND_BLUR_STYLE_BACKGROUND_ULTRA_THICK_0100
     * @tc.desc   Test foregroundBlurStyle with BACKGROUND_ULTRA_THICK enum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('foregroundBlurStyleBackgroundUltraThick_0100', Level.LEVEL0, async () => {
      console.info('[foregroundBlurStyleBackgroundUltraThick_0100] START');

      let strJson: string = getInspectorByKey('foregroundBlurStyle_BACKGROUND_ULTRA_THICK');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[foregroundBlurStyleBackgroundUltraThick_0100] BACKGROUND_ULTRA_THICK obj is: " + JSON.stringify(obj.$attrs));

      // Check that BACKGROUND_ULTRA_THICK enum is applied
      expect(obj.$attrs.borderColor).assertEqual('#FF000000');
      console.info('[foregroundBlurStyleBackgroundUltraThick_0100] END');
    });

    /**
     * @tc.name   foregroundBlurStyleNone_0100
     * @tc.number SUB_ARKUI_FOREGROUND_BLUR_STYLE_NONE_0100
     * @tc.desc   Test foregroundBlurStyle with NONE enum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('foregroundBlurStyleNone_0100', Level.LEVEL0, async () => {
      console.info('[foregroundBlurStyleNone_0100] START');

      let strJson: string = getInspectorByKey('foregroundBlurStyle_NONE');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[foregroundBlurStyleNone_0100] NONE obj is: " + JSON.stringify(obj.$attrs));

      // Check that NONE enum is applied
      expect(obj.$attrs.backgroundBlurStyle.value).assertEqual('BlurStyle.NONE');
      console.info('[foregroundBlurStyleNone_0100] END');
    });

    /**
     * @tc.name   foregroundBlurStyleComponentUltraThin_0100
     * @tc.number SUB_ARKUI_FOREGROUND_BLUR_STYLE_COMPONENT_ULTRA_THIN_0100
     * @tc.desc   Test foregroundBlurStyle with COMPONENT_ULTRA_THIN enum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('foregroundBlurStyleComponentUltraThin_0100', Level.LEVEL0, async () => {
      console.info('[foregroundBlurStyleComponentUltraThin_0100] START');

      let strJson: string = getInspectorByKey('foregroundBlurStyle_COMPONENT_ULTRA_THIN');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[foregroundBlurStyleComponentUltraThin_0100] COMPONENT_ULTRA_THIN obj is: " + JSON.stringify(obj.$attrs));

      // Check that COMPONENT_ULTRA_THIN enum is applied
      expect(obj.$attrs.borderColor).assertEqual('#FF000000');
      console.info('[foregroundBlurStyleComponentUltraThin_0100] END');
    });

    /**
     * @tc.name   foregroundBlurStyleComponentThin_0100
     * @tc.number SUB_ARKUI_FOREGROUND_BLUR_STYLE_COMPONENT_THIN_0100
     * @tc.desc   Test foregroundBlurStyle with COMPONENT_THIN enum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('foregroundBlurStyleComponentThin_0100', Level.LEVEL0, async () => {
      console.info('[foregroundBlurStyleComponentThin_0100] START');

      let strJson: string = getInspectorByKey('foregroundBlurStyle_COMPONENT_THIN');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[foregroundBlurStyleComponentThin_0100] COMPONENT_THIN obj is: " + JSON.stringify(obj.$attrs));

      // Check that COMPONENT_THIN enum is applied
      expect(obj.$attrs.borderColor).assertEqual('#FF000000');
      console.info('[foregroundBlurStyleComponentThin_0100] END');
    });

    /**
     * @tc.name   foregroundBlurStyleComponentRegular_0100
     * @tc.number SUB_ARKUI_FOREGROUND_BLUR_STYLE_COMPONENT_REGULAR_0100
     * @tc.desc   Test foregroundBlurStyle with COMPONENT_REGULAR enum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('foregroundBlurStyleComponentRegular_0100', Level.LEVEL0, async () => {
      console.info('[foregroundBlurStyleComponentRegular_0100] START');

      let strJson: string = getInspectorByKey('foregroundBlurStyle_COMPONENT_REGULAR');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[foregroundBlurStyleComponentRegular_0100] COMPONENT_REGULAR obj is: " + JSON.stringify(obj.$attrs));

      // Check that COMPONENT_REGULAR enum is applied
      expect(obj.$attrs.borderColor).assertEqual('#FF000000');
      console.info('[foregroundBlurStyleComponentRegular_0100] END');
    });

    /**
     * @tc.name   foregroundBlurStyleComponentThick_0100
     * @tc.number SUB_ARKUI_FOREGROUND_BLUR_STYLE_COMPONENT_THICK_0100
     * @tc.desc   Test foregroundBlurStyle with COMPONENT_THICK enum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('foregroundBlurStyleComponentThick_0100', Level.LEVEL0, async () => {
      console.info('[foregroundBlurStyleComponentThick_0100] START');

      let strJson: string = getInspectorByKey('foregroundBlurStyle_COMPONENT_THICK');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[foregroundBlurStyleComponentThick_0100] COMPONENT_THICK obj is: " + JSON.stringify(obj.$attrs));

      // Check that COMPONENT_THICK enum is applied
      expect(obj.$attrs.borderColor).assertEqual('#FF000000');
      console.info('[foregroundBlurStyleComponentThick_0100] END');
    });

    /**
     * @tc.name   foregroundBlurStyleComponentUltraThick_0100
     * @tc.number SUB_ARKUI_FOREGROUND_BLUR_STYLE_COMPONENT_ULTRA_THICK_0100
     * @tc.desc   Test foregroundBlurStyle with COMPONENT_ULTRA_THICK enum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('foregroundBlurStyleComponentUltraThick_0100', Level.LEVEL0, async () => {
      console.info('[foregroundBlurStyleComponentUltraThick_0100] START');

      let strJson: string = getInspectorByKey('foregroundBlurStyle_COMPONENT_ULTRA_THICK');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[foregroundBlurStyleComponentUltraThick_0100] COMPONENT_ULTRA_THICK obj is: " + JSON.stringify(obj.$attrs));

      // Check that COMPONENT_ULTRA_THICK enum is applied
      expect(obj.$attrs.borderColor).assertEqual('#FF000000');
      console.info('[foregroundBlurStyleComponentUltraThick_0100] END');
    });

    // ========== foregroundBlurStyle(style: Optional<BlurStyle>, options?: ForegroundBlurStyleOptions): T; tests ==========

    /**
     * @tc.name   foregroundBlurStyleOptionalNull_0100
     * @tc.number SUB_ARKUI_FOREGROUND_BLUR_STYLE_OPTIONAL_NULL_0100
     * @tc.desc   Test foregroundBlurStyle Optional with null parameter, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('foregroundBlurStyleOptionalNull_0100', Level.LEVEL0, async () => {
      console.info('[foregroundBlurStyleOptionalNull_0100] START');

      let strJsonCompare: string = getInspectorByKey('foregroundBlurStyle_Optional_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('foregroundBlurStyle_Optional_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[foregroundBlurStyleOptionalNull_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[foregroundBlurStyleOptionalNull_0100] null obj is: " + JSON.stringify(obj.$attrs));

      // null should restore to default value
      expect(obj.$attrs.blurStyle).assertEqual(objCompare.$attrs.blurStyle);
      console.info('[foregroundBlurStyleOptionalNull_0100] END');
    });

    /**
     * @tc.name   foregroundBlurStyleOptionalUndefined_0100
     * @tc.number SUB_ARKUI_FOREGROUND_BLUR_STYLE_OPTIONAL_UNDEFINED_0100
     * @tc.desc   Test foregroundBlurStyle Optional with undefined parameter, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('foregroundBlurStyleOptionalUndefined_0100', Level.LEVEL0, async () => {
      console.info('[foregroundBlurStyleOptionalUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('foregroundBlurStyle_Optional_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('foregroundBlurStyle_Optional_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[foregroundBlurStyleOptionalUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[foregroundBlurStyleOptionalUndefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

      // undefined should restore to default value
      expect(obj.$attrs.blurStyle).assertEqual(objCompare.$attrs.blurStyle);
      console.info('[foregroundBlurStyleOptionalUndefined_0100] END');
    });
  });
}