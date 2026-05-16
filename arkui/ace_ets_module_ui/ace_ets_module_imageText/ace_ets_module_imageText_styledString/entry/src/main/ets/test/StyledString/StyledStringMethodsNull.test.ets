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

export default function StyledStringMethodsNullTest() {
  describe('StyledStringMethodsNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("StyledStringMethodsNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/StyledStringMethodsNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StyledStringMethodsNullTest state pages: " + JSON.stringify(pages));
        if (!("StyledStringMethodsNull" == pages.name)) {
          console.info("get StyledStringMethodsNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StyledStringMethodsNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StyledStringMethodsNullTest page error: " + err);
      }
      done();
    })

    // ==================== getStyles 方法测试 ====================

    /**
     * @tc.name   styledStringGetStylesNullStart_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_GETSTYLES_NULL_START_PARAM_001
     * @tc.desc   Test StyledString getStyles method with null start parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('styledStringGetStylesNullStart_0100', Level.LEVEL1, async () => {
      console.info('StyledStringMethodsNullTest', 'styledStringGetStylesNullStart_0100 START');

      let strJson: string = getInspectorByKey('styledString_getStyles_null_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('GetStyles Test: error: Input parameter check failed.');
      console.info('StyledStringMethodsNullTest', 'styledStringGetStylesNullStart_0100 END');
    });

    /**
     * @tc.name   styledStringGetStylesUndefinedStart_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_GETSTYLES_UNDEFINED_START_PARAM_001
     * @tc.desc   Test StyledString getStyles method with undefined start parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('styledStringGetStylesUndefinedStart_0100', Level.LEVEL1, async () => {
      console.info('StyledStringMethodsNullTest', 'styledStringGetStylesUndefinedStart_0100 START');

      let strJson: string = getInspectorByKey('styledString_getStyles_undefined_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('GetStyles Test: error: Input parameter check failed.');
      console.info('StyledStringMethodsNullTest', 'styledStringGetStylesUndefinedStart_0100 END');
    });

    /**
     * @tc.name   styledStringGetStylesNullLength_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_GETSTYLES_NULL_LENGTH_PARAM_001
     * @tc.desc   Test StyledString getStyles method with null length parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('styledStringGetStylesNullLength_0100', Level.LEVEL1, async () => {
      console.info('StyledStringMethodsNullTest', 'styledStringGetStylesNullLength_0100 START');

      let strJson: string = getInspectorByKey('styledString_getStyles_null_length');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('GetStyles Test: error: Input parameter check failed.');
      console.info('StyledStringMethodsNullTest', 'styledStringGetStylesNullLength_0100 END');
    });

    /**
     * @tc.name   styledStringGetStylesUndefinedLength_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_GETSTYLES_UNDEFINED_LENGTH_PARAM_001
     * @tc.desc   Test StyledString getStyles method with undefined length parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('styledStringGetStylesUndefinedLength_0100', Level.LEVEL1, async () => {
      console.info('StyledStringMethodsNullTest', 'styledStringGetStylesUndefinedLength_0100 START');

      let strJson: string = getInspectorByKey('styledString_getStyles_undefined_length');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('GetStyles Test: error: Input parameter check failed.');
      console.info('StyledStringMethodsNullTest', 'styledStringGetStylesUndefinedLength_0100 END');
    });

    /**
     * @tc.name   styledStringGetStylesNullStyledKey_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_GETSTYLES_NULL_STYLEDKEY_PARAM_001
     * @tc.desc   Test StyledString getStyles method with null styledKey parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('styledStringGetStylesNullStyledKey_0100', Level.LEVEL1, async () => {
      console.info('StyledStringMethodsNullTest', 'styledStringGetStylesNullStyledKey_0100 START');

      let strJson: string = getInspectorByKey('styledString_getStyles_null_styledKey');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('GetStyles Test: error: Input parameter check failed.');
      console.info('StyledStringMethodsNullTest', 'styledStringGetStylesNullStyledKey_0100 END');
    });

    /**
     * @tc.name   styledStringGetStylesUndefinedStyledKey_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_GETSTYLES_UNDEFINED_STYLEDKEY_PARAM_001
     * @tc.desc   Test StyledString getStyles method with undefined styledKey parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('styledStringGetStylesUndefinedStyledKey_0100', Level.LEVEL1, async () => {
      console.info('StyledStringMethodsNullTest', 'styledStringGetStylesUndefinedStyledKey_0100 START');

      let strJson: string = getInspectorByKey('styledString_getStyles_undefined_styledKey');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('GetStyles Test: error: Input parameter check failed.');
      console.info('StyledStringMethodsNullTest', 'styledStringGetStylesUndefinedStyledKey_0100 END');
    });

    // ==================== equals 方法测试 ====================

    /**
     * @tc.name   styledStringEqualsNull_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_EQUALS_NULL_PARAM_001
     * @tc.desc   Test StyledString equals method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('styledStringEqualsNull_0100', Level.LEVEL1, async () => {
      console.info('StyledStringMethodsNullTest', 'styledStringEqualsNull_0100 START');

      let strJson: string = getInspectorByKey('styledString_equals_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('Equals Test: false');
      console.info('StyledStringMethodsNullTest', 'styledStringEqualsNull_0100 END');
    });

    /**
     * @tc.name   styledStringEqualsUndefined_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_EQUALS_UNDEFINED_PARAM_001
     * @tc.desc   Test StyledString equals method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('styledStringEqualsUndefined_0100', Level.LEVEL1, async () => {
      console.info('StyledStringMethodsNullTest', 'styledStringEqualsUndefined_0100 START');

      let strJson: string = getInspectorByKey('styledString_equals_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('Equals Test: false');
      console.info('StyledStringMethodsNullTest', 'styledStringEqualsUndefined_0100 END');
    });

    // ==================== subStyledString 方法测试 ====================

    /**
     * @tc.name   styledStringSubStyledStringNullStart_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_SUBSTYLEDSTRING_NULL_START_PARAM_001
     * @tc.desc   Test StyledString subStyledString method with null start parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('styledStringSubStyledStringNullStart_0100', Level.LEVEL1, async () => {
      console.info('StyledStringMethodsNullTest', 'styledStringSubStyledStringNullStart_0100 START');

      let strJson: string = getInspectorByKey('styledString_subStyledString_null_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('SubStyledString Test: error: Input parameter check failed.');
      console.info('StyledStringMethodsNullTest', 'styledStringSubStyledStringNullStart_0100 END');
    });

    /**
     * @tc.name   styledStringSubStyledStringUndefinedStart_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_SUBSTYLEDSTRING_UNDEFINED_START_PARAM_001
     * @tc.desc   Test StyledString subStyledString method with undefined start parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('styledStringSubStyledStringUndefinedStart_0100', Level.LEVEL1, async () => {
      console.info('StyledStringMethodsNullTest', 'styledStringSubStyledStringUndefinedStart_0100 START');

      let strJson: string = getInspectorByKey('styledString_subStyledString_undefined_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('SubStyledString Test: error: Input parameter check failed.');
      console.info('StyledStringMethodsNullTest', 'styledStringSubStyledStringUndefinedStart_0100 END');
    });

    /**
     * @tc.name   styledStringSubStyledStringNullLength_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_SUBSTYLEDSTRING_NULL_LENGTH_PARAM_001
     * @tc.desc   Test StyledString subStyledString method with null length parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('styledStringSubStyledStringNullLength_0100', Level.LEVEL1, async () => {
      console.info('StyledStringMethodsNullTest', 'styledStringSubStyledStringNullLength_0100 START');

      let strJson: string = getInspectorByKey('styledString_subStyledString_null_length');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('SubStyledString Test: error: Input parameter check failed.');
      console.info('StyledStringMethodsNullTest', 'styledStringSubStyledStringNullLength_0100 END');
    });

    /**
     * @tc.name   styledStringSubStyledStringUndefinedLength_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_SUBSTYLEDSTRING_UNDEFINED_LENGTH_PARAM_001
     * @tc.desc   Test StyledString subStyledString method with undefined length parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('styledStringSubStyledStringUndefinedLength_0100', Level.LEVEL1, async () => {
      console.info('StyledStringMethodsNullTest', 'styledStringSubStyledStringUndefinedLength_0100 START');

      let strJson: string = getInspectorByKey('styledString_subStyledString_undefined_length');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('SubStyledString Test: error: Input parameter check failed.');
      console.info('StyledStringMethodsNullTest', 'styledStringSubStyledStringUndefinedLength_0100 END');
    });

    // ==================== fromHtml 静态方法测试 ====================

    /**
     * @tc.name   styledStringFromHtmlNull_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_FROMHTML_NULL_PARAM_001
     * @tc.desc   Test StyledString fromHtml static method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('styledStringFromHtmlNull_0100', Level.LEVEL1, async () => {
      console.info('StyledStringMethodsNullTest', 'styledStringFromHtmlNull_0100 START');

      let strJson: string = getInspectorByKey('styledString_fromHtml_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Parameter error');
      console.info('StyledStringMethodsNullTest', 'styledStringFromHtmlNull_0100 END');
    });

    /**
     * @tc.name   styledStringFromHtmlUndefined_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_FROMHTML_UNDEFINED_PARAM_001
     * @tc.desc   Test StyledString fromHtml static method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('styledStringFromHtmlUndefined_0100', Level.LEVEL1, async () => {
      console.info('StyledStringMethodsNullTest', 'styledStringFromHtmlUndefined_0100 START');

      let strJson: string = getInspectorByKey('styledString_fromHtml_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Parameter error');
      console.info('StyledStringMethodsNullTest', 'styledStringFromHtmlUndefined_0100 END');
    });

    /**
     * @tc.name   styledStringFromHtmlEmpty_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_FROMHTML_EMPTY_PARAM_001
     * @tc.desc   Test StyledString fromHtml static method with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('styledStringFromHtmlEmpty_0100', Level.LEVEL1, async () => {
      console.info('StyledStringMethodsNullTest', 'styledStringFromHtmlEmpty_0100 START');

      let strJson: string = getInspectorByKey('styledString_fromHtml_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('Convert error');
      console.info('StyledStringMethodsNullTest', 'styledStringFromHtmlEmpty_0100 END');
    });

    // ==================== toHtml 静态方法测试 ====================

    /**
     * @tc.name   styledStringToHtmlNull_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_TOHTML_NULL_PARAM_001
     * @tc.desc   Test StyledString toHtml static method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('styledStringToHtmlNull_0100', Level.LEVEL1, async () => {
      console.info('StyledStringMethodsNullTest', 'styledStringToHtmlNull_0100 START');

      let strJson: string = getInspectorByKey('styledString_toHtml_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('ToHtml Test: success');
      console.info('StyledStringMethodsNullTest', 'styledStringToHtmlNull_0100 END');
    });

    /**
     * @tc.name   styledStringToHtmlUndefined_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_TOHTML_UNDEFINED_PARAM_001
     * @tc.desc   Test StyledString toHtml static method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('styledStringToHtmlUndefined_0100', Level.LEVEL1, async () => {
      console.info('StyledStringMethodsNullTest', 'styledStringToHtmlUndefined_0100 START');

      let strJson: string = getInspectorByKey('styledString_toHtml_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('ToHtml Test: success');
      console.info('StyledStringMethodsNullTest', 'styledStringToHtmlUndefined_0100 END');
    });
  });
}
