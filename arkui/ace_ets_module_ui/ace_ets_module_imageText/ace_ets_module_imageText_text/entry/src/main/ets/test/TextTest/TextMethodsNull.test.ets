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

export default function TextMethodsNullTest() {
  describe('TextMethodsNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextMethodsNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextMethodsNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextMethodsNullTest state pages: " + JSON.stringify(pages));
        if (!("TextMethodsNull" == pages.name)) {
          console.info("get TextMethodsNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextMethodsNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextMethodsNullTest page error: " + err);
      }
      done();
    })

    // ==================== onMarqueeStateChange 方法测试 ====================

    /**
     * @tc.name   textOnMarqueeStateChangeNull_0100
     * @tc.number SUB_ARKUI_TEXT_ONMARQUEESTATECHANGE_NULL_PARAM_001
     * @tc.desc   Test Text onMarqueeStateChange method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textOnMarqueeStateChangeNull_0100', Level.LEVEL1, async () => {
      console.info('TextMethodsNullTest', 'textOnMarqueeStateChangeNull_0100 START');

      let strJson: string = getInspectorByKey('text_onMarqueeStateChange_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$type).assertEqual('Text');

      console.info('TextMethodsNullTest', 'textOnMarqueeStateChangeNull_0100 END');
    });

    /**
     * @tc.name   textOnMarqueeStateChangeUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_ONMARQUEESTATECHANGE_UNDEFINED_PARAM_001
     * @tc.desc   Test Text onMarqueeStateChange method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textOnMarqueeStateChangeUndefined_0100', Level.LEVEL1, async () => {
      console.info('TextMethodsNullTest', 'textOnMarqueeStateChangeUndefined_0100 START');

      let strJson: string = getInspectorByKey('text_onMarqueeStateChange_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$type).assertEqual('Text');

      console.info('TextMethodsNullTest', 'textOnMarqueeStateChangeUndefined_0100 END');
    });

    // ==================== bindSelectionMenu 方法测试 ====================

    /**
     * @tc.name   textBindSelectionMenuSpanTypeNull_0100
     * @tc.number SUB_ARKUI_TEXT_BINDSELECTIONMENU_SPANTYPE_NULL_PARAM_001
     * @tc.desc   Test Text bindSelectionMenu method with spanType null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textBindSelectionMenuSpanTypeNull_0100', Level.LEVEL1, async () => {
      console.info('TextMethodsNullTest', 'textBindSelectionMenuSpanTypeNull_0100 START');

      let strJson: string = getInspectorByKey('text_bindSelectionMenu_spanType_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.bindSelectionMenu).assertContain('"responseType":1');

      console.info('TextMethodsNullTest', 'textBindSelectionMenuSpanTypeNull_0100 END');
    });

    /**
     * @tc.name   textBindSelectionMenuSpanTypeUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_BINDSELECTIONMENU_SPANTYPE_UNDEFINED_PARAM_001
     * @tc.desc   Test Text bindSelectionMenu method with spanType undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textBindSelectionMenuSpanTypeUndefined_0100', Level.LEVEL1, async () => {
      console.info('TextMethodsNullTest', 'textBindSelectionMenuSpanTypeUndefined_0100 START');

      let strJson: string = getInspectorByKey('text_bindSelectionMenu_spanType_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.bindSelectionMenu).assertContain('"responseType":1');

      console.info('TextMethodsNullTest', 'textBindSelectionMenuSpanTypeUndefined_0100 END');
    });

    /**
     * @tc.name   textBindSelectionMenuContentNull_0100
     * @tc.number SUB_ARKUI_TEXT_BINDSELECTIONMENU_CONTENT_NULL_PARAM_001
     * @tc.desc   Test Text bindSelectionMenu method with content null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textBindSelectionMenuContentNull_0100', Level.LEVEL1, async () => {
      console.info('TextMethodsNullTest', 'textBindSelectionMenuContentNull_0100 START');

      let strJson: string = getInspectorByKey('text_bindSelectionMenu_content_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.bindSelectionMenu).assertEqual('[]');

      console.info('TextMethodsNullTest', 'textBindSelectionMenuContentNull_0100 END');
    });

    /**
     * @tc.name   textBindSelectionMenuContentUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_BINDSELECTIONMENU_CONTENT_UNDEFINED_PARAM_001
     * @tc.desc   Test Text bindSelectionMenu method with content undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textBindSelectionMenuContentUndefined_0100', Level.LEVEL1, async () => {
      console.info('TextMethodsNullTest', 'textBindSelectionMenuContentUndefined_0100 START');

      let strJson: string = getInspectorByKey('text_bindSelectionMenu_content_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.bindSelectionMenu).assertEqual('[]');

      console.info('TextMethodsNullTest', 'textBindSelectionMenuContentUndefined_0100 END');
    });

    /**
     * @tc.name   textBindSelectionMenuResponseTypeNull_0100
     * @tc.number SUB_ARKUI_TEXT_BINDSELECTIONMENU_RESPONSETYPE_NULL_PARAM_001
     * @tc.desc   Test Text bindSelectionMenu method with responseType null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textBindSelectionMenuResponseTypeNull_0100', Level.LEVEL1, async () => {
      console.info('TextMethodsNullTest', 'textBindSelectionMenuResponseTypeNull_0100 START');

      let strJson: string = getInspectorByKey('text_bindSelectionMenu_responseType_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.bindSelectionMenu).assertContain('"responseType":1');

      console.info('TextMethodsNullTest', 'textBindSelectionMenuResponseTypeNull_0100 END');
    });

    /**
     * @tc.name   textBindSelectionMenuResponseTypeUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_BINDSELECTIONMENU_RESPONSETYPE_UNDEFINED_PARAM_001
     * @tc.desc   Test Text bindSelectionMenu method with responseType undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textBindSelectionMenuResponseTypeUndefined_0100', Level.LEVEL1, async () => {
      console.info('TextMethodsNullTest', 'textBindSelectionMenuResponseTypeUndefined_0100 START');

      let strJson: string = getInspectorByKey('text_bindSelectionMenu_responseType_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.bindSelectionMenu).assertContain('"responseType":1');

      console.info('TextMethodsNullTest', 'textBindSelectionMenuResponseTypeUndefined_0100 END');
    });

    /**
     * @tc.name   textBindSelectionMenuOptionsNull_0100
     * @tc.number SUB_ARKUI_TEXT_BINDSELECTIONMENU_OPTIONS_NULL_PARAM_001
     * @tc.desc   Test Text bindSelectionMenu method with options null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textBindSelectionMenuOptionsNull_0100', Level.LEVEL1, async () => {
      console.info('TextMethodsNullTest', 'textBindSelectionMenuOptionsNull_0100 START');

      let strJson: string = getInspectorByKey('text_bindSelectionMenu_options_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.bindSelectionMenu).assertContain('"responseType":1');

      console.info('TextMethodsNullTest', 'textBindSelectionMenuOptionsNull_0100 END');
    });

    /**
     * @tc.name   textBindSelectionMenuOptionsUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_BINDSELECTIONMENU_OPTIONS_UNDEFINED_PARAM_001
     * @tc.desc   Test Text bindSelectionMenu method with options undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textBindSelectionMenuOptionsUndefined_0100', Level.LEVEL1, async () => {
      console.info('TextMethodsNullTest', 'textBindSelectionMenuOptionsUndefined_0100 START');

      let strJson: string = getInspectorByKey('text_bindSelectionMenu_options_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.bindSelectionMenu).assertContain('"responseType":1');

      console.info('TextMethodsNullTest', 'textBindSelectionMenuOptionsUndefined_0100 END');
    });

    /**
     * @tc.name   textBindSelectionMenuAllNull_0100
     * @tc.number SUB_ARKUI_TEXT_BINDSELECTIONMENU_ALL_NULL_PARAM_001
     * @tc.desc   Test Text bindSelectionMenu method with all null parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textBindSelectionMenuAllNull_0100', Level.LEVEL1, async () => {
      console.info('TextMethodsNullTest', 'textBindSelectionMenuAllNull_0100 START');

      let strJson: string = getInspectorByKey('text_bindSelectionMenu_all_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.bindSelectionMenu).assertEqual('[]');

      console.info('TextMethodsNullTest', 'textBindSelectionMenuAllNull_0100 END');
    });

    /**
     * @tc.name   textBindSelectionMenuAllUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_BINDSELECTIONMENU_ALL_UNDEFINED_PARAM_001
     * @tc.desc   Test Text bindSelectionMenu method with all undefined parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textBindSelectionMenuAllUndefined_0100', Level.LEVEL1, async () => {
      console.info('TextMethodsNullTest', 'textBindSelectionMenuAllUndefined_0100 START');

      let strJson: string = getInspectorByKey('text_bindSelectionMenu_all_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.bindSelectionMenu).assertEqual('[]');

      console.info('TextMethodsNullTest', 'textBindSelectionMenuAllUndefined_0100 END');
    });

    // ==================== setTextSelection 方法测试 ====================

    /**
     * @tc.name   textSetTextSelectionStartNull_0100
     * @tc.number SUB_ARKUI_TEXT_SETTEXTSELECTION_START_NULL_PARAM_001
     * @tc.desc   Test Text setTextSelection method with start null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textSetTextSelectionStartNull_0100', Level.LEVEL1, async () => {
      console.info('TextMethodsNullTest', 'textSetTextSelectionStartNull_0100 START');

      let strJson: string = getInspectorByKey('text_setTextSelection_start_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$type).assertEqual('Text');

      console.info('TextMethodsNullTest', 'textSetTextSelectionStartNull_0100 END');
    });

    /**
     * @tc.name   textSetTextSelectionStartUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_SETTEXTSELECTION_START_UNDEFINED_PARAM_001
     * @tc.desc   Test Text setTextSelection method with start undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textSetTextSelectionStartUndefined_0100', Level.LEVEL1, async () => {
      console.info('TextMethodsNullTest', 'textSetTextSelectionStartUndefined_0100 START');

      let strJson: string = getInspectorByKey('text_setTextSelection_start_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$type).assertEqual('Text');

      console.info('TextMethodsNullTest', 'textSetTextSelectionStartUndefined_0100 END');
    });
  });
}
