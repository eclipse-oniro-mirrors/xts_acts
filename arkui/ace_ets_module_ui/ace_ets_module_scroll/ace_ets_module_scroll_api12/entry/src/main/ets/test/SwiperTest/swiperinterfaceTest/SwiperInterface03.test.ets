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
import CommonFunc from '../../../MainAbility/utils/Common';

export default function SwiperInterface03() {
  describe('SwiperInterface03', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperInterface03 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperInterface03 state pages:" + JSON.stringify(pages));
        if (!("SwiperInterface03" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: 'MainAbility/pages/Swiper/SwiperInterface/SwiperInterface03'
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperInterface03 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperInterface03 page error:" + err);
      }
      console.info("SwiperInterface03 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperInterface03 after each called");
    });

    /**
     * @tc.number SWIPER_DRAG_0190
     * @tc.name step
     * @tc.desc curve
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0190', Level.LEVEL1, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0190 START");
      await CommonFunc.sleep(6000);
      let strJson: string = getInspectorByKey('SWIPER_INTERFACE_0190');
      let marq: ESObject =JSON.parse(strJson).$attrs.curve;
      let marq2: ESObject =JSON.parse(strJson).$attrs.indicator;
      expect(marq2).assertEqual("true");
      expect(marq).assertEqual("Curves.Linear");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0190 END');
      done();
    });


    /**
     * @tc.number SWIPER_DRAG_0200
     * @tc.name step
     * @tc.desc curve
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0200', Level.LEVEL1, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0200 START");
      await CommonFunc.sleep(6000);
      let strJson: string = getInspectorByKey('SWIPER_INTERFACE_0200');
      let marq: ESObject =JSON.parse(strJson).$attrs.curve;
      let marq2: ESObject =JSON.parse(strJson).$attrs.indicator;
      expect(marq2).assertEqual("true");
      expect(marq).assertEqual("Curves.EaseIn");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0200 END');
      done();
    });

    /**
     * @tc.number SWIPER_DRAG_0210
     * @tc.name step
     * @tc.desc curve
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0210', Level.LEVEL1, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0210 START");
      await CommonFunc.sleep(6000);
      let strJson: string = getInspectorByKey('SWIPER_INTERFACE_0210');
      let marq: ESObject =JSON.parse(strJson).$attrs.curve;
      let marq2: ESObject =JSON.parse(strJson).$attrs.indicator;
      expect(marq2).assertEqual("true");
      expect(marq).assertEqual("Curves.EaseInOut");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0210 END');
      done();
    });

    /**
     * @tc.number SWIPER_DRAG_0220
     * @tc.name step
     * @tc.desc curve
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0220', Level.LEVEL1, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0220 START");
      await CommonFunc.sleep(6000);
      let strJson: string = getInspectorByKey('SWIPER_INTERFACE_0220');
      let marq: ESObject =JSON.parse(strJson).$attrs.curve;
      let marq2: ESObject =JSON.parse(strJson).$attrs.indicator;
      expect(marq2).assertEqual("true");
      expect(marq).assertEqual("Curves.EaseOut");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0220 END');
      done();
    });



  })
}