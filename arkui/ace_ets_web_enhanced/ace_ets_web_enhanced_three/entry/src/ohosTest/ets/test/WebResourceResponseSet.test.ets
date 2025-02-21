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

import { beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';


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
          await Utils.sleep(2000);
          console.info("push webResourceResponseSet page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webResourceResponseSet page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("webResourceResponseSet beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_SETRESPONSEDATA_0100
    * @tc.name       : testSetResponseData001
    * @tc.desc       : test setResponseData
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSetResponseData001', 0, async (done: Function) => {
      Utils.emitEvent("testSetResponseData001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetResponseData001", true, 36010, done);
      sendEventByKey('WebResourceResponseSetButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_SETRESPONSEENCODING_0100
    * @tc.name       : testSetResponseEncoding001
    * @tc.desc       : test setResponseEncoding
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSetResponseEncoding001', 0, async (done: Function) => {
      Utils.emitEvent("testSetResponseEncoding001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetResponseEncoding001", '', 36011, done);
      sendEventByKey('WebResourceResponseSetButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_SETRESPONSEMIMETYPE_0100
    * @tc.name       : testSetResponseMimeType001
    * @tc.desc       : test setResponseMimeType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSetResponseMimeType001', 0, async (done: Function) => {
      Utils.emitEvent("testSetResponseMimeType001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetResponseMimeType001", "text/html", 36012, done);
      sendEventByKey('WebResourceResponseSetButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_SETREASONMESSAGE_0100
    * @tc.name       : testSetReasonMessage001
    * @tc.desc       : test setReasonMessage
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSetReasonMessage001', 0, async (done: Function) => {
      Utils.emitEvent("testSetReasonMessage001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetReasonMessage001", "OK", 36013, done);
      sendEventByKey('WebResourceResponseSetButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_SETRESPONSEHEADER_0100
    * @tc.name       : testSetResponseHeader001
    * @tc.desc       : test setResponseHeader
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSetResponseHeader001', 0, async (done: Function) => {
      Utils.emitEvent("testSetResponseHeader001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetResponseHeader001", true, 36014, done);
      sendEventByKey('WebResourceResponseSetButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_SETRESPONSECODE_0100
    * @tc.name       : testSetResponseCode001
    * @tc.desc       : test setResponseCode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSetResponseCode001', 0, async (done: Function) => {
      Utils.emitEvent("testSetResponseCode001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetResponseCode001", 403, 36015, done);
      sendEventByKey('WebResourceResponseSetButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_SETRESPONSEISREADY_0100
    * @tc.name       : testSetResponseIsReady001
    * @tc.desc       : test setResponseIsReady
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSetResponseIsReady001', 0, async (done: Function) => {
      Utils.emitEvent("testSetResponseIsReady001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetResponseIsReady001", 'test', 36016, done);
      sendEventByKey('WebResourceResponseSetButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_SETRESPONSEISREADY_0200
    * @tc.name       : testSetResponseIsReady002
    * @tc.desc       : test setResponseIsReady
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSetResponseIsReady002', 0, async (done: Function) => {
      Utils.emitEvent("testSetResponseIsReady002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetResponseIsReady002", "intercept test", 36017, done);
      sendEventByKey('WebResourceResponseSetButton', 10, '');
    })


  })
}
