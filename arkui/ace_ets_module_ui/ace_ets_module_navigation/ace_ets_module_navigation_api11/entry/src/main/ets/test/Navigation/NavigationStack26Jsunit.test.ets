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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
export default function NavigationStack26Jsunit() {
  describe('NavigationStack26Jsunit',  () =>{
    beforeEach(async  (done:Function) =>{
      console.info("NavigationStack26Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationStack26',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationStack26Jsunit state pages:" + JSON.stringify(pages));
        if (!("NavigationStack26" == pages.name)) {
          console.info("get NavigationStack26Jsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push NavigationStack26Jsunit success " + JSON.stringify(result));
          await CommonFunc.sleep(3000);
        }
      } catch (err) {
        console.error("push NavigationStack26Jsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   NavigationStack26Jsunit_0100
     * @tc.number SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_HIDENAVBAR_0202
     * @tc.desc   In auto mode, the value of hideNavBar is changed from true to false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NavigationStack26Jsunit_0100',  Level.LEVEL0, async  (done:Function) =>{
      await CommonFunc.sleep(1000);
      let driver = await UiDriver.create()
      await CommonFunc.sleep(500);
      let ZKbutton = await driver.findComponent(BY.key('NavigationStack26False'));
      await ZKbutton.click();
      await CommonFunc.sleep(2000);
      let YCbutton = await driver.findComponent(BY.key('NavigationStack26True'));
      await YCbutton.click();
      await CommonFunc.sleep(2000);
      let textcontent = getInspectorByKey('NavigationStack26Blur');
      console.info('NavigationStack26Jsunit_0100 component textobj is: ' + JSON.parse(textcontent).$attrs.content);
      expect(JSON.parse(textcontent).$attrs.content).assertEqual('false');
      console.info('NavigationStack26Jsunit_0100 END')
      done();
    });

  })
}