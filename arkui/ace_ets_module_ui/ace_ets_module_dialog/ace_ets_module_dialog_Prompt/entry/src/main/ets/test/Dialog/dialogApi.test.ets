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
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function dialogApi() {
  describe('dialogApi', () => {
    beforeEach(async (done: Function) => {
      console.info("dialogApi beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get dialogApi state pages:" + JSON.stringify(pages));
        if (!("dialogApi" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Dialog/dialogApi"})
          await CommonFunc.sleep(2000);
          console.info("push dialogApi page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push dialogApi page error:" + err);
      }
      console.info("dialogApi foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("dialogApi after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_Dialog_001
     * @tc.desc      background test of Dialog
     * @tc.level     Level 3
     * @tc.type
     */

    it('dialogApi_0100', Level.LEVEL2, async (done: Function) => {

      console.info('dialogApi_0100 START');
      let driver = await Driver.create();
      let button = await driver.findComponent(ON.id('dialogApiBt'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('dialogApiBt');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dialogApi_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual("dialogApi");
      console.info('[dialogApi_0100] END');
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070)
      await CommonFunc.sleep(1000);
      done();
    });




  })
}
