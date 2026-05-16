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

export default function TextMinMaxLineHeightTest() {
  describe('TextMinMaxLineHeightTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextMinMaxLineHeightTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextMinMaxLineHeight',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextMinMaxLineHeightTest state pages: " + JSON.stringify(pages));
        if (!("TextMinMaxLineHeight" == pages.name)) {
          console.info("get TextMinMaxLineHeightTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextMinMaxLineHeightTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextMinMaxLineHeightTest page error: " + err);
      }
      done();
    })

    // ==================== minLineHeight null/undefined tests ====================

    /**
     * @tc.name   textMinLineHeightNull_0100
     * @tc.number SUB_ARKUI_TEXT_MINLINEHEIGHT_NULL_PARAM_001
     * @tc.desc   Test Text minLineHeight property with null parameter should restore default value (0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textMinLineHeightNull_0100', Level.LEVEL2, async () => {
      console.info('TextMinMaxLineHeightTest', 'textMinLineHeightNull_0100 START');

      // Get default minLineHeight for comparison
      let strJsonDefault: string = getInspectorByKey('text_minLineHeight_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let defaultMinLineHeight: string = objDefault.$attrs.minLineHeight as string;

      // Get minLineHeight with null parameter
      let strJson: string = getInspectorByKey('text_minLineHeight_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let minLineHeight: string = obj.$attrs.minLineHeight as string;

      // Verify minLineHeight exists and is not undefined
      expect(minLineHeight).not().assertUndefined();

      // Verify null parameter restores default value
      expect(minLineHeight).assertEqual(defaultMinLineHeight);
      // Default value is 0, which may be represented as '0.00px' or '0.00fp'
      let isZero = minLineHeight === '0.00px' || minLineHeight === '0.00fp' || minLineHeight === '0';
      expect(isZero).assertTrue();

      console.info('TextMinMaxLineHeightTest', 'textMinLineHeightNull_0100 END');
    });

    /**
     * @tc.name   textMinLineHeightUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_MINLINEHEIGHT_UNDEFINED_PARAM_001
     * @tc.desc   Test Text minLineHeight property with undefined parameter should restore default value (0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textMinLineHeightUndefined_0100', Level.LEVEL2, async () => {
      console.info('TextMinMaxLineHeightTest', 'textMinLineHeightUndefined_0100 START');

      // Get default minLineHeight for comparison
      let strJsonDefault: string = getInspectorByKey('text_minLineHeight_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let defaultMinLineHeight: string = objDefault.$attrs.minLineHeight as string;

      // Get minLineHeight with undefined parameter
      let strJson: string = getInspectorByKey('text_minLineHeight_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let minLineHeight: string = obj.$attrs.minLineHeight as string;

      // Verify minLineHeight exists and is not undefined
      expect(minLineHeight).not().assertUndefined();

      // Verify undefined parameter restores default value
      expect(minLineHeight).assertEqual(defaultMinLineHeight);
      // Default value is 0, which may be represented as '0.00px' or '0.00fp'
      let isZero = minLineHeight === '0.00px' || minLineHeight === '0.00fp' || minLineHeight === '0';
      expect(isZero).assertTrue();

      console.info('TextMinMaxLineHeightTest', 'textMinLineHeightUndefined_0100 END');
    });

    // ==================== maxLineHeight null/undefined tests ====================

    /**
     * @tc.name   textMaxLineHeightNull_0100
     * @tc.number SUB_ARKUI_TEXT_MAXLINEHEIGHT_NULL_PARAM_001
     * @tc.desc   Test Text maxLineHeight property with null parameter should restore default value (no limit, treated as 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textMaxLineHeightNull_0100', Level.LEVEL2, async () => {
      console.info('TextMinMaxLineHeightTest', 'textMaxLineHeightNull_0100 START');

      // Get default maxLineHeight for comparison
      let strJsonDefault: string = getInspectorByKey('text_maxLineHeight_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let defaultMaxLineHeight: string = objDefault.$attrs.maxLineHeight as string;

      // Get maxLineHeight with null parameter
      let strJson: string = getInspectorByKey('text_maxLineHeight_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let maxLineHeight: string = obj.$attrs.maxLineHeight as string;

      // Verify maxLineHeight exists and is not undefined
      expect(maxLineHeight).not().assertUndefined();

      // Verify null parameter restores default value
      expect(maxLineHeight).assertEqual(defaultMaxLineHeight);
      // Default value is 0 (no limit), which may be represented as '0.00px' or '0.00fp'
      let isZero = maxLineHeight === '0.00px' || maxLineHeight === '0.00fp' || maxLineHeight === '0';
      expect(isZero).assertTrue();

      console.info('TextMinMaxLineHeightTest', 'textMaxLineHeightNull_0100 END');
    });

    /**
     * @tc.name   textMaxLineHeightUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_MAXLINEHEIGHT_UNDEFINED_PARAM_001
     * @tc.desc   Test Text maxLineHeight property with undefined parameter should restore default value (no limit, treated as 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textMaxLineHeightUndefined_0100', Level.LEVEL2, async () => {
      console.info('TextMinMaxLineHeightTest', 'textMaxLineHeightUndefined_0100 START');

      // Get default maxLineHeight for comparison
      let strJsonDefault: string = getInspectorByKey('text_maxLineHeight_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let defaultMaxLineHeight: string = objDefault.$attrs.maxLineHeight as string;

      // Get maxLineHeight with undefined parameter
      let strJson: string = getInspectorByKey('text_maxLineHeight_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let maxLineHeight: string = obj.$attrs.maxLineHeight as string;

      // Verify maxLineHeight exists and is not undefined
      expect(maxLineHeight).not().assertUndefined();

      // Verify undefined parameter restores default value
      expect(maxLineHeight).assertEqual(defaultMaxLineHeight);
      // Default value is 0 (no limit), which may be represented as '0.00px' or '0.00fp'
      let isZero = maxLineHeight === '0.00px' || maxLineHeight === '0.00fp' || maxLineHeight === '0';
      expect(isZero).assertTrue();

      console.info('TextMinMaxLineHeightTest', 'textMaxLineHeightUndefined_0100 END');
    });
  });
}
