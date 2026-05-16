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

export default function MutableStyledStringMethodsNullTest() {
  describe('MutableStyledStringMethodsNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("MutableStyledStringMethodsNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/MutableStyledStringMethodsNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MutableStyledStringMethodsNullTest state pages: " + JSON.stringify(pages));
        if (!("MutableStyledStringMethodsNull" == pages.name)) {
          console.info("get MutableStyledStringMethodsNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push MutableStyledStringMethodsNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MutableStyledStringMethodsNullTest page error: " + err);
      }
      done();
    })

    // ==================== replaceString 方法测试 ====================

    /**
     * @tc.name   mutableStyledStringReplaceStringNullStart_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REPLACESTRING_NULL_START_PARAM_001
     * @tc.desc   Test MutableStyledString replaceString method with null start parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringReplaceStringNullStart_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringReplaceStringNullStart_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_replaceString_null_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringReplaceStringNullStart_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringReplaceStringUndefinedStart_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REPLACESTRING_UNDEFINED_START_PARAM_001
     * @tc.desc   Test MutableStyledString replaceString method with undefined start parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringReplaceStringUndefinedStart_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringReplaceStringUndefinedStart_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_replaceString_undefined_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringReplaceStringUndefinedStart_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringReplaceStringNullLength_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REPLACESTRING_NULL_LENGTH_PARAM_001
     * @tc.desc   Test MutableStyledString replaceString method with null length parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringReplaceStringNullLength_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringReplaceStringNullLength_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_replaceString_null_length');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringReplaceStringNullLength_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringReplaceStringUndefinedLength_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REPLACESTRING_UNDEFINED_LENGTH_PARAM_001
     * @tc.desc   Test MutableStyledString replaceString method with undefined length parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringReplaceStringUndefinedLength_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringReplaceStringUndefinedLength_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_replaceString_undefined_length');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringReplaceStringUndefinedLength_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringReplaceStringNullOther_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REPLACESTRING_NULL_OTHER_PARAM_001
     * @tc.desc   Test MutableStyledString replaceString method with null other parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringReplaceStringNullOther_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringReplaceStringNullOther_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_replaceString_null_other');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringReplaceStringNullOther_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringReplaceStringUndefinedOther_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REPLACESTRING_UNDEFINED_OTHER_PARAM_001
     * @tc.desc   Test MutableStyledString replaceString method with undefined other parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringReplaceStringUndefinedOther_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringReplaceStringUndefinedOther_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_replaceString_undefined_other');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringReplaceStringUndefinedOther_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringReplaceStringEmptyOther_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REPLACESTRING_EMPTY_OTHER_PARAM_001
     * @tc.desc   Test MutableStyledString replaceString method with empty string other parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringReplaceStringEmptyOther_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringReplaceStringEmptyOther_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_replaceString_empty_other');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('ReplaceString Test: success');
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringReplaceStringEmptyOther_0100 END');
    });

    // ==================== insertString 方法测试 ====================

    /**
     * @tc.name   mutableStyledStringInsertStringNullStart_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_INSERTSTRING_NULL_START_PARAM_001
     * @tc.desc   Test MutableStyledString insertString method with null start parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringInsertStringNullStart_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringInsertStringNullStart_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_insertString_null_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringInsertStringNullStart_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringInsertStringUndefinedStart_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_INSERTSTRING_UNDEFINED_START_PARAM_001
     * @tc.desc   Test MutableStyledString insertString method with undefined start parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringInsertStringUndefinedStart_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringInsertStringUndefinedStart_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_insertString_undefined_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringInsertStringUndefinedStart_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringInsertStringNullOther_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_INSERTSTRING_NULL_OTHER_PARAM_001
     * @tc.desc   Test MutableStyledString insertString method with null other parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringInsertStringNullOther_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringInsertStringNullOther_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_insertString_null_other');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringInsertStringNullOther_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringInsertStringUndefinedOther_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_INSERTSTRING_UNDEFINED_OTHER_PARAM_001
     * @tc.desc   Test MutableStyledString insertString method with undefined other parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringInsertStringUndefinedOther_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringInsertStringUndefinedOther_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_insertString_undefined_other');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringInsertStringUndefinedOther_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringInsertStringEmptyOther_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_INSERTSTRING_EMPTY_OTHER_PARAM_001
     * @tc.desc   Test MutableStyledString insertString method with empty string other parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringInsertStringEmptyOther_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringInsertStringEmptyOther_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_insertString_empty_other');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('InsertString Test: success');
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringInsertStringEmptyOther_0100 END');
    });

    // ==================== removeString 方法测试 ====================

    /**
     * @tc.name   mutableStyledStringRemoveStringNullStart_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REMOVESTRING_NULL_START_PARAM_001
     * @tc.desc   Test MutableStyledString removeString method with null start parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringRemoveStringNullStart_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringRemoveStringNullStart_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_removeString_null_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringRemoveStringNullStart_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringRemoveStringUndefinedStart_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REMOVESTRING_UNDEFINED_START_PARAM_001
     * @tc.desc   Test MutableStyledString removeString method with undefined start parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringRemoveStringUndefinedStart_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringRemoveStringUndefinedStart_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_removeString_undefined_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringRemoveStringUndefinedStart_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringRemoveStringNullLength_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REMOVESTRING_NULL_LENGTH_PARAM_001
     * @tc.desc   Test MutableStyledString removeString method with null length parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringRemoveStringNullLength_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringRemoveStringNullLength_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_removeString_null_length');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringRemoveStringNullLength_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringRemoveStringUndefinedLength_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REMOVESTRING_UNDEFINED_LENGTH_PARAM_001
     * @tc.desc   Test MutableStyledString removeString method with undefined length parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringRemoveStringUndefinedLength_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringRemoveStringUndefinedLength_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_removeString_undefined_length');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringRemoveStringUndefinedLength_0100 END');
    });

    // ==================== replaceStyle 方法测试 ====================

    /**
     * @tc.name   mutableStyledStringReplaceStyleNull_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REPLACESTYLE_NULL_PARAM_001
     * @tc.desc   Test MutableStyledString replaceStyle method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringReplaceStyleNull_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringReplaceStyleNull_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_replaceStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringReplaceStyleNull_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringReplaceStyleUndefined_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REPLACESTYLE_UNDEFINED_PARAM_001
     * @tc.desc   Test MutableStyledString replaceStyle method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringReplaceStyleUndefined_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringReplaceStyleUndefined_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_replaceStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringReplaceStyleUndefined_0100 END');
    });

    // ==================== setStyle 方法测试 ====================

    /**
     * @tc.name   mutableStyledStringSetStyleNull_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_SETSTYLE_NULL_PARAM_001
     * @tc.desc   Test MutableStyledString setStyle method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringSetStyleNull_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringSetStyleNull_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_setStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringSetStyleNull_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringSetStyleUndefined_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_SETSTYLE_UNDEFINED_PARAM_001
     * @tc.desc   Test MutableStyledString setStyle method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringSetStyleUndefined_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringSetStyleUndefined_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_setStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNullTest', 'mutableStyledStringSetStyleUndefined_0100 END');
    });
  });
}
