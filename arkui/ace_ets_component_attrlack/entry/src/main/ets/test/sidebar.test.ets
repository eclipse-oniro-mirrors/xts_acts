/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"
import Utils from './Utils.ets'

export default function sidebarIconsJsunit() {
  describe('sidebarIconsTest', function () {
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/sidebar',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get sidebar state success " + JSON.stringify(pages));
        if (!("sidebarIcons" == pages.name)) {
          console.info("get sidebar state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push sidebar page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push sidebar page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("sidebarIcons after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0011
     * @tc.name         testsidebarIcons0011
     * @tc.desic         acesidebarIconsEtsTest0011
     */
    it('testsidebarIcons0011', 0, async function (done) {
      console.info('sidebarIcons testsidebarIcons0011 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('SideBarContainer');
      console.info("[testsidebarIcons0011] component controlButton strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('SideBarContainer');
      expect(obj.$attrs.controlButton.icons).assertEqual(undefined);
      console.info("[testsidebarIcons0011] controlButton value :" + obj.$attrs.controlButton);
      done();
    });
  })
}
