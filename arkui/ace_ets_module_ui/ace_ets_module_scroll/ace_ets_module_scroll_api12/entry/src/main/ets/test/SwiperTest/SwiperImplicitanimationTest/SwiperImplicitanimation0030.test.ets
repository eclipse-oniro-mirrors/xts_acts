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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/utils/Common';

export default function SwiperImplicitanimation0030() {
  describe('SwiperImplicitanimation0030', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperImplicitanimation0030 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperImplicitanimation0030 state pages:" + JSON.stringify(pages));
        if (!("SwiperImplicitanimation0030" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: 'MainAbility/pages/Swiper/SwiperImplicitanimation/SwiperImplicitanimation0030'
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperImplicitanimation0030 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperImplicitanimation0030 page error:" + err);
      }
      console.info("SwiperImplicitanimation0030 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperImplicitanimation0030 after each called");
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_0030
     * @tc.name SWIPER_IMPLICITANIMATION_0030
     * @tc.desc show index currentOffset change
     * @tc.level Level 3
     * @tc.type Function
     * @tc.size MediumTest
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_0030', 0, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_0030 START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id("btn_implicitanimation_0030_1"));
      await btn1.click();
      await CommonFunc.sleep(500);
      await btn1.click();
      await CommonFunc.sleep(500);
      let strIndex: string = getInspectorByKey('implicitanimation_0030_1')
      let jsonIndex: ESObject = JSON.parse(strIndex).$attrs.content;
      expect(jsonIndex).assertEqual('1')
      let swiperArrow = await driver.findComponent(ON.id("implicitanimation_0030"));
      let point2 = await swiperArrow.getBoundsCenter();
      let x:number = parseInt(vp2px(120).toString());
      let x1:number = parseInt(vp2px(90).toString());
      await driver.drag(point2.x +x,  point2.y,point2.x - x1,point2.y,3000)
      await CommonFunc.sleep(1000);
      let strIndex0: string = getInspectorByKey('implicitanimation_0030_1')
      let jsonIndex0: ESObject = JSON.parse(strIndex0).$attrs.content;
      expect(jsonIndex0).assertEqual('2')
      let tarindex: string = getInspectorByKey('implicitanimation_0030_2')
      let tarindex1: ESObject = JSON.parse(tarindex).$attrs.content;
      expect(tarindex1).assertEqual('0')
      let btn2 = await driver.findComponent(ON.id("btn_implicitanimation_0030"));
      await btn2.click();
      await CommonFunc.sleep(500);
      await btn2.click();
      await CommonFunc.sleep(500);
      let strIndex3: string = getInspectorByKey('implicitanimation_0030_1')
      let jsonIndex3: ESObject = JSON.parse(strIndex3).$attrs.content;
      expect(jsonIndex3).assertEqual('1')
      await driver.drag(point2.x -x,  point2.y,point2.x +x1,point2.y,3000);
      await CommonFunc.sleep(300);
      let strIndex4: string = getInspectorByKey('implicitanimation_0030_1')
      let jsonIndex4: ESObject = JSON.parse(strIndex4).$attrs.content;
      expect(jsonIndex4).assertEqual('0')
      let tarindex5: string = getInspectorByKey('implicitanimation_0030_2')
      let jsonIndex5: ESObject = JSON.parse(tarindex5).$attrs.content;
      expect(jsonIndex5).assertEqual('0')
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_0030 END');
      done();
    });

  })
}