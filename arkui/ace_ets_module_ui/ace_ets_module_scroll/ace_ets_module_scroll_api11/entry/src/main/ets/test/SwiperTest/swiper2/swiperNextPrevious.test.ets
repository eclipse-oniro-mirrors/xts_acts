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
import CommonFunc from '../../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function swiperNextPreTest() {
  describe('swiperNextPreTest', () => {
    beforeEach(async (done: Function) => {
      console.info("swiperNextPreTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiperNextPreTest state pages:" + JSON.stringify(pages));
        if (!("swiper_next_previous" == pages.name)) {
          console.info("get swiperPageTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Swiper/swiper2/swiper_next_previous"})
          await CommonFunc.sleep(2000);
          console.info("push swiperNextPreTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperNextPreTest page error:" + err);
      }
      console.info("swiperNextPreTest foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("swiperNextPreTest after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0050
     * @tc.desc      test the swipe scroller next
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */

    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0050', 0, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0050] START');
      await CommonFunc.sleep(2000);
      // click the next button
      let driver = await Driver.create();
      let buttonNext :Component = await driver.findComponent(ON.id('showNextT'));
      await buttonNext.click();
      await CommonFunc.sleep(2000);

      // get the component of text_3
      let text3:Component = await driver.findComponent(ON.text('3'));
      let ttContent = await text3.getText();
      expect(ttContent).assertEqual("3")
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0050] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0060
     * @tc.desc      test the swipe scroller previous
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0060', 0, async (done: Function) => {
      console.info('[] START');
      await CommonFunc.sleep(2000);
      // click the next button
      let driver = await Driver.create();
      let buttonNext :Component = await driver.findComponent(ON.id('showPreviousT'));
      await buttonNext.click();
      await CommonFunc.sleep(2000);

      // get the component of text_2
      let text3:Component = await driver.findComponent(ON.text('2'));
      let ttContent = await text3.getText();
      expect(ttContent).assertEqual("2")
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0060] END');
      done();
    });

  })
}
