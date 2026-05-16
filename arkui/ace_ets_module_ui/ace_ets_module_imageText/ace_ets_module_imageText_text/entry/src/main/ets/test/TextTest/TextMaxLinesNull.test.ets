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

export default function TextMaxLinesNullTest() {
  describe('TextMaxLinesNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextMaxLinesNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextMaxLinesNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextMaxLinesNullTest state pages: " + JSON.stringify(pages));
        if (!("TextMaxLinesNull" == pages.name)) {
          console.info("get TextMaxLinesNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextMaxLinesNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextMaxLinesNullTest page error: " + err);
      }
      done();
    })
    
    /**
     * @tc.name   textMaxLines_0100
     * @tc.number SUB_ARKUI_TEXT_MAXLINES_PARAM_0100
     * @tc.desc   测试 Text maxLines 属性 - null 参数应恢复默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textMaxLines_0100', Level.LEVEL2, async () => {
      console.info('TextMaxLinesNullTest', 'textMaxLines_0100 START');
      
      // 获取默认值组件的maxLines属性
      let strJsonDefault: string = getInspectorByKey('text_maxlines_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // 获取null参数组件的maxLines属性
      let strJsonNull: string = getInspectorByKey('text_maxlines_null');
      let objNull: Record<string, ESObject> = JSON.parse(strJsonNull);
      
      // 确保属性读取成功
      expect(objNull.$attrs.maxLines).not().assertUndefined();
      console.info('textMaxLines_0100 objDefault: ' + objDefault.$attrs.maxLines);
      console.info('textMaxLines_0100 objNull:' + objNull.$attrs.maxLines);
      // 断言null参数时恢复为默认值
      expect(objNull.$attrs.maxLines).assertLarger(0);
      
      console.info('TextMaxLinesNullTest', 'textMaxLines_0100 END');
    });

    /**
     * @tc.name   textMaxLines_0200
     * @tc.number SUB_ARKUI_TEXT_MAXLINES_PARAM_0200
     * @tc.desc   测试 Text maxLines 属性 - undefined 参数应恢复默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textMaxLines_0200', Level.LEVEL2, async () => {
      console.info('TextMaxLinesNullTest', 'textMaxLines_0200 START');
      
      // 获取默认值组件的maxLines属性
      let strJsonDefault: string = getInspectorByKey('text_maxlines_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // 获取undefined参数组件的maxLines属性
      let strJsonUndefined: string = getInspectorByKey('text_maxlines_undefined');
      let objUndefined: Record<string, ESObject> = JSON.parse(strJsonUndefined);
      
      // 确保属性读取成功
      expect(objUndefined.$attrs.maxLines).not().assertUndefined();
      
      // 断言undefined参数时恢复为默认值  expect 1000000 equals 4294967295
      expect(objUndefined.$attrs.maxLines).assertLarger(0);
      
      console.info('TextMaxLinesNullTest', 'textMaxLines_0200 END');
    });
  });
}