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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import CommonFunc from '../../MainAbility/utils/Common';
import { Driver, ON } from '@ohos.UiTest';


export default function ObserverNavDestinationState() {
    describe('ObserverNavDestinationState', () => {
      beforeEach(async (done: Function) => {
        console.info("ObserverNavDestinationState beforeEach start");
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/observer/ObserverNavDestinationState',
        }
        try {
          router.clear();
          let pages = router.getState();
          console.info("get ObserverNavDestinationState state success " + JSON.stringify(pages));
          if (!("ObserverNavDestinationState" == pages.name)) {
            console.info("get ObserverNavDestinationState state success " + JSON.stringify(pages.name));
            let result = await router.pushUrl(options);
            await CommonFunc.sleep(2000);
            console.info("push ObserverNavDestinationState page success " + JSON.stringify(result));
          }
        } catch (err) {
          console.error("push ObserverNavDestinationState page error: " + err);
        }
        done()
      });

      afterEach(async () => {
        await CommonFunc.sleep(1000);
        console.info("ObserverNavDestinationState after each called");
      });


      /**
     * @tc.number    ObserverNavDestinationState_0100
     * @tc.name      ObserverNavDestinationState_0100
     * @tc.desc      Test Observer NavDestinationState
     * @tc.level:    Level 2
     */
    it('ObserverNavDestinationState_0100', 0, async (done: Function) => {
      console.info('[ObserverNavDestinationState_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('ObserverNavDestinationState_pageOne'));
      await btn1.click()
      console.info("[ObserverNavDestinationState_0100] btn1");
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('ObserverNavDestinationState_pageTwo'));
      await btn2.click()
      console.info("[ObserverNavDestinationState_0100] btn2");
      await CommonFunc.sleep(1000);

      await driver.pressBack()
      await CommonFunc.sleep(2000);

      let btn3 = await driver.findComponent(ON.id('ObserverNavDestinationState_get'));
      await btn3.click()
      console.info("[ObserverNavDestinationState_0100] btn2");
      await CommonFunc.sleep(3000);

      let strJson1 = getInspectorByKey('ObserverNavDestinationState_text');
      let obj1: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(2000);
      console.info("[ObserverNavDestinationState_0100] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('1ON_WILL_APPEAR;1ON_APPEAR;1ON_WILL_SHOW;1ON_SHOWN;2ON_WILL_APPEAR;1ON_WILL_HIDE;2ON_APPEAR;2ON_WILL_SHOW;1ON_HIDDEN;2ON_SHOWN;2ON_BACKPRESS;2ON_WILL_HIDE;1ON_WILL_SHOW;2ON_HIDDEN;2ON_WILL_DISAPPEAR;1ON_SHOWN;2ON_DISAPPEAR;');

      console.info('[ObserverNavDestinationState_0100] END');
      done();
    });
  })
}

