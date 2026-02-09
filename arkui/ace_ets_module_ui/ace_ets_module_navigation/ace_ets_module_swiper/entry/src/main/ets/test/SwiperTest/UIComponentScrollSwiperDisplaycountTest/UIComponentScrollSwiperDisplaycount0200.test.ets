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
import CommonFunc from '../../../MainAbility/utils/Common';
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

export default function UIComponentScrollSwiperDisplaycount0200() {
  describe('UIComponentScrollSwiperDisplaycount0200', () => {
    beforeEach(async (done: Function) => {
      console.info("UIComponentScrollSwiperDisplaycount0200 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UIComponentScrollSwiperDisplaycount0200 state pages:" + JSON.stringify(pages));
        if (!("UIComponentScrollSwiperDisplaycount0200" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: 'MainAbility/pages/Swiper/UIComponentScrollSwiperDisplaycount/UIComponentScrollSwiperDisplaycount0200'
          })
          await CommonFunc.sleep(2000);
          console.info("push UIComponentScrollSwiperDisplaycount0200 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIComponentScrollSwiperDisplaycount0200 page error:" + err);
      }
      console.info("UIComponentScrollSwiperDisplaycount0200 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("UIComponentScrollSwiperDisplaycount0200 after each called");
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DISPLAYCOUNT_0200
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DISPLAYCOUNT_0200
     * @tc.desc   change page and success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DISPLAYCOUNT_0200', Level.LEVEL1, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DISPLAYCOUNT_0200 START");
      await CommonFunc.sleep(2000)
      let driver = await Driver.create()
      let swiper = await driver.findComponent(ON.id("btnDisplaycount0200"));
      await swiper.click();
      await CommonFunc.sleep(1000);
      let strIndex: string = getInspectorByKey('swiperdisplaycount0200_1')
      let jsonIndex: ESObject = JSON.parse(strIndex).$attrs.content;
      expect(jsonIndex).assertEqual('1')
      await CommonFunc.sleep(3000)
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DISPLAYCOUNT_0200 END');
      done();

    });
  })
}