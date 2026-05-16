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
 * Image SyncLoad 属性测试用例
 *
 * 测试目标: 验证Image组件的syncLoad属性功能
 * 测试覆盖:
 * 1. syncLoad(true) - 同步加载
 * 2. syncLoad(false) - 异步加载（默认值）
 * 3. null 参数测试 (应恢复为默认值)
 * 4. undefined 参数测试 (应恢复为默认值)
 *
 * 注意事项：
 * - syncLoad属性类型为boolean，不是字符串，不需要测试空字符串''
 * - 设置是否同步加载图片
 * - 默认值为 false（异步加载）
 * - API 8+
 * - 同步加载时阻塞UI线程，不会显示占位图
 */

import CommonFunc from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';

export default function ImageSyncLoadUndefinedAndNullTest() {
  describe('ImageSyncLoadUndefinedAndNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ImageSyncLoadUndefinedAndNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageUndefinedAndNull/ImageSyncLoadUndefinedAndNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ImageSyncLoadUndefinedAndNullTest state pages:" + JSON.stringify(pages));
        if (!("ImageSyncLoadUndefinedAndNull" == pages.name)) {
          console.info("get ImageSyncLoadUndefinedAndNullTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ImageSyncLoadUndefinedAndNullTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageSyncLoadUndefinedAndNullTest page error:" + err);
      }
      console.info("ImageSyncLoadUndefinedAndNullTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   imageSyncLoad_001
     * @tc.number SUB_ARKUI_IMAGE_SYNCLOAD_NULL_001
     * @tc.desc   测试Image的syncLoad属性 - null参数应恢复为默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('imageSyncLoad_001', Level.LEVEL2, async () => {
      console.info('[imageSyncLoad_001] START');

      // 获取false作为参考默认值（false是默认值）
      let strJsonCompare: string = getInspectorByKey('image_syncLoad_false');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取null参数组件的属性
      let strJson: string = getInspectorByKey('image_syncLoad_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[imageSyncLoad_001] reference syncLoad value is: " + JSON.stringify(objCompare.$attrs.syncLoad));
      console.info("[imageSyncLoad_001] null syncLoad value is: " + JSON.stringify(obj.$attrs.syncLoad));

      // null 应该恢复为默认值 false
      expect(obj.$attrs.syncLoad).assertEqual(objCompare.$attrs.syncLoad);

      console.info('[imageSyncLoad_001] END');
    });

    /**
     * @tc.name   imageSyncLoad_002
     * @tc.number SUB_ARKUI_IMAGE_SYNCLOAD_UNDEFINED_001
     * @tc.desc   测试Image的syncLoad属性 - undefined参数应恢复为默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('imageSyncLoad_002', Level.LEVEL2, async () => {
      console.info('[imageSyncLoad_002] START');

      // 获取false作为参考默认值（false是默认值）
      let strJsonCompare: string = getInspectorByKey('image_syncLoad_false');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('image_syncLoad_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[imageSyncLoad_002] reference syncLoad value is: " + JSON.stringify(objCompare.$attrs.syncLoad));
      console.info("[imageSyncLoad_002] undefined syncLoad value is: " + JSON.stringify(obj.$attrs.syncLoad));

      // undefined 应该恢复为默认值 false
      expect(obj.$attrs.syncLoad).assertEqual(objCompare.$attrs.syncLoad);

      console.info('[imageSyncLoad_002] END');
    });
  })
}
