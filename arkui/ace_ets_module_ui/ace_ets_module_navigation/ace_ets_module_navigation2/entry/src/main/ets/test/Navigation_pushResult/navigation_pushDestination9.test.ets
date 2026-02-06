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

export default function navigation_pushDestination9() {
  describe('navigation_pushDestination9',  () =>{
    beforeEach(async  (done:Function) =>{
      console.info("navigation_pushDestination9 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation_pushResult/navigation_pushDestination9',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get navigation_pushDestination9 state pages:" + JSON.stringify(pages));
        if (!("navigation_pushDestination9" == pages.name)) {
          console.info("get navigation_pushDestination9 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push navigation_pushDestination9 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push navigation_pushDestination9 page error:" + err);
      }
      console.info("navigation_pushDestination9 beforeEach end");
      done();
    });
    afterEach(async  () =>{
      await CommonFunc.sleep(1000);
      console.info("navigation_pushDestination9 after each called");
    });

    /**
     * @tc.name   navigation_pushDestination9_0100
     * @tc.number navigation_pushDestination9_0100
     * @tc.desc   Navigation pushDestination result test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('navigation_pushDestination9_0100',  Level.LEVEL0, async  (done:Function) =>{
      console.info('[navigation_pushDestination9_0100] START');
      await CommonFunc.sleep(2000);

      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn1 = await driver.findComponent(ON.id('navigation_pushDestination9_pushDestinationOne'));
      await btn1.click();
      await CommonFunc.sleep(2000);
      console.info('[navigation_pushDestination9_0100] btn1');

      let text1 = getInspectorByKey('navigation_pushDestination9_text_result1');
      expect(JSON.parse(text1).$attrs.content).assertEqual('success');

      let btn2 = await driver.findComponent(ON.id('navigation_pushDestination9_pop'));
      await btn2.click();
      await CommonFunc.sleep(2000);
      console.info('[navigation_pushDestination9_0100] btn2');

      let btn3 = await driver.findComponent(ON.id('navigation_pushDestination9_pushDestinationTwo'));
      await btn3.click();
      await CommonFunc.sleep(2000);
      console.info('[navigation_pushDestination9_0100] btn3');

      let text2 = getInspectorByKey('navigation_pushDestination9_text_result2');
      expect(JSON.parse(text2).$attrs.content).assertEqual('100006NavDestination not found.');

      let btn4 = await driver.findComponent(ON.id('navigation_pushDestination9_btn'));
      await btn4.click();
      await CommonFunc.sleep(2000);
      console.info('[navigation_pushDestination9_0100] btn4');

      let btn5 = await driver.findComponent(ON.id('navigation_pushDestination9_pushDestinationThree'));
      await btn5.click();
      await CommonFunc.sleep(2000);
      console.info('[navigation_pushDestination9_0100] btn5');

      let text3 = getInspectorByKey('navigation_pushDestination9_text_result3');
      expect(JSON.parse(text3).$attrs.content).assertEqual('100005Builder function not registered.');

      console.info('[navigation_pushDestination9_0100] END');
      done();
    });

  })
}
