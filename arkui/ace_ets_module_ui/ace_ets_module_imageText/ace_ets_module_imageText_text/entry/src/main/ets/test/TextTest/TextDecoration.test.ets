/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export default function TextDecorationTest() {
  describe('TextDecorationTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextDecorationTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextDecorationNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextDecorationTest state pages: " + JSON.stringify(pages));
        if (!("TextDecorationNull" == pages.name)) {
          console.info("get TextDecorationTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextDecorationTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextDecorationTest page error: " + err);
      }
      done();
    })

    /**
     * @tc.name   textDecoration_0100
     * @tc.number SUB_ARKUI_TEXT_DECORATION_PARAM_0100
     * @tc.desc   测试 Text decoration 属性 - null 参数应恢复默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textDecoration_0100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'TextDecorationTest', 'textDecoration_0100 START');
      
      // 获取默认值组件的decoration属性
      let strJsonDefault: string = getInspectorByKey('text_decoration_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // 获取null参数组件的decoration属性
      let strJsonNull: string = getInspectorByKey('text_decoration_null');
      let objNull: Record<string, ESObject> = JSON.parse(strJsonNull);
      
      // 确保属性读取成功
      expect(objNull.$attrs.decoration).not().assertUndefined();
      console.info('textDecoration_0100 objDefault: ' + objDefault.$attrs.decoration);
      console.info('textDecoration_0100 objNull:' + objNull.$attrs.decoration);
      // 断言null参数时恢复为默认值
      expect(objNull.$attrs.decoration).assertEqual(objDefault.$attrs.decoration);
      
      hilog.info(0x0000, 'TextDecorationTest', 'textDecoration_0100 END');
    });

    /**
     * @tc.name   textDecoration_0200
     * @tc.number SUB_ARKUI_TEXT_DECORATION_PARAM_0200
     * @tc.desc   测试 Text decoration 属性 - undefined 参数应恢复默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textDecoration_0200', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'TextDecorationTest', 'textDecoration_0200 START');
      
      // 获取默认值组件的decoration属性
      let strJsonDefault: string = getInspectorByKey('text_decoration_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // 获取undefined参数组件的decoration属性
      let strJsonUndefined: string = getInspectorByKey('text_decoration_undefined');
      let objUndefined: Record<string, ESObject> = JSON.parse(strJsonUndefined);
      
      // 确保属性读取成功
      expect(objUndefined.$attrs.decoration).not().assertUndefined();
      console.info('textDecoration_0200 objDefault: ' + objDefault.$attrs.decoration);
      console.info('textDecoration_0200 objUndefined:' + objUndefined.$attrs.decoration);
      // 断言undefined参数时恢复为默认值
      expect(objUndefined.$attrs.decoration).assertEqual(objDefault.$attrs.decoration);
      
      hilog.info(0x0000, 'TextDecorationTest', 'textDecoration_0200 END');
    });
  });
}