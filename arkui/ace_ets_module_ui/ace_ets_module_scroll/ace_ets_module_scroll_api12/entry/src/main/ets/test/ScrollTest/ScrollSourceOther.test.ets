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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ScrollSourceOther() {
  describe('ScrollSourceOther', () => {
    beforeEach(async (done: Function) => {
      console.info("ScrollSourceOther beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/ScrollSourceOther",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ScrollSourceOther state pages: " + JSON.stringify(pages));
        if (!("ScrollSourceOther" == pages.name)) {
          console.info("get ScrollSourceOther state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ScrollSourceOther success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ScrollSourceOther page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('SCROLL_BAR_FLING'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info("column after each called");
    });

    /**
     * @tc.number    ScrollSourceOther_0100
     * @tc.name      ScrollSourceOther_0100
     * @tc.desc      frameNode: ScrollSourceOtherToWindow
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ScrollSourceOther_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ScrollSourceOther_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('SCROLLER_ANIMATION'));
      await button.click();

      let button2 = await driver.findComponent(ON.id('EDGE_EFFECT'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SCROLLER_ANIMATION');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ScrollSourceOther_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ScrollSourceOther_0100] content obj is: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual('EDGE_EFFECT'); //EDGE_EFFECT
      console.info('[ScrollSourceOther_0100] END');
      done();
    });
    
    /**
     * @tc.number    ScrollSourceOther_0200
     * @tc.name      ScrollSourceOther_0200
     * @tc.desc      frameNode: ScrollSourceOtherToWindow
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ScrollSourceOther_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ScrollSourceOther_0200 START');
      let driver = Driver.create();
      let swiperScroll = CommonFunc.getComponentRectOnScreen('scrollSourceOther');
      let top = swiperScroll.top;
      let right = swiperScroll.right;
      let left = swiperScroll.left;
      let bottom = swiperScroll.bottom;
      console.info("ScrollSourceOther_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width/2),Math.round(top + height*0.6),Math.round(left + width/2),Math.round(top + height*0.2));
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('EDGE_EFFECT');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ScrollSourceOther_0200] component obj is: " + JSON.stringify(obj));
      console.info("[ScrollSourceOther_0200] content obj is: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual('FLING'); //FLING
      console.info('[ScrollSourceOther_0200] END');
      done();
    });

    /**
     * @tc.number    ScrollSourceOther_0300
     * @tc.name      ScrollSourceOther_0300
     * @tc.desc      frameNode: ScrollSourceOtherToWindow
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ScrollSourceOther_0300', Level.LEVEL0, async (done: Function) => {
      console.info('ScrollSourceOther_0300 START');
      let driver = Driver.create();
      let swiperScroll = CommonFunc.getComponentRectOnScreen('scrollSourceOther');
      let top = swiperScroll.top;
      let right = swiperScroll.right;
      let left = swiperScroll.left;
      let bottom = swiperScroll.bottom;
      console.info("ScrollSourceOther_0300 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      
      await driver.mouseScroll({x:Math.round(left + width/2), y: Math.round(top + height*0.3)}, false, 20)
      await driver.mouseScroll({x:Math.round(left + width/2), y: Math.round(top + height*0.3)}, true, 20)
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('SCROLLER_ANIMATION');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ScrollSourceOther_0300] component obj is: " + JSON.stringify(obj));
      console.info("[ScrollSourceOther_0300] content obj is: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual('OTHER_USER_INPUT'); //OTHER_USER_INPUT
      console.info('[ScrollSourceOther_0300] END');
      done();
    });

  })
}

