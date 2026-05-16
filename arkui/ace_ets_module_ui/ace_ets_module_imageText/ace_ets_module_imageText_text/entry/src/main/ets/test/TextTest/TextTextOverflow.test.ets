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

export default function TextTextOverflowTest() {
  describe('TextTextOverflowTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextTextOverflowTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextTextOverflow',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextTextOverflowTest state pages: " + JSON.stringify(pages));
        if (!("TextTextOverflow" == pages.name)) {
          console.info("get TextTextOverflowTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextTextOverflowTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextTextOverflowTest page error: " + err);
      }
      done();
    })

    /**
     * @tc.name   textTextOverflow_0100
     * @tc.number SUB_ARKUI_TEXT_TEXTOVERFLOW_PARAM_0100
     * @tc.desc   测试 Text textOverflow 属性 - null 参数应恢复默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textTextOverflow_0100', Level.LEVEL0, async () => {
      console.info('TextTextOverflowTest', 'textTextOverflow_0100 START');
      
      // 获取默认值组件的textOverflow属性
      let strJsonDefault: string = getInspectorByKey('text_textoverflow_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // 获取null参数组件的textOverflow属性
      let strJsonNull: string = getInspectorByKey('text_textoverflow_null');
      let objNull: Record<string, ESObject> = JSON.parse(strJsonNull);
      
      // 确保属性读取成功
      expect(objNull.$attrs.textOverflow).not().assertUndefined();
      console.info('textTextOverflow_0200 objDefault: ' + objDefault.$attrs.textOverflow);
      console.info('textTextOverflow_0200 objNull:' + objNull.$attrs.textOverflow);
      // 断言null参数时恢复为默认值
      expect(objNull.$attrs.textOverflow).assertEqual(objDefault.$attrs.textOverflow);
      expect(objNull.$attrs.textOverflow).assertEqual('TextOverflow.Clip');
      console.info('TextTextOverflowTest', 'textTextOverflow_0100 END');
    });

    /**
     * @tc.name   textTextOverflow_0200
     * @tc.number SUB_ARKUI_TEXT_TEXTOVERFLOW_PARAM_0200
     * @tc.desc   测试 Text textOverflow 属性 - undefined 参数应恢复默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textTextOverflow_0200', Level.LEVEL0, async () => {
      console.info('TextTextOverflowTest', 'textTextOverflow_0200 START');
      
      // 获取默认值组件的textOverflow属性
      let strJsonDefault: string = getInspectorByKey('text_textoverflow_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      
      // 获取undefined参数组件的textOverflow属性
      let strJsonUndefined: string = getInspectorByKey('text_textoverflow_undefined');
      let objUndefined: Record<string, ESObject> = JSON.parse(strJsonUndefined);
      
      // 确保属性读取成功
      expect(objUndefined.$attrs.textOverflow).not().assertUndefined();
      console.info('textTextOverflow_0200 objDefault: ' + objDefault.$attrs.textOverflow);
      console.info('textTextOverflow_0200 objNull:' + objUndefined.$attrs.textOverflow);
      // 断言undefined参数时恢复为默认值
      expect(objUndefined.$attrs.textOverflow).assertEqual(objDefault.$attrs.textOverflow);
      expect(objUndefined.$attrs.textOverflow).assertEqual('TextOverflow.Clip');
      console.info('TextTextOverflowTest', 'textTextOverflow_0200 END');
    });
  });
}