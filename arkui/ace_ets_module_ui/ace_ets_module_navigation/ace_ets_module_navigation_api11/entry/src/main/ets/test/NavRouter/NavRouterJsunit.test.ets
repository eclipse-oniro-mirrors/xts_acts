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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';


export default function NavRouterJsunit() {
  describe('NavRouterJsunit',  () =>{
    beforeEach(async  (done:Function) =>{
      console.info("NavRouter beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/NavRouter/NavRouterPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavRouter state pages: " + JSON.stringify(pages));
        if (!("NavRouterPage" == pages.name)) {
          console.info("get NavRouter state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push NavRouter page result: " + JSON.stringify(result));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push NavRouter page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('NavRouterJsunit_0100',  Level.LEVEL0, async  (done:Function) =>{
      // Verify onStateChange function of the main title
      console.info('[NavRouterJsunit_0100] START');
      let driver = await Driver.create()
      let navRouter = await driver.findComponent(ON.id('NavRouter1'));
      await navRouter.click();
      await CommonFunc.sleep(1000);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      let router1Component = await scrollBar.scrollSearch(ON.id('TestRouter'));
      let router1State = await router1Component.getText();
      // router1 state is true
      console.info("[NavRouterJsunit_0100] textRouter: " + JSON.stringify(router1State));
      expect(router1State == 'stateChange true').assertTrue();
      let navRouter2 = await scrollBar.scrollSearch(ON.id('NavRouter2'));
      await navRouter2.click();
      await CommonFunc.sleep(1000);
      let stateChange = await scrollBar.scrollSearch(ON.id('testT'));
      let text1 = await stateChange.getText();
      console.info("[NavRouterJsunit_0100] text1: " + JSON.stringify(text1));
      expect(text1 == 'stateChange true').assertTrue();
      let textComponent = await scrollBar.scrollSearch(ON.id('textContent'));
      let text2 = await textComponent.getText();
      console.info("[NavRouterJsunit_0100] text2: " + JSON.stringify(text2));
      expect(text2 == 'Hello').assertTrue();
      // check navouter1 state is false
       let router1Component2 = await scrollBar.scrollSearch(ON.id('TestRouter'));
      router1State = await router1Component2.getText();
      console.info("[NavRouterJsunit_0100] textRouter: " + JSON.stringify(router1State));
      expect(router1State == 'stateChange false').assertTrue();
      console.info('[NavRouterJsunit_0100] END');
      done();
    });
  })
}
