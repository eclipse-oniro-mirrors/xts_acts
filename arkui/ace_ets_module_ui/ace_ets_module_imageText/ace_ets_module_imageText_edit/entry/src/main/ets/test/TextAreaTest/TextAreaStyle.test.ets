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

/**
 * TextArea Style 属性测试用例
 *
 * 测试目标: 验证TextArea组件的style属性功能
 * 测试覆盖:
 * 1. style属性设置为null时，应恢复为默认值TextContentStyle.DEFAULT
 * 2. style属性设置为undefined时，应恢复为默认值TextContentStyle.DEFAULT
 *
 * 重要说明：
 * 根据null/undefined参数测试规则，当属性设置为null或undefined时，
 * 组件会恢复为该属性的默认值（除非文档有特别说明其他行为）。
 * style属性的默认值为：TextContentStyle.DEFAULT
 */

import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';

export default function TextAreaStyleTest() {
  describe('TextAreaStyleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextAreaStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/TextAreaStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaStyleTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaStyle" == pages.name)) {
          console.info("get TextAreaStyleTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextAreaStyleTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaStyleTest page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   textAreaStyle_0100
     * @tc.number textAreaStyle_0100
     * @tc.desc   Test TextArea style property with null value - should revert to default value TextContentStyle.DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textAreaStyle_0100', Level.LEVEL0, async () => {
      console.info('[textAreaStyle_0100] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('key_textArea_style_null');
      console.info('[textAreaStyle_0100] strJson: ' + strJson);

      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let styleValue: string = obj.$attrs.style as string;

      console.info('[textAreaStyle_0100] style value: ' + styleValue);

      // 验证：当style设置为null时，应恢复为默认值TextContentStyle.DEFAULT
      expect(styleValue).assertEqual('TextContentStyle.DEFAULT');

      console.info('[textAreaStyle_0100] END');
    });

    /**
     * @tc.name   textAreaStyle_0200
     * @tc.number textAreaStyle_0200
     * @tc.desc   Test TextArea style property with undefined value - should revert to default value TextContentStyle.DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textAreaStyle_0200', Level.LEVEL0, async () => {
      console.info('[textAreaStyle_0200] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('key_textArea_style_undefined');
      console.info('[textAreaStyle_0200] strJson: ' + strJson);

      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let styleValue: string = obj.$attrs.style as string;

      console.info('[textAreaStyle_0200] style value: ' + styleValue);

      // 验证：当style设置为undefined时，应恢复为默认值TextContentStyle.DEFAULT
      expect(styleValue).assertEqual('TextContentStyle.DEFAULT');

      console.info('[textAreaStyle_0200] END');
    });
  })
}
