/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function DrawableTabBarIndicatorPage() {
  describe('DrawableTabBarIndicatorPage', () => {
    beforeEach(async (done: Function) => {
      console.info("DrawableTabBarIndicatorPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TabContent/DrawableTabBarIndicatorPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DrawableTabBarIndicatorPage state pages:" + JSON.stringify(pages));
        if (!("DrawableTabBarIndicatorPage" == pages.name)) {
          console.info("get DrawableTabBarIndicatorPage pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push DrawableTabBarIndicatorPage page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DrawableTabBarIndicatorPage page error:" + err);
      }
      console.info("DrawableTabBarIndicatorPage beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("DrawableTabBarIndicatorPage after each called");
    });
    /**
     * @tc.number    DrawableTabBarIndicatorPage_0100
     * @tc.name      DrawableTabBarIndicatorPage_0100
     * @tc.desc      test DrawableTabBarIndicator
     * @tc.level     Level 1
     * @tc.type
     */
    it('DrawableTabBarIndicatorPage_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[DrawableTabBarIndicatorPage_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn1 = await driver.findComponent(ON.id('tabId1'));
      await btn1.click();
      console.info('[DrawableTabBarIndicatorPage_0100] btn1 click');
      await CommonFunc.sleep(2000);
      let callbackJson = getInspectorByKey('tabId1');
      let obj: ESObject = JSON.parse(callbackJson);
      console.info('[DrawableTabBarIndicatorPage_0100] component obj is: ' + JSON.stringify(obj));
      let indicator: ESObject = obj?.$attrs?.tabBar?.indicator;
      console.log('[DrawableTabBarIndicatorPage_0100] indicator is : ',  JSON.stringify(indicator))
      console.log('[DrawableTabBarIndicatorPage_0100] indicator height is : ',  indicator?.height)
      console.log('[DrawableTabBarIndicatorPage_0100] indicator width is : ',  indicator?.width)
      console.log('[DrawableTabBarIndicatorPage_0100] indicator borderRadius is : ',  indicator?.borderRadius)
      console.log('[DrawableTabBarIndicatorPage_0100] indicator marginTop is : ',  indicator?.marginTop)
      expect(indicator?.height).assertEqual('10.00vp');
      expect(indicator?.width).assertEqual('70.00vp');
      expect(indicator?.borderRadius).assertEqual('5.00vp');
      expect(indicator?.marginTop).assertEqual('5.00vp');
      console.info('[testRichEditor_0100] END');
      done();
    });

  })
}
