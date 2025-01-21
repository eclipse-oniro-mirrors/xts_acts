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

import {describe, beforeAll, beforeEach, afterEach, it, expect} from "@ohos/hypium"
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function PinchGestureHandlerTest() {

  describe('PinchGestureHandlerTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureHandler/PinchGestureHandler',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PinchGestureHandler state pages: " + JSON.stringify(pages));
        if (!("PinchGestureHandler" == pages.name)) {
          console.info("get PinchGestureHandler state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push PinchGestureHandler success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PinchGestureHandler page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("PinchGestureHandler after each called");
    });

    /**
     * @tc.number    PinchGestureHandler_0010
     * @tc.name      PinchGestureHandlerOptions
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('PinchGestureHandler_0010', 0, async (done: Function) => {
      console.info('PinchGestureHandler_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('PinchGestureHandlerColumn'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PinchGestureHandler1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.label).assertEqual('succ');
      console.info('[PinchGestureHandler_0010] END');
      done();
    });
  })
}
