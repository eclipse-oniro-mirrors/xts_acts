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

export default function tabsCallBack8() {
  describe('tabsCallBack8', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsCallBack8 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/tabsCallBack8",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsCallBack8 state pages:" + JSON.stringify(pages));
        if (!("tabsCallBack8" == pages.name)) {
          console.info("get tabsCallBack8 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tabsCallBack8 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsCallBack8 page error:" + err);
      }
      console.info("tabsCallBack8 beforeEach end");
      done();
    });

    /**
     * @tc.name   tabsCallBack8_0100
     * @tc.number tabsCallBack8_001
     * @tc.desc   Click on the tabBar to trigger the start and end callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tabsCallBack8_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[tabsCallBack8_0100] START');
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.text('Yellow'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('tabs_onGestureSwipe_8');
      console.info("[tabsCallBack8_0100] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[tabsCallBack8_0100] content: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('111');
      let strJson2 = getInspectorByKey('tabs_callback_8');
      console.info("[tabsCallBack8_0100] component obj is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[tabsCallBack8_0100] content1: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content)
        .assertEqual('tabs: onTabBarClick-onContentWillChange-onAnimationStart-onChange-onAnimationEnd-');
      console.info('[tabsCallBack8_0100] END');
      done();
    });
  })
}
