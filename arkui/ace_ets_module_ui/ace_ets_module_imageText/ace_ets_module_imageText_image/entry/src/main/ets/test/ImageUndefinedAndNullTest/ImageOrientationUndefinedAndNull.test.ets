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
 * Image Orientation 属性测试用例
 *
 * 测试目标: 验证Image组件的orientation属性功能
 * 测试覆盖:
 * 1. ImageRotateOrientation.UP (默认值)
 * 2. ImageRotateOrientation.AUTO
 * 3. ImageRotateOrientation.RIGHT
 * 4. ImageRotateOrientation.DOWN
 * 5. ImageRotateOrientation.LEFT
 * 6. ImageRotateOrientation.UP_MIRRORED
 * 7. ImageRotateOrientation.RIGHT_MIRRORED
 * 8. ImageRotateOrientation.DOWN_MIRRORED
 * 9. ImageRotateOrientation.LEFT_MIRRORED
 * 10. null 参数测试 (应变为ImageRotateOrientation.AUTO)
 * 11. undefined 参数测试 (应变为ImageRotateOrientation.AUTO)
 *
 * 注意事项：
 * - orientation属性类型为ImageRotateOrientation枚举，不是字符串，不需要测试空字符串''
 * - 默认值为 ImageRotateOrientation.UP
 * - 根据文档说明：设置为undefined或null时，取值为ImageRotateOrientation.AUTO
 */

import CommonFunc from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';

export default function ImageOrientationUndefinedAndNullTest() {
  describe('ImageOrientationUndefinedAndNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ImageOrientationUndefinedAndNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageUndefinedAndNull/ImageOrientationUndefinedAndNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ImageOrientationUndefinedAndNullTest state pages:" + JSON.stringify(pages));
        if (!("ImageOrientationUndefinedAndNull" == pages.name)) {
          console.info("get ImageOrientationUndefinedAndNullTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ImageOrientationUndefinedAndNullTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageOrientationUndefinedAndNullTest page error:" + err);
      }
      console.info("ImageOrientationUndefinedAndNullTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   imageOrientation_001
     * @tc.number SUB_ARKUI_IMAGE_ORIENTATION_NULL_001
     * @tc.desc   测试Image的orientation属性 - null参数应变为ImageRotateOrientation.AUTO
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('imageOrientation_001', Level.LEVEL2, async () => {
      console.info('[imageOrientation_001] START');

      // 获取AUTO组件的属性作为参照
      let strJsonCompare: string = getInspectorByKey('image_orientation_auto');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取null参数组件的属性
      let strJson: string = getInspectorByKey('image_orientation_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[imageOrientation_001] AUTO orientation value is: " + JSON.stringify(objCompare.$attrs.orientation));
      console.info("[imageOrientation_001] null orientation value is: " + JSON.stringify(obj.$attrs.orientation));

      // 根据文档说明：设置为null时，取值为ImageRotateOrientation.AUTO
      expect(obj.$attrs.orientation).assertEqual(objCompare.$attrs.orientation);

      console.info('[imageOrientation_001] END');
    });

    /**
     * @tc.name   imageOrientation_002
     * @tc.number SUB_ARKUI_IMAGE_ORIENTATION_UNDEFINED_001
     * @tc.desc   测试Image的orientation属性 - undefined参数应变为ImageRotateOrientation.AUTO
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('imageOrientation_002', Level.LEVEL2, async () => {
      console.info('[imageOrientation_002] START');

      // 获取AUTO组件的属性作为参照
      let strJsonCompare: string = getInspectorByKey('image_orientation_auto');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('image_orientation_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[imageOrientation_002] AUTO orientation value is: " + JSON.stringify(objCompare.$attrs.orientation));
      console.info("[imageOrientation_002] undefined orientation value is: " + JSON.stringify(obj.$attrs.orientation));

      // 根据文档说明：设置为undefined时，取值为ImageRotateOrientation.AUTO
      expect(obj.$attrs.orientation).assertEqual(objCompare.$attrs.orientation);

      console.info('[imageOrientation_002] END');
    });
  })
}
