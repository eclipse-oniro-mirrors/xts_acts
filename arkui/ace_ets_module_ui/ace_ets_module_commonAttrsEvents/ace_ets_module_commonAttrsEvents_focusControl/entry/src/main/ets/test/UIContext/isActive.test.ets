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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from "@ohos/hypium"
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function isActiveTest() {

  describe('isActiveTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/isActive",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get isActive state pages: " + JSON.stringify(pages));
        if (!("NormalEts" == pages.name)) {
          console.info("get isActive state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info("push isActive success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push isActive page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("isActive after each called");
    });

    /**
     * @tc.name   isActiveTest_0010
     * @tc.number isActiveTest_0010
     * @tc.desc   api for test isActive true and false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isActiveTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('isActive_0010 START');
      let driver : Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let setFocus = await driver.findComponent(ON.id('setFocus'));
      await setFocus.click();
      await CommonFunc.sleep(500);
      console.info('[isActive_0010] isActiveTestTrueResult: ' + AppStorage.get('isActiveTestTrueResult'));
      expect(AppStorage.get('isActiveTestTrueResult')).assertEqual(true);

      let notSetFocus = await driver.findComponent(ON.id('notSetFocus'));
      await notSetFocus.click();
      await CommonFunc.sleep(500);
      console.info('[isActive_0010] isActiveTestFalseResult: ' + AppStorage.get('isActiveTestFalseResult'));
      expect(AppStorage.get('isActiveTestFalseResult')).assertEqual(false);
      console.info('[isActive_0010] END');
      done();
    });
  })
}