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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, ON } from '@kit.TestKit';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webResourceResponseSet() {

  describe('WebResourceResponseSetTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webResourceResponseSet',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webResourceResponseSet state success " + JSON.stringify(pages));
        if (!("webController" == pages.name)) {
          console.info("get webResourceResponseSet state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webResourceResponseSet page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webResourceResponseSet page error: " + err);
      }
      await waitForComponent('"WebResourceResponseSetButton"');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webResourceResponseSet beforeEach start");
      done();
    })

    /**
     * @tc.name   testSetResponseData001
     * @tc.number SUB_WEB_SETRESPONSEDATA_0100
     * @tc.desc   test setResponseData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetResponseData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testSetResponseData001", 14049)
      Utils.registerEvent("testSetResponseData001", true, 14050, done);
      sendEventByKey('WebResourceResponseSetButton', 10, '');
    })

    /**
     * @tc.name   testSetResponseEncoding001
     * @tc.number SUB_WEB_SETRESPONSEENCODING_0100
     * @tc.desc   test setResponseEncoding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetResponseEncoding001", 14049)
      Utils.registerEvent("testSetResponseEncoding001", '', 14051, done);
      sendEventByKey('WebResourceResponseSetButton', 10, '');
    })

    /**
     * @tc.name   testSetResponseMimeType001
     * @tc.number SUB_WEB_SETRESPONSEMIMETYPE_0100
     * @tc.desc   test setResponseMimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseMimeType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetResponseMimeType001", 14049)
      Utils.registerEvent("testSetResponseMimeType001", "text/html", 14052, done);
      sendEventByKey('WebResourceResponseSetButton', 10, '');
    })

    /**
     * @tc.name   testSetReasonMessage001
     * @tc.number SUB_WEB_SETREASONMESSAGE_0100
     * @tc.desc   test setReasonMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetReasonMessage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetReasonMessage001", 14049)
      Utils.registerEvent("testSetReasonMessage001", "OK", 14053, done);
      sendEventByKey('WebResourceResponseSetButton', 10, '');
    })

    /**
     * @tc.name   testSetResponseHeader001
     * @tc.number SUB_WEB_SETRESPONSEHEADER_0100
     * @tc.desc   test setResponseHeader
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseHeader001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetResponseHeader001", 14049)
      Utils.registerEvent("testSetResponseHeader001", true, 14054, done);
      sendEventByKey('WebResourceResponseSetButton', 10, '');
    })

    /**
     * @tc.name   testSetResponseCode001
     * @tc.number SUB_WEB_SETRESPONSECODE_0100
     * @tc.desc   test setResponseCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetResponseCode001", 14049)
      Utils.registerEvent("testSetResponseCode001", 403, 14055, done);
      sendEventByKey('WebResourceResponseSetButton', 10, '');
    })

    /**
     * @tc.name   testSetResponseIsReady001
     * @tc.number SUB_WEB_SETRESPONSEISREADY_0100
     * @tc.desc   test setResponseIsReady
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseIsReady001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetResponseIsReady001", 14049)
      Utils.registerEvent("testSetResponseIsReady001", 'test', 14056, done);
      sendEventByKey('WebResourceResponseSetButton', 10, '');
    })

    /**
     * @tc.name   testSetResponseIsReady002
     * @tc.number SUB_WEB_SETRESPONSEISREADY_0200
     * @tc.desc   test setResponseIsReady
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseIsReady002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetResponseIsReady002", 14049)
      Utils.registerEvent("testSetResponseIsReady002", "intercept test", 14057, done);
      sendEventByKey('WebResourceResponseSetButton', 10, '');
    })


  })
}
