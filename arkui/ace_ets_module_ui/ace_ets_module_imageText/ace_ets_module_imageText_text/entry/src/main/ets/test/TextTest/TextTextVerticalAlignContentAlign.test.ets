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

export default function TextTextVerticalAlignContentAlignTest() {
  describe('TextTextVerticalAlignContentAlignTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextTextVerticalAlignContentAlignTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextTextVerticalAlignContentAlign',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextFontStyleLineSpacingNullTest state pages: " + JSON.stringify(pages));
        if (!("TextTextVerticalAlignContentAlign" == pages.name)) {
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

    // ==================== textVerticalAlign null/undefined tests ====================
    /**
     * @tc.name   textTextVerticalAlignNull_0100
     * @tc.number SUB_ARKUI_TEXT_TEXTVERTICALALIGN_NULL_PARAM_001
     * @tc.desc   Test Text textVerticalAlign property with null parameter should restore default value (TextVerticalAlign.BASELINE)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTextVerticalAlignNull_0100', Level.LEVEL2, async () => {
      console.info('TextTextVerticalAlignContentAlignTest', 'textTextVerticalAlignNull_0100 START');

      // Get default textVerticalAlign for comparison
      let strJsonDefault: string = getInspectorByKey('text_textVerticalAlign_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let defaultTextVerticalAlign: string = objDefault.$attrs.textVerticalAlign as string;

      // Get textVerticalAlign with null parameter
      let strJson: string = getInspectorByKey('text_textVerticalAlign_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let textVerticalAlign: string = obj.$attrs.textVerticalAlign as string;

      // Verify textVerticalAlign exists and is not undefined
      expect(textVerticalAlign).not().assertUndefined();

      // Verify null parameter restores default value
      expect(textVerticalAlign).assertEqual(defaultTextVerticalAlign);
      expect(textVerticalAlign).assertEqual('TextVerticalAlign.BASELINE');

      console.info('TextTextVerticalAlignContentAlignTest', 'textTextVerticalAlignNull_0100 END');
    });

    /**
     * @tc.name   textTextVerticalAlignUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_TEXTVERTICALALIGN_UNDEFINED_PARAM_001
     * @tc.desc   Test Text textVerticalAlign property with undefined parameter should restore default value (TextVerticalAlign.BASELINE)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTextVerticalAlignUndefined_0100', Level.LEVEL2, async () => {
      console.info('TextTextVerticalAlignContentAlignTest', 'textTextVerticalAlignUndefined_0100 START');

      // Get default textVerticalAlign for comparison
      let strJsonDefault: string = getInspectorByKey('text_textVerticalAlign_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let defaultTextVerticalAlign: string = objDefault.$attrs.textVerticalAlign as string;

      // Get textVerticalAlign with undefined parameter
      let strJson: string = getInspectorByKey('text_textVerticalAlign_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let textVerticalAlign: string = obj.$attrs.textVerticalAlign as string;

      // Verify textVerticalAlign exists and is not undefined
      expect(textVerticalAlign).not().assertUndefined();

      // Verify undefined parameter restores default value
      expect(textVerticalAlign).assertEqual(defaultTextVerticalAlign);
      expect(textVerticalAlign).assertEqual('TextVerticalAlign.BASELINE');

      console.info('TextTextVerticalAlignContentAlignTest', 'textTextVerticalAlignUndefined_0100 END');
    });

    // ==================== textContentAlign null/undefined tests ====================

    /**
     * @tc.name   textTextContentAlignNull_0100
     * @tc.number SUB_ARKUI_TEXT_TEXTCONTENTALIGN_NULL_PARAM_001
     * @tc.desc   Test Text textContentAlign property with null parameter should restore default value (consistent with align Center)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTextContentAlignNull_0100', Level.LEVEL2, async () => {
      console.info('TextTextVerticalAlignContentAlignTest', 'textTextContentAlignNull_0100 START');

      // Get default textContentAlign for comparison
      let strJsonDefault: string = getInspectorByKey('text_textContentAlign_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let defaultTextContentAlign: string = objDefault.$attrs.textContentAlign as string;

      // Get textContentAlign with null parameter
      let strJson: string = getInspectorByKey('text_textContentAlign_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let textContentAlign: string = obj.$attrs.textContentAlign as string;

      // Verify textContentAlign exists and is not undefined
      expect(textContentAlign).not().assertUndefined();

      // Verify null parameter restores default value (consistent with align Center when undefined)
      expect(textContentAlign).assertEqual(defaultTextContentAlign);

      console.info('TextTextVerticalAlignContentAlignTest', 'textTextContentAlignNull_0100 END');
    });

    /**
     * @tc.name   textTextContentAlignUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_TEXTCONTENTALIGN_UNDEFINED_PARAM_001
     * @tc.desc   Test Text textContentAlign property with undefined parameter should restore default value (consistent with align Center)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTextContentAlignUndefined_0100', Level.LEVEL2, async () => {
      console.info('TextTextVerticalAlignContentAlignTest', 'textTextContentAlignUndefined_0100 START');

      // Get default textContentAlign for comparison
      let strJsonDefault: string = getInspectorByKey('text_textContentAlign_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let defaultTextContentAlign: string = objDefault.$attrs.textContentAlign as string;

      // Get textContentAlign with undefined parameter
      let strJson: string = getInspectorByKey('text_textContentAlign_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let textContentAlign: string = obj.$attrs.textContentAlign as string;

      // Verify textContentAlign exists and is not undefined
      expect(textContentAlign).not().assertUndefined();

      // Verify undefined parameter restores default value (consistent with align Center when undefined)
      expect(textContentAlign).assertEqual(defaultTextContentAlign);

      console.info('TextTextVerticalAlignContentAlignTest', 'textTextContentAlignUndefined_0100 END');
    });
  });
}
