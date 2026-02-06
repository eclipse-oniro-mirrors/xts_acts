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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import { SwiperDynamicSyncScene } from '@ohos.arkui.UIContext'
export default function swiperSyncType() {
  describe('swiperSyncType', () => {
    beforeEach(async (done: Function) => {
      console.info("swiperSyncType beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/swiperSyncType",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiperSyncType state pages:" + JSON.stringify(pages));
        if (!("swiperSyncType" == pages.name)) {
          console.info("get swiperSyncType pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push swiperSyncType page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperSyncType page error:" + err);
      }
      console.info("swiperSyncType beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("swiperSyncType after each called");
    });

    /**
     * @tc.number    swiperSyncType_001
     * @tc.name      swiperSyncType_001
     * @tc.desc      Set SwinperDynamicSyncSceneType.
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('swiperSyncType_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[swiperSyncType_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('sceneType_set'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('sceneType_swiper');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[swiperSyncType_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('setFrameRateRangeSwiper1: 60Swiper11: 30');
      console.info('[swiperSyncType_0100] END');
      done();
    });

    /**
     * @tc.number    swiperSyncType_002
     * @tc.name      swiperSyncType_0200
     * @tc.desc      Set SwinperDynamicSyncSceneType.
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('swiperSyncType_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[swiperSyncType_0200] START');
      await CommonFunc.sleep(1000);
      console.info("[swiperSyncType_0200] requireDynamicSyncScene: " + AppStorage.get('requireDynamicSyncScene'));
      let result: SwiperDynamicSyncScene[] | undefined = AppStorage.get('requireDynamicSyncScene')
      expect(result && result.length > 0).assertTrue();
      AppStorage.delete('requireDynamicSyncScene')
      console.info('[swiperSyncType_0200] END');
      done();
    });
  })
}
