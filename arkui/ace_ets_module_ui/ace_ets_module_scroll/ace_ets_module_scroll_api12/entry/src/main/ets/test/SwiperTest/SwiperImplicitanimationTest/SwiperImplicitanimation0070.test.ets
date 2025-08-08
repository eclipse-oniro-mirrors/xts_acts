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

export default function SwiperImplicitanimation0070() {
  describe('SwiperImplicitanimation0070', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperImplicitanimation0070 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperImplicitanimation0070 state pages:" + JSON.stringify(pages));
        if (!("SwiperImplicitanimation0070" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: 'MainAbility/pages/Swiper/SwiperImplicitanimation/SwiperImplicitanimation0070'
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperImplicitanimation0070 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperImplicitanimation0070 page error:" + err);
      }
      console.info("SwiperImplicitanimation0070 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperImplicitanimation0070 after each called");
    });

    /**
     * @tc.number SWIPER_IMPLICITANIMATION_0070
     * @tc.name step
     * @tc.desc change
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_0070', Level.LEVEL1, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_0070 START");
      let driver: Driver = Driver.create();
      let swiperOffset = CommonFunc.getComponentRectOnScreen('implicitanimation_0070');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      let height = bottom -top;
      let width = right - left;
      await driver.swipe(Math.round(left + width*0.8),Math.round(bottom - height/2),Math.round(left + width*0.5),Math.round(bottom - height/2));
      await CommonFunc.sleep(1000);
      let strIndex: string = getInspectorByKey('implicitanimation_0070_1')
      let jsonIndex: ESObject = JSON.parse(strIndex).$attrs.content;
      expect(jsonIndex).assertEqual('0')
      await driver.drag(Math.round(left + width*0.3),Math.round(bottom - height/2),Math.round(left + width*0.9),Math.round(bottom - height/2));
      await CommonFunc.sleep(300);
      let strIndex0: string = getInspectorByKey('implicitanimation_0070_1')
      let jsonIndex0: ESObject = JSON.parse(strIndex0).$attrs.content;
      expect(jsonIndex0).assertEqual('0')
      let tarindex2: string = getInspectorByKey('implicitanimation_0070_2')
      let jsonIndex2: ESObject = JSON.parse(tarindex2).$attrs.content;
      expect(jsonIndex2 != 0).assertTrue();
      await driver.swipe(Math.round(left + width*0.8),Math.round(bottom - height/2),Math.round(left + width*0.1),Math.round(bottom - height/2));
      await CommonFunc.sleep(300);
      await driver.swipe(Math.round(left + width*0.8),Math.round(bottom - height/2),Math.round(left + width*0.1),Math.round(bottom - height/2));
      await CommonFunc.sleep(300);
      let strIndex3: string = getInspectorByKey('implicitanimation_0070_1')
      let jsonIndex3: ESObject = JSON.parse(strIndex3).$attrs.content;
      expect(jsonIndex3).assertEqual('1')
      await driver.drag(Math.round(left + width*0.8),Math.round(bottom - height/2),Math.round(left + width*0.1),Math.round(bottom - height/2));
      await CommonFunc.sleep(300);
      let strIndex4: string = getInspectorByKey('implicitanimation_0070_1')
      let jsonIndex4: ESObject = JSON.parse(strIndex4).$attrs.content;
      expect(jsonIndex4).assertEqual('2')
      let tarindex: string = getInspectorByKey('implicitanimation_0070_2')
      let tarindex1: ESObject = JSON.parse(tarindex).$attrs.content;
      expect(tarindex1 != 0).assertTrue();
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_0070 END');
      done();
    });

  })
}