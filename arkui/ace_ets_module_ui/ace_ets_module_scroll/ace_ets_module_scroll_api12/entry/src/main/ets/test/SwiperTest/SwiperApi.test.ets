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
import CommonFunc from '../../MainAbility/utils/Common';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import text from "@ohos.graphics.text"

export default function SwiperApi() {
  describe('SwiperApi', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperApi beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperApi state pages:" + JSON.stringify(pages));
        if (!("SwiperApi" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Swiper/SwiperApi"})
          await CommonFunc.sleep(2000);
          console.info("push SwiperApi page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperApi page error:" + err);
      }
      console.info("SwiperApi foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperApi after each called");
    });


    /**
     * @tc.name   SwiperApi_001
     * @tc.number SwiperApi_001
     * @tc.desc   SwiperApi_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SwiperApi_001', Level.LEVEL1, async (done: Function) => {
      console.info('[SwiperApi_001] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SwiperApi');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SwiperApi_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$type).assertEqual('Swiper');
      console.info('[SwiperApi_001] END');
      done();
    });

  })
}
