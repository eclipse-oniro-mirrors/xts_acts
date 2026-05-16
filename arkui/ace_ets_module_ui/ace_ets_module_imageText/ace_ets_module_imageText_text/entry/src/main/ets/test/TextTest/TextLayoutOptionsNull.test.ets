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


export default function TextLayoutOptionsNullTest() {
  describe('TextLayoutOptionsNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextLayoutOptionsNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextLayoutOptionsNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextLayoutOptionsNullTest state pages: " + JSON.stringify(pages));
        if (!("TextLayoutOptionsNull" == pages.name)) {
          console.info("get TextLayoutOptionsNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextLayoutOptionsNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextLayoutOptionsNullTest page error: " + err);
      }
      done();
    })

    // ==================== enableHapticFeedback 属性测试 ====================

    /**
     * @tc.name   textEnableHapticFeedbackNull_0100
     * @tc.number SUB_ARKUI_TEXT_ENABLEHAPTICFEEDBACK_NULL_PARAM_001
     * @tc.desc   Test Text enableHapticFeedback property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textEnableHapticFeedbackNull_0100', Level.LEVEL0, async () => {
      console.info('TextLayoutOptionsNullTest', 'textEnableHapticFeedbackNull_0100 START');
      
      let strJsonDefault: string = getInspectorByKey('text_layoutOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      let strJson: string = getInspectorByKey('text_enableHapticFeedback_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      expect(obj.$attrs.enableHapticFeedback).assertEqual(objDefault.$attrs.enableHapticFeedback);
      
      console.info('TextLayoutOptionsNullTest', 'textEnableHapticFeedbackNull_0100 END');
    });

    /**
     * @tc.name   textEnableHapticFeedbackUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_ENABLEHAPTICFEEDBACK_UNDEFINED_PARAM_001
     * @tc.desc   Test Text enableHapticFeedback property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textEnableHapticFeedbackUndefined_0100', Level.LEVEL0, async () => {
      console.info('TextLayoutOptionsNullTest', 'textEnableHapticFeedbackUndefined_0100 START');
      
      let strJsonDefault: string = getInspectorByKey('text_layoutOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      let strJson: string = getInspectorByKey('text_enableHapticFeedback_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      expect(obj.$attrs.enableHapticFeedback).assertEqual(objDefault.$attrs.enableHapticFeedback);
      
      console.info('TextLayoutOptionsNullTest', 'textEnableHapticFeedbackUndefined_0100 END');
    });

    // ==================== optimizeTrailingSpace 属性测试 ====================

    /**
     * @tc.name   textOptimizeTrailingSpaceNull_0100
     * @tc.number SUB_ARKUI_TEXT_OPTIMIZETRAILINGSPACE_NULL_PARAM_001
     * @tc.desc   Test Text optimizeTrailingSpace property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textOptimizeTrailingSpaceNull_0100', Level.LEVEL0, async () => {
      console.info('TextLayoutOptionsNullTest', 'textOptimizeTrailingSpaceNull_0100 START');
      
      let strJsonDefault: string = getInspectorByKey('text_layoutOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      let strJson: string = getInspectorByKey('text_optimizeTrailingSpace_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      expect(obj.$attrs.optimizeTrailingSpace).assertEqual(objDefault.$attrs.optimizeTrailingSpace);
      
      console.info('TextLayoutOptionsNullTest', 'textOptimizeTrailingSpaceNull_0100 END');
    });

    /**
     * @tc.name   textOptimizeTrailingSpaceUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_OPTIMIZETRAILINGSPACE_UNDEFINED_PARAM_001
     * @tc.desc   Test Text optimizeTrailingSpace property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textOptimizeTrailingSpaceUndefined_0100', Level.LEVEL0, async () => {
      console.info('TextLayoutOptionsNullTest', 'textOptimizeTrailingSpaceUndefined_0100 START');
      
      let strJsonDefault: string = getInspectorByKey('text_layoutOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      let strJson: string = getInspectorByKey('text_optimizeTrailingSpace_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      expect(obj.$attrs.optimizeTrailingSpace).assertEqual(objDefault.$attrs.optimizeTrailingSpace);
      
      console.info('TextLayoutOptionsNullTest', 'textOptimizeTrailingSpaceUndefined_0100 END');
    });

    // ==================== enableAutoSpacing 属性测试 ====================

    /**
     * @tc.name   textEnableAutoSpacingNull_0100
     * @tc.number SUB_ARKUI_TEXT_ENABLEAUTOSPACING_NULL_PARAM_001
     * @tc.desc   Test Text enableAutoSpacing property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textEnableAutoSpacingNull_0100', Level.LEVEL0, async () => {
      console.info('TextLayoutOptionsNullTest', 'textEnableAutoSpacingNull_0100 START');
      
      let strJsonDefault: string = getInspectorByKey('text_layoutOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      let strJson: string = getInspectorByKey('text_enableAutoSpacing_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      expect(obj.$attrs.enableAutoSpacing).assertEqual(objDefault.$attrs.enableAutoSpacing);
      
      console.info('TextLayoutOptionsNullTest', 'textEnableAutoSpacingNull_0100 END');
    });

    /**
     * @tc.name   textEnableAutoSpacingUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_ENABLEAUTOSPACING_UNDEFINED_PARAM_001
     * @tc.desc   Test Text enableAutoSpacing property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textEnableAutoSpacingUndefined_0100', Level.LEVEL0, async () => {
      console.info('TextLayoutOptionsNullTest', 'textEnableAutoSpacingUndefined_0100 START');
      
      let strJsonDefault: string = getInspectorByKey('text_layoutOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      let strJson: string = getInspectorByKey('text_enableAutoSpacing_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      expect(obj.$attrs.enableAutoSpacing).assertEqual(objDefault.$attrs.enableAutoSpacing);
      
      console.info('TextLayoutOptionsNullTest', 'textEnableAutoSpacingUndefined_0100 END');
    });

    // ==================== contentTransition 属性测试 ====================

    /**
     * @tc.name   textContentTransitionNull_0100
     * @tc.number SUB_ARKUI_TEXT_CONTENTTRANSITION_NULL_PARAM_001
     * @tc.desc   Test Text contentTransition property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textContentTransitionNull_0100', Level.LEVEL0, async () => {
      console.info('TextLayoutOptionsNullTest', 'textContentTransitionNull_0100 START');
      
      let strJson: string = getInspectorByKey('text_contentTransition_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      expect(obj.$attrs.contentTransition).assertUndefined();
      
      console.info('TextLayoutOptionsNullTest', 'textContentTransitionNull_0100 END');
    });

    /**
     * @tc.name   textContentTransitionUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_CONTENTTRANSITION_UNDEFINED_PARAM_001
     * @tc.desc   Test Text contentTransition property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textContentTransitionUndefined_0100', Level.LEVEL0, async () => {
      console.info('TextLayoutOptionsNullTest', 'textContentTransitionUndefined_0100 START');
      
      let strJson: string = getInspectorByKey('text_contentTransition_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      expect(obj.$attrs.contentTransition).assertUndefined();
      
      console.info('TextLayoutOptionsNullTest', 'textContentTransitionUndefined_0100 END');
    });

    // ==================== includeFontPadding 属性测试 ====================

    /**
     * @tc.name   textIncludeFontPaddingNull_0100
     * @tc.number SUB_ARKUI_TEXT_INCLUDEFONTPADDING_NULL_PARAM_001
     * @tc.desc   Test Text includeFontPadding property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textIncludeFontPaddingNull_0100', Level.LEVEL0, async () => {
      console.info('TextLayoutOptionsNullTest', 'textIncludeFontPaddingNull_0100 START');
      
      let strJsonDefault: string = getInspectorByKey('text_layoutOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      let strJson: string = getInspectorByKey('text_includeFontPadding_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      expect(obj.$attrs.includeFontPadding).assertEqual(objDefault.$attrs.includeFontPadding);
      
      console.info('TextLayoutOptionsNullTest', 'textIncludeFontPaddingNull_0100 END');
    });

    /**
     * @tc.name   textIncludeFontPaddingUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_INCLUDEFONTPADDING_UNDEFINED_PARAM_001
     * @tc.desc   Test Text includeFontPadding property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textIncludeFontPaddingUndefined_0100', Level.LEVEL0, async () => {
      console.info('TextLayoutOptionsNullTest', 'textIncludeFontPaddingUndefined_0100 START');
      
      let strJsonDefault: string = getInspectorByKey('text_layoutOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      let strJson: string = getInspectorByKey('text_includeFontPadding_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      expect(obj.$attrs.includeFontPadding).assertEqual(objDefault.$attrs.includeFontPadding);
      
      console.info('TextLayoutOptionsNullTest', 'textIncludeFontPaddingUndefined_0100 END');
    });
  });
}
