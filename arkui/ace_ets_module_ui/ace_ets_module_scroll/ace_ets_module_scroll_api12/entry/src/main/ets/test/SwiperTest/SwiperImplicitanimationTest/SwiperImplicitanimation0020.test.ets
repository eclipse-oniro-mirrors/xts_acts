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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
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

export default function SwiperImplicitanimation0020() {
  describe('SwiperImplicitanimation0020', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperImplicitanimation0020 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperImplicitanimation0020 state pages:" + JSON.stringify(pages));
        if (!("SwiperImplicitanimation0020" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: 'MainAbility/pages/Swiper/SwiperImplicitanimation/SwiperImplicitanimation0020'
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperImplicitanimation0020 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperImplicitanimation0020 page error:" + err);
      }
      console.info("SwiperImplicitanimation0020 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperImplicitanimation0020 after each called");
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_0020
     * @tc.name SWIPER_IMPLICITANIMATION_0020
     * @tc.desc show index targetIndex,currentOffset、targetOffset
     * @tc.level Level 3
     * @tc.type Function
     * @tc.size MediumTest
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_0020', 0, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_0020 START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id("btn_implicitanimation_0020_1"));
      await btn1.click();
      await CommonFunc.sleep(500);
      await btn1.click();
      await CommonFunc.sleep(500);
      let strIndex: string = getInspectorByKey('implicitanimation_0020_1')
      let jsonIndex: ESObject = JSON.parse(strIndex).$attrs.content;
      expect(jsonIndex).assertEqual('1')
      let swiperArrow = await driver.findComponent(ON.id("implicitanimation_0020"));
      let point2 = await swiperArrow.getBoundsCenter();
      let x:number = parseInt(vp2px(120).toString());
      let x1:number = parseInt(vp2px(90).toString());
      await driver.drag(point2.x + x, point2.y, point2.x - x1, point2.y, 3000)
      await CommonFunc.sleep(1000);
      let strIndex4: string = getInspectorByKey('implicitanimation_0020_1')
      let jsonIndex4: ESObject = JSON.parse(strIndex4).$attrs.content;
      expect(jsonIndex4).assertEqual('2')
      let strIndex5: string = getInspectorByKey('implicitanimation_0020_2')
      let jsonIndex5: ESObject = JSON.parse(strIndex5).$attrs.content;
      expect(jsonIndex5).assertEqual('2')

      let currindex_1: string = getInspectorByKey('implicitanimation_0020_3')
      let currindex2_1: ESObject = JSON.parse(currindex_1).$attrs.content;
      expect(currindex2_1).assertEqual('0')

      let taroffindex_1: string = getInspectorByKey('implicitanimation_0020_4')
      let taroffindex2_1: ESObject = JSON.parse(taroffindex_1).$attrs.content;
      expect(taroffindex2_1).assertEqual('0')
      let velocity_1: string = getInspectorByKey('implicitanimation_0020_5')
      let velocity1_1: ESObject = JSON.parse(velocity_1).$attrs.content;
      expect(velocity1_1).assertEqual('0')

      let showPrevious = await driver.findComponent(ON.id("btn_implicitanimation_0020"));
      await showPrevious.click();
      await CommonFunc.sleep(1000);

      await driver.drag(point2.x - x, point2.y, point2.x + x1, point2.y, 3000)
      await CommonFunc.sleep(1000);
      let strIndex0: string = getInspectorByKey('implicitanimation_0020_1')
      let jsonIndex0: ESObject = JSON.parse(strIndex0).$attrs.content;
      expect(jsonIndex0).assertEqual('0')
      let tarindex: string = getInspectorByKey('implicitanimation_0020_2')
      let tarindex1: ESObject = JSON.parse(tarindex).$attrs.content;
      expect(tarindex1).assertEqual('0')

      let currindex: string = getInspectorByKey('implicitanimation_0020_3')
      let currindex2: ESObject = JSON.parse(currindex).$attrs.content;
      expect(currindex2).assertEqual('0')

      let taroffindex: string = getInspectorByKey('implicitanimation_0020_4')
      let taroffindex2: ESObject = JSON.parse(taroffindex).$attrs.content;
      expect(taroffindex2).assertEqual('0')
      let velocity: string = getInspectorByKey('implicitanimation_0020_5')
      let velocity1: ESObject = JSON.parse(velocity).$attrs.content;
      expect(velocity1).assertEqual('0')
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_0020 END');
      done();
    });

  })
}