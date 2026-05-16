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
 * Image DynamicRangeMode 属性测试用例
 *
 * 测试目标: 验证Image组件的dynamicRangeMode属性功能
 * 测试覆盖:
 * 1. DynamicRangeMode.HIGH - 不受限动态范围，最大限度进行图片提亮
 * 2. DynamicRangeMode.CONSTRAINT - 受限动态范围，受限进行图片提亮
 * 3. DynamicRangeMode.STANDARD - 标准动态范围，不进行图片提亮（默认值）
 * 4. null 参数测试 (应恢复为默认值)
 * 5. undefined 参数测试 (应恢复为默认值)
 *
 * 注意事项：
 * - dynamicRangeMode属性类型为DynamicRangeMode枚举，不是字符串，不需要测试空字符串''
 * - 默认值为 DynamicRangeMode.STANDARD
 * - SVG类型图源不支持该属性
 * - 该属性与hdrBrightness属性同时设置时，dynamicRangeMode属性不生效
 * - 设备行为差异：该接口在手机、PC/2in1和Tablet设备中可正常生效，在其他设备类型中无效果
 */

import CommonFunc from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';

export default function ImageDynamicRangeModeUndefinedAndNullTest() {
  describe('ImageDynamicRangeModeUndefinedAndNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ImageDynamicRangeModeUndefinedAndNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageUndefinedAndNull/ImageDynamicRangeModeUndefinedAndNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ImageDynamicRangeModeUndefinedAndNullTest state pages:" + JSON.stringify(pages));
        if (!("ImageDynamicRangeModeUndefinedAndNull" == pages.name)) {
          console.info("get ImageDynamicRangeModeUndefinedAndNullTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ImageDynamicRangeModeUndefinedAndNullTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageDynamicRangeModeUndefinedAndNullTest page error:" + err);
      }
      console.info("ImageDynamicRangeModeUndefinedAndNullTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   imageDynamicRangeMode_001
     * @tc.number SUB_ARKUI_IMAGE_DYNAMICRANGEMODE_NULL_001
     * @tc.desc   测试Image的dynamicRangeMode属性 - null参数应恢复为默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('imageDynamicRangeMode_001', Level.LEVEL2, async () => {
      console.info('[imageDynamicRangeMode_001] START');

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('image_dynamicRangeMode_standard');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取null参数组件的属性
      let strJson: string = getInspectorByKey('image_dynamicRangeMode_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[imageDynamicRangeMode_001] default dynamicRangeMode value is: " + JSON.stringify(objCompare.$attrs.dynamicRangeMode));
      console.info("[imageDynamicRangeMode_001] null dynamicRangeMode value is: " + JSON.stringify(obj.$attrs.dynamicRangeMode));

      // null 应该恢复为默认值 DynamicRangeMode.STANDARD
      expect(obj.$attrs.dynamicRangeMode).assertEqual(objCompare.$attrs.dynamicRangeMode);

      console.info('[imageDynamicRangeMode_001] END');
    });

    /**
     * @tc.name   imageDynamicRangeMode_002
     * @tc.number SUB_ARKUI_IMAGE_DYNAMICRANGEMODE_UNDEFINED_001
     * @tc.desc   测试Image的dynamicRangeMode属性 - undefined参数应恢复为默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('imageDynamicRangeMode_002', Level.LEVEL2, async () => {
      console.info('[imageDynamicRangeMode_002] START');

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('image_dynamicRangeMode_standard');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('image_dynamicRangeMode_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[imageDynamicRangeMode_002] default dynamicRangeMode value is: " + JSON.stringify(objCompare.$attrs.dynamicRangeMode));
      console.info("[imageDynamicRangeMode_002] undefined dynamicRangeMode value is: " + JSON.stringify(obj.$attrs.dynamicRangeMode));

      // undefined 应该恢复为默认值 DynamicRangeMode.STANDARD
      expect(obj.$attrs.dynamicRangeMode).assertEqual(objCompare.$attrs.dynamicRangeMode);

      console.info('[imageDynamicRangeMode_002] END');
    });
  })
}
