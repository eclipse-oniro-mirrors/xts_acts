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

export default function RichEditorStyledStringControllerNullTest() {
  describe('RichEditorStyledStringControllerNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorStyledStringControllerNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorStyledStringControllerNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorStyledStringControllerNullTest state pages: " + JSON.stringify(pages));
        if (!("RichEditorStyledStringControllerNull" == pages.name)) {
          console.info("get RichEditorStyledStringControllerNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorStyledStringControllerNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorStyledStringControllerNullTest page error: " + err);
      }
      done();
    })

    // ==================== setStyledString 方法测试 ====================

    /**
     * @tc.name   richEditorSSSetStyledStringNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SS_SETSTYLEDSTRING_NULL_PARAM_001
     * @tc.desc   Test RichEditorStyledStringController setStyledString method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSSSetStyledStringNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorStyledStringControllerNullTest', 'richEditorSSSetStyledStringNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_ss_setStyledString_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorStyledStringControllerNullTest', 'richEditorSSSetStyledStringNull_0100 END');
    });

    /**
     * @tc.name   richEditorSSSetStyledStringUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SS_SETSTYLEDSTRING_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditorStyledStringController setStyledString method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSSSetStyledStringUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorStyledStringControllerNullTest', 'richEditorSSSetStyledStringUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_ss_setStyledString_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorStyledStringControllerNullTest', 'richEditorSSSetStyledStringUndefined_0100 END');
    });

    /**
     * @tc.name   richEditorSSSetStyledStringEmpty_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SS_SETSTYLEDSTRING_EMPTY_PARAM_001
     * @tc.desc   Test RichEditorStyledStringController setStyledString method with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSSSetStyledStringEmpty_0100', Level.LEVEL1, async () => {
      console.info('RichEditorStyledStringControllerNullTest', 'richEditorSSSetStyledStringEmpty_0100 START');

      let strJson: string = getInspectorByKey('richEditor_ss_setStyledString_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorStyledStringControllerNullTest', 'richEditorSSSetStyledStringEmpty_0100 END');
    });

    /**
     * @tc.name   richEditorSSStyledStringNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SS_STYLEDSTRING_NULL_PARAM_001
     * @tc.desc   Test RichEditorStyledStringController setStyledString with StyledString null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSSStyledStringNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorStyledStringControllerNullTest', 'richEditorSSStyledStringNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_ss_styledString_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorStyledStringControllerNullTest', 'richEditorSSStyledStringNull_0100 END');
    });

    // ==================== onContentChanged 方法测试 ====================

    /**
     * @tc.name   richEditorSSOnContentChangedNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SS_ONCONTENTCHANGED_NULL_PARAM_001
     * @tc.desc   Test RichEditorStyledStringController onContentChanged method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSSOnContentChangedNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorStyledStringControllerNullTest', 'richEditorSSOnContentChangedNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_ss_onContentChanged_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorStyledStringControllerNullTest', 'richEditorSSOnContentChangedNull_0100 END');
    });

    /**
     * @tc.name   richEditorSSOnContentChangedUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SS_ONCONTENTCHANGED_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditorStyledStringController onContentChanged method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSSOnContentChangedUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorStyledStringControllerNullTest', 'richEditorSSOnContentChangedUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_ss_onContentChanged_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorStyledStringControllerNullTest', 'richEditorSSOnContentChangedUndefined_0100 END');
    });
  });
}
