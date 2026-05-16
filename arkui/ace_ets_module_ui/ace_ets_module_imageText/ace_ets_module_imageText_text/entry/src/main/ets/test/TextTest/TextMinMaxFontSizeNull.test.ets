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

export default function TextMinMaxFontSizeNullTest() {
  describe('TextMinMaxFontSizeNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextMinMaxFontSizeNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextMinMaxFontSizeNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextMinMaxFontSizeNullTest state pages: " + JSON.stringify(pages));
        if (!("TextMinMaxFontSizeNull" == pages.name)) {
          console.info("get TextMinMaxFontSizeNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextMinMaxFontSizeNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextMinMaxFontSizeNullTest page error: " + err);
      }
      done();
    })
    // ==================== minFontSize 属性测试 ====================

    /**
     * @tc.name   textMinSizeNull_0100
     * @tc.number SUB_ARKUI_TEXT_MINSIZE_NULL_PARAM_001
     * @tc.desc   Test Text minFontSize property with null parameter should restore default behavior
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textMinSizeNull_0100', Level.LEVEL0, async () => {
      console.info('TextMinMaxFontSizeNullTest', 'textMinSizeNull_0100 START');
      
      // Get default minFontSize properties for comparison
      let strJsonDefault: string = getInspectorByKey('text_sizing_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // Get minFontSize properties with null parameter
      let strJson: string = getInspectorByKey('text_minsize_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      // Verify minFontSize property exists
      expect(obj.$attrs.minFontSize).not().assertUndefined();
      
      // Verify null parameter restores default behavior
      expect(obj.$attrs.minFontSize).assertEqual(objDefault.$attrs.minFontSize);
      
      console.info('TextMinMaxFontSizeNullTest', 'textMinSizeNull_0100 END');
    });

    /**
     * @tc.name   textMinSizeUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_MINSIZE_UNDEFINED_PARAM_001
     * @tc.desc   Test Text minFontSize property with undefined parameter should restore default behavior
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textMinSizeUndefined_0100', Level.LEVEL0, async () => {
      console.info('TextMinMaxFontSizeNullTest', 'textMinSizeUndefined_0100 START');
      
      // Get default minFontSize properties for comparison
      let strJsonDefault: string = getInspectorByKey('text_sizing_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // Get minFontSize properties with undefined parameter
      let strJson: string = getInspectorByKey('text_minsize_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      // Verify minFontSize property exists
      expect(obj.$attrs.minFontSize).not().assertUndefined();
      
      // Verify undefined parameter restores default behavior
      expect(obj.$attrs.minFontSize).assertEqual(objDefault.$attrs.minFontSize);
      
      console.info('TextMinMaxFontSizeNullTest', 'textMinSizeUndefined_0100 END');
    });

    /**
     * @tc.name   textMinSizeEmpty_0100
     * @tc.number SUB_ARKUI_TEXT_MINSIZE_EMPTY_PARAM_001
     * @tc.desc   Test Text minFontSize property with empty string parameter should restore default behavior
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textMinSizeEmpty_0100', Level.LEVEL0, async () => {
      console.info('TextMinMaxFontSizeNullTest', 'textMinSizeEmpty_0100 START');
      
      // Get default minFontSize properties for comparison
      let strJsonDefault: string = getInspectorByKey('text_sizing_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // Get minFontSize properties with empty string parameter
      let strJson: string = getInspectorByKey('text_minsize_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      // Verify minFontSize property exists
      expect(obj.$attrs.minFontSize).not().assertUndefined();
      
      // Verify empty string parameter restores default behavior
      expect(obj.$attrs.minFontSize).assertEqual(objDefault.$attrs.minFontSize);
      
      console.info('TextMinMaxFontSizeNullTest', 'textMinSizeEmpty_0100 END');
    });

    // ==================== maxFontSize 属性测试 ====================

    /**
     * @tc.name   textMaxSizeNull_0100
     * @tc.number SUB_ARKUI_TEXT_MAXSIZE_NULL_PARAM_001
     * @tc.desc   Test Text maxFontSize property with null parameter should restore default behavior
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textMaxSizeNull_0100', Level.LEVEL0, async () => {
      console.info('TextMinMaxFontSizeNullTest', 'textMaxSizeNull_0100 START');
      
      // Get default maxFontSize properties for comparison
      let strJsonDefault: string = getInspectorByKey('text_sizing_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // Get maxFontSize properties with null parameter
      let strJson: string = getInspectorByKey('text_maxsize_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      // Verify maxFontSize property exists
      expect(obj.$attrs.maxFontSize).not().assertUndefined();
      
      // Verify null parameter restores default behavior
      expect(obj.$attrs.maxFontSize).assertEqual(objDefault.$attrs.maxFontSize);
      
      console.info('TextMinMaxFontSizeNullTest', 'textMaxSizeNull_0100 END');
    });

    /**
     * @tc.name   textMaxSizeUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_MAXSIZE_UNDEFINED_PARAM_001
     * @tc.desc   Test Text maxFontSize property with undefined parameter should restore default behavior
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textMaxSizeUndefined_0100', Level.LEVEL0, async () => {
      console.info('TextMinMaxFontSizeNullTest', 'textMaxSizeUndefined_0100 START');
      
      // Get default maxFontSize properties for comparison
      let strJsonDefault: string = getInspectorByKey('text_sizing_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // Get maxFontSize properties with undefined parameter
      let strJson: string = getInspectorByKey('text_maxsize_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      // Verify maxFontSize property exists
      expect(obj.$attrs.maxFontSize).not().assertUndefined();
      
      // Verify undefined parameter restores default behavior
      expect(obj.$attrs.maxFontSize).assertEqual(objDefault.$attrs.maxFontSize);
      
      console.info('TextMinMaxFontSizeNullTest', 'textMaxSizeUndefined_0100 END');
    });

    /**
     * @tc.name   textMaxSizeEmpty_0100
     * @tc.number SUB_ARKUI_TEXT_MAXSIZE_EMPTY_PARAM_001
     * @tc.desc   Test Text maxFontSize property with empty string parameter should restore default behavior
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textMaxSizeEmpty_0100', Level.LEVEL0, async () => {
      console.info('TextMinMaxFontSizeNullTest', 'textMaxSizeEmpty_0100 START');
      
      // Get default maxFontSize properties for comparison
      let strJsonDefault: string = getInspectorByKey('text_sizing_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // Get maxFontSize properties with empty string parameter
      let strJson: string = getInspectorByKey('text_maxsize_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      // Verify maxFontSize property exists
      expect(obj.$attrs.maxFontSize).not().assertUndefined();
      
      // Verify empty string parameter restores default behavior
      expect(obj.$attrs.maxFontSize).assertEqual(objDefault.$attrs.maxFontSize);
      
      console.info('TextMinMaxFontSizeNullTest', 'textMaxSizeEmpty_0100 END');
    });
  });
}