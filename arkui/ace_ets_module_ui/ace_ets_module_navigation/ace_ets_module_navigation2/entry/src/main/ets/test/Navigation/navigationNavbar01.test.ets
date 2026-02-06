/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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


export default function navigationNavbar01() {
  describe('navigationNavbar01',  () =>{
    beforeEach(async  (done:Function) =>{
      console.info("navigationNavbar01 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/navigationNavbar01',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get navigationNavbar01 state pages: " + JSON.stringify(pages));
        if (!("navigationNavbar01" == pages.name)) {
          console.info("get navigationNavbar01 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push navigationNavbar01 page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push navigationNavbar01 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   navigationNavbar01_001
     * @tc.number navigationNavbar01_001
     * @tc.desc   Set NavigationWidth to 300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('navigationNavbar01_001',  Level.LEVEL0, async  (done:Function) =>{
      console.info('[navigationNavbar01_001] START');
      globalThis.value.message.notify({name:'NavigationWidth', value: 300 });
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('NavRouter0'));
      await button.click();
      await CommonFunc.sleep(1000);
      let navigationText01 = CommonFunc.getComponentRect('navigationText01');
      expect(Math.abs(Math.round(navigationText01.right - navigationText01.left) - Math.round(vp2px(300))) <= 1).assertTrue();
      console.info('[navigationNavbar01_001] END');
      done();
    });

    /**
     * @tc.name   navigationNavbar01_002
     * @tc.number navigationNavbar01_002
     * @tc.desc   Set NavigationWidth to 200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('navigationNavbar01_002',  Level.LEVEL0, async  (done:Function) =>{
      console.info('[navigationNavbar01_002] START');
      globalThis.value.message.notify({name:'NavigationWidth', value: 200 });
      await CommonFunc.sleep(1000);
      let navigationText01 = CommonFunc.getComponentRect('navigationText01');
      expect(Math.abs(Math.round(navigationText01.right - navigationText01.left) - Math.round(vp2px(200))) <= 1).assertTrue();
      console.info('[navigationNavbar01_002] END');
      done();
    });
  })
}
