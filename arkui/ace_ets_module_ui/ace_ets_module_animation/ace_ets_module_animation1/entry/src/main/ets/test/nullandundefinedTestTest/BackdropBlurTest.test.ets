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


export default function BackdropBlurTest() {
  describe('BackdropBlurTest', () => {
    beforeEach(async (done: Function) => {
      console.info('BackdropBlurTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/nullandundefinedTest/BackdropBlurTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get BackdropBlurTest state pages: ' + JSON.stringify(pages));
        if (!('BackdropBlurTest' == pages.name)) {
          console.info('get BackdropBlurTest  state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(3000);
          console.info('push BackdropBlurTest  success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push BackdropBlurTest page error:' + err);
      }
      console.info('BackdropBlurTest beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('BackdropBlurTest after each called');
    });

    // ========== backdropBlur(value: number, options?: BlurOptions): T; tests ==========

    /**
     * @tc.name   backdropBlurValue_0100
     * @tc.number SUB_ARKUI_BACKDROP_BLUR_VALUE_0100
     * @tc.desc   Test backdropBlur with value parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backdropBlurValue_0100', Level.LEVEL0, async () => {
      console.info('[backdropBlurValue_0100] START');

      let strJson: string = getInspectorByKey('backdropBlur_value_10');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backdropBlurValue_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.backdropBlur).assertEqual(10);
      console.info('[backdropBlurValue_0100] END');
    });

    /**
     * @tc.name   backdropBlurValue0_0100
     * @tc.number SUB_ARKUI_BACKDROP_BLUR_VALUE_0_0100
     * @tc.desc   Test backdropBlur with value 0 (no blur)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backdropBlurValue0_0100', Level.LEVEL0, async () => {
      console.info('[backdropBlurValue0_0100] START');

      let strJson: string = getInspectorByKey('backdropBlur_value_0');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backdropBlurValue0_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.backdropBlur).assertEqual(0);
      console.info('[backdropBlurValue0_0100] END');
    });

    /**
     * @tc.name   backdropBlurWithOptions_0100
     * @tc.number SUB_ARKUI_BACKDROP_BLUR_WITH_OPTIONS_0100
     * @tc.desc   Test backdropBlur with options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backdropBlurWithOptions_0100', Level.LEVEL0, async () => {
      console.info('[backdropBlurWithOptions_0100] START');

      let strJson: string = getInspectorByKey('backdropBlur_with_options');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backdropBlurWithOptions_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.backdropBlur).assertEqual(15);
      console.info('[backdropBlurWithOptions_0100] END');
    });

    // ========== backdropBlur(radius: Optional<number>, options?: BlurOptions): T; tests ==========

    /**
     * @tc.name   backdropBlurOptionalValue_0100
     * @tc.number SUB_ARKUI_BACKDROP_BLUR_OPTIONAL_VALUE_0100
     * @tc.desc   Test backdropBlur Optional with value parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backdropBlurOptionalValue_0100', Level.LEVEL0, async () => {
      console.info('[backdropBlurOptionalValue_0100] START');

      let strJson: string = getInspectorByKey('backdropBlur_Optional_value');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backdropBlurOptionalValue_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.backdropBlur).assertEqual(20);
      console.info('[backdropBlurOptionalValue_0100] END');
    });

    /**
     * @tc.name   backdropBlurOptionalNull_0100
     * @tc.number SUB_ARKUI_BACKDROP_BLUR_OPTIONAL_NULL_0100
     * @tc.desc   Test backdropBlur Optional with null parameter, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backdropBlurOptionalNull_0100', Level.LEVEL0, async () => {
      console.info('[backdropBlurOptionalNull_0100] START');

      let strJsonCompare: string = getInspectorByKey('backdropBlur_Optional_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('backdropBlur_Optional_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backdropBlurOptionalNull_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[backdropBlurOptionalNull_0100] null obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.backdropBlur).assertEqual(objCompare.$attrs.backdropBlur);
      console.info('[backdropBlurOptionalNull_0100] END');
    });

    /**
     * @tc.name   backdropBlurOptionalUndefined_0100
     * @tc.number SUB_ARKUI_BACKDROP_BLUR_OPTIONAL_UNDEFINED_0100
     * @tc.desc   Test backdropBlur Optional with undefined parameter, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backdropBlurOptionalUndefined_0100', Level.LEVEL0, async () => {
      console.info('[backdropBlurOptionalUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('backdropBlur_Optional_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('backdropBlur_Optional_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backdropBlurOptionalUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[backdropBlurOptionalUndefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.backdropBlur).assertEqual(objCompare.$attrs.backdropBlur);
      console.info('[backdropBlurOptionalUndefined_0100] END');
    });

    /**
     * @tc.name   backdropBlurOptionalOptionsNull_0100
     * @tc.number SUB_ARKUI_BACKDROP_BLUR_OPTIONAL_OPTIONS_NULL_0100
     * @tc.desc   Test backdropBlur Optional with null options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backdropBlurOptionalOptionsNull_0100', Level.LEVEL0, async () => {
      console.info('[backdropBlurOptionalOptionsNull_0100] START');

      let strJson: string = getInspectorByKey('backdropBlur_Optional_options_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backdropBlurOptionalOptionsNull_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.backdropBlur).assertEqual(20);
      console.info('[backdropBlurOptionalOptionsNull_0100] END');
    });

    /**
     * @tc.name   backdropBlurOptionalOptionsUndefined_0100
     * @tc.number SUB_ARKUI_BACKDROP_BLUR_OPTIONAL_OPTIONS_UNDEFINED_0100
     * @tc.desc   Test backdropBlur Optional with undefined options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backdropBlurOptionalOptionsUndefined_0100', Level.LEVEL0, async () => {
      console.info('[backdropBlurOptionalOptionsUndefined_0100] START');

      let strJson: string = getInspectorByKey('backdropBlur_Optional_options_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backdropBlurOptionalOptionsUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.backdropBlur).assertEqual(20);
      console.info('[backdropBlurOptionalOptionsUndefined_0100] END');
    });

    // ========== backdropBlur(radius: Optional<number>, options?: BlurOptions, sysOptions?: SystemAdaptiveOptions): T; tests ==========

    /**
     * @tc.name   backdropBlurThreeValue_0100
     * @tc.number SUB_ARKUI_BACKDROP_BLUR_THREE_VALUE_0100
     * @tc.desc   Test backdropBlur Three parameters with value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backdropBlurThreeValue_0100', Level.LEVEL0, async () => {
      console.info('[backdropBlurThreeValue_0100] START');

      let strJson: string = getInspectorByKey('backdropBlur_Three_value');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backdropBlurThreeValue_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.backdropBlur).assertEqual(25);
      console.info('[backdropBlurThreeValue_0100] END');
    });

    /**
     * @tc.name   backdropBlurThreeNull_0100
     * @tc.number SUB_ARKUI_BACKDROP_BLUR_THREE_NULL_0100
     * @tc.desc   Test backdropBlur Three parameters with null radius, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backdropBlurThreeNull_0100', Level.LEVEL0, async () => {
      console.info('[backdropBlurThreeNull_0100] START');

      let strJsonCompare: string = getInspectorByKey('backdropBlur_Three_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('backdropBlur_Three_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backdropBlurThreeNull_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[backdropBlurThreeNull_0100] null obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.backdropBlur).assertEqual(objCompare.$attrs.backdropBlur);
      console.info('[backdropBlurThreeNull_0100] END');
    });

    /**
     * @tc.name   backdropBlurThreeUndefined_0100
     * @tc.number SUB_ARKUI_BACKDROP_BLUR_THREE_UNDEFINED_0100
     * @tc.desc   Test backdropBlur Three parameters with undefined radius, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backdropBlurThreeUndefined_0100', Level.LEVEL0, async () => {
      console.info('[backdropBlurThreeUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('backdropBlur_Three_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('backdropBlur_Three_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backdropBlurThreeUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[backdropBlurThreeUndefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.backdropBlur).assertEqual(objCompare.$attrs.backdropBlur);
      console.info('[backdropBlurThreeUndefined_0100] END');
    });

    /**
     * @tc.name   backdropBlurThreeOptionsNull_0100
     * @tc.number SUB_ARKUI_BACKDROP_BLUR_THREE_OPTIONS_NULL_0100
     * @tc.desc   Test backdropBlur Three parameters with null options
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backdropBlurThreeOptionsNull_0100', Level.LEVEL0, async () => {
      console.info('[backdropBlurThreeOptionsNull_0100] START');

      let strJson: string = getInspectorByKey('backdropBlur_Three_options_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backdropBlurThreeOptionsNull_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.backdropBlur).assertEqual(25);
      console.info('[backdropBlurThreeOptionsNull_0100] END');
    });

    /**
     * @tc.name   backdropBlurThreeOptionsUndefined_0100
     * @tc.number SUB_ARKUI_BACKDROP_BLUR_THREE_OPTIONS_UNDEFINED_0100
     * @tc.desc   Test backdropBlur Three parameters with undefined options
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backdropBlurThreeOptionsUndefined_0100', Level.LEVEL0, async () => {
      console.info('[backdropBlurThreeOptionsUndefined_0100] START');

      let strJson: string = getInspectorByKey('backdropBlur_Three_options_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backdropBlurThreeOptionsUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.backdropBlur).assertEqual(25);
      console.info('[backdropBlurThreeOptionsUndefined_0100] END');
    });

    /**
     * @tc.name   backdropBlurThreeSysOptionsNull_0100
     * @tc.number SUB_ARKUI_BACKDROP_BLUR_THREE_SYS_OPTIONS_NULL_0100
     * @tc.desc   Test backdropBlur Three parameters with null sysOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backdropBlurThreeSysOptionsNull_0100', Level.LEVEL0, async () => {
      console.info('[backdropBlurThreeSysOptionsNull_0100] START');

      let strJson: string = getInspectorByKey('backdropBlur_Three_sysOptions_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backdropBlurThreeSysOptionsNull_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.backdropBlur).assertEqual(25);
      console.info('[backdropBlurThreeSysOptionsNull_0100] END');
    });

    /**
     * @tc.name   backdropBlurThreeSysOptionsUndefined_0100
     * @tc.number SUB_ARKUI_BACKDROP_BLUR_THREE_SYS_OPTIONS_UNDEFINED_0100
     * @tc.desc   Test backdropBlur Three parameters with undefined sysOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backdropBlurThreeSysOptionsUndefined_0100', Level.LEVEL0, async () => {
      console.info('[backdropBlurThreeSysOptionsUndefined_0100] START');

      let strJson: string = getInspectorByKey('backdropBlur_Three_sysOptions_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backdropBlurThreeSysOptionsUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.backdropBlur).assertEqual(25);
      console.info('[backdropBlurThreeSysOptionsUndefined_0100] END');
    });

    /**
     * @tc.name   backdropBlurThreeSysOptionsTrue_0100
     * @tc.number SUB_ARKUI_BACKDROP_BLUR_THREE_SYS_OPTIONS_TRUE_0100
     * @tc.desc   Test backdropBlur Three parameters with sysOptions containing true for disableSystemAdaptation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backdropBlurThreeSysOptionsTrue_0100', Level.LEVEL0, async () => {
      console.info('[backdropBlurThreeSysOptionsTrue_0100] START');

      let strJson: string = getInspectorByKey('backdropBlur_Three_sysOptions_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backdropBlurThreeSysOptionsTrue_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.backdropBlur).assertEqual(25);
      console.info('[backdropBlurThreeSysOptionsTrue_0100] END');
    });

    /**
     * @tc.name   backdropBlurThreeSysOptionsFalse_0100
     * @tc.number SUB_ARKUI_BACKDROP_BLUR_THREE_SYS_OPTIONS_FALSE_0100
     * @tc.desc   Test backdropBlur Three parameters with sysOptions containing false for disableSystemAdaptation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backdropBlurThreeSysOptionsFalse_0100', Level.LEVEL0, async () => {
      console.info('[backdropBlurThreeSysOptionsFalse_0100] START');

      let strJson: string = getInspectorByKey('backdropBlur_Three_sysOptions_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[backdropBlurThreeSysOptionsFalse_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.backdropBlur).assertEqual(25);
      console.info('[backdropBlurThreeSysOptionsFalse_0100] END');
    });
  });
}