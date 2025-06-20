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

export default function NavigationOnPop() {
  describe('NavigationOnPop', () => {
    beforeEach(async (done: Function) => {
      console.info("NavigationOnPop beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationOnPop',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationOnPop state pages:" + JSON.stringify(pages));
        if (!("NavigationOnPop" == pages.name)) {
          console.info("get NavigationOnPop pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavigationOnPop page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavigationOnPop page error:" + err);
      }
      console.info("NavigationOnPop beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("NavigationOnPop after each called");
    });


    /**
     * @tc.number    NavigationOnPop_0100
     * @tc.name      NavigationOnPop_0100
     * @tc.desc      Test NavPathInfo onPop
     * @tc.level     Level 2
     */
    it('NavigationOnPop_0100', 0, async (done: Function) => {
      console.info('NavigationOnPop_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('NavigationOnPop_pageOne'));
      await btn1.click()
      console.info("[NavigationOnPop_0100] btn1");
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('NavigationOnPop_pop'));
      await btn2.click()
      console.info("[NavigationOnPop_0100] btn2");
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('NavigationOnPop_text1');
      let obj1: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[NavigationOnPop_0100] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('page:pageOne;param:str;result:{"value":"pageOnePop"}');

      console.info('NavigationOnPop_0100 END');
      done();
    });


  })
}