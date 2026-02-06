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
import CommonFunc from '../../MainAbility/utils/Common';

export default function observeTabJsunit() {
  describe('observeTabJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("observeTabJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/observer/observeTab",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get observeTabJsunit state pages:" + JSON.stringify(pages));
        if (!("observeTab" == pages.name)) {
          console.info("get observeTabJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push observeTabJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push observeTabJsunit page error:" + err);
      }
      console.info("observeTabJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("observeTabJsunit after each called");
    });

    /**
     * @tc.number    observeTabJsunit_001
     * @tc.name      observeTabJsunit_001
     * @tc.desc      Switching information of TabContent page.
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('observeTabJsunit_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[observeTabJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1: Component = await driver.findComponent(ON.id('observer_tabOn'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id('change_index'));
      await btn2.click();
      await CommonFunc.sleep(1000);

      let strJson3 = getInspectorByKey('tabs_tabContentId');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[observeTabJsunit_0100] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('tabContentId: tabContent02');
	  
      await CommonFunc.sleep(1000);
      let btn3: Component = await driver.findComponent(ON.id('observer_tabOff'));
      await btn3.click();
      await CommonFunc.sleep(1000);
	  
      console.info('[observeTabJsunit_0100] END');
      done();
    });
  })
}
