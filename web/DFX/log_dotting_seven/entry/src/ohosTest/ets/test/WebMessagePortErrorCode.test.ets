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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 123301;
const driver = Driver.create();

export default function webMessagePortErrorCode() {

  describe('WebMessagePortErrorCodeTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webMessagePortErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webMessagePortErrorCode state success " + JSON.stringify(pages));
        if (!("webMessagePortErrorCode" == pages.name)) {
          console.info("get webMessagePortErrorCode state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await driver.waitForComponent(ON.id("WebMessagePortErrorCodeButton"), 10000);
          console.info("push webMessagePortErrorCode page success ");
        }
      } catch (err) {
        console.error("push webMessagePortErrorCode page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webMessagePortErrorCode beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_POSTMESSAGEEVENTEXT_0100
    * @tc.name       : testPostMessageEventExtError001
    * @tc.desc       : test postMessageEventExt error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testPostMessageEventExtError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testPostMessageEventExtError001", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testPostMessageEventExtError001", '17100010', 123310, done);
      Utils.waitAndClickComponent(driver, "WebMessagePortErrorCodeButton");
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_CREATEWEBMESSAGEPORTS_0100
    * @tc.name       : testCreateWebMessagePortsError001
    * @tc.desc       : test createWebMessagePorts error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testCreateWebMessagePortsError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testCreateWebMessagePortsError001", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testCreateWebMessagePortsError001", '17100001', 123320, done);
      Utils.waitAndClickComponent(driver, "WebMessagePortErrorCodeButton");
    })

  })
}
