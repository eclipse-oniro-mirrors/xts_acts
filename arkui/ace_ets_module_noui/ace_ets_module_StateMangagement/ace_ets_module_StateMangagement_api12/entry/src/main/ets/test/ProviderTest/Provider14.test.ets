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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
export default function Provider14Test() {
  describe('Provider14Test', () => {
    beforeEach(async (done: Function) => {
      console.info("Provider14Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Provider/Provider14',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Provider14Test state pages: " + JSON.stringify(pages));
        if (!("Provider14" == pages.name)) {
          console.info("get Provider14Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Provider14Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Provider14Test page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    Provider14
     * @tc.name      Provider14Test_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Provider14Test_0100', 0, async (done: Function) => {
      console.info('Provider14Test_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('Provider14'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strBut = getInspectorByKey('Provider14');
      let objBut: ESObject = JSON.parse(strBut);
      console.info("[Provider14Test_0100] component objBut is: " + JSON.stringify(objBut));
      expect(objBut.$attrs.label).assertEqual('1');
      console.info('[Provider14Test_0100] END');
      done();
    });
  })
}

