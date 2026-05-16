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

export default function TextShadowNullTest() {
  describe('TextShadowNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextShadowNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextShadowNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextShadowNullTest state pages: " + JSON.stringify(pages));
        if (!("TextShadowNull" == pages.name)) {
          console.info("get TextShadowNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextShadowNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextShadowNullTest page error: " + err);
      }
      done();
    })

    // ==================== textShadow 属性测试 ====================

    /**
     * @tc.name   textShadowNull_0100
     * @tc.number SUB_ARKUI_TEXT_TEXTSHADOW_NULL_PARAM_001
     * @tc.desc   Test Text textShadow property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textShadowNull_0100', Level.LEVEL2, async () => {
      console.info('TextShadowNullTest', 'textShadowNull_0100 START');
      
      // Get default textShadow for comparison
      let strJsonDefault: string = getInspectorByKey('text_textShadow_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // Get textShadow with null parameter
      let strJson: string = getInspectorByKey('text_textShadow_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('textShadowNull_0100 objDefault: ' + objDefault.$attrs.textShadow.type);
      console.info('textShadowNull_0100 obj:' + obj.$attrs.textShadow);
      // Verify null parameter restores default value
      expect(objDefault.$attrs.textShadow.type).assertEqual('0');
      console.info('TextShadowNullTest', 'textShadowNull_0100 END');
    });

    /**
     * @tc.name   textShadowUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_TEXTSHADOW_UNDEFINED_PARAM_001
     * @tc.desc   Test Text textShadow property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textShadowUndefined_0100', Level.LEVEL2, async () => {
      console.info('TextShadowNullTest', 'textShadowUndefined_0100 START');
      
      // Get default textShadow for comparison
      let strJsonDefault: string = getInspectorByKey('text_textShadow_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // Get textShadow with undefined parameter
      let strJson: string = getInspectorByKey('text_textShadow_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('textShadowUndefined_0100 objDefault: ' + objDefault.$attrs.textShadow);
      console.info('textShadowUndefined_0100 obj:' + obj.$attrs.textShadow);
      // Verify undefined parameter restores default value
      expect(objDefault.$attrs.textShadow.type).assertEqual('0');
      console.info('TextShadowNullTest', 'textShadowUndefined_0100 END');
    });
  });
}
