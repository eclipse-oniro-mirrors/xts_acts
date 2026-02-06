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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function TapGestureHandlerTest() {

  describe('TapGestureHandlerTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureHandler/TapGestureHandler',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TapGestureHandler state pages: " + JSON.stringify(pages));
        if (!("TapGestureHandler" == pages.name)) {
          console.info("get TapGestureHandler state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TapGestureHandler success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TapGestureHandler page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TapGestureHandler after each called");
    });

    /**
     * @tc.number    TapGestureHandler_0010
     * @tc.name      TapGestureHandlerOptions
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('TapGestureHandler_0010', Level.LEVEL0, async (done: Function) => {
      console.info('TapGestureHandler_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('TapGestureHandlerColumn'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TapGestureHandler1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.label).assertEqual('tap succ');
      console.info('[TapGestureHandler_0010] END');
      done();
    });
  })
}
