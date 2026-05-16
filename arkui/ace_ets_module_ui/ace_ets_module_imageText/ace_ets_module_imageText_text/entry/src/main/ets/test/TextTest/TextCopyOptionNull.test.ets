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

export default function TextCopyOptionNullTest() {
  describe('TextCopyOptionNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextCopyOptionNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextCopyOptionNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextCopyOptionNullTest state pages: " + JSON.stringify(pages));
        if (!("TextCopyOptionNull" == pages.name)) {
          console.info("get TextCopyOptionNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextCopyOptionNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextCopyOptionNullTest page error: " + err);
      }
      done();
    })

    // ==================== copyOption 属性测试 ====================

    /**
     * @tc.name   textCopyOptionNull_0100
     * @tc.number SUB_ARKUI_TEXT_COPYOPTION_NULL_PARAM_001
     * @tc.desc   Test Text copyOption property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textCopyOptionNull_0100', Level.LEVEL2, async () => {
      console.info('TextCopyOptionNullTest', 'textCopyOptionNull_0100 START');
      
      // Get default copyOption for comparison
      let strJsonDefault: string = getInspectorByKey('text_copyOption_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // Get copyOption with null parameter
      let strJson: string = getInspectorByKey('text_copyOption_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      // Verify copyOption is not undefined
      expect(obj.$attrs.copyOption).not().assertUndefined();
      
      // Verify null parameter restores default value (CopyOptions.None)
      expect(obj.$attrs.copyOption).assertEqual(objDefault.$attrs.copyOption);
      
      console.info('TextCopyOptionNullTest', 'textCopyOptionNull_0100 END');
    });

    /**
     * @tc.name   textCopyOptionUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_COPYOPTION_UNDEFINED_PARAM_001
     * @tc.desc   Test Text copyOption property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textCopyOptionUndefined_0100', Level.LEVEL2, async () => {
      console.info('TextCopyOptionNullTest', 'textCopyOptionUndefined_0100 START');
      
      // Get default copyOption for comparison
      let strJsonDefault: string = getInspectorByKey('text_copyOption_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // Get copyOption with undefined parameter
      let strJson: string = getInspectorByKey('text_copyOption_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      // Verify copyOption is not undefined
      expect(obj.$attrs.copyOption).not().assertUndefined();
      
      // Verify undefined parameter restores default value (CopyOptions.None)
      expect(obj.$attrs.copyOption).assertEqual(objDefault.$attrs.copyOption);
      
      console.info('TextCopyOptionNullTest', 'textCopyOptionUndefined_0100 END');
    });
  });
}
