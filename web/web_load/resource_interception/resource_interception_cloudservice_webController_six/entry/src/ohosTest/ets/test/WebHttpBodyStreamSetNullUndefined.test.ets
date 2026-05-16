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

import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';

import { Driver, ON } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const driver = Driver.create();

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function WebHttpBodyStreamSetNullUndefinedTest() {
  describe('WebHttpBodyStreamSetNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebHttpBodyStreamSetNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebHttpBodyStreamSetNullUndefinedTest state success " + JSON.stringify(pages));
        if (!("WebHttpBodyStreamSetNullUndefined" == pages.name)) {
          console.info("get WebHttpBodyStreamSetNullUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebHttpBodyStreamSetNullUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebHttpBodyStreamSetNullUndefinedTest page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebHttpBodyStreamButton"), 10000);
      console.log("waitForComponent WebHttpBodyStreamSetNullUndefinedTest");
      done()
    });
    beforeEach(async (done: Function) => {

      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebHttpBodyStreamButton afterEach start");
      console.info("WebHttpBodyStreamButton afterEach end");
      done();
    })


    /**
     * @tc.name   testReadNull
     * @tc.number SUB_WEB_WEBHTTPBODYSTREAM_READ_0100
     * @tc.desc   test WebHttpBodyStream read set null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testReadNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testReadNull", 26031320)
      Utils.registerBaseEvent("testReadNull", "401", 26031321,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebHttpBodyStreamButton', 10, '');
    })

    /**
     * @tc.name   testReadUndefined
     * @tc.number SUB_WEB_WEBHTTPBODYSTREAM_READ_0200
     * @tc.desc   test WebHttpBodyStream read set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testReadUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testReadUndefined", 26031320)
      Utils.registerBaseEvent("testReadUndefined", "401", 26031322,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebHttpBodyStreamButton', 10, '');
    })


  })
}