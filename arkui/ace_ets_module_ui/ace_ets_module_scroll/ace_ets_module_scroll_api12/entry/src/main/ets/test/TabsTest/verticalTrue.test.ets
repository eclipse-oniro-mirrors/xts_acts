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

export default function verticalTrue() {
  describe('verticalTrue', () => {
    beforeEach(async (done: Function) => {
      console.info("verticalTrue beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/verticalTrue",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get verticalTrue state pages:" + JSON.stringify(pages));
        if (!("verticalTrue" == pages.name)) {
          console.info("get verticalTrue pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push verticalTrue page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push verticalTrue page error:" + err);
      }
      console.info("verticalTrue beforeEach end");
      done();
    });

    /**
     * @tc.name   verticalTrue_0100
     * @tc.number verticalTrue_001
     * @tc.desc   Vertical sliding of the page triggers a callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('verticalTrue_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[verticalTrue_0100] START');
      let swiperTabs = CommonFunc.getComponentRectOnScreen('vertical_true_callback');
      let top = swiperTabs.top;
      let right = swiperTabs.right;
      let left = swiperTabs.left;
      let bottom = swiperTabs.bottom;
      console.info("verticalTrue_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = await Driver.create()
      await driver.swipe(Math.round(left + width/2),Math.round(top + height*0.9),Math.round(left + width/2),Math.round(top + height*0.1));
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('portrait_onGestureSwipe');
      console.info("[verticalTrue_0100] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[verticalTrue_0100] content: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('onGestureSwipe success');
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('portrait_callback');
      console.info("[verticalTrue_0100] component obj is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[verticalTrue_0100] content1: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content)
        .assertEqual('tabs: onWillShow1-onWillShow2-onWillHide1-onAnimationStart-onChange-onAnimationEnd-');
      console.info('[verticalTrue_0100] END');
      done();
    });
  })
}
