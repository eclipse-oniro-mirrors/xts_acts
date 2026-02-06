/*
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, beforeEach, afterEach, Level, Size, TestType } from '@ohos/hypium';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';

function sleep (time:number):Promise<string>{
  return new Promise<string>((resolve)=>{
    setTimeout(()=>{
      resolve('ok')},time)
  });
}

function expectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    console.info('assertion failure');
  }
};

function expectTrue(n : boolean) {
  try {
    expect(n).assertTrue();
  } catch (err){
    console.info('assertion failure');
  }
};

export default function httpRequestJsunit() {
  describe("HttpRequestJsunitTest", () => {
    afterEach(async () => {
      console.log('Test afterEach start');
      let httpRequest = http.createHttp();
      httpRequest.off('headersReceive');
      httpRequest.destroy();
    });
    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequest_Request_0100
     * @tc.name: testNetworkMgrHttpHttpRequestRequest0100
     * @tc.desc: Test Test httpRequest property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrHttpHttpRequestRequest0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = "testNetworkMgrHttpHttpRequestRequest0100";
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions:http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        };
        let httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(caseName + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expectTrue(data.responseCode == 200);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpRequestRequest0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequest_Request_0200
     * @tc.name: testNetworkMgrHttpHttpRequestRequest0200
     * @tc.desc: Test Test HttpRequest property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrHttpHttpRequestRequest0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = "testNetworkMgrHttpHttpRequestRequest0200";
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", (err, data) => {
          console.log(caseName + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expectTrue(data.responseCode == 200);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpRequestRequest0200 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequest_Request_0300
     * @tc.name: testNetworkMgrHttpHttpRequestRequest0300
     * @tc.desc: Test Test httpRequest property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrHttpHttpRequestRequest0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = "testNetworkMgrHttpHttpRequestRequest0300";
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions:http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        };
        let httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
          console.log(caseName + JSON.stringify(data));
          expectTrue(data.responseCode == 200);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        }).catch((error:BusinessError) => {
          console.info('HttpRequest_request_0300 asyncCallback error : ' + JSON.stringify(error));
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpRequestRequest0300 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequest_Destroy_0100
     * @tc.name: testNetworkMgrHttpHttpRequestDestroy0100
     * @tc.desc: Test Test httpRequest property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrHttpHttpRequestDestroy0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = "testNetworkMgrHttpHttpRequestDestroy0100";
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions:http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        };
        let httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(caseName + JSON.stringify(err) + " data: " + JSON.stringify(data));
          try {
            httpRequest.destroy();
            expectTrue(true);
            console.info(`${caseName}---End`);
            done();
          } catch (error) {
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpRequestDestroy0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequest_On_HeaderReceive_0100
     * @tc.name: testNetworkMgrHttpHttpRequestOnHeaderReceive0100
     * @tc.desc: Test Test httpRequest property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOnHeaderReceive0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = "testNetworkMgrHttpHttpRequestOnHeaderReceive0100";
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        httpRequest.on('headersReceive', (data) => {
          console.log(caseName + " data: " + JSON.stringify(data));
          expectTrue(true);
          console.info(`${caseName}---End`);
          done();
        });
        httpRequest.request("https://www.baidu.com/", (err, data) => {
          console.log(caseName + " data: " + JSON.stringify(data.responseCode) + " err: " + JSON.stringify(err));
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpRequestOnHeaderReceive0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequest_Off_HeaderReceive_0100
     * @tc.name: testNetworkMgrHttpHttpRequestOffHeaderReceive0100
     * @tc.desc: Test Test httpRequest property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOffHeaderReceive0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = "testNetworkMgrHttpHttpRequestOffHeaderReceive0100";
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        let callbackdata1 = (data:object) => {
          console.log(caseName + " data: " + JSON.stringify(data));
          expectFalse();
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        };
        httpRequest.on('headersReceive', callbackdata1);
        httpRequest.off('headersReceive', callbackdata1);
        httpRequest.request("https://www.baidu.com/", (err, data) => {
          console.log(caseName + " data: " + JSON.stringify(data.responseCode) + " err: " + JSON.stringify(err));
          done();
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpRequestOffHeaderReceive0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_Telephony_Http_HttpRequest_On_HeadersReceive_0100
     * @tc.name: testNetworkMgrHttpHttpRequestOnHeadersReceive0100
     * @tc.desc: Test Test httpRequest property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOnHeadersReceive0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) => {
      let caseName:string = "testNetworkMgrHttpHttpRequestOnHeadersReceive0100";
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        httpRequest.on("headersReceive", (data) => {
          console.log(caseName + " data: " + JSON.stringify(data));
          expectTrue(true);
          console.info(`${caseName}---End`);
          done();
        });
        httpRequest.request("https://www.baidu.com/", (err, data) => {
          console.log(caseName + " data: " + JSON.stringify(data.responseCode) + " err: " + JSON.stringify(err));
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpRequestOnHeadersReceive0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequest_Off_HeadersReceive_0100
     * @tc.name: testNetworkMgrHttpHttpRequestOffHeadersReceive0100
     * @tc.desc: Test Test httpRequest property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOffHeadersReceive0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) => {
      let caseName:string = "testNetworkMgrHttpHttpRequestOffHeadersReceive0100";
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        httpRequest.off("headersReceive", (data) => {
          console.log(caseName + " data: " + JSON.stringify(data));
          expectFalse();
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        });
        httpRequest.request("https://www.baidu.com/", (err, data) => {
          console.log(caseName + " data: " + JSON.stringify(data.responseCode) + " err: " + JSON.stringify(err));
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpRequestOffHeadersReceive0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequest_Off_HeadersReceive_0200
     * @tc.name: testNetworkMgrHttpHttpRequestOffHeadersReceive0200
     * @tc.desc: Test Test httpRequest property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOffHeadersReceive0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) => {
      let caseName:string = "testNetworkMgrHttpHttpRequestOffHeadersReceive0200";
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        httpRequest.off('headersReceive');
        expectTrue(true);
        httpRequest.destroy();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpHttpRequestOffHeadersReceive0200 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequest_Once_HeadersReceive_0100
     * @tc.name: testNetworkMgrHttpHttpRequestOnceHeadersReceive0100
     * @tc.desc: Test Test httpRequest property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOnceHeadersReceive0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = "testNetworkMgrHttpHttpRequestOnceHeadersReceive0100";
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        httpRequest.once('headersReceive', async (data) => {
          console.log(caseName + " data: " + JSON.stringify(data));
          expectTrue(true);
          await sleep(250);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        });
        httpRequest.request("https://www.baidu.com/", (err, data) => {
          console.log(caseName + " data: " + JSON.stringify(data?.responseCode) + " err: " + JSON.stringify(err));
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpRequestOnceHeadersReceive0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
  })
};