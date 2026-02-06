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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function tabsCallBack6() {
  describe('tabsCallBack6', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsCallBack6 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/tabsCallBack6",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsCallBack6 state pages:" + JSON.stringify(pages));
        if (!("tabsCallBack6" == pages.name)) {
          console.info("get tabsCallBack6 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tabsCallBack6 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsCallBack6 page error:" + err);
      }
      console.info("tabsCallBack6 beforeEach end");
      done();
    });

    /**
     * @tc.number    tabsCallBack6_001
     * @tc.name      tabsCallBack6_0100
     * @tc.desc      Dragging with fingers triggers onGestureSwipe callback.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('tabsCallBack6_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[tabsCallBack6_0100] START');
      let swiperTabs = CommonFunc.getComponentRectOnScreen('callback_gestureSwipe_6');
      let top = swiperTabs.top;
      let right = swiperTabs.right;
      let left = swiperTabs.left;
      let bottom = swiperTabs.bottom;
      console.info("tabsCallBack6_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = await Driver.create()
      await driver.swipe(Math.round(left + width*0.9),Math.round(bottom - height/2),Math.round(left + width*0.1),Math.round(bottom - height/2));
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('tabs_onGestureSwipe_6');
      console.info("[tabsCallBack6_0100] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[tabsCallBack6_0100] content1: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('onGestureSwipe success');
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('tabs_callback_6');
      console.info("[tabsCallBack6_0100] component obj is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[tabsCallBack6_0100] content1: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content)
        .assertEqual('tabs: onAnimationStart-onChange-onAnimationEnd-');
      console.info('[tabsCallBack6_0100] END');
      done();
    });
  })
}
