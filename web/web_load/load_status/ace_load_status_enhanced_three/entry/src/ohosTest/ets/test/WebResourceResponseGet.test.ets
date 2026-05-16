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

import { beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver } from '@kit.TestKit';
import { waitForExist } from './WaitTest.test';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();
export default function webResourceResponseGet() {

  describe('WebResourceResponseGetTestSuite', () => {

    beforeEach(async (done: Function) => {
      try {
        console.info('======> wifi_test/isWifiActive :' + wifiMg.isWifiActive());
        let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
        console.info('======> Internet WifiLinkedInfo : ' + JSON.stringify(data));
        console.info('======> Internet speed : ' + JSON.stringify(data.linkSpeed));
        console.info('======> Internet chload : ' + JSON.stringify(data.chload));
        console.info('======> Internet rssi : ' + JSON.stringify(data.rssi));
        if (data.connState == wifiMg.ConnState.CONNECTED) {
          console.info('======> WLAN connection established ');
        } else {
          expect().message('======> WLAN Network error').assertFail();
          done()
        }
        if (data.chload >= 900 || data.rssi <= -80) {
          expect().message('======> WLAN Network error').assertFail();
          done();
        } else if (data.chload >= 500) {
          console.info('======> The internet connection is poor. ');
        }
      } catch (err) {
        console.info('======> getLinkedInfo promise failed, err : ' + JSON.stringify(err));
        throw (err as Error);
        done();
      }
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webResourceResponseGet beforeEach start");
      done();
    })

    /**
     * @tc.name   testGetRequestHeader001
     * @tc.number SUB_WEB_GETREQUESTHEADER_0100
     * @tc.desc   test getRequestHeader
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetRequestHeader001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testGetRequestHeader001", 141511)
      let isReturn = false;
      Utils.registerEvent("testGetRequestHeader001", true, 141520, ()=>{isReturn = true});
      Utils.waitAndClickComponent("WebResourceResponseGetButton",driver)
      await waitForExist(()=>isReturn, "testGetRequestHeader001", true,1000);
      done();
    })

    /**
     * @tc.name   testGetRequestUrl001
     * @tc.number SUB_WEB_GETREQUESTURL_0100
     * @tc.desc   test getRequestUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetRequestUrl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetRequestUrl001", 141511)
      let isReturn = false;
      Utils.registerEvent("testGetRequestUrl001", 'https://www.example.com/404', 141530, ()=>{isReturn = true});
      Utils.waitAndClickComponent("WebResourceResponseGetButton",driver)
      await waitForExist(()=>isReturn, "testGetRequestUrl001", true,1000);
      done();
    })

    /**
     * @tc.name   testIsRequestGesture001
     * @tc.number SUB_WEB_ISREQUESTGESTURE_0100
     * @tc.desc   test isRequestGesture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsRequestGesture001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testIsRequestGesture001", 141511)
      let isReturn = false;
      Utils.registerEvent("testIsRequestGesture001", false, 141540, ()=>{isReturn = true});
      Utils.waitAndClickComponent("WebResourceResponseGetButton",driver)
      await waitForExist(()=>isReturn, "testIsRequestGesture001", true,1000);
      done();
    })

    /**
     * @tc.name   testIsMainFrame001
     * @tc.number SUB_WEB_ISMAINFRAME_0100
     * @tc.desc   test isMainFrame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsMainFrame001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testIsMainFrame001", 141511)
      let isReturn = false;
      Utils.registerEvent("testIsMainFrame001", true, 141550, ()=>{isReturn = true});
      Utils.waitAndClickComponent("WebResourceResponseGetButton",driver)
      await waitForExist(()=>isReturn, "testIsMainFrame001", true,1000);
      done();
    })

    /**
     * @tc.name   testIsRedirect001
     * @tc.number SUB_WEB_ISREDIRECT_0100
     * @tc.desc   test isRedirect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsRedirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testIsRedirect001", 141511)
      let isReturn = false;
      Utils.registerEvent("testIsRedirect001", false, 141560, ()=>{isReturn = true});
      Utils.waitAndClickComponent("WebResourceResponseGetButton",driver)
      await waitForExist(()=>isReturn, "testIsRedirect001", true,1000);
      done();
    })

    /**
     * @tc.name   testGetRequestMethod001
     * @tc.number SUB_WEB_GETREQUESTMETHOD_0100
     * @tc.desc   test getRequestMethod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetRequestMethod001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetRequestMethod001", 141511)
      let isReturn = false;
      Utils.registerEvent("testGetRequestMethod001", "GET", 141570, ()=>{isReturn = true});
      Utils.waitAndClickComponent("WebResourceResponseGetButton",driver)
      await waitForExist(()=>isReturn, "testGetRequestMethod001", true,1000);
      done();
    })

    /**
     * @tc.name   testGetResponseData001
     * @tc.number SUB_WEB_GETRESPONSEDATA_0100
     * @tc.desc   test getRequestMethod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetResponseData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetResponseData001", 141511)
      let isReturn = false;
      Utils.registerEvent("testGetResponseData001", "\"\"", 141580, ()=>{isReturn = true});
      Utils.waitAndClickComponent("WebResourceResponseGetButton",driver)
      await waitForExist(()=>isReturn, "testGetResponseData001", true,1000);
      done();
    })

    /**
     * @tc.name   testGetResponseEncoding001
     * @tc.number SUB_WEB_GETRESPONSEENCODING_0100
     * @tc.desc   test getResponseEncoding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetResponseEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetResponseEncoding001", 141511)
      let isReturn = false;
      Utils.registerEvent("testGetResponseEncoding001", "", 141590, ()=>{isReturn = true});
      Utils.waitAndClickComponent("WebResourceResponseGetButton",driver)
      await waitForExist(()=>isReturn, "testGetResponseEncoding001", true,1000);
      done();
    })

    /**
     * @tc.name   testGetResponseMimeType001
     * @tc.number SUB_WEB_GETRESPONSEMIMETYPE_0100
     * @tc.desc   test getResponseMimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetResponseMimeType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetResponseMimeType001", 141511)
      let isReturn = false;
      Utils.registerEvent("testGetResponseMimeType001", "text/html", 141600, ()=>{isReturn = true});
      Utils.waitAndClickComponent("WebResourceResponseGetButton",driver)
      await waitForExist(()=>isReturn, "testGetResponseMimeType001", true,1000);
      done();
    })

    /**
     * @tc.name   testGetReasonMessage001
     * @tc.number SUB_WEB_GETREASONMESSAGE_0100
     * @tc.desc   test getReasonMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetReasonMessage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetReasonMessage001", 141511)
      let isReturn = false;
      Utils.registerEvent("testGetReasonMessage001", "", 141610, ()=>{isReturn = true});
      Utils.waitAndClickComponent("WebResourceResponseGetButton",driver)
      await waitForExist(()=>isReturn, "testGetReasonMessage001", true,1000);
      done();
    })

    /**
     * @tc.name   testGetResponseHeader001
     * @tc.number SUB_WEB_GETRESPONSEHEADER_0100
     * @tc.desc   test getResponseHeader
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetResponseHeader001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetResponseHeader001", 141511)
      let isReturn = false;
      Utils.registerEvent("testGetResponseHeader001", true, 141620, ()=>{isReturn = true});
      Utils.waitAndClickComponent("WebResourceResponseGetButton",driver)
      await waitForExist(()=>isReturn, "testGetResponseHeader001", true,1000);
      done();
    })

    /**
     * @tc.name   testGetResponseCode001
     * @tc.number SUB_WEB_GETRESPONSECODE_0100
     * @tc.desc   test getResponseCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetResponseCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetResponseCode001", 141511)
      let isReturn = false;
      Utils.registerEvent("testGetResponseCode001", 404, 141630, ()=>{isReturn = true});
      Utils.waitAndClickComponent("WebResourceResponseGetButton",driver)
      await waitForExist(()=>isReturn, "testGetResponseCode001", true,1000);
      done();
    })


    /**
     * @tc.name   testGetResponseDataExReturnUndefined
     * @tc.number SUB_ACE_WEB_GetResponseDataEx_Return_Undefined
     * @tc.desc   test getResponseDataEx return undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetResponseDataExReturnUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testGetResponseDataExReturnUndefined start')
        try {
            let webResourceResponse:WebResourceResponse = new WebResourceResponse();
            let responseDataEx = webResourceResponse.getResponseDataEx()
            console.log('[WebResourceResponse] getResponseDataEx:' + responseDataEx);
            expect(responseDataEx).assertUndefined()
        } catch(error) {
            console.error('testGetResponseDataExReturnUndefined error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testGetResponseDataExReturnUndefined end')
        done()
    })

    /**
     * @tc.name   testGetResponseIsReadyReturnFalse
     * @tc.number SUB_ACE_WEB_GetResponseIsReady_Return_False
     * @tc.desc   test getResponseIsReady return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetResponseIsReadyReturnFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testGetResponseIsReadyReturnFalse start')
        try {
            let webResourceResponse:WebResourceResponse = new WebResourceResponse();
            webResourceResponse.setResponseIsReady(false)
            let responseIsReady: boolean = webResourceResponse.getResponseIsReady()
            console.log('[WebResourceResponse] getResponseIsReady:' + responseIsReady);
            expect(responseIsReady).assertEqual(false)
        } catch(error) {
            console.error('testGetResponseIsReadyReturnFalse error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testGetResponseIsReadyReturnFalse end')
        done()
    })


    /**
     * @tc.name   testGetResponseHeaderLength0
     * @tc.number SUB_ACE_WEB_GetResponseHeader_Length_0001
     * @tc.desc   test getResponseHeader length 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetResponseHeaderLength0', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testGetResponseHeaderLength0 start')
        try {
            let webResourceResponse:WebResourceResponse = new WebResourceResponse();
            console.log('[WebResourceResponse] getResponseHeader length:' + webResourceResponse.getResponseHeader().length);
            expect(webResourceResponse.getResponseHeader().length).assertEqual(0)
        } catch(error) {
            console.error('testGetResponseHeaderLength0 error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testGetResponseHeaderLength0 end')
        done()
    })

  })
}
