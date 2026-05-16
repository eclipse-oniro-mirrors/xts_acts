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

export default function TextWordBreakNullTest() {
  describe('TextWordBreakNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextWordBreakNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextWordBreakNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextWordBreakNullTest state pages: " + JSON.stringify(pages));
        if (!("TextWordBreakNull" == pages.name)) {
          console.info("get TextWordBreakNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextWordBreakNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextWordBreakNullTest page error: " + err);
      }
      done();
    })

    // ==================== wordBreak 属性测试 ====================

    /**
     * @tc.name   textWordBreakNull_0100
     * @tc.number SUB_ARKUI_TEXT_WORDBREAK_NULL_PARAM_001
     * @tc.desc   Test Text wordBreak property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textWordBreakNull_0100', Level.LEVEL2, async () => {
      console.info('TextWordBreakNullTest', 'textWordBreakNull_0100 START');
      
      // Get default wordBreak for comparison
      let strJsonDefault: string = getInspectorByKey('text_wordBreak_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // Get wordBreak with null parameter
      let strJson: string = getInspectorByKey('text_wordBreak_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      // Verify wordBreak is not undefined
      expect(obj.$attrs.wordBreak).not().assertUndefined();
      console.info('TextWordBreakNullTest objDefault: ' + objDefault.$attrs.wordBreak);
      console.info('TextWordBreakNullTest obj:' + obj.$attrs.wordBreak);
      // Verify null parameter restores default value (WordBreak.BREAK_WORD)
      expect(obj.$attrs.wordBreak).assertEqual(objDefault.$attrs.wordBreak);
      
      console.info('TextWordBreakNullTest', 'textWordBreakNull_0100 END');
    });

    /**
     * @tc.name   textWordBreakUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_WORDBREAK_UNDEFINED_PARAM_001
     * @tc.desc   Test Text wordBreak property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textWordBreakUndefined_0100', Level.LEVEL2, async () => {
      console.info('textWordBreakUndefined_0100 START');
      
      // Get default wordBreak for comparison
      let strJsonDefault: string = getInspectorByKey('text_wordBreak_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // Get wordBreak with undefined parameter
      let strJson: string = getInspectorByKey('text_wordBreak_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      // Verify wordBreak is not undefined
      expect(obj.$attrs.wordBreak).not().assertUndefined();
      console.info('textWordBreakUndefined_0100 objDefault: ' + objDefault.$attrs.wordBreak);
      console.info('textWordBreakUndefined_0100 obj:' + obj.$attrs.wordBreak);
      // Verify undefined parameter restores default value (WordBreak.BREAK_WORD)
      expect(obj.$attrs.wordBreak).assertEqual(objDefault.$attrs.wordBreak);
      
      console.info('textWordBreakUndefined_0100 END');
    });
  });
}
