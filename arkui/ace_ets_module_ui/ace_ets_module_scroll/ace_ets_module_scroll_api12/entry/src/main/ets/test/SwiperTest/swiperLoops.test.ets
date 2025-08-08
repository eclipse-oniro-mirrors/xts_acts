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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function swiperLoops() {
  describe('swiperLoops', () => {
    beforeEach(async (done: Function) => {
      console.info("swiperLoops beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/swiperLoops",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiperLoops state pages:" + JSON.stringify(pages));
        if (!("swiperLoops" == pages.name)) {
          console.info("get swiperLoops pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push swiperLoops page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperLoops page error:" + err);
      }
      console.info("swiperLoops beforeEach end");
      done();
    });
    afterEach(async () => {
      console.info("swiperLoops after each called");
    });

    /**
     * @tc.number    swiperLoops_001
     * @tc.name      swiperLoops_0100
     * @tc.desc      Set the loop attribute of the Swiper component multiple times
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('swiperLoops_0100', 0, async (done: Function) => {
      console.info('[swiperLoops_0100] START');
      let strJson = getInspectorByKey('swiperLoops');
      console.info("[swiperLoops_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[swiperLoops_0100] loop: " + JSON.stringify(JSON.parse(strJson).$attrs.loop));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.loop).assertEqual('false');
      console.info('[swiperLoops_0100] END');
      done();
    });
  })
}