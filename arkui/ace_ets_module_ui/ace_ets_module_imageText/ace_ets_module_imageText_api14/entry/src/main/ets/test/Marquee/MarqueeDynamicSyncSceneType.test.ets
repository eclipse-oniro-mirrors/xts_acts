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
import { describe, beforeEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function MarqueeDynamicSyncSceneTest() {
  describe('MarqueeDynamicSyncSceneTest', () => {
    beforeEach(async (done: Function) => {
      console.info("MarqueeDynamicSyncSceneTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Marquee/MarqueeDynamicSyncSceneType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MarqueeDynamicSyncSceneTest state pages: " + JSON.stringify(pages));
        if (!("MarqueeDynamicSyncSceneType" == pages.name)) {
          console.info("get MarqueeDynamicSyncSceneTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push MarqueeDynamicSyncSceneTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MarqueeDynamicSyncSceneTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_MarqueeDynamicSyncSceneTest_0010
     * @tc.name      MarqueeDynamicSyncSceneTest_0010
     * @tc.desc      test MarqueeDynamicSyncSceneType: ANIMATION
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('MarqueeDynamicSyncSceneTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('MarqueeDynamicSyncSceneTest_0010 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.type('Button'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info("[MarqueeDynamicSyncSceneTest_0010] MarqueeDynamicSyncSceneType:"
        + JSON.stringify(AppStorage.get('MarqueeDynamicSyncSceneType')));
      expect(AppStorage.get('MarqueeDynamicSyncSceneType')).assertEqual('ANIMATION');
      AppStorage.delete('MarqueeDynamicSyncSceneType')
      console.info('[MarqueeDynamicSyncSceneTest_0010] END');
      done();
    });
  })
}
