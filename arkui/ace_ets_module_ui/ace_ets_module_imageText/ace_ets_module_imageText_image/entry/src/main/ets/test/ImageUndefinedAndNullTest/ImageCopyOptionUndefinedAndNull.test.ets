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
 * Image CopyOption 属性测试用例
 *
 * 测试目标: 验证Image组件的copyOption属性功能
 * 测试覆盖:
 * 1. CopyOptions.InApp - 仅应用内可复制
 * 2. CopyOptions.LocalDevice - 设备内可复制
 * 3. CopyOptions.None - 不可复制（默认值）
 * 4. null 参数测试 (应恢复为默认值)
 * 5. undefined 参数测试 (应恢复为默认值)
 *
 * 注意事项：
 * - copyOption属性类型为CopyOptions枚举，不是字符串，不需要测试空字符串''
 * - 默认值为 CopyOptions.None
 * - SVG图片不支持复制
 * - 当组件的参数类型为AnimatedDrawableDescriptor时设置该属性不生效
 * - 设置为非CopyOptions.None时，支持使用长按、鼠标右击、快捷组合键'CTRL+C'等方式进行复制
 */

import CommonFunc from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';

export default function ImageCopyOptionUndefinedAndNullTest() {
  describe('ImageCopyOptionUndefinedAndNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ImageCopyOptionUndefinedAndNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageUndefinedAndNull/ImageCopyOptionUndefinedAndNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ImageCopyOptionUndefinedAndNullTest state pages:" + JSON.stringify(pages));
        if (!("ImageCopyOptionUndefinedAndNull" == pages.name)) {
          console.info("get ImageCopyOptionUndefinedAndNullTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ImageCopyOptionUndefinedAndNullTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageCopyOptionUndefinedAndNullTest page error:" + err);
      }
      console.info("ImageCopyOptionUndefinedAndNullTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });


    /**
     * @tc.name   imageCopyOption_001
     * @tc.number SUB_ARKUI_IMAGE_COPYOPTION_NULL_001
     * @tc.desc   测试Image的copyOption属性 - null参数应恢复为默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('imageCopyOption_001', Level.LEVEL0, async () => {
      console.info('[imageCopyOption_001] START');

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('image_copyOption_none');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取null参数组件的属性
      let strJson: string = getInspectorByKey('image_copyOption_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[imageCopyOption_001] default copyOption value is: " + JSON.stringify(objCompare.$attrs.copyOption));
      console.info("[imageCopyOption_001] null copyOption value is: " + JSON.stringify(obj.$attrs.copyOption));

      // null 应该恢复为默认值 CopyOptions.None
      expect(obj.$attrs.copyOption).assertEqual(objCompare.$attrs.copyOption);

      console.info('[imageCopyOption_001] END');
    });

    /**
     * @tc.name   imageCopyOption_002
     * @tc.number SUB_ARKUI_IMAGE_COPYOPTION_UNDEFINED_001
     * @tc.desc   测试Image的copyOption属性 - undefined参数应恢复为默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('imageCopyOption_002', Level.LEVEL0, async () => {
      console.info('[imageCopyOption_002] START');

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('image_copyOption_none');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('image_copyOption_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[imageCopyOption_002] default copyOption value is: " + JSON.stringify(objCompare.$attrs.copyOption));
      console.info("[imageCopyOption_002] undefined copyOption value is: " + JSON.stringify(obj.$attrs.copyOption));

      // undefined 应该恢复为默认值 CopyOptions.None
      expect(obj.$attrs.copyOption).assertEqual(objCompare.$attrs.copyOption);

      console.info('[imageCopyOption_002] END');
    });
  })
}
