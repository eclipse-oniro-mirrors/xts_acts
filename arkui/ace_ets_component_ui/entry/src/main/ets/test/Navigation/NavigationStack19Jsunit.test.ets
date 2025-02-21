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
export default function NavigationStack19Jsunit() {
  describe('NavigationStack19Jsunit', function () {
    beforeEach(async function (done) {
      console.info("NavigationStack19Jsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/Navigation/NavigationStack19',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationStack19Jsunit state pages:" + JSON.stringify(pages));
        if (!("NavigationStack19" == pages.name)) {
          console.info("get NavigationStack19Jsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push NavigationStack19Jsunit success " + JSON.stringify(result));
          await CommonFunc.sleep(3000);
        }
      } catch (err) {
        console.error("push NavigationStack19Jsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_HIDENAVBAR_0070
    * @tc.name  : NavigationStack19Jsunit_0100
    * @tc.desc  : When NavigationMode is set to split, hideNavBar is dynamically changed to false.
    * @tc.level : Level 3
    */
    it('NavigationStack19Jsunit_0100', 0, async function (done) {
      await CommonFunc.sleep(1000);
      let driver = await UiDriver.create()
      await CommonFunc.sleep(500);
      let CZbutton = await driver.findComponent(BY.key('NavigationStack19ListItemText1'));
      await CZbutton.click();
      await CommonFunc.sleep(2000);
      let YCbutton = await driver.findComponent(BY.key('NavigationStack19True'));
      await YCbutton.click();
      await CommonFunc.sleep(2000);
      let ZKbutton = await driver.findComponent(BY.key('NavigationStack19False'));
      await ZKbutton.click();
      await CommonFunc.sleep(2000);
      let buttoncontent = await driver.findComponent(BY.key('NavigationStack19ButtonContent'));
      await buttoncontent.click();
      await CommonFunc.sleep(2000);
      let textcontent = getInspectorByKey('NavigationStack19TextCont');
      let textobj = JSON.parse(textcontent);
      console.info('NavigationStack19Jsunit_0100 component textobj is: ' + textobj.$attrs.content);
      expect(textobj.$attrs.content).assertEqual('clicked1');
      let textcontent1 = getInspectorByKey('NavigationStack19Navigation');
      let textobj1 = JSON.parse(textcontent1);
      console.info('NavigationStack19Jsunit_0100 component textobj is: ' + textobj1.$attrs.title);
      expect(textobj1.$attrs.title).assertEqual('NavIndex');
      console.info('NavigationStack19Jsunit_0100 END')
      done();
    });

  })
}