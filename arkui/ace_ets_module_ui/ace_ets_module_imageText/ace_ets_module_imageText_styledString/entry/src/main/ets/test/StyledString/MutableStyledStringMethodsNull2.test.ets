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

export default function MutableStyledStringMethodsNull2Test() {
  describe('MutableStyledStringMethodsNull2Test', () => {
    beforeEach(async (done: Function) => {
      console.info("MutableStyledStringMethodsNull2Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/MutableStyledStringMethodsNull2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MutableStyledStringMethodsNull2Test state pages: " + JSON.stringify(pages));
        if (!("MutableStyledStringMethodsNull2" == pages.name)) {
          console.info("get MutableStyledStringMethodsNull2Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push MutableStyledStringMethodsNull2Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MutableStyledStringMethodsNull2Test page error: " + err);
      }
      done();
    })

    // ==================== removeStyle 方法测试 ====================

    /**
     * @tc.name   mutableStyledStringRemoveStyleNullStart_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REMOVESTYLE_NULL_START_PARAM_001
     * @tc.desc   Test MutableStyledString removeStyle method with null start parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringRemoveStyleNullStart_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringRemoveStyleNullStart_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_removeStyle_null_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringRemoveStyleNullStart_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringRemoveStyleUndefinedStart_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REMOVESTYLE_UNDEFINED_START_PARAM_001
     * @tc.desc   Test MutableStyledString removeStyle method with undefined start parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringRemoveStyleUndefinedStart_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringRemoveStyleUndefinedStart_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_removeStyle_undefined_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringRemoveStyleUndefinedStart_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringRemoveStyleNullLength_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REMOVESTYLE_NULL_LENGTH_PARAM_001
     * @tc.desc   Test MutableStyledString removeStyle method with null length parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringRemoveStyleNullLength_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringRemoveStyleNullLength_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_removeStyle_null_length');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringRemoveStyleNullLength_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringRemoveStyleUndefinedLength_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REMOVESTYLE_UNDEFINED_LENGTH_PARAM_001
     * @tc.desc   Test MutableStyledString removeStyle method with undefined length parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringRemoveStyleUndefinedLength_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringRemoveStyleUndefinedLength_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_removeStyle_undefined_length');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringRemoveStyleUndefinedLength_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringRemoveStyleNullStyledKey_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REMOVESTYLE_NULL_STYLEDKEY_PARAM_001
     * @tc.desc   Test MutableStyledString removeStyle method with null styledKey parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringRemoveStyleNullStyledKey_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringRemoveStyleNullStyledKey_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_removeStyle_null_styledKey');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringRemoveStyleNullStyledKey_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringRemoveStyleUndefinedStyledKey_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REMOVESTYLE_UNDEFINED_STYLEDKEY_PARAM_001
     * @tc.desc   Test MutableStyledString removeStyle method with undefined styledKey parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringRemoveStyleUndefinedStyledKey_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringRemoveStyleUndefinedStyledKey_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_removeStyle_undefined_styledKey');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringRemoveStyleUndefinedStyledKey_0100 END');
    });

    // ==================== removeStyles 方法测试 ====================

    /**
     * @tc.name   mutableStyledStringRemoveStylesNullStart_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REMOVESTYLES_NULL_START_PARAM_001
     * @tc.desc   Test MutableStyledString removeStyles method with null start parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringRemoveStylesNullStart_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringRemoveStylesNullStart_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_removeStyles_null_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringRemoveStylesNullStart_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringRemoveStylesUndefinedStart_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REMOVESTYLES_UNDEFINED_START_PARAM_001
     * @tc.desc   Test MutableStyledString removeStyles method with undefined start parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringRemoveStylesUndefinedStart_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringRemoveStylesUndefinedStart_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_removeStyles_undefined_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringRemoveStylesUndefinedStart_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringRemoveStylesNullLength_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REMOVESTYLES_NULL_LENGTH_PARAM_001
     * @tc.desc   Test MutableStyledString removeStyles method with null length parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringRemoveStylesNullLength_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringRemoveStylesNullLength_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_removeStyles_null_length');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringRemoveStylesNullLength_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringRemoveStylesUndefinedLength_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REMOVESTYLES_UNDEFINED_LENGTH_PARAM_001
     * @tc.desc   Test MutableStyledString removeStyles method with undefined length parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringRemoveStylesUndefinedLength_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringRemoveStylesUndefinedLength_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_removeStyles_undefined_length');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringRemoveStylesUndefinedLength_0100 END');
    });

    // ==================== replaceStyledString 方法测试 ====================

    /**
     * @tc.name   mutableStyledStringReplaceStyledStringNullStart_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REPLACESTYLEDSTRING_NULL_START_PARAM_001
     * @tc.desc   Test MutableStyledString replaceStyledString method with null start parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringReplaceStyledStringNullStart_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringReplaceStyledStringNullStart_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_replaceStyledString_null_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringReplaceStyledStringNullStart_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringReplaceStyledStringUndefinedStart_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REPLACESTYLEDSTRING_UNDEFINED_START_PARAM_001
     * @tc.desc   Test MutableStyledString replaceStyledString method with undefined start parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringReplaceStyledStringUndefinedStart_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringReplaceStyledStringUndefinedStart_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_replaceStyledString_undefined_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringReplaceStyledStringUndefinedStart_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringReplaceStyledStringNullLength_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REPLACESTYLEDSTRING_NULL_LENGTH_PARAM_001
     * @tc.desc   Test MutableStyledString replaceStyledString method with null length parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringReplaceStyledStringNullLength_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringReplaceStyledStringNullLength_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_replaceStyledString_null_length');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringReplaceStyledStringNullLength_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringReplaceStyledStringUndefinedLength_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REPLACESTYLEDSTRING_UNDEFINED_LENGTH_PARAM_001
     * @tc.desc   Test MutableStyledString replaceStyledString method with undefined length parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringReplaceStyledStringUndefinedLength_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringReplaceStyledStringUndefinedLength_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_replaceStyledString_undefined_length');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringReplaceStyledStringUndefinedLength_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringReplaceStyledStringNullOther_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REPLACESTYLEDSTRING_NULL_OTHER_PARAM_001
     * @tc.desc   Test MutableStyledString replaceStyledString method with null other parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringReplaceStyledStringNullOther_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringReplaceStyledStringNullOther_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_replaceStyledString_null_other');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringReplaceStyledStringNullOther_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringReplaceStyledStringUndefinedOther_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_REPLACESTYLEDSTRING_UNDEFINED_OTHER_PARAM_001
     * @tc.desc   Test MutableStyledString replaceStyledString method with undefined other parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringReplaceStyledStringUndefinedOther_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringReplaceStyledStringUndefinedOther_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_replaceStyledString_undefined_other');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringReplaceStyledStringUndefinedOther_0100 END');
    });

    // ==================== insertStyledString 方法测试 ====================

    /**
     * @tc.name   mutableStyledStringInsertStyledStringNullStart_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_INSERTSTYLEDSTRING_NULL_START_PARAM_001
     * @tc.desc   Test MutableStyledString insertStyledString method with null start parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringInsertStyledStringNullStart_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringInsertStyledStringNullStart_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_insertStyledString_null_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringInsertStyledStringNullStart_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringInsertStyledStringUndefinedStart_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_INSERTSTYLEDSTRING_UNDEFINED_START_PARAM_001
     * @tc.desc   Test MutableStyledString insertStyledString method with undefined start parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringInsertStyledStringUndefinedStart_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringInsertStyledStringUndefinedStart_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_insertStyledString_undefined_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringInsertStyledStringUndefinedStart_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringInsertStyledStringNullOther_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_INSERTSTYLEDSTRING_NULL_OTHER_PARAM_001
     * @tc.desc   Test MutableStyledString insertStyledString method with null other parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringInsertStyledStringNullOther_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringInsertStyledStringNullOther_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_insertStyledString_null_other');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringInsertStyledStringNullOther_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringInsertStyledStringUndefinedOther_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_INSERTSTYLEDSTRING_UNDEFINED_OTHER_PARAM_001
     * @tc.desc   Test MutableStyledString insertStyledString method with undefined other parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringInsertStyledStringUndefinedOther_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringInsertStyledStringUndefinedOther_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_insertStyledString_undefined_other');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringInsertStyledStringUndefinedOther_0100 END');
    });

    // ==================== appendStyledString 方法测试 ====================

    /**
     * @tc.name   mutableStyledStringAppendStyledStringNull_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_APPENDSTYLEDSTRING_NULL_PARAM_001
     * @tc.desc   Test MutableStyledString appendStyledString method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringAppendStyledStringNull_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringAppendStyledStringNull_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_appendStyledString_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringAppendStyledStringNull_0100 END');
    });

    /**
     * @tc.name   mutableStyledStringAppendStyledStringUndefined_0100
     * @tc.number SUB_ARKUI_MUTABLESTYLEDSTRING_APPENDSTYLEDSTRING_UNDEFINED_PARAM_001
     * @tc.desc   Test MutableStyledString appendStyledString method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('mutableStyledStringAppendStyledStringUndefined_0100', Level.LEVEL1, async () => {
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringAppendStyledStringUndefined_0100 START');

      let strJson: string = getInspectorByKey('mutableStyledString_appendStyledString_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Input parameter check failed');
      console.info('MutableStyledStringMethodsNull2Test', 'mutableStyledStringAppendStyledStringUndefined_0100 END');
    });
  });
}
