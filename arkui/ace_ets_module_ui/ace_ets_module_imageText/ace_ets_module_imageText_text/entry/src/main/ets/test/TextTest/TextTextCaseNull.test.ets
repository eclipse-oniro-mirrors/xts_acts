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

export default function TextTextCaseNullTest() {
  describe('TextTextCaseNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextTextCaseNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextTextCaseNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextTextCaseNullTest state pages: " + JSON.stringify(pages));
        if (!("TextTextCaseNull" == pages.name)) {
          console.info("get TextTextCaseNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextTextCaseNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextTextCaseNullTest page error: " + err);
      }
      done();
    })

    /**
     * @tc.name   textTextCase_normal_0100
     * @tc.number SUB_ARKUI_TEXT_TEXTCASE_PARAM_0100
     * @tc.desc   测试 Text 的 textCase 属性 - TextCase.Normal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textTextCase_normal_0100', Level.LEVEL0, async () => {
      console.info('[textTextCase_normal_0100] START');
      let strJson: string = getInspectorByKey('text_textcase_normal');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let textCaseValue: string = obj.$attrs.textCase as string;
      console.info('textTextCase_normal_0100 textCaseValue: ' + textCaseValue);
      expect(textCaseValue).assertEqual('TextCase.Normal');
      console.info('[textTextCase_normal_0100] END');
    });

    /**
     * @tc.name   textTextCase_uppercase_0200
     * @tc.number SUB_ARKUI_TEXT_TEXTCASE_PARAM_0200
     * @tc.desc   测试 Text 的 textCase 属性 - TextCase.UpperCase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textTextCase_uppercase_0200', Level.LEVEL0, async () => {
      console.info('[textTextCase_uppercase_0200] START');
      let strJson: string = getInspectorByKey('text_textcase_uppercase');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let textCaseValue: string = obj.$attrs.textCase as string;
      console.info('textTextCase_uppercase_0200 textCaseValue: ' + textCaseValue);
      expect(textCaseValue).assertEqual('TextCase.UpperCase');
      console.info('[textTextCase_uppercase_0200] END');
    });

    /**
     * @tc.name   textTextCase_lowercase_0300
     * @tc.number SUB_ARKUI_TEXT_TEXTCASE_PARAM_0300
     * @tc.desc   测试 Text 的 textCase 属性 - TextCase.LowerCase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textTextCase_lowercase_0300', Level.LEVEL0, async () => {
      console.info('[textTextCase_lowercase_0300] START');
      let strJson: string = getInspectorByKey('text_textcase_lowercase');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[textTextCase_lowercase_0300] obj:' + obj);
      let textCaseValue: string = obj.$attrs.textCase as string;
      console.info('textTextCase_lowercase_0300 textCaseValue: ' + textCaseValue);
      expect(textCaseValue).assertEqual('TextCase.LowerCase');
      console.info('[textTextCase_lowercase_0300] END');
    });

    /**
     * @tc.name   textTextCase_null_0400
     * @tc.number SUB_ARKUI_TEXT_TEXTCASE_PARAM_0400
     * @tc.desc   测试 Text 的 textCase 属性 - null 参数应恢复默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textTextCase_null_0400', Level.LEVEL0, async () => {
      console.info('[textTextCase_null_0400] START');
      let strJsonCompare: string = getInspectorByKey('text_textcase_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_textcase_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      // 确保属性读取成功
      expect(obj.$attrs.textCase).not().assertUndefined();
      // 断言两者最终属性值相等，判断设置 null 时是否正确触发默认值逻辑
      console.info('textTextCase_null_0400 obj: ' + obj.$attrs.textCase);
      console.info('textTextCase_null_0400 objCompare:' + objCompare.$attrs.textCase);
      expect(obj.$attrs.textCase).assertEqual(objCompare.$attrs.textCase);
      console.info('[textTextCase_null_0400] END');
    });

    /**
     * @tc.name   textTextCase_undefined_0500
     * @tc.number SUB_ARKUI_TEXT_TEXTCASE_PARAM_0500
     * @tc.desc   测试 Text 的 textCase 属性 - undefined 参数应恢复默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textTextCase_undefined_0500', Level.LEVEL0, async () => {
      console.info('[textTextCase_undefined_0500] START');
      let strJsonCompare: string = getInspectorByKey('text_textcase_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_textcase_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      // 确保属性读取成功
      expect(obj.$attrs.textCase).not().assertUndefined();
      // 断言两者最终属性值相等，判断设置 undefined 时是否正确触发默认值逻辑
      console.info('textTextCase_undefined_0500 obj: ' + obj.$attrs.textCase);
      console.info('textTextCase_undefined_0500 objCompare:' + objCompare.$attrs.textCase);
      expect(obj.$attrs.textCase).assertEqual(objCompare.$attrs.textCase);
      console.info('[textTextCase_undefined_0500] END');
    });
  });
}