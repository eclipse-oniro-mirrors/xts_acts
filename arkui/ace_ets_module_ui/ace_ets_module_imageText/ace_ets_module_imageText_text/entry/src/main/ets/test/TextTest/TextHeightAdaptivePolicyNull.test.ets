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

export default function TextHeightAdaptivePolicyNullTest() {
  describe('TextHeightAdaptivePolicyNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextHeightAdaptivePolicyNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextHeightAdaptivePolicyNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextHeightAdaptivePolicyNullTest state pages: " + JSON.stringify(pages));
        if (!("TextHeightAdaptivePolicyNull" == pages.name)) {
          console.info("get TextHeightAdaptivePolicyNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextHeightAdaptivePolicyNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextHeightAdaptivePolicyNullTest page error: " + err);
      }
      done();
    })

    // ==================== heightAdaptivePolicy 属性测试 ====================

    /**
     * @tc.name   textHeightAdaptivePolicyNull_0100
     * @tc.number SUB_ARKUI_TEXT_HEIGHTADAPTIVEPOLICY_NULL_PARAM_001
     * @tc.desc   Test Text heightAdaptivePolicy property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textHeightAdaptivePolicyNull_0100', Level.LEVEL2, async () => {
      console.info('textHeightAdaptivePolicyNull_0100 START');
      
      // Get default heightAdaptivePolicy for comparison
      let strJsonDefault: string = getInspectorByKey('text_heightAdaptivePolicy_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // Get heightAdaptivePolicy with null parameter
      let strJson: string = getInspectorByKey('text_heightAdaptivePolicy_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      // Verify heightAdaptivePolicy is not undefined
      expect(obj.$attrs.heightAdaptivePolicy).not().assertUndefined();
      console.info('textHeightAdaptivePolicyNull_0100 objDefault: ' + objDefault.$attrs.heightAdaptivePolicy);
      console.info('textHeightAdaptivePolicyNull_0100 obj:' + obj.$attrs.heightAdaptivePolicy);
      // Verify null parameter restores default value (TextHeightAdaptivePolicy.MAX_LINES_FIRST)
      expect(obj.$attrs.heightAdaptivePolicy).assertEqual(objDefault.$attrs.heightAdaptivePolicy);
      
      console.info('textHeightAdaptivePolicyNull_0100 END');
    });

    /**
     * @tc.name   textHeightAdaptivePolicyUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_HEIGHTADAPTIVEPOLICY_UNDEFINED_PARAM_001
     * @tc.desc   Test Text heightAdaptivePolicy property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textHeightAdaptivePolicyUndefined_0100', Level.LEVEL2, async () => {
      console.info('textHeightAdaptivePolicyUndefined_0100 START');
      
      // Get default heightAdaptivePolicy for comparison
      let strJsonDefault: string = getInspectorByKey('text_heightAdaptivePolicy_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // Get heightAdaptivePolicy with undefined parameter
      let strJson: string = getInspectorByKey('text_heightAdaptivePolicy_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      // Verify heightAdaptivePolicy is not undefined
      expect(obj.$attrs.heightAdaptivePolicy).not().assertUndefined();
      console.info('textHeightAdaptivePolicyUndefined_0100 objDefault: ' + objDefault.$attrs.heightAdaptivePolicy);
      console.info('textHeightAdaptivePolicyUndefined_0100 obj:' + obj.$attrs.heightAdaptivePolicy);
      // Verify undefined parameter restores default value (TextHeightAdaptivePolicy.MAX_LINES_FIRST)
      expect(obj.$attrs.heightAdaptivePolicy).assertEqual(objDefault.$attrs.heightAdaptivePolicy);
      
      console.info('textHeightAdaptivePolicyUndefined_0100 END');
    });
  });
}
