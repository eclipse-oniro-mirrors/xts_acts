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

import { beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webResourceResponseGet() {

  describe('WebResourceResponseGetTestSuite', () => {

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("webResourceResponseGet beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_GETREQUESTHEADER_0100
    * @tc.name       : testGetRequestHeader001
    * @tc.desc       : test getRequestHeader
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testGetRequestHeader001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testGetRequestHeader001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetRequestHeader001", true, 35010, done);
      sendEventByKey('WebResourceResponseGetButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_GETREQUESTURL_0100
    * @tc.name       : testGetRequestUrl001
    * @tc.desc       : test getRequestUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetRequestUrl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetRequestUrl001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetRequestUrl001", 'https://gitee.com/openharmony/123', 35011, done);
      sendEventByKey('WebResourceResponseGetButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ISREQUESTGESTURE_0100
    * @tc.name       : testIsRequestGesture001
    * @tc.desc       : test isRequestGesture
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsRequestGesture001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testIsRequestGesture001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testIsRequestGesture001", false, 35012, done);
      sendEventByKey('WebResourceResponseGetButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ISMAINFRAME_0100
    * @tc.name       : testIsMainFrame001
    * @tc.desc       : test isMainFrame
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsMainFrame001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testIsMainFrame001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testIsMainFrame001", true, 35013, done);
      sendEventByKey('WebResourceResponseGetButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ISREDIRECT_0100
    * @tc.name       : testIsRedirect001
    * @tc.desc       : test isRedirect
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsRedirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testIsRedirect001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testIsRedirect001", false, 35014, done);
      sendEventByKey('WebResourceResponseGetButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_GETREQUESTMETHOD_0100
    * @tc.name       : testGetRequestMethod001
    * @tc.desc       : test getRequestMethod
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetRequestMethod001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetRequestMethod001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetRequestMethod001", "GET", 35015, done);
      sendEventByKey('WebResourceResponseGetButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_GETRESPONSEDATA_0100
    * @tc.name       : testGetResponseData001
    * @tc.desc       : test getRequestMethod
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetResponseData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetResponseData001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetResponseData001", "\"\"", 35016, done);
      sendEventByKey('WebResourceResponseGetButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_GETRESPONSEENCODING_0100
    * @tc.name       : testGetResponseEncoding001
    * @tc.desc       : test getResponseEncoding
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetResponseEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetResponseEncoding001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetResponseEncoding001", "utf-8", 35017, done);
      sendEventByKey('WebResourceResponseGetButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_GETRESPONSEMIMETYPE_0100
    * @tc.name       : testGetResponseMimeType001
    * @tc.desc       : test getResponseMimeType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetResponseMimeType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetResponseMimeType001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetResponseMimeType001", "text/html", 35018, done);
      sendEventByKey('WebResourceResponseGetButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_GETREASONMESSAGE_0100
    * @tc.name       : testGetReasonMessage001
    * @tc.desc       : test getReasonMessage
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetReasonMessage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetReasonMessage001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetReasonMessage001", "Not Found", 35019, done);
      sendEventByKey('WebResourceResponseGetButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_GETRESPONSEHEADER_0100
    * @tc.name       : testGetResponseHeader001
    * @tc.desc       : test getResponseHeader
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetResponseHeader001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetResponseHeader001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetResponseHeader001", true, 35020, done);
      sendEventByKey('WebResourceResponseGetButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_GETRESPONSECODE_0100
    * @tc.name       : testGetResponseCode001
    * @tc.desc       : test getResponseCode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetResponseCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetResponseCode001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetResponseCode001", 404, 35021, done);
      sendEventByKey('WebResourceResponseGetButton', 10, '');
    })


  })
}
