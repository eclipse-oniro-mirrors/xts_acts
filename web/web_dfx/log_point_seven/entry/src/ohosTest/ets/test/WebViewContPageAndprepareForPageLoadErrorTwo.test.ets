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
import Utils from './Utils.test';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 111850;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "";

export default function webViewContPageAndprepareForPageLoadErrorTwo() {
  describe('ActsAceWebDevWebViewContPageAndPrepareForPageLoadErrorTwoTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewContPageAndprepareForPageLoadErrorTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webViewContPageAndprepareForPageLoadErrorTwo state success ' + JSON.stringify(pages));
        if (!("WebViewContPageAndprepareForPageLoadErrorTwo" == pages.name)) {
          console.info('get webViewContPageAndprepareForPageLoadErrorTwo state success ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info('push webViewContPageAndprepareForPageLoadErrorTwo page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webViewContPageAndprepareForPageLoadErrorTwo page error: ' + err);
      }
      await driver.waitForComponent(ON.id("webViewContPageAndprepareForPageLoadErrorTwo"), 10000);
      console.log('waitForComponent webViewContPageAndprepareForPageLoadErrorTwo');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webViewContPageAndprepareForPageLoadErrorTwo beforeEach start');
      done();
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS__WEBVIEWCONTPAGEANDPREPAREFORPAGELOADERRORTWO_0100
    * @tc.name       PrefetchPageErr
    * @tc.desc       test interface of postMessage with not been associated with specific Web Components
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('PrefetchPageErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitPrefetchPageErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("PrefetchPageErr", "17100002", 111860, done);
      await Utils.waitAndClickComponent(driver, "webViewContPageAndprepareForPageLoadErrorTwo");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS__WEBVIEWCONTPAGEANDPREPAREFORPAGELOADERROEONE_0200
    * @tc.name       PrepareForPageLoadErr
    * @tc.desc       test interface of postMessageEvent with WebMessagePort been closed by ets
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('PrepareForPageLoadErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitPrepareForPageLoadErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("PrepareForPageLoadErr", "17100002", 111870, done);
      await Utils.waitAndClickComponent(driver, "webViewContPageAndprepareForPageLoadErrorTwo");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS__WEBVIEWCONTPAGEANDPREPAREFORPAGELOADERROEONE_0300
    * @tc.name       PrepareForPageLoadErrTwo
    * @tc.desc       test interface of postMessageEvent with WebMessagePort been closed by ets
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('PrepareForPageLoadErrTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitPrepareForPageLoadErrTwo";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("PrepareForPageLoadErrTwo", "17100013", 111880, done);
      await Utils.waitAndClickComponent(driver, "webViewContPageAndprepareForPageLoadErrorTwo");
    })
  })
}