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

export default function TextFontFamilyTest() {
  describe('TextFontFamilyTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextFontFamilyTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextFontFamily',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextFontFamilyTest state pages: " + JSON.stringify(pages));
        if (!("TextFontFamily" == pages.name)) {
          console.info("get TextFontFamilyTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextFontFamilyTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextFontFamilyTest page error: " + err);
      }
      done();
    })
    
    /**
     * @tc.name   textFontFamily_0100
     * @tc.number SUB_ARKUI_TEXT_FONTFAMILY_PARAM_0100
     * @tc.desc   测试 Text fontFamily 属性 - null 参数应恢复默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textFontFamily_0100', Level.LEVEL0, async () => {
      console.info('TextFontFamilyTest', 'textFontFamily_0100 START');
      
      // 获取默认值组件的fontFamily属性
      let strJsonDefault: string = getInspectorByKey('text_fontfamily_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // 获取null参数组件的fontFamily属性
      let strJsonNull: string = getInspectorByKey('text_fontfamily_null');
      let objNull: Record<string, ESObject> = JSON.parse(strJsonNull);
      
      // 确保属性读取成功
      expect(objNull.$attrs.fontFamily).not().assertUndefined();
      console.info('textFontFamily_0100 objDefault: ' + objDefault.$attrs.fontFamily);
      console.info('textFontFamily_0100 objNull:' + objNull.$attrs.fontFamily);
      // 断言null参数时恢复为默认值
      expect(objNull.$attrs.fontFamily).assertEqual(objDefault.$attrs.fontFamily);
      expect(objNull.$attrs.fontFamily).assertEqual('HarmonyOS Sans');
      console.info('TextFontFamilyTest', 'textFontFamily_0100 END');
    });

    /**
     * @tc.name   textFontFamily_0200
     * @tc.number SUB_ARKUI_TEXT_FONTFAMILY_PARAM_0200
     * @tc.desc   测试 Text fontFamily 属性 - undefined 参数应恢复默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textFontFamily_0200', Level.LEVEL0, async () => {
      console.info('TextFontFamilyTest', 'textFontFamily_0200 START');
      
      // 获取默认值组件的fontFamily属性
      let strJsonDefault: string = getInspectorByKey('text_fontfamily_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // 获取undefined参数组件的fontFamily属性
      let strJsonUndefined: string = getInspectorByKey('text_fontfamily_undefined');
      let objUndefined: Record<string, ESObject> = JSON.parse(strJsonUndefined);
      
      // 确保属性读取成功
      expect(objUndefined.$attrs.fontFamily).not().assertUndefined();
      console.info('textFontFamily_0100 objDefault: ' + objDefault.$attrs.fontFamily);
      console.info('textFontFamily_0100 objUndefined:' + objUndefined.$attrs.fontFamily);
      // 断言undefined参数时恢复为默认值
      expect(objUndefined.$attrs.fontFamily).assertEqual(objDefault.$attrs.fontFamily);
      expect(objUndefined.$attrs.fontFamily).assertEqual('HarmonyOS Sans');
      console.info('TextFontFamilyTest', 'textFontFamily_0200 END');
    });

    /**
     * @tc.name   textFontFamily_0300
     * @tc.number SUB_ARKUI_TEXT_FONTFAMILY_PARAM_0300
     * @tc.desc   测试 Text fontFamily 属性 - 空字符串参数应恢复默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textFontFamily_0300', Level.LEVEL0, async () => {
      console.info('TextFontFamilyTest', 'textFontFamily_0300 START');
      
      // 获取默认值组件的fontFamily属性
      let strJsonDefault: string = getInspectorByKey('text_fontfamily_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // 获取空字符串参数组件的fontFamily属性
      let strJsonEmpty: string = getInspectorByKey('text_fontfamily_empty');
      let objEmpty: Record<string, ESObject> = JSON.parse(strJsonEmpty);
      
      // 确保属性读取成功
      expect(objEmpty.$attrs.fontFamily).not().assertUndefined();
      console.info('textFontFamily_0100 objDefault: ' + objDefault.$attrs.fontFamily);
      console.info('textFontFamily_0100 objEmpty:' + objEmpty.$attrs.fontFamily);
      // 断言空字符串参数时恢复为默认值
      expect(objEmpty.$attrs.fontFamily).assertEqual(objDefault.$attrs.fontFamily);
      expect(objEmpty.$attrs.fontFamily).assertEqual('HarmonyOS Sans');
      console.info('TextFontFamilyTest', 'textFontFamily_0300 END');
    });
  });
}