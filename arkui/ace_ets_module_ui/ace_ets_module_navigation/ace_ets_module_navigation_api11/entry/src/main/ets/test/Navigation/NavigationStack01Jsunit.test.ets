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
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function NavigationStack01Jsunit() {
  describe('NavigationStack01Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("NavigationStack01Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationStack01',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationStack01Jsunit state pages:" + JSON.stringify(pages));
        if (!("NavigationStack01" == pages.name)) {
          console.info("get NavigationStack01Jsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push NavigationStack01Jsunit success " + JSON.stringify(result));
          await CommonFunc.sleep(3000);
        }
      } catch (err) {
        console.error("push NavigationStack01Jsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_HIDENAVBAR_0206
    * @tc.name  : NavigationStack01Jsunit_0100
    * @tc.desc  : The NavPathStack is set. The content is not empty and the content in the content area can be focused.
    * @tc.level : Level 3
    */
    it('NavigationStack01Jsunit_0100', 0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      let driver = await UiDriver.create()
      await CommonFunc.sleep(500);
      let CZbutton = await driver.findComponent(BY.key('NavigationStack01ListItemText1'));
      await CZbutton.click();
      await CommonFunc.sleep(2000);
      let YCbutton = await driver.findComponent(BY.key('NavigationStack01True'));
      await YCbutton.click();
      await CommonFunc.sleep(2000);
      let strfocus = getInspectorByKey('NavigationStack01Focus');
      console.info('NavigationStack01Jsunit_0100 component focusobj is: ' + JSON.parse(strfocus).$attrs.content);
      expect(JSON.parse(strfocus).$attrs.content).assertEqual('FocusDone');
      console.info('NavigationStack01Jsunit_0100 END')
      done();
    });

  })
}