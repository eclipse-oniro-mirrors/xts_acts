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

export default function TextFontNullTest() {
  describe('TextFontNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextFontNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextFontNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextFontNullTest state pages: " + JSON.stringify(pages));
        if (!("TextFontNull" == pages.name)) {
          console.info("get TextFontNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextFontNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextFontNullTest page error: " + err);
      }
      done();
    })

    // ==================== font(value: Font) 属性测试 ====================

    /**
     * @tc.name   textFontNull_0100
     * @tc.number SUB_ARKUI_TEXT_FONT_NULL_PARAM_001
     * @tc.desc   Test Text font(Font) property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textFontNull_0100', Level.LEVEL0, async () => {
      console.info('TextFontNullTest', 'textFontNull_0100 START');
      
      // Get default font properties for comparison
      let strJsonDefault: string = getInspectorByKey('text_font_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // Get font properties with null parameter
      let strJson: string = getInspectorByKey('text_font_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      // Verify font properties exist and are not undefined
      expect(obj.$attrs.fontSize).not().assertUndefined();
      expect(obj.$attrs.fontWeight).not().assertUndefined();
      expect(obj.$attrs.fontStyle).not().assertUndefined();
      expect(obj.$attrs.fontFamily).not().assertUndefined();
      
      // Verify null parameter restores default values
      expect(obj.$attrs.fontSize).assertEqual(objDefault.$attrs.fontSize);
      expect(obj.$attrs.fontWeight).assertEqual(objDefault.$attrs.fontWeight);
      expect(obj.$attrs.fontStyle).assertEqual(objDefault.$attrs.fontStyle);
      expect(obj.$attrs.fontFamily).assertEqual(objDefault.$attrs.fontFamily);
      
      console.info('TextFontNullTest', 'textFontNull_0100 END');
    });

    /**
     * @tc.name   textFontUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_FONT_UNDEFINED_PARAM_001
     * @tc.desc   Test Text font(Font) property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textFontUndefined_0100', Level.LEVEL0, async () => {
      console.info('TextFontNullTest', 'textFontUndefined_0100 START');
      
      // Get default font properties for comparison
      let strJsonDefault: string = getInspectorByKey('text_font_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // Get font properties with undefined parameter
      let strJson: string = getInspectorByKey('text_font_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      // Verify font properties exist and are not undefined
      expect(obj.$attrs.fontSize).not().assertUndefined();
      expect(obj.$attrs.fontWeight).not().assertUndefined();
      expect(obj.$attrs.fontStyle).not().assertUndefined();
      expect(obj.$attrs.fontFamily).not().assertUndefined();
      
      // Verify undefined parameter restores default values
      expect(obj.$attrs.fontSize).assertEqual(objDefault.$attrs.fontSize);
      expect(obj.$attrs.fontWeight).assertEqual(objDefault.$attrs.fontWeight);
      expect(obj.$attrs.fontStyle).assertEqual(objDefault.$attrs.fontStyle);
      expect(obj.$attrs.fontFamily).assertEqual(objDefault.$attrs.fontFamily);
      
      console.info('TextFontNullTest', 'textFontUndefined_0100 END');
    });

    // ==================== font(fontValue: Font, options?: FontSettingOptions) 属性测试 ====================

    /**
     * @tc.name   textFontWithOptionsNull_0100
     * @tc.number SUB_ARKUI_TEXT_FONT_WITHOPTIONS_NULL_PARAM_001
     * @tc.desc   Test Text font(Font, options?) property with null fontValue should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textFontWithOptionsNull_0100', Level.LEVEL0, async () => {
      console.info('TextFontNullTest', 'textFontWithOptionsNull_0100 START');
      
      // Get default font properties for comparison
      let strJsonDefault: string = getInspectorByKey('text_font_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // Get font properties with null fontValue and options
      let strJson: string = getInspectorByKey('text_font_withoptions_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      // Verify font properties exist and are not undefined
      expect(obj.$attrs.fontSize).not().assertUndefined();
      expect(obj.$attrs.fontWeight).not().assertUndefined();
      expect(obj.$attrs.fontStyle).not().assertUndefined();
      expect(obj.$attrs.fontFamily).not().assertUndefined();
      
      // Verify null fontValue restores default values
      expect(obj.$attrs.fontSize).assertEqual(objDefault.$attrs.fontSize);
      expect(obj.$attrs.fontWeight).assertEqual(objDefault.$attrs.fontWeight);
      expect(obj.$attrs.fontStyle).assertEqual(objDefault.$attrs.fontStyle);
      expect(obj.$attrs.fontFamily).assertEqual(objDefault.$attrs.fontFamily);
      
      console.info('TextFontNullTest', 'textFontWithOptionsNull_0100 END');
    });

    /**
     * @tc.name   textFontWithOptionsUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_FONT_WITHOPTIONS_UNDEFINED_PARAM_001
     * @tc.desc   Test Text font(Font, options?) property with undefined fontValue should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textFontWithOptionsUndefined_0100', Level.LEVEL0, async () => {
      console.info('TextFontNullTest', 'textFontWithOptionsUndefined_0100 START');
      
      // Get default font properties for comparison
      let strJsonDefault: string = getInspectorByKey('text_font_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // Get font properties with undefined fontValue and options
      let strJson: string = getInspectorByKey('text_font_withoptions_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      // Verify font properties exist and are not undefined
      expect(obj.$attrs.fontSize).not().assertUndefined();
      expect(obj.$attrs.fontWeight).not().assertUndefined();
      expect(obj.$attrs.fontStyle).not().assertUndefined();
      expect(obj.$attrs.fontFamily).not().assertUndefined();
      
      // Verify undefined fontValue restores default values
      expect(obj.$attrs.fontSize).assertEqual(objDefault.$attrs.fontSize);
      expect(obj.$attrs.fontWeight).assertEqual(objDefault.$attrs.fontWeight);
      expect(obj.$attrs.fontStyle).assertEqual(objDefault.$attrs.fontStyle);
      expect(obj.$attrs.fontFamily).assertEqual(objDefault.$attrs.fontFamily);
      
      console.info('TextFontNullTest', 'textFontWithOptionsUndefined_0100 END');
    });
  });
}