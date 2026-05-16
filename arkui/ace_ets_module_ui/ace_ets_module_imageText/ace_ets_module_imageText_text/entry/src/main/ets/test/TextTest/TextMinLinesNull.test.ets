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

export default function TextMinLinesNullTest() {
  describe('TextMinLinesNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextMinLinesNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextMinLinesNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextMinLinesNullTest state pages: " + JSON.stringify(pages));
        if (!("TextMinLinesNull" == pages.name)) {
          console.info("get TextMinLinesNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextMinLinesNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextMinLinesNullTest page error: " + err);
      }
      done();
    })
    
    /**
     * @tc.name   textMinLines_0100
     * @tc.number SUB_ARKUI_TEXT_MINLINES_PARAM_0100
     * @tc.desc   测试 Text minLines 属性 - null 参数应恢复默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textMinLines_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'TextMinLinesNullTest', 'textMinLines_0100 START');
      
      // 获取默认值组件的minLines属性
      let strJsonDefault: string = getInspectorByKey('text_minlines_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // 获取null参数组件的minLines属性
      let strJsonNull: string = getInspectorByKey('text_minlines_null');
      let objNull: Record<string, ESObject> = JSON.parse(strJsonNull);
      
      // 确保属性读取成功
      expect(objNull.$attrs.minLines).not().assertUndefined();
      console.info('textMinLines_0200 objDefault: ' + objDefault.$attrs.minLines);
      console.info('textMinLines_0200 objNull:' + objNull.$attrs.minLines);
      // 断言null参数时恢复为默认值
      expect(objNull.$attrs.minLines).assertEqual(objDefault.$attrs.minLines);
      expect(objNull.$attrs.minLines).assertEqual('0');
      hilog.info(0x0000, 'TextMinLinesNullTest', 'textMinLines_0100 END');
    });

    /**
     * @tc.name   textMinLines_0200
     * @tc.number SUB_ARKUI_TEXT_MINLINES_PARAM_0200
     * @tc.desc   测试 Text minLines 属性 - undefined 参数应恢复默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textMinLines_0200', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'TextMinLinesNullTest', 'textMinLines_0200 START');
      
      // 获取默认值组件的minLines属性
      let strJsonDefault: string = getInspectorByKey('text_minlines_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // 获取undefined参数组件的minLines属性
      let strJsonUndefined: string = getInspectorByKey('text_minlines_undefined');
      let objUndefined: Record<string, ESObject> = JSON.parse(strJsonUndefined);
      
      // 确保属性读取成功
      expect(objUndefined.$attrs.minLines).not().assertUndefined();
      console.info('textMinLines_0200 objDefault: ' + objDefault.$attrs.minLines);
      console.info('textMinLines_0200 objUndefined:' + objUndefined.$attrs.minLines);
      // 断言undefined参数时恢复为默认值
      expect(objUndefined.$attrs.minLines).assertEqual(objDefault.$attrs.minLines);
      expect(objUndefined.$attrs.minLines).assertEqual('0');
      hilog.info(0x0000, 'TextMinLinesNullTest', 'textMinLines_0200 END');
    });
  });
}