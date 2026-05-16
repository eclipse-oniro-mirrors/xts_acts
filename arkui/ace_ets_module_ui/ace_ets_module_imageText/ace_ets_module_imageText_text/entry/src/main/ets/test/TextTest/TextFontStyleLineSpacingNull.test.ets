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

export default function TextFontStyleLineSpacingNullTest() {
  describe('TextFontStyleLineSpacingNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextFontStyleLineSpacingNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextFontStyleLineSpacingNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextFontStyleLineSpacingNullTest state pages: " + JSON.stringify(pages));
        if (!("TextFontStyleLineSpacingNull" == pages.name)) {
          console.info("get TextFontStyleLineSpacingNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextFontStyleLineSpacingNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextFontStyleLineSpacingNullTest page error: " + err);
      }
      done();
    })

    // ==================== fontStyle null/undefined tests ====================

    /**
     * @tc.name   textFontStyleNull_0100
     * @tc.number SUB_ARKUI_TEXT_FONTSTYLE_NULL_PARAM_001
     * @tc.desc   Test Text fontStyle property with null parameter should restore default value (FontStyle.Normal)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textFontStyleNull_0100', Level.LEVEL2, async () => {
      console.info('TextFontStyleLineSpacingNullTest', 'textFontStyleNull_0100 START');

      // Get default fontStyle for comparison
      let strJsonDefault: string = getInspectorByKey('text_fontStyle_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let defaultFontStyle: string = objDefault.$attrs.fontStyle as string;

      // Get fontStyle with null parameter
      let strJson: string = getInspectorByKey('text_fontStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let fontStyle: string = obj.$attrs.fontStyle as string;

      // Verify fontStyle exists and is not undefined
      expect(fontStyle).not().assertUndefined();

      // Verify null parameter restores default value
      expect(fontStyle).assertEqual(defaultFontStyle);
      expect(fontStyle).assertEqual('FontStyle.Normal');

      console.info('TextFontStyleLineSpacingNullTest', 'textFontStyleNull_0100 END');
    });

    /**
     * @tc.name   textFontStyleUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_FONTSTYLE_UNDEFINED_PARAM_001
     * @tc.desc   Test Text fontStyle property with undefined parameter should restore default value (FontStyle.Normal)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textFontStyleUndefined_0100', Level.LEVEL2, async () => {
      console.info('TextFontStyleLineSpacingNullTest', 'textFontStyleUndefined_0100 START');

      // Get default fontStyle for comparison
      let strJsonDefault: string = getInspectorByKey('text_fontStyle_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let defaultFontStyle: string = objDefault.$attrs.fontStyle as string;

      // Get fontStyle with undefined parameter
      let strJson: string = getInspectorByKey('text_fontStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let fontStyle: string = obj.$attrs.fontStyle as string;

      // Verify fontStyle exists and is not undefined
      expect(fontStyle).not().assertUndefined();

      // Verify undefined parameter restores default value
      expect(fontStyle).assertEqual(defaultFontStyle);
      expect(fontStyle).assertEqual('FontStyle.Normal');

      console.info('TextFontStyleLineSpacingNullTest', 'textFontStyleUndefined_0100 END');
    });

    // ==================== lineSpacing null/undefined tests ====================

    /**
     * @tc.name   textLineSpacingNull_0100
     * @tc.number SUB_ARKUI_TEXT_LINESPACING_NULL_PARAM_001
     * @tc.desc   Test Text lineSpacing property with null parameter should restore default value (0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textLineSpacingNull_0100', Level.LEVEL2, async () => {
      console.info('TextFontStyleLineSpacingNullTest', 'textLineSpacingNull_0100 START');

      // Get default lineSpacing for comparison
      let strJsonDefault: string = getInspectorByKey('text_lineSpacing_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let defaultLineSpacing: string = objDefault.$attrs.lineSpacing as string;

      // Get lineSpacing with null parameter
      let strJson: string = getInspectorByKey('text_lineSpacing_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let lineSpacing: string = obj.$attrs.lineSpacing as string;

      // Verify lineSpacing exists and is not undefined
      expect(lineSpacing).not().assertUndefined();

      // Verify null parameter restores default value
      expect(lineSpacing.slice(0, -2)).assertEqual(defaultLineSpacing.slice(0, -2));
      // Default value is 0, which may be represented as '0.00px' or '0.00vp'
      let isZero = lineSpacing === '0.00px' || lineSpacing === '0.00vp' || lineSpacing === '0';
      expect(isZero).assertTrue();

      console.info('TextFontStyleLineSpacingNullTest', 'textLineSpacingNull_0100 END');
    });

    /**
     * @tc.name   textLineSpacingUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_LINESPACING_UNDEFINED_PARAM_001
     * @tc.desc   Test Text lineSpacing property with undefined parameter should restore default value (0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textLineSpacingUndefined_0100', Level.LEVEL2, async () => {
      console.info('TextFontStyleLineSpacingNullTest', 'textLineSpacingUndefined_0100 START');

      // Get default lineSpacing for comparison
      let strJsonDefault: string = getInspectorByKey('text_lineSpacing_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let defaultLineSpacing: string = objDefault.$attrs.lineSpacing as string;

      // Get lineSpacing with undefined parameter
      let strJson: string = getInspectorByKey('text_lineSpacing_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let lineSpacing: string = obj.$attrs.lineSpacing as string;

      // Verify lineSpacing exists and is not undefined
      expect(lineSpacing).not().assertUndefined();

      // Verify undefined parameter restores default value
      expect(lineSpacing.slice(0, -2)).assertEqual(defaultLineSpacing.slice(0, -2));
      // Default value is 0, which may be represented as '0.00px' or '0.00vp'
      let isZero = lineSpacing === '0.00px' || lineSpacing === '0.00vp' || lineSpacing === '0';
      expect(isZero).assertTrue();

      console.info('TextFontStyleLineSpacingNullTest', 'textLineSpacingUndefined_0100 END');
    });
  });
}
