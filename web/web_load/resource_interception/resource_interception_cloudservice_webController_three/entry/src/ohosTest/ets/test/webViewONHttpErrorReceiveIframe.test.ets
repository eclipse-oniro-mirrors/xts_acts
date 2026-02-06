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
import {describe, beforeEach, it, beforeAll, TestType, Size, Level } from "@ohos/hypium";
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 202250;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewONHttpErrorReceiveIframe() {
  describe('ActsAceWebDevWebViewONHttpErrorReceiveIframeTest',  () => {
    beforeAll(async  (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewONHttpErrorReceiveIframe',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewONHttpErrorReceiveIframe state success " + JSON.stringify(pages));
        if (!("webViewONHttpErrorReceiveIframe" == pages.name)) {
          console.info("get webViewONHttpErrorReceiveIframe state success " + JSON.stringify(pages.name));
          await router.push(options);
          console.info("push webViewONHttpErrorReceiveIframe page success");
        }
      } catch (err) {
        console.error("push webViewONHttpErrorReceiveIframe page error: " + err);
      }
      await driver.waitForComponent(ON.id("webViewONHttpErrorReceiveIframe"), 10000);
      console.log("waitForComponent webViewONHttpErrorReceiveIframe");
      done()
    });

    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewONHttpErrorReceiveIframe beforeEach start");
      done();
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORRECV_API_0400
     *tc.name testOnHttpErrorReceiveByIframeHtml
     *tc.desc test interface of onHttpErrorReceive with parameter used by html file with iframe
     */
    it('testOnHttpErrorReceiveByIframeHtml',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitOnHttpErrorReceiveByIframeHtml", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testOnHttpErrorReceiveByIframeHtml", "false|index", 202260, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webViewONHttpErrorReceiveIframe");
      if (await Utils.waitForExist(() => isReturn, 'testOnHttpErrorReceiveByIframeHtml' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
  })
}