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

export default function UIComponentScrollSwiperDisplaycount0210() {
  describe('UIComponentScrollSwiperDisplaycount0210', () => {
    beforeEach(async (done: Function) => {
      console.info("UIComponentScrollSwiperDisplaycount0210 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UIComponentScrollSwiperDisplaycount0210 state pages:" + JSON.stringify(pages));
        if (!("UIComponentScrollSwiperDisplaycount0210" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: 'MainAbility/pages/Swiper/UIComponentScrollSwiperDisplaycount/UIComponentScrollSwiperDisplaycount0210'
          })
          await CommonFunc.sleep(2000);
          console.info("push UIComponentScrollSwiperDisplaycount0210 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIComponentScrollSwiperDisplaycount0210 page error:" + err);
      }
      console.info("UIComponentScrollSwiperDisplaycount0210 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("UIComponentScrollSwiperDisplaycount0210 after each called");
    });

    /**
     * @tc.number SWIPER_DISPLAYCOUNT_0210
     * @tc.name step
     * @tc.desc loop
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DISPLAYCOUNT_0210', Level.LEVEL1, async (done: Function) => {
      console.info(`SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DISPLAYCOUNT_0210 start.`);
      await CommonFunc.sleep(3000)
      let driver = await Driver.create()
      let swipeList = CommonFunc.getComponentRectOnScreen('swiperdisplaycount0210');
      let top = swipeList.top;
      let right = swipeList.right;
      let left = swipeList.left;
      let bottom = swipeList.bottom;
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DISPLAYCOUNT_0210 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver.swipe(Math.round(left + width*0.4),Math.round(top + height/2),Math.round(left + width*0.9),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      let strIndex: string = getInspectorByKey('swiperdisplaycount0210_1')
      let jsonIndex: ESObject = JSON.parse(strIndex).$attrs.content;
      expect(jsonIndex).assertEqual('0')
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DISPLAYCOUNT_0210 END');
      done();
    });
  })
}