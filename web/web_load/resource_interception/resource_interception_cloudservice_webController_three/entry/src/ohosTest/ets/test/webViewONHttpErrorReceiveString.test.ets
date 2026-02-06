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

const EVENT_ID_SET_EMIT_KEY = 202310;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewONHttpErrorReceiveString() {
  describe('ActsAceWebDevWebViewONHttpErrorReceiveStringTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewONHttpErrorReceiveString',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewONHttpErrorReceiveString state success " + JSON.stringify(pages));
        if (!("webViewONHttpErrorReceiveString" == pages.name)) {
          console.info("get webViewONHttpErrorReceiveString state success " + JSON.stringify(pages.name));
          await router.push(options);
          console.info("push webViewONHttpErrorReceiveString page success");
        }
      } catch (err) {
        console.error("push webViewONHttpErrorReceiveString page error: " + err);
      }
      await driver.waitForComponent(ON.id("webViewONHttpErrorReceiveString"), 10000);
      console.log("waitForComponent webViewONHttpErrorReceiveString");
      done()
    });

    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewONHttpErrorReceiveString beforeEach start");
      done();
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORRECV_API_0500
     *tc.name testOnHttpErrorReceiveByString
     *tc.desc test interface of onHttpErrorReceive with parameter used by string
     */
    it('testOnHttpErrorReceiveByString',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitOnHttpErrorReceiveByString", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testOnHttpErrorReceiveByString", 403, 202320, done);
      Utils.registerEvent("testOnHttpErrorReceiveByString",1,202330,done);
      await Utils.waitAndClickComponent(driver, "webViewONHttpErrorReceiveString");
    })
  })
}