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

export default function navigation_pushDestinationByName6() {
  describe('navigation_pushDestinationByName6',  () =>{
    beforeEach(async  (done:Function) =>{
      console.info("navigation_pushDestinationByName6 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation_pushResult/navigation_pushDestinationByName6',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get navigation_pushDestinationByName6 state pages:" + JSON.stringify(pages));
        if (!("navigation_pushDestinationByName6" == pages.name)) {
          console.info("get navigation_pushDestinationByName6 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push navigation_pushDestinationByName6 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push navigation_pushDestinationByName6 page error:" + err);
      }
      console.info("navigation_pushDestinationByName6 beforeEach end");
      done();
    });
    afterEach(async  () =>{
      await CommonFunc.sleep(1000);
      console.info("navigation_pushDestinationByName6 after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_PUSH_007
     * @tc.name      navigation_pushDestinationByName6_0100
     * @tc.desc      Navigation pushDestinationByName result test
     * @tc.level     Level 1
     */
    it('navigation_pushDestinationByName6_0100',  Level.LEVEL0, async  (done:Function) =>{
      console.info('[navigation_pushDestinationByName6_0100] START');
      await CommonFunc.sleep(2000);

      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn1 = await driver.findComponent(ON.id('navigation_pushDestinationByName6_pushDestination'));
      await btn1.click();
      await CommonFunc.sleep(2000);

      let text1 = getInspectorByKey('navigation_pushDestinationByName6_text_str');
      expect(JSON.parse(text1).$attrs.content).assertEqual('success');

      console.info('[navigation_pushDestinationByName6_0100] END');
      done();
    });

  })
}
