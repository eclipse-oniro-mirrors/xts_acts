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

export default function LongPressGestureHandlerTest() {

  describe('LongPressGestureHandlerTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureHandler/LongPressGestureHandler',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LongPressGestureHandler state pages: " + JSON.stringify(pages));
        if (!("LongPressGestureHandler" == pages.name)) {
          console.info("get LongPressGestureHandler state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push LongPressGestureHandler success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LongPressGestureHandler page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LongPressGestureHandler after each called");
    });

    /**
     * @tc.name   LongPressGestureHandler_0010
     * @tc.number LongPressGestureHandler_0010
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LongPressGestureHandler_0010', Level.LEVEL0, async (done: Function) => {
      console.info('LongPressGestureHandler_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('LongPressGestureHandlerColumn'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('LongPressGestureHandler1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.label).assertEqual('succ');
      console.info('[LongPressGestureHandler_0010] END');
      done();
    });
  })
}
