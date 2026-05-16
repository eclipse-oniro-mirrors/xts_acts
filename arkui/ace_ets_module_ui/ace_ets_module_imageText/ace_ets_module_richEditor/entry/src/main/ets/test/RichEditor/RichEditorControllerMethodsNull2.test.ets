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

export default function RichEditorControllerMethodsNull2Test() {
  describe('RichEditorControllerMethodsNull2Test', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorControllerMethodsNull2Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorControllerMethodsNull2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorControllerMethodsNull2Test state pages: " + JSON.stringify(pages));
        if (!("RichEditorControllerMethodsNull2" == pages.name)) {
          console.info("get RichEditorControllerMethodsNull2Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorControllerMethodsNull2Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorControllerMethodsNull2Test page error: " + err);
      }
      done();
    })

    // ==================== updateParagraphStyle 方法测试 ====================

    /**
     * @tc.name   richEditorUpdateParagraphStyleNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_UPDATEPARAGRAPHSTYLE_NULL_PARAM_001
     * @tc.desc   Test RichEditor updateParagraphStyle method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorUpdateParagraphStyleNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorUpdateParagraphStyleNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_updateParagraphStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorUpdateParagraphStyleNull_0100 END');
    });

    /**
     * @tc.name   richEditorUpdateParagraphStyleUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_UPDATEPARAGRAPHSTYLE_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor updateParagraphStyle method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorUpdateParagraphStyleUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorUpdateParagraphStyleUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_updateParagraphStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorUpdateParagraphStyleUndefined_0100 END');
    });

    /**
     * @tc.name   richEditorUpdateParagraphStyleStartNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_UPDATEPARAGRAPHSTYLE_START_NULL_PARAM_001
     * @tc.desc   Test RichEditor updateParagraphStyle method with start null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorUpdateParagraphStyleStartNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorUpdateParagraphStyleStartNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_updateParagraphStyle_start_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorUpdateParagraphStyleStartNull_0100 END');
    });

    /**
     * @tc.name   richEditorUpdateParagraphStyleStartUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_UPDATEPARAGRAPHSTYLE_START_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor updateParagraphStyle method with start undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorUpdateParagraphStyleStartUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorUpdateParagraphStyleStartUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_updateParagraphStyle_start_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorUpdateParagraphStyleStartUndefined_0100 END');
    });

    /**
     * @tc.name   richEditorUpdateParagraphStyleEndNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_UPDATEPARAGRAPHSTYLE_END_NULL_PARAM_001
     * @tc.desc   Test RichEditor updateParagraphStyle method with end null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorUpdateParagraphStyleEndNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorUpdateParagraphStyleEndNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_updateParagraphStyle_end_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorUpdateParagraphStyleEndNull_0100 END');
    });

    /**
     * @tc.name   richEditorUpdateParagraphStyleEndUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_UPDATEPARAGRAPHSTYLE_END_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor updateParagraphStyle method with end undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorUpdateParagraphStyleEndUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorUpdateParagraphStyleEndUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_updateParagraphStyle_end_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorUpdateParagraphStyleEndUndefined_0100 END');
    });

    // ==================== deleteSpans 方法测试 ====================

    /**
     * @tc.name   richEditorDeleteSpansNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_DELETESPANS_NULL_PARAM_001
     * @tc.desc   Test RichEditor deleteSpans method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorDeleteSpansNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorDeleteSpansNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_deleteSpans_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorDeleteSpansNull_0100 END');
    });

    /**
     * @tc.name   richEditorDeleteSpansUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_DELETESPANS_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor deleteSpans method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorDeleteSpansUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorDeleteSpansUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_deleteSpans_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorDeleteSpansUndefined_0100 END');
    });

    /**
     * @tc.name   richEditorDeleteSpansStartNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_DELETESPANS_START_NULL_PARAM_001
     * @tc.desc   Test RichEditor deleteSpans method with start null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorDeleteSpansStartNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorDeleteSpansStartNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_deleteSpans_start_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorDeleteSpansStartNull_0100 END');
    });

    /**
     * @tc.name   richEditorDeleteSpansStartUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_DELETESPANS_START_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor deleteSpans method with start undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorDeleteSpansStartUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorDeleteSpansStartUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_deleteSpans_start_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorDeleteSpansStartUndefined_0100 END');
    });

    /**
     * @tc.name   richEditorDeleteSpansEndNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_DELETESPANS_END_NULL_PARAM_001
     * @tc.desc   Test RichEditor deleteSpans method with end null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorDeleteSpansEndNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorDeleteSpansEndNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_deleteSpans_end_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorDeleteSpansEndNull_0100 END');
    });

    /**
     * @tc.name   richEditorDeleteSpansEndUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_DELETESPANS_END_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor deleteSpans method with end undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorDeleteSpansEndUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorDeleteSpansEndUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_deleteSpans_end_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorDeleteSpansEndUndefined_0100 END');
    });

    // ==================== getSpans 方法测试 ====================

    /**
     * @tc.name   richEditorGetSpansNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_GETSPANS_NULL_PARAM_001
     * @tc.desc   Test RichEditor getSpans method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorGetSpansNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorGetSpansNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_getSpans_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorGetSpansNull_0100 END');
    });

    /**
     * @tc.name   richEditorGetSpansUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_GETSPANS_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor getSpans method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorGetSpansUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorGetSpansUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_getSpans_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorGetSpansUndefined_0100 END');
    });

    /**
     * @tc.name   richEditorGetSpansStartNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_GETSPANS_START_NULL_PARAM_001
     * @tc.desc   Test RichEditor getSpans method with start null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorGetSpansStartNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorGetSpansStartNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_getSpans_start_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorGetSpansStartNull_0100 END');
    });

    /**
     * @tc.name   richEditorGetSpansStartUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_GETSPANS_START_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor getSpans method with start undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorGetSpansStartUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorGetSpansStartUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_getSpans_start_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorGetSpansStartUndefined_0100 END');
    });

    // ==================== getParagraphs 方法测试 ====================

    /**
     * @tc.name   richEditorGetParagraphsNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_GETPARAGRAPHS_NULL_PARAM_001
     * @tc.desc   Test RichEditor getParagraphs method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorGetParagraphsNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorGetParagraphsNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_getParagraphs_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorGetParagraphsNull_0100 END');
    });

    /**
     * @tc.name   richEditorGetParagraphsUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_GETPARAGRAPHS_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor getParagraphs method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorGetParagraphsUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorGetParagraphsUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_getParagraphs_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorGetParagraphsUndefined_0100 END');
    });

    // ==================== fromStyledString 方法测试 ====================

    /**
     * @tc.name   richEditorFromStyledStringNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_FROMSTYLEDSTRING_NULL_PARAM_001
     * @tc.desc   Test RichEditor fromStyledString method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorFromStyledStringNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorFromStyledStringNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_fromStyledString_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorFromStyledStringNull_0100 END');
    });

    /**
     * @tc.name   richEditorFromStyledStringUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_FROMSTYLEDSTRING_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor fromStyledString method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorFromStyledStringUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorFromStyledStringUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_fromStyledString_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorFromStyledStringUndefined_0100 END');
    });

    // ==================== toStyledString 方法测试 ====================

    /**
     * @tc.name   richEditorToStyledStringNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_TOSTYLEDSTRING_NULL_PARAM_001
     * @tc.desc   Test RichEditor toStyledString method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorToStyledStringNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorToStyledStringNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_toStyledString_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorToStyledStringNull_0100 END');
    });

    /**
     * @tc.name   richEditorToStyledStringUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_TOSTYLEDSTRING_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor toStyledString method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorToStyledStringUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorToStyledStringUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_toStyledString_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorControllerMethodsNull2Test', 'richEditorToStyledStringUndefined_0100 END');
    });
  });
}
