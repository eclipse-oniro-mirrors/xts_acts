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

export default function NavigationMode04Jsunit() {
  describe('NavigationMode04Jsunit',  () =>{
    beforeEach(async  (done:Function) =>{
      console.info("NavigationMode04Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationModel04',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationMode04Jsunit state pages:" + JSON.stringify(pages));
        if (!("NavigationModel04" == pages.name)) {
          console.info("get NavigationMode04Jsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push NavigationMode04Jsunit success " + JSON.stringify(result));
          await CommonFunc.sleep(3000);
        }
      } catch (err) {
        console.error("push NavigationMode04Jsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
     /* *
    * @tc.number: SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MODE_0080
    * @tc.name  : NavigationMode04Jsunit_0100
    * @tc.desc  : The width of Navigation is greater than 600 vp. The width of Navigation is dynamically changed to less than 600 vp.
    * @tc.level : Level 3
    */
    it('NavigationMode04Jsunit_0100', 0, async  (done:Function) =>{
      await CommonFunc.sleep(1000);
      let driver = await UiDriver.create()
      await CommonFunc.sleep(500);
      let CZbutton = await driver.findComponent(BY.key('NavigationModel04button'));
      await CZbutton.click();
      await CommonFunc.sleep(2000);
      let strcontent = getInspectorByKey('NavigationModel04text');
      await CommonFunc.sleep(1000);
      console.info('NavigationMode04Jsunit_0100 component obj is: ' + JSON.parse(strcontent).$attrs.content);
      expect(JSON.parse(strcontent).$attrs.content).assertEqual('doing2');
      console.info('NavigationMode04Jsunit_0100 END')
      done();
    });

  })
}