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

const EVENT_ID_SET_EMIT_KEY = 202340;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewONHttpErrorRecvExampleIsReady() {
  describe('ActsAceWebDevWebViewONHttpErrorRecvExampleIsReadyTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewONHttpErrorRecvExampleIsReady',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewONHttpErrorRecvExampleIsReady state success " + JSON.stringify(pages));
        if (!("webViewONHttpErrorRecvExampleIsReady" == pages.name)) {
          console.info("get webViewONHttpErrorRecvExampleIsReady state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push webViewONHttpErrorRecvExampleIsReady page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewONHttpErrorRecvExampleIsReady page error: " + err);
      }
      await driver.waitForComponent(ON.id("webViewONHttpErrorRecvExampleIsReady"), 10000);
      console.log("waitForComponent webViewONHttpErrorRecvExampleIsReady");
      done()
    });

    beforeEach(async  (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewONHttpErrorRecvExampleIsReady beforeEach start");
      done();
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORRECV_API_0300
     *tc.name testOnHttpErrorRecvExampleIsReadyFalse
     *tc.desc test interface of onHttpErrorReceive with parameter used by example but setResponseIsReady false
     */
    it('testOnHttpErrorRecvExampleIsReadyFalse',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitOnHttpErrorRecvExampleIsReadyFalse", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testOnHttpErrorRecvExampleIsReadyFalse", "", 202350, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webViewONHttpErrorRecvExampleIsReady");
      if (await Utils.waitForExist(() => isReturn, 'testOnHttpErrorRecvExampleIsReadyFalse' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
  })
}