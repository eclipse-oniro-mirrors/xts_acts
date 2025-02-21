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
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
export default function NavigationMode17Jsunit() {
  describe('NavigationMode17Jsunit', function () {
    beforeEach(async function (done) {
      console.info("NavigationMode17Jsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/Navigation/NavigationModel17',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationMode17Jsunit state pages:" + JSON.stringify(pages));
        if (!("NavigationModel17" == pages.name)) {
          console.info("get NavigationMode17Jsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push NavigationMode17Jsunit success " + JSON.stringify(result));
          await CommonFunc.sleep(3000);
        }
      } catch (err) {
        console.error("push NavigationMode17Jsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MODE_0050
    * @tc.name  : NavigationMode17Jsunit_0100
    * @tc.desc  : NavigationMode: Dynamically switches the stack mode and split mode.
    * @tc.level : Level 3
    */
    it('NavigationMode17Jsunit_0100', 0, async function (done) {
      console.info('NavigationMode17Jsunit_0100 START')
      await CommonFunc.sleep(1000);
      let driver = await UiDriver.create()
      await CommonFunc.sleep(1000);
      let CZbutton = await driver.findComponent(BY.key('NavigationModel17But'));
      await CZbutton.click();
      await CommonFunc.sleep(2000);
      let strcontent = getInspectorByKey('NavigationModel17Txt');
      let obj = JSON.parse(strcontent);
      await CommonFunc.sleep(1000);
      console.info('NavigationMode17Jsunit_0100 component obj is: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('doing2');
      console.info('NavigationMode17Jsunit_0100 END')
      done();
    });
  })
}