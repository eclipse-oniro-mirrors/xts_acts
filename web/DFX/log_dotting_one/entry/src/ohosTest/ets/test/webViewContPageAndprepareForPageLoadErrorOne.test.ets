/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeEach, it, beforeAll, TestType, Size, Level } from "@ohos/hypium";
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 111830;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = "";

export default function webViewContPageAndprepareForPageLoadErrorOne() {
  describe('ActsAceWebDevWebViewContPageAndPrepareForPageLoadErrorOneTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewContPageAndprepareForPageLoadErrorOne',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewContPageAndprepareForPageLoadErrorOne state success " + JSON.stringify(pages));
        if (!("webViewContPageAndprepareForPageLoadErrorOne" == pages.name)) {
          console.info("get webViewContPageAndprepareForPageLoadErrorOne state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push webViewContPageAndprepareForPageLoadErrorOne page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewContPageAndprepareForPageLoadErrorOne page error: " + err);
      }
      await driver.waitForComponent(ON.id("webViewContPageAndprepareForPageLoadErrorOne"), 10000);
      console.log("waitForComponent webViewContPageAndprepareForPageLoadErrorOne");
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("webViewContPageAndprepareForPageLoadErrorOne beforeEach start");
      done();
    })

    /**
     * @tc.name   PrefetchPageErr
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWCONTPAGEANDPREPAREFORPAGELOADERROEONE_0100
     * @tc.desc   test interface of postMessage with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PrefetchPageErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitPrefetchPageErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("PrefetchPageErr", "17100001", 111840, done);
      await Utils.waitAndClickComponent(driver, "webViewContPageAndprepareForPageLoadErrorOne");
    })
  })
}