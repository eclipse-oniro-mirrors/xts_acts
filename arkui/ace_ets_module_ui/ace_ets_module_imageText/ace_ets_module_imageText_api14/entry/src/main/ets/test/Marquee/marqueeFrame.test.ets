/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function SetFrameRateRangeTest() {
  describe('setFrameRateRangeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("setFrameRateRangeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Marquee/marqueeFrame",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get setFrameRateRangeTest state pages: " + JSON.stringify(pages));
        if (!("setFrameRateRange" == pages.name)) {
          console.info("get setFrameRateRangeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push setFrameRateRangeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setFrameRateRangeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   MarqueerequireDynamicSyncSceneTest_0010
     * @tc.number requireDynamicSyncSceneTest_0010
     * @tc.desc   UIContext: requireDynamicSyncScene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MarqueerequireDynamicSyncSceneTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('MarqueerequireDynamicSyncSceneTest_0010 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('MarqueegetGetFrameRateRange_id'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('MarqueerequireDynamicSyncScene_id');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[MarqueerequireDynamicSyncSceneTest_0010] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('MarqueerequireDynamicSyncScene succ');
      console.info('[MarqueerequireDynamicSyncSceneTest_0010] END');
      done();
    });
  })
}

