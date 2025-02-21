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
export default function NavigationStack24Jsunit() {
  describe('NavigationStack24Jsunit', function () {
    beforeEach(async function (done) {
      console.info("NavigationStack24Jsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/Navigation/NavigationStack24',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationStack24Jsunit state pages:" + JSON.stringify(pages));
        if (!("NavigationStack24" == pages.name)) {
          console.info("get NavigationStack24Jsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push NavigationStack24Jsunit success " + JSON.stringify(result));
          await CommonFunc.sleep(3000);
        }
      } catch (err) {
        console.error("push NavigationStack24Jsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_HIDENAVBAR_0205
    * @tc.name  : NavigationStack24Jsunit_0100
    * @tc.desc  : In stack mode, the value of hideNavBar is changed from true to false.
    * @tc.level : Level 3
    */
    it('NavigationStack24Jsunit_0100', 0, async function (done) {
      await CommonFunc.sleep(1000);
      let driver = await UiDriver.create()
      await CommonFunc.sleep(500);
      let ZKbutton = await driver.findComponent(BY.key('NavigationStack24False'));
      await ZKbutton.click();
      await CommonFunc.sleep(2000);
      let YCbutton = await driver.findComponent(BY.key('NavigationStack24True'));
      await YCbutton.click();
      await CommonFunc.sleep(2000);
      let textcontent = getInspectorByKey('NavigationStack24Blur');
      let textobj = JSON.parse(textcontent);
      console.info('NavigationStack24Jsunit_0100 component textobj is: ' + textobj.$attrs.content);
      expect(textobj.$attrs.content).assertEqual('false');
      console.info('NavigationStack24Jsunit_0100 END')
      done();
    });

  })
}