/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

const EVENT_ID_SET_EMIT_KEY = 200460;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewOnInterceptReqOne() {
  describe('ActsAceWebDevWebViewOnInterceptReqOneTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewOnInterceptReqOne',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewOnInterceptReqOne state success " + JSON.stringify(pages));
        if (!("webViewOnInterceptReqOne" == pages.name)) {
          console.info("get webViewOnInterceptReqOne state success " + JSON.stringify(pages.name));
          await router.push(options);
          console.info("push webViewOnInterceptReqOne page success");
        }
      } catch (err) {
        console.error("push webViewOnInterceptReqOne page error: " + err);
      }
      await driver.waitForComponent(ON.id("webViewOnInterceptReqOne"), 10000);
      console.log("waitForComponent webViewOnInterceptReqOne");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewOnInterceptReqOne beforeEach start");
      done();
    })

    /*
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWPATR2_API_0100
     * @tc.name testOnInterceptRequest
     * @tc.desc onInterceptRequest without setting webresourceresponse
     */
    it('testOnInterceptRequest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const emitKey = "emitOnInterceptRequest";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testOnInterceptRequest", "success", 200470, done);
      await Utils.waitAndClickComponent(driver, "webViewOnInterceptReqOne");
    })
  })
}