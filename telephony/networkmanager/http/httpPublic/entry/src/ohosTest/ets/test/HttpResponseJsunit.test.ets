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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base'

function expectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    console.info('assertion failure');
  }
};

function expectTrue(n:boolean) {
  try {
    expect(n).assertTrue();
  }catch (err) {
    console.info('assertion failure');
  }
}

export default function httpResponseJsunit() {
  describe("HttpResponseJsunitTest", () => {
    /**
     * @tc.name   testNetworkMgrHttpHttpResponseResult0100
     * @tc.number SUB_NetworkMgr_Http_HttpResponse_Result_0100
     * @tc.desc   Test Test HttpResponse property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpResponseResult0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpResponseResult0100';
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
          expectTrue(data.result != null);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpResponseResult0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpHttpResponseResult0200
     * @tc.number SUB_NetworkMgr_Http_HttpResponse_Result_0200
     * @tc.desc   Test Test HttpResponse property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpResponseResult0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpResponseResult0200';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", (err, data) => {
          console.log(caseName + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expectTrue(data.result != null);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpResponseResult0200 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpHttpResponseResult0300
     * @tc.number SUB_NetworkMgr_Http_HttpResponse_Result_0300
     * @tc.desc   Test Test HttpResponse property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpResponseResult0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpResponseResult0300';
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
          expectTrue(data.result != null);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        }).catch((error:BusinessError) => {
          console.info(caseName + "errocode" + JSON.stringify(error));
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpResponseResult0300 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpHttpResponseResponseCode0100
     * @tc.number SUB_NetworkMgr_Http_HttpResponse_ResponseCode_0100
     * @tc.desc   Test Test HttpResponse property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpResponseResponseCode0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpResponseResponseCode0100';
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
          expectTrue(data.responseCode != 0);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpResponseResponseCode0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpHttpResponseResponseCode0200
     * @tc.number SUB_NetworkMgr_Http_HttpResponse_ResponseCode_0200
     * @tc.desc   Test Test HttpResponse property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpResponseResponseCode0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpResponseResponseCode0200';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", (err, data) => {
          console.log(caseName + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expectTrue(data.responseCode != 0);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpResponseResponseCode0200 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpHttpResponseResponseCode0300
     * @tc.number SUB_NetworkMgr_Http_HttpResponse_ResponseCode_0300
     * @tc.desc   Test Test HttpResponse property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpResponseResponseCode0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpResponseResponseCode0300';
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
          expectTrue(data.responseCode != 0);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        }).catch((error:BusinessError) => {
          console.info(caseName + "errorcode" + JSON.stringify(error));
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpResponseResponseCode0300 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpHttpResponseHeader0100
     * @tc.number SUB_NetworkMgr_Http_HttpResponse_Header_0100
     * @tc.desc   Test Test HttpResponse property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpResponseHeader0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpResponseHeader0100';
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
          expectTrue(data.header != null);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpResponseHeader0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpHttpResponseHeader0200
     * @tc.number SUB_NetworkMgr_Http_HttpResponse_Header_0200
     * @tc.desc   Test Test HttpResponse property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpResponseHeader0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpResponseHeader0200';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", (err, data) => {
          console.log(caseName + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expectTrue(data.header != null);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpResponseHeader0200 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpHttpResponseHeader0300
     * @tc.number SUB_NetworkMgr_Http_HttpResponse_Header_0300
     * @tc.desc   Test Test HttpResponse property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpResponseHeader0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpResponseHeader0300';
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
          expectTrue(data.header != null);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        }).catch((error:BusinessError) => {
          console.info(caseName + "errorcode" + JSON.stringify(error));
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpResponseHeader0300 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCookies0100
     * @tc.number SUB_NetworkMgr_Http_HttpResponse_Cookies_0100
     * @tc.desc   Test Test HttpResponse property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpResponseCookies0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpResponseCookies0100';
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
          expectTrue(data.cookies != null);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpResponseCookies0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCookies0200
     * @tc.number SUB_NetworkMgr_Http_HttpResponse_Cookies_0200
     * @tc.desc   Test Test HttpResponse property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpResponseCookies0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpResponseCookies0200';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", (err, data) => {
          console.log(caseName + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expectTrue(data.cookies != null);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpResponseCookies0200 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCookies0300
     * @tc.number SUB_NetworkMgr_Http_HttpResponse_Cookies_0300
     * @tc.desc   Test Test HttpResponse property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpResponseCookies0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpResponseCookies0300';
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
          expectTrue(data.cookies != null);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        }).catch((error:BusinessError) => {
          console.info(caseName + "errorcode" + JSON.stringify(error));
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpResponseCookies0300 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
  })
};