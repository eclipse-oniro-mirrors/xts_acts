/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

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
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webMessagePortErrorCode page success " + JSON.stringify(result));
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

    afterEach(async (done: Function) => {
      console.info("WebMessagePortErrorCodeTestSuite afterEach start");
      await Utils.sleep(2000);
      console.info("WebMessagePortErrorCodeTestSuite afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_CLOSE_0100
    * @tc.name       : testCloseError001
    * @tc.desc       : test close error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testCloseError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testCloseError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testCloseError001", '17100010', 20360, done);
      sendEventByKey('WebMessagePortErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ONMESSAGEEVENTEXT_0100
    * @tc.name       : testOnMessageEventExtError001
    * @tc.desc       : test onMessageEventExt error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testOnMessageEventExtError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testOnMessageEventExtError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnMessageEventExtError001", '17100006', 20361, done);
      sendEventByKey('WebMessagePortErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_POSTMESSAGEEVENTEXT_0100
    * @tc.name       : testPostMessageEventExtError001
    * @tc.desc       : test postMessageEventExt error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testPostMessageEventExtError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testPostMessageEventExtError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPostMessageEventExtError001", '17100010', 20362, done);
      sendEventByKey('WebMessagePortErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ONMESSAGEEVENT_0100
    * @tc.name       : testOnMessageEventError001
    * @tc.desc       : test onMessageEvent error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testOnMessageEventError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testOnMessageEventError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnMessageEventError001", '17100006', 20363, done);
      sendEventByKey('WebMessagePortErrorCodeButton', 10, '');
    })

  })
}
