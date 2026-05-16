/**
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
import { beforeAll, beforeEach, describe, it, TestType, Size, Level  } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 114610;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = ''

export default function webHttpBodyStreamTest() {
  describe('webHttpBodyStreamTest', () => {

      beforeAll(async (done: Function) => {
        let options: router.RouterOptions = {
          url: 'testability/pages/webHttpBodyStreamTest',
        }

        try {
          router.clear();
          let pages = router.getState();
          console.info("get webHttpBodyStreamTest state success " + JSON.stringify(pages));
          if (!("webHttpBodyStreamTest" == pages.name)) {
            console.info("get webHttpBodyStreamTest state success " + JSON.stringify(pages.name));
            let result = await router.pushUrl(options);
            console.info("push webHttpBodyStreamTest state success " + JSON.stringify(result));
          }
        } catch (err) {
          console.error("push webHttpBodyStreamTest page error:" + err);
        }
        await driver.waitForComponent(ON.id("webView"), 10000);
        console.log("waitForComponent webView");
        done()
      });

      beforeEach(async (done: Function) => {
        config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
          console.info(`enable success`);
        }).catch((err: object) => {
          console.error(`failed to enable, ${err}`);
        })
        done();
      })

      /**
       * @tc.name   testWebView_WebHttpBodyStream_READ
       * @tc.number SUB_ACE_WEB_WebHttpBodyStream_READ_0100
       * @tc.desc   test WebView_WebHttpBodyStream_READ
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testWebView_WebHttpBodyStream_READ', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        emitKey = "emitWebView_WebHttpBodyStream_READ"
        Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent("testWebView_WebHttpBodyStream_READ", 0, 114620, done);
        await Utils.waitAndClickComponent(driver, "webView");
      })
 })
}
