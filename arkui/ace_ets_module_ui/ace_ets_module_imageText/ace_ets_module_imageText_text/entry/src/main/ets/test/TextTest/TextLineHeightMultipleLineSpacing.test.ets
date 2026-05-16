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

import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';

export default function TextLineHeightMultipleLineSpacingTest() {
  describe('TextLineHeightMultipleLineSpacingTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextLineHeightMultipleLineSpacingTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextLineHeightMultipleLineSpacing',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextLineHeightMultipleLineSpacingTest state pages: " + JSON.stringify(pages));
        if (!("TextLineHeightMultipleLineSpacing" == pages.name)) {
          console.info("get TextLineHeightMultipleLineSpacingTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextLineHeightMultipleLineSpacingTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextLineHeightMultipleLineSpacingTest page error: " + err);
      }
      done();
    })

    // ==================== lineHeightMultiple null/undefined tests ====================

    /**
     * @tc.name   textLineHeightMultipleNull_0100
     * @tc.number SUB_ARKUI_TEXT_LINEHEIGHTMULTIPLE_NULL_PARAM_001
     * @tc.desc   Test Text lineHeightMultiple property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textLineHeightMultipleNull_0100', Level.LEVEL2, async () => {
      console.info('textLineHeightMultipleNull_0100 START');

      // Get default lineHeightMultiple for comparison
      let strJsonDefault: string = getInspectorByKey('text_lineHeightMultiple_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let defaultLineHeightMultiple: string = objDefault.$attrs.lineHeightMultiple as string;

      // Get lineHeightMultiple with null parameter
      let strJson: string = getInspectorByKey('text_lineHeightMultiple_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let lineHeightMultiple: string = obj.$attrs.lineHeightMultiple as string;
      console.info('textLineHeightMultipleNull_0100 lineHeightMultiple：' + lineHeightMultiple);
      console.info('textLineHeightMultipleNull_0100 defaultLineHeightMultiple：' + defaultLineHeightMultiple);
      // Verify null parameter restores default value
      expect(lineHeightMultiple).assertEqual(defaultLineHeightMultiple);

      console.info('textLineHeightMultipleNull_0100 END');
    });

    /**
     * @tc.name   textLineHeightMultipleUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_LINEHEIGHTMULTIPLE_UNDEFINED_PARAM_001
     * @tc.desc   Test Text lineHeightMultiple property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textLineHeightMultipleUndefined_0100', Level.LEVEL2, async () => {
      console.info('TextLineHeightMultipleLineSpacingTest', 'textLineHeightMultipleUndefined_0100 START');

      // Get default lineHeightMultiple for comparison
      let strJsonDefault: string = getInspectorByKey('text_lineHeightMultiple_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let defaultLineHeightMultiple: string = objDefault.$attrs.lineHeightMultiple as string;

      // Get lineHeightMultiple with undefined parameter
      let strJson: string = getInspectorByKey('text_lineHeightMultiple_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let lineHeightMultiple: string = obj.$attrs.lineHeightMultiple as string;

      console.info('textLineHeightMultipleNull_0100 lineHeightMultiple：' + lineHeightMultiple);
      console.info('textLineHeightMultipleNull_0100 defaultLineHeightMultiple：' + defaultLineHeightMultiple);

      // Verify undefined parameter restores default value
      expect(lineHeightMultiple).assertEqual(defaultLineHeightMultiple);

      console.info('TextLineHeightMultipleLineSpacingTest', 'textLineHeightMultipleUndefined_0100 END');
    });

    // ==================== lineSpacing(value) null/undefined tests ====================

    /**
     * @tc.name   textLineSpacingValueNull_0100
     * @tc.number SUB_ARKUI_TEXT_LINESPACING_VALUE_NULL_PARAM_001
     * @tc.desc   Test Text lineSpacing(LengthMetrics) property with null value should restore default value (0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textLineSpacingValueNull_0100', Level.LEVEL2, async () => {
      console.info('TextLineHeightMultipleLineSpacingTest', 'textLineSpacingValueNull_0100 START');

      // Get default lineSpacing for comparison
      let strJsonDefault: string = getInspectorByKey('text_lineSpacing_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let defaultLineSpacing: string = objDefault.$attrs.lineSpacing as string;

      // Get lineSpacing with null value
      let strJson: string = getInspectorByKey('text_lineSpacing_value_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let lineSpacing: string = obj.$attrs.lineSpacing as string;
      console.info('textLineHeightMultipleNull_0100 lineSpacing：' + lineSpacing);
      console.info('textLineHeightMultipleNull_0100 defaultLineSpacing：' + defaultLineSpacing);

      // Verify null value restores default value
      expect(lineSpacing.slice(0, -2)).assertEqual(defaultLineSpacing.slice(0, -2));
      // Default value is 0, which may be represented as '0.00px' or '0.00vp'
      let isZero = lineSpacing === '0.00px' || lineSpacing === '0.00vp' || lineSpacing === '0';
      expect(isZero).assertTrue();

      console.info('TextLineHeightMultipleLineSpacingTest', 'textLineSpacingValueNull_0100 END');
    });

    /**
     * @tc.name   textLineSpacingValueUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_LINESPACING_VALUE_UNDEFINED_PARAM_001
     * @tc.desc   Test Text lineSpacing(LengthMetrics) property with undefined value should restore default value (0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textLineSpacingValueUndefined_0100', Level.LEVEL2, async () => {
      console.info('textLineSpacingValueUndefined_0100 START');

      // Get default lineSpacing for comparison
      let strJsonDefault: string = getInspectorByKey('text_lineSpacing_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let defaultLineSpacing: string = objDefault.$attrs.lineSpacing as string;

      // Get lineSpacing with undefined value
      let strJson: string = getInspectorByKey('text_lineSpacing_value_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let lineSpacing: string = obj.$attrs.lineSpacing as string;

      // Verify lineSpacing exists and is not undefined
      expect(lineSpacing).not().assertUndefined();
      console.info('textLineSpacingValueUndefined_0100 lineSpacing：' + lineSpacing);
      console.info('textLineSpacingValueUndefined_0100 defaultLineSpacing：' + defaultLineSpacing);

      // Verify undefined value restores default value
      expect(lineSpacing.slice(0, -2)).assertEqual(defaultLineSpacing.slice(0, -2));
      // Default value is 0, which may be represented as '0.00px' or '0.00vp'
      let isZero = lineSpacing === '0.00px' || lineSpacing === '0.00vp' || lineSpacing === '0';
      expect(isZero).assertTrue();
      console.info('textLineSpacingValueUndefined_0100 END');
    });

    // ==================== lineSpacing(value, options?) null/undefined tests ====================

    /**
     * @tc.name   textLineSpacingValueNullOptionsEmpty_0100
     * @tc.number SUB_ARKUI_TEXT_LINESPACING_VALUE_NULL_OPTIONS_EMPTY_PARAM_001
     * @tc.desc   Test Text lineSpacing(LengthMetrics, options?) property with null value and empty options should restore default value (0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textLineSpacingValueNullOptionsEmpty_0100', Level.LEVEL2, async () => {
      console.info('TextLineHeightMultipleLineSpacingTest', 'textLineSpacingValueNullOptionsEmpty_0100 START');

      // Get default lineSpacing for comparison
      let strJsonDefault: string = getInspectorByKey('text_lineSpacing_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let defaultLineSpacing: string = objDefault.$attrs.lineSpacing as string;

      // Get lineSpacing with null value and empty options
      let strJson: string = getInspectorByKey('text_lineSpacing_value_null_options_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let lineSpacing: string = obj.$attrs.lineSpacing as string;

      // Verify lineSpacing exists and is not undefined
      expect(lineSpacing).not().assertUndefined();

      // Verify null value restores default value
      expect(lineSpacing.slice(0, -2)).assertEqual(defaultLineSpacing.slice(0, -2));
      // Default value is 0, which may be represented as '0.00px' or '0.00vp'
      let isZero = lineSpacing === '0.00px' || lineSpacing === '0.00vp' || lineSpacing === '0';
      expect(isZero).assertTrue();

      console.info('TextLineHeightMultipleLineSpacingTest', 'textLineSpacingValueNullOptionsEmpty_0100 END');
    });

    /**
     * @tc.name   textLineSpacingValueUndefinedOptionsEmpty_0100
     * @tc.number SUB_ARKUI_TEXT_LINESPACING_VALUE_UNDEFINED_OPTIONS_EMPTY_PARAM_001
     * @tc.desc   Test Text lineSpacing(LengthMetrics, options?) property with undefined value and empty options should restore default value (0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textLineSpacingValueUndefinedOptionsEmpty_0100', Level.LEVEL2, async () => {
      console.info('TextLineHeightMultipleLineSpacingTest', 'textLineSpacingValueUndefinedOptionsEmpty_0100 START');

      // Get default lineSpacing for comparison
      let strJsonDefault: string = getInspectorByKey('text_lineSpacing_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let defaultLineSpacing: string = objDefault.$attrs.lineSpacing as string;

      // Get lineSpacing with undefined value and empty options
      let strJson: string = getInspectorByKey('text_lineSpacing_value_undefined_options_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let lineSpacing: string = obj.$attrs.lineSpacing as string;

      // Verify lineSpacing exists and is not undefined
      expect(lineSpacing).not().assertUndefined();

      // Verify undefined value restores default value
      expect(lineSpacing.slice(0, -2)).assertEqual(defaultLineSpacing.slice(0, -2));
      // Default value is 0, which may be represented as '0.00px' or '0.00vp'
      let isZero = lineSpacing === '0.00px' || lineSpacing === '0.00vp' || lineSpacing === '0';
      expect(isZero).assertTrue();

      console.info('TextLineHeightMultipleLineSpacingTest', 'textLineSpacingValueUndefinedOptionsEmpty_0100 END');
    });

    /**
     * @tc.name   textLineSpacingValueNullOptionsNull_0100
     * @tc.number SUB_ARKUI_TEXT_LINESPACING_VALUE_NULL_OPTIONS_NULL_PARAM_001
     * @tc.desc   Test Text lineSpacing(LengthMetrics, options?) property with null value and null options should restore default value (0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textLineSpacingValueNullOptionsNull_0100', Level.LEVEL2, async () => {
      console.info('TextLineHeightMultipleLineSpacingTest', 'textLineSpacingValueNullOptionsNull_0100 START');

      // Get default lineSpacing for comparison
      let strJsonDefault: string = getInspectorByKey('text_lineSpacing_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let defaultLineSpacing: string = objDefault.$attrs.lineSpacing as string;

      // Get lineSpacing with null value and null options
      let strJson: string = getInspectorByKey('text_lineSpacing_value_null_options_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let lineSpacing: string = obj.$attrs.lineSpacing as string;

      // Verify lineSpacing exists and is not undefined
      expect(lineSpacing).not().assertUndefined();

      // Verify null value restores default value
      expect(lineSpacing.slice(0, -2)).assertEqual(defaultLineSpacing.slice(0, -2));
      // Default value is 0, which may be represented as '0.00px' or '0.00vp'
      let isZero = lineSpacing === '0.00px' || lineSpacing === '0.00vp' || lineSpacing === '0';
      expect(isZero).assertTrue();

      console.info('TextLineHeightMultipleLineSpacingTest', 'textLineSpacingValueNullOptionsNull_0100 END');
    });

    /**
     * @tc.name   textLineSpacingValueUndefinedOptionsUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_LINESPACING_VALUE_UNDEFINED_OPTIONS_UNDEFINED_PARAM_001
     * @tc.desc   Test Text lineSpacing(LengthMetrics, options?) property with undefined value and undefined options should restore default value (0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textLineSpacingValueUndefinedOptionsUndefined_0100', Level.LEVEL2, async () => {
      console.info('TextLineHeightMultipleLineSpacingTest', 'textLineSpacingValueUndefinedOptionsUndefined_0100 START');

      // Get default lineSpacing for comparison
      let strJsonDefault: string = getInspectorByKey('text_lineSpacing_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let defaultLineSpacing: string = objDefault.$attrs.lineSpacing as string;

      // Get lineSpacing with undefined value and undefined options
      let strJson: string = getInspectorByKey('text_lineSpacing_value_undefined_options_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let lineSpacing: string = obj.$attrs.lineSpacing as string;

      // Verify lineSpacing exists and is not undefined
      expect(lineSpacing).not().assertUndefined();

      // Verify undefined value restores default value
      expect(lineSpacing.slice(0, -2)).assertEqual(defaultLineSpacing.slice(0, -2));
      // Default value is 0, which may be represented as '0.00px' or '0.00vp'
      let isZero = lineSpacing === '0.00px' || lineSpacing === '0.00vp' || lineSpacing === '0';
      expect(isZero).assertTrue();

      console.info('TextLineHeightMultipleLineSpacingTest', 'textLineSpacingValueUndefinedOptionsUndefined_0100 END');
    });
  });
}
