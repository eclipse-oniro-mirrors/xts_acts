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
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/utils/Common';

export default function SwiperAdd0510() {
  describe('SwiperAdd0510', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperAdd0510 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperAdd0510 state pages:" + JSON.stringify(pages));
        if (!("SwiperAdd0510" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: 'MainAbility/pages/Swiper/SwiperAdd/SwiperAdd0510'
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperAdd0510 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperAdd0510 page error:" + err);
      }
      console.info("SwiperAdd0510 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperAdd0510 after each called");
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ADD_0510
     * @tc.number SWIPER_ADD_0510
     * @tc.desc   loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ADD_0510', Level.LEVEL1, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ADD_0510 START");
      await CommonFunc.sleep(5000);
      let strJson2: string = getInspectorByKey('swiper_add_0510');
      let marq: ESObject = JSON.parse(strJson2).$attrs.content;
      expect(marq).assertEqual("1");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ADD_0510 END');
      done();
    });

  })
}