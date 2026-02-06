/*
* Copyright (C) 2024 HiHope Open Source Organization.
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { waitForComponent } from './WaitTest';


// @ts-nocheck
let emitKey = "";

export default function webRequestHeaderList() {
  describe('WebRequestHeaderListTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/NavigationStartTick',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebComponent state success " + JSON.stringify(pages));
        if (!("WebComponent" == pages.name)) {
          console.info("get WebComponent state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebComponent state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebComponent page error:" + err);
      }
      await waitForComponent("getSecurityLevelButton");
      done();
    });



    /**
     * @tc.number SUB_ACE_WEB_getSecurityLevel_SDK_0001
     * @tc.name testWebView_getSecurityLevel0001
     * @tc.desc test getSecurityLevel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getSecurityLevel0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      emitKey = "emitGetSecurityLevelError";
      Utils.emitEvent(emitKey, 160000);
      Utils.registerEvent("testWebView_getSecurityLevel0001", 'success', 160010, done);
      sendEventByKey('getSecurityLevelButton', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_ONFIRSTCONTENTFULPAINT_0001
     * @tc.name testWebView_onFirstContentfulPaint_navigationStartTick
     * @tc.desc test onOverrideUrlLoading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_onFirstContentfulPaint_navigationStartTick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      emitKey = "emitNavigationStartTick";
      Utils.emitEvent(emitKey, 160000);
      Utils.registerEvent("testWebView_onFirstContentfulPaint_navigationStartTick", 'success', 160020, done);
      sendEventByKey('navigationStartButton', 10, '');
    });
  });
}