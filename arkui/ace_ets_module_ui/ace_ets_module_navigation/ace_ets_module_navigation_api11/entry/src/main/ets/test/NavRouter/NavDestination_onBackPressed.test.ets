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
import CommonFunc from '../../MainAbility/utils/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function NavDestination_onBackPressed() {
  describe('NavDestination_onBackPressed',  () =>{
    beforeEach(async  (done:Function) =>{
      console.info("NavDestination_onBackPressed beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/NavRouter/NavDestination_onBackPressed',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavDestination_onBackPressed state pages:" + JSON.stringify(pages));
        if (!("NavDestination_onBackPressed" == pages.name)) {
          console.info("get NavDestination_onBackPressed pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavDestination_onBackPressed page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavDestination_onBackPressed page error:" + err);
      }
      console.info("NavDestination_onBackPressed beforeEach end");
      done();
    });
    afterEach(async  () =>{
      await CommonFunc.sleep(1000);
      console.info("NavDestination_onBackPressed after each called");
    });
    /**
     * @tc.number    SUB_ACE_NavDestination_onBackPressed_0100
     * @tc.name      testNavRouter
     * @tc.desc      Determine whether the cursor change triggers onSelectionChange
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('NavDestination_onBackPressed_0100',  Level.LEVEL0, async  (done:Function) =>{
      console.info('[NavDestination_onBackPressed_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(300);

      let btn1 = await driver.findComponent(ON.id('NavDestination_onBackPressed_btn1'));
      await btn1.click();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2);
      await CommonFunc.sleep(300);
      let text1 = getInspectorByKey('NavDestination_onBackPressed_text1');
      expect(JSON.parse(text1).$attrs.content).assertEqual('{"number":1}');

      console.info('[NavDestination_onBackPressed_0100] END');
      done();
    });

  })
}
