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
 * Image ObjectRepeat 属性测试用例
 *
 * 测试目标: 验证Image组件的objectRepeat属性功能
 * 测试覆盖:
 * 1. ImageRepeat.NoRepeat (默认值)
 * 2. ImageRepeat.X
 * 3. ImageRepeat.Y
 * 4. ImageRepeat.XY
 * 5. null 参数测试 (应恢复为默认值)
 * 6. undefined 参数测试 (应恢复为默认值)
 *
 * 注意事项：
 * - objectRepeat属性类型为ImageRepeat枚举，不是字符串，不需要测试空字符串''
 * - 默认值为 ImageRepeat.NoRepeat
 * - SVG类型图源不支持该属性
 */

import CommonFunc from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';

export default function ImageObjectRepeatUndefinedAndNullTest() {
  describe('ImageObjectRepeatUndefinedAndNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ImageObjectRepeatUndefinedAndNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageUndefinedAndNull/ImageObjectRepeatUndefinedAndNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ImageObjectRepeatUndefinedAndNullTest state pages:" + JSON.stringify(pages));
        if (!("ImageObjectRepeatUndefinedAndNull" == pages.name)) {
          console.info("get ImageObjectRepeatUndefinedAndNullTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ImageObjectRepeatUndefinedAndNullTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageObjectRepeatUndefinedAndNullTest page error:" + err);
      }
      console.info("ImageObjectRepeatUndefinedAndNullTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   imageObjectRepeat_001
     * @tc.number SUB_ARKUI_IMAGE_OBJECTREPEAT_NULL_001
     * @tc.desc   测试Image的objectRepeat属性 - null参数应恢复为默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('imageObjectRepeat_001', Level.LEVEL2, async () => {
      console.info('[imageObjectRepeat_001] START');

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('image_objectRepeat_noRepeat');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取null参数组件的属性
      let strJson: string = getInspectorByKey('image_objectRepeat_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[imageObjectRepeat_001] default objectRepeat value is: " + JSON.stringify(objCompare.$attrs.objectRepeat));
      console.info("[imageObjectRepeat_001] null objectRepeat value is: " + JSON.stringify(obj.$attrs.objectRepeat));

      // null 应该恢复为默认值 ImageRepeat.NoRepeat
      expect(obj.$attrs.objectRepeat).assertEqual(objCompare.$attrs.objectRepeat);

      console.info('[imageObjectRepeat_001] END');
    });

    /**
     * @tc.name   imageObjectRepeat_002
     * @tc.number SUB_ARKUI_IMAGE_OBJECTREPEAT_UNDEFINED_001
     * @tc.desc   测试Image的objectRepeat属性 - undefined参数应恢复为默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('imageObjectRepeat_002', Level.LEVEL2, async () => {
      console.info('[imageObjectRepeat_002] START');

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('image_objectRepeat_noRepeat');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('image_objectRepeat_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[imageObjectRepeat_002] default objectRepeat value is: " + JSON.stringify(objCompare.$attrs.objectRepeat));
      console.info("[imageObjectRepeat_002] undefined objectRepeat value is: " + JSON.stringify(obj.$attrs.objectRepeat));

      // undefined 应该恢复为默认值 ImageRepeat.NoRepeat
      expect(obj.$attrs.objectRepeat).assertEqual(objCompare.$attrs.objectRepeat);

      console.info('[imageObjectRepeat_002] END');
    });
  })
}
