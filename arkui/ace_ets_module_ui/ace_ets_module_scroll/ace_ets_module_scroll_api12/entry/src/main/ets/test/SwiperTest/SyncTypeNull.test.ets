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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { SwiperDynamicSyncScene } from '@ohos.arkui.UIContext'

export default function SyncTypeNull() {
  describe('SyncTypeNull', () => {
    beforeEach(async (done: Function) => {
      console.info("SyncTypeNull beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/SyncTypeNull",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SyncTypeNull state pages:" + JSON.stringify(pages));
        if (!("SyncTypeNull" == pages.name)) {
          console.info("get SyncTypeNull pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SyncTypeNull page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SyncTypeNull page error:" + err);
      }
      console.info("SyncTypeNull beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SyncTypeNull after each called");
    });

    /**
     * @tc.number    SyncTypeNull_001
     * @tc.name      SyncTypeNull_0100
     * @tc.desc      Set SwinperDynamicSyncSceneType null.
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('SyncTypeNull_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[SyncTypeNull_0100] START');
      await CommonFunc.sleep(1000);
      console.info("[SyncTypeNull_0100] requireDynamicSyncScene: " + AppStorage.get('requireDynamicSyncScene'));
      let result: SwiperDynamicSyncScene[] | undefined = AppStorage.get('requireDynamicSyncScene')
      expect(result && result.length == 0).assertTrue();
      AppStorage.delete('requireDynamicSyncScene')
      console.info('[SyncTypeNull_0100] END');
      done();
    });
  })
}
