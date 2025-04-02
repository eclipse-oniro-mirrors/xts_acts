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
export default function NavigationStack13Jsunit() {
  describe('NavigationStack13Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("NavigationStack13Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationStack13',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationStack13Jsunit state pages:" + JSON.stringify(pages));
        if (!("NavigationStack13" == pages.name)) {
          console.info("get NavigationStack13Jsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push NavigationStack13Jsunit success " + JSON.stringify(result));
          await CommonFunc.sleep(3000);
        }
      } catch (err) {
        console.error("push NavigationStack13Jsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_HIDENAVBAR_0080
    * @tc.name  : NavigationStack13Jsunit_0100
    * @tc.desc  : The NavigationMode mode is split, and the NavigationMode mode is dynamically changed to stack.
    * @tc.level : Level 3
    */
    it('NavigationStack13Jsunit_0100', 0, async (done: Function) => {
      console.info('NavigationStack13Jsunit_0100 START')
      await CommonFunc.sleep(1000);
      let driver = await UiDriver.create()
      await CommonFunc.sleep(500);
      let CZbutton = await driver.findComponent(BY.key('NavigationStack13ListItemText1'));
      await CZbutton.click();
      await CommonFunc.sleep(2000);
      let YCbutton = await driver.findComponent(BY.key('NavigationStack13True'));
      await YCbutton.click();
      await CommonFunc.sleep(2000);
      let buttoncontent = await driver.findComponent(BY.key('NavigationStack13ButtonContent'));
      await buttoncontent.click();
      await CommonFunc.sleep(2000);
      let changecontent = await driver.findComponent(BY.key('NavigationStack13clear'));
      await changecontent.click();
      await CommonFunc.sleep(2000);
      let textcontent = getInspectorByKey('NavigationStack13TextCont');
      let textobj: ESObject = JSON.parse(textcontent);
      console.info('NavigationStack13Jsunit_0100 component textobj is: ' + textobj.$attrs.content);
      expect(textobj.$attrs.content).assertEqual('clicked1');
      console.info('NavigationStack13Jsunit_0100 END')
      done();
    });

  })
}