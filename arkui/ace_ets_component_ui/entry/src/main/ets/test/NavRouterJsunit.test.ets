/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';


export default function NavRouterJsunit() {
  describe('NavRouterJsunit', function () {
    beforeEach(async function (done) {
      console.info("NavRouter beforeEach start");
      let options = {
        uri: 'MainAbility/pages/NavRouterPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavRouter state pages: " + JSON.stringify(pages));
        if (!("NavRouterPage" == pages.name)) {
          console.info("get NavRouter state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push NavRouter page result: " + JSON.stringify(result));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push NavRouter page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('NavRouterJsunit_0100', 0, async function (done) {
      // Verify onStateChange function of the main title
      console.info('[NavRouterJsunit_0100] START');
      let driver = await UiDriver.create()
      let navRouter = await driver.findComponent(BY.key('NavRouter1'));
      await navRouter.click();
      await CommonFunc.sleep(1000);
      let router1Component = await driver.findComponent(BY.key('TestRouter'));
      let router1State = await router1Component.getText();
      // router1 state is true
      console.info("[NavRouterJsunit_0100] textRouter: " + JSON.stringify(router1State));
      expect(router1State == 'stateChange true').assertTrue();
      let navRouter2 = await driver.findComponent(BY.key('NavRouter2'));
      await navRouter2.click();
      await CommonFunc.sleep(1000);
      let stateChange = await driver.findComponent(BY.key('testT'));
      let text1 = await stateChange.getText();
      console.info("[NavRouterJsunit_0100] text1: " + JSON.stringify(text1));
      expect(text1 == 'stateChange true').assertTrue();
      let textComponent = await driver.findComponent(BY.key('textContent'));
      let text2 = await textComponent.getText();
      console.info("[NavRouterJsunit_0100] text2: " + JSON.stringify(text2));
      expect(text2 == 'Hello').assertTrue();
      // check navouter1 state is false
      router1State = await router1Component.getText();
      console.info("[NavRouterJsunit_0100] textRouter: " + JSON.stringify(router1State));
      expect(router1State == 'stateChange false').assertTrue();
      console.info('[NavRouterJsunit_0100] END');
      done();
    });

  })
}
