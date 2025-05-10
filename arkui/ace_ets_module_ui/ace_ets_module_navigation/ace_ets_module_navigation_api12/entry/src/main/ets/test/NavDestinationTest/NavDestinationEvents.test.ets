/*
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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function NavDestinationEvents() {
  describe('NavDestinationEvents', () => {
    beforeEach(async (done: Function) => {
      console.info("NavDestinationEvents beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/NavDestination/NavDestinationEvents',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavDestinationEvents state pages:" + JSON.stringify(pages));
        if (!("NavDestinationEvents" == pages.name)) {
          console.info("get NavDestinationEvents pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavDestinationEvents page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavDestinationEvents page error:" + err);
      }
      console.info("NavDestinationEvents beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("NavDestinationEvents after each called");
    });


    /**
     * @tc.number    NavDestinationEvents_0100
     * @tc.name      NavDestinationEvents_0100
     * @tc.desc      Test NavDestination onWillAppear
     * @tc.level     Level 2
     */
    it('NavDestinationEvents_0100', 0, async (done: Function) => {
      console.info('NavDestinationEvents_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('NavDestinationEvents_pageOne'));
      await btn1.click()
      console.info("[NavDestinationEvents_0100] btn1");
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('NavDestinationEvents_text1');
      let obj1: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[NavDestinationEvents_0100] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('onWillAppear');

      let btn2 = await driver.findComponent(ON.id('NavDestinationEvents_pop'));
      await btn2.click()
      console.info("[NavDestinationEvents_0100] btn2");
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('NavDestinationEvents_text2');
      let obj2: ESObject = JSON.parse(strJson2);
      await CommonFunc.sleep(1000);
      console.info("[NavDestinationEvents_0100] obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('onWillDisappear');

      console.info('NavDestinationEvents_0100 END');
      done();
    });



  })
}