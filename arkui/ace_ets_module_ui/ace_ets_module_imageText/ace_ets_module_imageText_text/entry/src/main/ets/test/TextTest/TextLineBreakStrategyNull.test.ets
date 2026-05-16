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

export default function TextLineBreakStrategyNullTest() {
  describe('TextLineBreakStrategyNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextLineBreakStrategyNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextLineBreakStrategyNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextLineBreakStrategyNullTest state pages: " + JSON.stringify(pages));
        if (!("TextLineBreakStrategyNull" == pages.name)) {
          console.info("get TextLineBreakStrategyNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextLineBreakStrategyNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextLineBreakStrategyNullTest page error: " + err);
      }
      done();
    })

    // ==================== lineBreakStrategy 属性测试 ====================

    /**
     * @tc.name   textLineBreakStrategyNull_0100
     * @tc.number SUB_ARKUI_TEXT_LINEBREAKSTRATEGY_NULL_PARAM_001
     * @tc.desc   Test Text lineBreakStrategy property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textLineBreakStrategyNull_0100', Level.LEVEL0, async () => {
      console.info('textLineBreakStrategyNull_0100 START');
      
      // Get default lineBreakStrategy for comparison
      let strJsonDefault: string = getInspectorByKey('text_lineBreakStrategy_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // Get lineBreakStrategy with null parameter
      let strJson: string = getInspectorByKey('text_lineBreakStrategy_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      // Verify lineBreakStrategy is not undefined
      expect(obj.$attrs.lineBreakStrategy).not().assertUndefined();
      console.info('textLineBreakStrategyNull_0100 objDefault: ' + objDefault.$attrs.lineBreakStrategy);
      console.info('textLineBreakStrategyNull_0100 obj:' + obj.$attrs.lineBreakStrategy);
      // Verify null parameter restores default value (LineBreakStrategy.GREEDY)
      expect(obj.$attrs.lineBreakStrategy).assertEqual(objDefault.$attrs.lineBreakStrategy);
      
      console.info('textLineBreakStrategyNull_0100 END');
    });

    /**
     * @tc.name   textLineBreakStrategyUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_LINEBREAKSTRATEGY_UNDEFINED_PARAM_001
     * @tc.desc   Test Text lineBreakStrategy property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textLineBreakStrategyUndefined_0100', Level.LEVEL0, async () => {
      console.info('TextLineBreakStrategyNullTest', 'textLineBreakStrategyUndefined_0100 START');
      
      // Get default lineBreakStrategy for comparison
      let strJsonDefault: string = getInspectorByKey('text_lineBreakStrategy_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // Get lineBreakStrategy with undefined parameter
      let strJson: string = getInspectorByKey('text_lineBreakStrategy_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      // Verify lineBreakStrategy is not undefined
      expect(obj.$attrs.lineBreakStrategy).not().assertUndefined();
      console.info('textLineBreakStrategyUndefined_0100 objDefault: ' + objDefault.$attrs.lineBreakStrategy);
      console.info('textLineBreakStrategyUndefined_0100 obj:' + obj.$attrs.lineBreakStrategy);
      // Verify undefined parameter restores default value (LineBreakStrategy.GREEDY)
      expect(obj.$attrs.lineBreakStrategy).assertEqual(objDefault.$attrs.lineBreakStrategy);
      
      console.info('textLineBreakStrategyUndefined_0100', 'textLineBreakStrategyUndefined_0100 END');
    });
  });
}
