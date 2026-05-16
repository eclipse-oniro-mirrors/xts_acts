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

/**
 * Image PrivacySensitive 属性测试用例
 *
 * 测试目标: 验证Image组件的privacySensitive属性功能
 * 测试覆盖:
 * 1. privacySensitive(true)
 * 2. privacySensitive(false)
 * 3. null 参数测试 (应恢复为默认值)
 * 4. undefined 参数测试 (应恢复为默认值)
 *
 * 注意事项：
 * - privacySensitive属性类型为boolean，不是字符串，不需要测试空字符串''
 * - 设置是否支持卡片敏感隐私信息
 * - API 12+
 * - 效果展示需要卡片框架支持
 */

import CommonFunc from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';

export default function ImagePrivacySensitiveUndefinedAndNullTest() {
  describe('ImagePrivacySensitiveUndefinedAndNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ImagePrivacySensitiveUndefinedAndNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageUndefinedAndNull/ImagePrivacySensitiveUndefinedAndNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ImagePrivacySensitiveUndefinedAndNullTest state pages:" + JSON.stringify(pages));
        if (!("ImagePrivacySensitiveUndefinedAndNull" == pages.name)) {
          console.info("get ImagePrivacySensitiveUndefinedAndNullTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ImagePrivacySensitiveUndefinedAndNullTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImagePrivacySensitiveUndefinedAndNullTest page error:" + err);
      }
      console.info("ImagePrivacySensitiveUndefinedAndNullTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   imagePrivacySensitive_001
     * @tc.number SUB_ARKUI_IMAGE_PRIVACYSENSITIVE_NULL_001
     * @tc.desc   测试Image的privacySensitive属性 - null参数应恢复为默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('imagePrivacySensitive_001', Level.LEVEL2, async () => {
      console.info('[imagePrivacySensitive_001] START');

      // 获取false作为参考默认值（false是默认状态）
      let strJsonCompare: string = getInspectorByKey('image_privacySensitive_false');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取null参数组件的属性
      let strJson: string = getInspectorByKey('image_privacySensitive_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[imagePrivacySensitive_001] reference privacySensitive value is: " + JSON.stringify(objCompare.$attrs.privacySensitive));
      console.info("[imagePrivacySensitive_001] null privacySensitive value is: " + JSON.stringify(obj.$attrs.privacySensitive));

      // null 应该恢复为默认值 false
      expect(obj.$attrs.privacySensitive).assertEqual(objCompare.$attrs.privacySensitive);

      console.info('[imagePrivacySensitive_001] END');
    });

    /**
     * @tc.name   imagePrivacySensitive_002
     * @tc.number SUB_ARKUI_IMAGE_PRIVACYSENSITIVE_UNDEFINED_001
     * @tc.desc   测试Image的privacySensitive属性 - undefined参数应恢复为默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('imagePrivacySensitive_002', Level.LEVEL2, async () => {
      console.info('[imagePrivacySensitive_002] START');

      // 获取false作为参考默认值（false是默认状态）
      let strJsonCompare: string = getInspectorByKey('image_privacySensitive_false');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('image_privacySensitive_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[imagePrivacySensitive_002] reference privacySensitive value is: " + JSON.stringify(objCompare.$attrs.privacySensitive));
      console.info("[imagePrivacySensitive_002] undefined privacySensitive value is: " + JSON.stringify(obj.$attrs.privacySensitive));

      // undefined 应该恢复为默认值 false
      expect(obj.$attrs.privacySensitive).assertEqual(objCompare.$attrs.privacySensitive);

      console.info('[imagePrivacySensitive_002] END');
    });
  })
}
