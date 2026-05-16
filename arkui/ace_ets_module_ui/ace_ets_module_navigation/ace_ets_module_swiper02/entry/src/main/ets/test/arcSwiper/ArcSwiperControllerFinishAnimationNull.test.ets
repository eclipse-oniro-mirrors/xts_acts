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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function ArcSwiperControllerFinishAnimationNullTest() {
  describe('ArcSwiperControllerFinishAnimationNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ArcSwiperControllerFinishAnimationNull beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/arcSwiper/ArcSwiperControllerFinishAnimationNull",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ArcSwiperControllerFinishAnimationNull state pages:" + JSON.stringify(pages));
        if (!("ArcSwiperControllerFinishAnimationNull" == pages.name)) {
          console.info("get ArcSwiperControllerFinishAnimationNull pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ArcSwiperControllerFinishAnimationNull page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ArcSwiperControllerFinishAnimationNull page error:" + err);
      }
      console.info("ArcSwiperControllerFinishAnimationNull beforeEach end");
      done();
    });

    /**
     * @tc.name   arcSwiperControllerFinishAnimationNull_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_CONTROLLER_FINISH_ANIMATION_NULL_0100
     * @tc.desc   Test ArcSwiperController finishAnimation method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperControllerFinishAnimationNull_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperControllerFinishAnimationNull_0100] START');

      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let btn = await driver.findComponent(ON.id('testUndefinedId'));
        await btn.click();
        await CommonFunc.sleep(1000);
        let flag: boolean | undefined = AppStorage.get('flag')
        expect(flag).assertTrue();
        AppStorage.delete('flag')
        console.info('[arcSwiperControllerFinishAnimationNull_0100] ArcSwiper component exists');
      } catch (error) {
        console.info('[arcSwiperControllerFinishAnimationNull_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[arcSwiperControllerFinishAnimationNull_0100] END');
    })

    /**
     * @tc.name   arcSwiperControllerFinishAnimationNull_0200
     * @tc.number SUB_ARKUI_ARC_SWIPER_CONTROLLER_FINISH_ANIMATION_NULL_0200
     * @tc.desc   Test ArcSwiperController finishAnimation method with null parameter - should work normally
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperControllerFinishAnimationNull_0200', Level.LEVEL0, async () => {
      console.info('[arcSwiperControllerFinishAnimationNull_0200] START');

      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let btn = await driver.findComponent(ON.id('testNullId'));
        await btn.click();
        await CommonFunc.sleep(1000);
        let flag: boolean | undefined = AppStorage.get('flag')
        expect(flag).assertTrue();
        AppStorage.delete('flag')
      } catch (error) {
        console.info('[arcSwiperControllerFinishAnimationNull_0200] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[arcSwiperControllerFinishAnimationNull_0200] END');
    })

  })
}
