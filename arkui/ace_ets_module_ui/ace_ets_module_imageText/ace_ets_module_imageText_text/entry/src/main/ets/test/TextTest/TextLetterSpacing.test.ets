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
import { hilog } from '@kit.PerformanceAnalysisKit';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';

export default function TextLetterSpacingTest() {
  describe('TextLetterSpacingTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextLetterSpacingTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextLetterSpacing',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextLetterSpacingTest state pages: " + JSON.stringify(pages));
        if (!("TextLetterSpacing" == pages.name)) {
          console.info("get TextLetterSpacingTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextLetterSpacingTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextLetterSpacingTest page error: " + err);
      }
      done();
    })

    /**
     * @tc.name   textLetterSpacing_0100
     * @tc.number SUB_ARKUI_TEXT_LETTERSPACING_PARAM_0100
     * @tc.desc   测试 Text letterSpacing 属性 - null 参数应恢复默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textLetterSpacing_0100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'TextLetterSpacingTest', 'textLetterSpacing_0100 START');
      
      // 获取默认值组件的letterSpacing属性
      let strJsonDefault: string = getInspectorByKey('text_letterspacing_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // 获取null参数组件的letterSpacing属性
      let strJsonNull: string = getInspectorByKey('text_letterspacing_null');
      let objNull: Record<string, ESObject> = JSON.parse(strJsonNull);
      
      // 确保属性读取成功
      expect(objNull.$attrs.letterSpacing).not().assertUndefined();
      console.info('textLetterSpacing_0100 objDefault: ' + objDefault.$attrs.letterSpacing);
      console.info('textLetterSpacing_0100 objNull:' + objNull.$attrs.letterSpacing);
      // 断言null参数时恢复为默认值
      expect(objNull.$attrs.letterSpacing).assertEqual(objDefault.$attrs.letterSpacing);
      expect(objNull.$attrs.letterSpacing).assertEqual('0.00px');
      hilog.info(0x0000, 'TextLetterSpacingTest', 'textLetterSpacing_0100 END');
    });

    /**
     * @tc.name   textLetterSpacing_0200
     * @tc.number SUB_ARKUI_TEXT_LETTERSPACING_PARAM_0200
     * @tc.desc   测试 Text letterSpacing 属性 - undefined 参数应恢复默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textLetterSpacing_0200', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'TextLetterSpacingTest', 'textLetterSpacing_0200 START');
      
      // 获取默认值组件的letterSpacing属性
      let strJsonDefault: string = getInspectorByKey('text_letterspacing_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // 获取undefined参数组件的letterSpacing属性
      let strJsonUndefined: string = getInspectorByKey('text_letterspacing_undefined');
      let objUndefined: Record<string, ESObject> = JSON.parse(strJsonUndefined);
      
      // 确保属性读取成功
      expect(objUndefined.$attrs.letterSpacing).not().assertUndefined();
      console.info('textLetterSpacing_0200 objDefault: ' + objDefault.$attrs.letterSpacing);
      console.info('textLetterSpacing_0200 objUndefined:' + objUndefined.$attrs.letterSpacing);
      // 断言undefined参数时恢复为默认值
      expect(objUndefined.$attrs.letterSpacing).assertEqual(objDefault.$attrs.letterSpacing);
      expect(objUndefined.$attrs.letterSpacing).assertEqual('0.00px');
      hilog.info(0x0000, 'TextLetterSpacingTest', 'textLetterSpacing_0200 END');
    });

    /**
     * @tc.name   textLetterSpacing_0300
     * @tc.number SUB_ARKUI_TEXT_LETTERSPACING_PARAM_0300
     * @tc.desc   测试 Text letterSpacing 属性 - 空字符串参数应恢复默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textLetterSpacing_0300', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'TextLetterSpacingTest', 'textLetterSpacing_0300 START');
      
      // 获取默认值组件的letterSpacing属性
      let strJsonDefault: string = getInspectorByKey('text_letterspacing_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // 获取空字符串参数组件的letterSpacing属性
      let strJsonEmpty: string = getInspectorByKey('text_letterspacing_empty');
      let objEmpty: Record<string, ESObject> = JSON.parse(strJsonEmpty);
      
      // 确保属性读取成功
      expect(objEmpty.$attrs.letterSpacing).not().assertUndefined();
      console.info('textLetterSpacing_0300 objDefault: ' + objDefault.$attrs.letterSpacing);
      console.info('textLetterSpacing_0300 objNull:' + objEmpty.$attrs.letterSpacing);
      // 断言空字符串参数时恢复为默认值
      expect(objEmpty.$attrs.letterSpacing).assertEqual(objDefault.$attrs.letterSpacing);
      expect(objEmpty.$attrs.letterSpacing).assertEqual('0.00px');
      hilog.info(0x0000, 'TextLetterSpacingTest', 'textLetterSpacing_0300 END');
    });
  });
}