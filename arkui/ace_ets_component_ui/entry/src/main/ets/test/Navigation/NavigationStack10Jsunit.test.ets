/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
export default function NavigationStack10Jsunit() {
  describe('NavigationStack10Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("NavigationStack10Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationStack10',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationStack10Jsunit state pages:" + JSON.stringify(pages));
        if (!("NavigationStack10" == pages.name)) {
          console.info("get NavigationStack10Jsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push NavigationStack10Jsunit success " + JSON.stringify(result));
          await CommonFunc.sleep(3000);
        }
      } catch (err) {
        console.error("push NavigationStack10Jsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_HIDENAVBAR_0130
    * @tc.name  : NavigationStack10Jsunit_0100
    * @tc.desc  : Use NavPathStack but empty content
    * @tc.level : Level 3
    */
    it('NavigationStack10Jsunit_0100', 0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('NavigationStack10pushPathbut'));
      await button.click();
      await CommonFunc.sleep(2000);
      let button1 = await driver.findComponent(ON.id('NavigationStack10True'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let buttonClear = await driver.findComponent(ON.id('NavigationStack10get'));
      await buttonClear.click();
      await CommonFunc.sleep(2000);
      let strfocus = getInspectorByKey('NavigationStack10getText');
      let focusobj: ESObject = JSON.parse(strfocus);
      console.info('NavigationStack10Jsunit_0100 component focusobj is: ' + focusobj.$attrs.content);
      expect(focusobj.$attrs.content).assertEqual('1');
      console.info('NavigationStack10Jsunit_0100 END')
      done();
    });

  })
}