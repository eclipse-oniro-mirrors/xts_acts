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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { router } from '@kit.ArkUI';
import CommonFunc from '../../../MainAbility/common/Common';

export default function accessibilityFocusDrawLevelNullUndefinedTest() {
  describe('AccessibilityFocusDrawLevelNullUndefinedTest', () => {
    beforeAll(async () => {
      let options: router.RouterOptions = {
        url: 'pages/accessibility/AccessibilityFocusDrawLevelNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('[beforeAll] before push, page: ' + JSON.stringify(pages));
        if (!('AccessibilityFocusDrawLevelNullUndefined' === pages.name)) {
          await router.pushUrl(options);
          await CommonFunc.sleep(1500);
        }
        let pagesAfter = router.getState();
        console.info('[beforeAll] after push, page: ' + JSON.stringify(pagesAfter));
      } catch (err) {
        console.error('[beforeAll] error: ' + err);
      }
    });

    /**
     * @tc.name   accessibilityFocusDrawLevel_null_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYFOCUSDRAWLEVEL_PARAM_NULL_001
     * @tc.desc   测试accessibilityFocusDrawLevel传入null参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityFocusDrawLevel_null_001', Level.LEVEL2, async () => {
      try {
        let strJson: string = getInspectorByKey('text_accessibilityFocusDrawLevel_null');
        console.info('[accessibilityFocusDrawLevel_null_001] strJson: ' + strJson);
        if (strJson === '' || strJson === undefined) {
          console.info('[accessibilityFocusDrawLevel_null_001] component not found, skip test');
          return;
        }
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        let accessibilityFocusDrawLevelValue: ESObject = obj.$attrs.accessibilityFocusDrawLevel;
        console.info('[accessibilityFocusDrawLevel_null_001] value: ' + JSON.stringify(accessibilityFocusDrawLevelValue));
        expect(accessibilityFocusDrawLevelValue).assertUndefined();
      } catch (e) {
        console.info('[accessibilityFocusDrawLevel_null_001] exception: ' + e);
      }
    });

    /**
     * @tc.name   accessibilityFocusDrawLevel_undefined_002
     * @tc.number SUB_ARKUI_ACCESSIBILITYFOCUSDRAWLEVEL_PARAM_UNDEFINED_002
     * @tc.desc   测试accessibilityFocusDrawLevel传入undefined参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityFocusDrawLevel_undefined_002', Level.LEVEL2, async () => {
      try {
        let strJson: string = getInspectorByKey('text_accessibilityFocusDrawLevel_undefined');
        console.info('[accessibilityFocusDrawLevel_undefined_002] strJson: ' + strJson);
        if (strJson === '' || strJson === undefined) {
          console.info('[accessibilityFocusDrawLevel_undefined_002] component not found, skip test');
          return;
        }
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        let accessibilityFocusDrawLevelValue: ESObject = obj.$attrs.accessibilityFocusDrawLevel;
        console.info('[accessibilityFocusDrawLevel_undefined_002] value: ' + JSON.stringify(accessibilityFocusDrawLevelValue));
        expect(accessibilityFocusDrawLevelValue).assertUndefined();
      } catch (e) {
        console.info('[accessibilityFocusDrawLevel_undefined_002] exception: ' + e);
      }
    });
  });
}
