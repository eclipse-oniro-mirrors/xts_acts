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

export default function SwiperImplicitanimation0010() {
    describe('SwiperImplicitanimation0010', () => {
      beforeEach(async (done: Function) => {
        console.info("SwiperImplicitanimation0010 beforeEach start");
        try {
          router.clear();
          let pages = router.getState();
          console.info("get SwiperImplicitanimation0010 state pages:" + JSON.stringify(pages));
          if (!("SwiperImplicitanimation0010" == pages.name)) {
            console.info("get Context pages.name:" + JSON.stringify(pages.name));
            let result = await router.pushUrl({
              url: 'MainAbility/pages/Swiper/SwiperImplicitanimation/SwiperImplicitanimation0010'
            })
            await CommonFunc.sleep(2000);
            console.info("push SwiperImplicitanimation0010 page result:" + JSON.stringify(result));
          }
        } catch (err) {
          console.error("push SwiperImplicitanimation0010 page error:" + err);
        }
        console.info("SwiperImplicitanimation0010 foreEach end");
        done();
      });
      afterEach(async () => {
        await CommonFunc.sleep(1000);
        console.info("SwiperImplicitanimation0010 after each called");
      });

    /**
     * @tc.number SWIPER_IMPLICITANIMATION_0010
     * @tc.name step
     * @tc.desc change
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_0010', Level.LEVEL1, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_0010 START");
      await CommonFunc.sleep(6000);
      let swiperOffset = CommonFunc.getComponentRectOnScreen('swiper0010');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      let height = bottom -top;
      let width = right - left;
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      await driver.drag(Math.round(left + width*0.8),Math.round(bottom - height/2),Math.round(left + width*0.1),Math.round(bottom - height/2));
      await CommonFunc.sleep(3000);
      let strJson2: string = getInspectorByKey('implicitanimation_0010');
      let marq2: ESObject =JSON.parse(strJson2).$attrs.content;
      expect(marq2).assertEqual("1");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_0010 END');
      done();
    });

  })
}