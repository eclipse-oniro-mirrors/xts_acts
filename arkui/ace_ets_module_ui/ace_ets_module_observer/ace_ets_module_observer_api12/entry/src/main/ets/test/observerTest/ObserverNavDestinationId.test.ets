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


export default function ObserverNavDestinationId() {
  describe('ObserverNavDestinationId', () => {
    beforeEach(async (done: Function) => {
      console.info("ObserverNavDestinationId beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/observer/ObserverNavDestinationId',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ObserverNavDestinationId state success " + JSON.stringify(pages));
        if (!("ObserverNavDestinationId" == pages.name)) {
          console.info("get ObserverNavDestinationId state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ObserverNavDestinationId page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ObserverNavDestinationId page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ObserverNavDestinationId after each called");
    });


    /**
     * @tc.number    ObserverNavDestinationId_0100
     * @tc.name      ObserverNavDestinationId_0100
     * @tc.desc      Test Observer NavDestinationInfo navDestinationId
     * @tc.level:    Level 2
     */
    it('ObserverNavDestinationId_0100', 0, async (done: Function) => {
      console.info('[ObserverNavDestinationId_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('ObserverNavDestinationId_pageOne'));
      await btn1.click()
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('ObserverNavDestinationId_text1');
      let obj1: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[ObserverNavDestinationId_0100] obj1 is: " + JSON.stringify(obj1));

      let strJson2 = getInspectorByKey('ObserverNavDestinationId_text2');
      let obj2: ESObject = JSON.parse(strJson2);
      await CommonFunc.sleep(1000);
      console.info("[ObserverNavDestinationId_0100] obj2 is: " + JSON.stringify(obj2));

      expect(obj1.$attrs.content).assertEqual(obj2.$attrs.content);

      console.info('[ObserverNavDestinationId_0100] END');
      done();
    });
  })
}

