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

export default function RichEditorBaseControllerSetStyledPlaceholderTest() {
  describe('RichEditorBaseControllerSetStyledPlaceholderTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorBaseControllerSetStyledPlaceholderTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi24/RichEditorBaseControllerSetStyledPlaceholder',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorBaseControllerSetStyledPlaceholderTest state pages: " + JSON.stringify(pages));
        if (!("RichEditorBaseControllerSetStyledPlaceholder" == pages.name)) {
          console.info("get RichEditorBaseControllerSetStyledPlaceholderTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorBaseControllerSetStyledPlaceholderTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorBaseControllerSetStyledPlaceholderTest page error: " + err);
      }
      done();
    })

    // ==================== setStyledPlaceholder 方法测试 ====================

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0100
     * @tc.desc   Test RichEditorBaseController setStyledPlaceholder method with StyledString parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0100 START');

      let strJson: string = getInspectorByKey('richEditor_base_setStyledPlaceholder_styledString');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      expect("placeholder text").assertContain(obj.$attrs.placeholder);
      console.info('SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0200
     * @tc.number SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0200
     * @tc.desc   Test RichEditorBaseController setStyledPlaceholder method with empty string StyledString parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0200', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0200 START');

      let strJson: string = getInspectorByKey('richEditor_base_setStyledPlaceholder_emptyString');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      expect(obj.$attrs.placeholder).assertEqual('');
      console.info('SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0300
     * @tc.number SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0300
     * @tc.desc   Test RichEditorBaseController setStyledPlaceholder method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0300 START');

      let strJson: string = getInspectorByKey('richEditor_base_setStyledPlaceholder_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      expect(obj.$attrs.placeholder).assertEqual('');
      console.info('SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0400
     * @tc.number SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0400
     * @tc.desc   Test RichEditorBaseController setStyledPlaceholder method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0400', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0400 START');

      let strJson: string = getInspectorByKey('richEditor_base_setStyledPlaceholder_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      expect(obj.$attrs.placeholder).assertEqual('');
      console.info('SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0400 END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0500
     * @tc.number SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0500
     * @tc.desc   Test RichEditorBaseController setStyledPlaceholder method with StyledString containing fontColor property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0500', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0500 START');

      let strJson: string = getInspectorByKey('richEditor_base_setStyledPlaceholder_fontColor');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      expect(obj.$attrs.fontColor).assertContain('#');
      console.info('SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0500 END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0600
     * @tc.number SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0600
     * @tc.desc   Test RichEditorBaseController setStyledPlaceholder method with StyledString containing fontSize property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0600', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0600 START');

      let strJson: string = getInspectorByKey('richEditor_base_setStyledPlaceholder_fontSize');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      expect("test fontSize").assertContain(obj.$attrs.placeholder);
      console.info('SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0600 END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0700
     * @tc.number SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0700
     * @tc.desc   Test RichEditorBaseController setStyledPlaceholder method with normal StyledString parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0700', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0700 START');

      let strJson: string = getInspectorByKey('richEditor_base_setStyledPlaceholder_normal');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      expect("normal placeholder").assertContain(obj.$attrs.placeholder);
      console.info('SUB_ARKUI_RICHEDITOR_BASECONTROLLER_SETSTYLEDPLACEHOLDER_PARAM_0700 END');
    });
  });
}
