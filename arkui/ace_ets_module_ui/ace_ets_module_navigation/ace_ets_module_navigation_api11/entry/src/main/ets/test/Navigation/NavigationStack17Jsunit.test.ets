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
export default function NavigationStack17Jsunit() {
  describe('NavigationStack17Jsunit',  () =>{
    beforeEach(async  (done:Function) =>{
      console.info("NavigationStack17Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationStack17',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationStack17Jsunit state pages:" + JSON.stringify(pages));
        if (!("NavigationStack17" == pages.name)) {
          console.info("get NavigationStack17Jsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push NavigationStack17Jsunit success " + JSON.stringify(result));
          await CommonFunc.sleep(3000);
        }
      } catch (err) {
        console.error("push NavigationStack17Jsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_HIDENAVBAR_0050
    * @tc.name  : NavigationStack17Jsunit_0100
    * @tc.desc  : NavigationMode is set to auto, and NavigationMode is set to stack.
    * @tc.level : Level 3
    */
    it('NavigationStack17Jsunit_0100',  Level.LEVEL0, async  (done:Function) =>{
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let CZbutton = await driver.findComponent(ON.id('NavigationStack17ListItemText1'));
      await CZbutton.click();
      await CommonFunc.sleep(2000);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      let YCbutton = await scrollBar.scrollSearch(ON.id('NavigationStack17True'));
      await YCbutton.click();
      await CommonFunc.sleep(2000);
      let ZKbutton = await scrollBar.scrollSearch(ON.id('NavigationStack17False'));
      await ZKbutton.click();
      await CommonFunc.sleep(2000);
      let buttoncontent = await scrollBar.scrollSearch(ON.id('NavigationStack17ButtonContent'));
      await buttoncontent.click();
      await CommonFunc.sleep(2000);
      let textcontent = getInspectorByKey('NavigationStack17TextCont');
      console.info('NavigationStack17Jsunit_0100 component textobj is: ' + JSON.parse(textcontent).$attrs.content);
      expect(JSON.parse(textcontent).$attrs.content).assertEqual('clicked1');
      console.info('NavigationStack17Jsunit_0100 END')
      done();
    });

  })
}