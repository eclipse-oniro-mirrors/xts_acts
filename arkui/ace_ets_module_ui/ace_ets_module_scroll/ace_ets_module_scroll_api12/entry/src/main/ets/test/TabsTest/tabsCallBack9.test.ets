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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function tabsCallBack9() {
  describe('tabsCallBack9', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsCallBack9 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/tabsCallBack9",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsCallBack9 state pages:" + JSON.stringify(pages));
        if (!("tabsCallBack9" == pages.name)) {
          console.info("get tabsCallBack9 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tabsCallBack9 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsCallBack9 page error:" + err);
      }
      console.info("tabsCallBack9 beforeEach end");
      done();
    });

    /**
     * @tc.number    tabsCallBack9_001
     * @tc.name      tabsCallBack9_0100
     * @tc.desc      Dragging the mouse to trigger the start and end callback.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('tabsCallBack9_0100', 0, async (done: Function) => {
      console.info('[tabsCallBack9_0100] START');
      let driver = await Driver.create()
      let dragTabs = CommonFunc.getComponentRectOnScreen('callback_gestureSwipe_9')
      await driver.mouseDrag({
        x: Math.round((dragTabs.right - dragTabs.left) * 0.9 + dragTabs.left),
        y: Math.round((dragTabs.bottom - dragTabs.top) * 0.5 + dragTabs.top)
      },
        {
          x: Math.round((dragTabs.right - dragTabs.left) * 0.1 + dragTabs.left),
          y: Math.round((dragTabs.bottom - dragTabs.top) * 0.5 + dragTabs.top)
        })
      await CommonFunc.sleep(3000);
      let strJson1 = getInspectorByKey('tabs_onGestureSwipe_9');
      console.info("[tabsCallBack9_0100] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[tabsCallBack9_0100] content1: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('onGestureSwipe success');

      let strJson2 = getInspectorByKey('tabs_callback_9');
      console.info("[tabsCallBack9_0100] component obj is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[tabsCallBack9_0100] content1: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content)
        .assertEqual('tabs: onAnimationStart-onChange-onAnimationEnd-');
      console.info('[tabsCallBack9_0100] END');
      done();
    });
  })
}
