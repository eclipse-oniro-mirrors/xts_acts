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

export default function HttpRequestOptionsJsunit() {
  describe("HttpRequestOptionsJsunitTest", () => {
    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOptionsMethod0100
     * @tc.number SUB_NetworkMgr_Http_HttpRequestOptions_Method_0100
     * @tc.desc   Test Test HttpRequestOptions property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpRequestOptionsMethod0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestOptionsMethod0100';
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
        console.log("testNetworkMgrHttpHttpRequestOptionsMethod0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOptionsMethod0200
     * @tc.number SUB_NetworkMgr_Http_HttpRequestOptions_Method_0200
     * @tc.desc   Test Test HttpRequestOptions property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpRequestOptionsMethod0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestOptionsMethod0200';
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
          console.info(caseName + "errocode" + JSON.stringify(error));
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpRequestOptionsMethod0200 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOptionsExtraData0100
     * @tc.number SUB_NetworkMgr_Http_HttpRequestOptions_ExtraData_0100
     * @tc.desc   Test Test HttpRequestOptions property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpRequestOptionsExtraData0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestOptionsExtraData0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions:http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: {
            q: "Hello World",
            from: "en",
            to: "zh",
            appid: "YOUR_APP_ID",
            salt: "1435660288",
            sign: "YOUR_SIGNATURE"
          } ,
          header: 'content-type: application/x-www-form-urlencoded',
          readTimeout: 60000,
          connectTimeout: 60000
        };
        let httpRequest = http.createHttp();
        httpRequest.request("https://fanyi-api.baidu.com/api/trans/vip/translate", httpRequestOptions, (err, data) => {
          console.log(caseName + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expectTrue(data.responseCode == 200);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpRequestOptionsExtraData0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOptionsExtraData0200
     * @tc.number SUB_NetworkMgr_Http_HttpRequestOptions_ExtraData_0200
     * @tc.desc   Test Test HttpRequestOptions property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpRequestOptionsExtraData0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestOptionsExtraData0200';
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions:http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: {
            q: "Hello World",
            from: "en",
            to: "zh",
            appid: "YOUR_APP_ID",
            salt: "1435660288",
            sign: "YOUR_SIGNATURE"
          } ,
          header: 'content-type: application/x-www-form-urlencoded',
          readTimeout: 60000,
          connectTimeout: 60000
        };
        let httpRequest = http.createHttp();
        httpRequest.request("https://fanyi-api.baidu.com/api/trans/vip/translate", httpRequestOptions).then(data => {
          console.log(caseName + JSON.stringify(data));
          expectTrue(data.responseCode == 200);
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
        console.log("testNetworkMgrHttpHttpRequestOptionsExtraData0200 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOptionsHeader0100
     * @tc.number SUB_NetworkMgr_Http_HttpRequestOptions_Header_0100
     * @tc.desc   Test Test HttpRequestOptions property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpRequestOptionsHeader0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestOptionsHeader0100';
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
            expectTrue(true);
            httpRequest.destroy();
            console.info(`${caseName}---End`);
            done();
          } catch (error) {
            console.log("testNetworkMgrHttpHttpRequestOptionsHeader0100 : JSON parse error = " + error);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpRequestOptionsHeader0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOptionsHeader0200
     * @tc.number SUB_NetworkMgr_Http_HttpRequestOptions_Header_0200
     * @tc.desc   Test Test HttpRequestOptions property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpRequestOptionsHeader0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestOptionsHeader0200';
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
          try {
            expectTrue(true);
            httpRequest.destroy();
            console.info(`${caseName}---End`);
            done();
          } catch (error) {
            console.log("testNetworkMgrHttpHttpRequestOptionsHeader0200 : JSON parse error = " + error);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          }
        }).catch((error:BusinessError) => {
          console.info(caseName + "errocode" + JSON.stringify(error));
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpRequestOptionsHeader0200 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOptionsHeader0300
     * @tc.number SUB_NetworkMgr_Http_HttpRequestOptions_Header_0300
     * @tc.desc   Test Test HttpRequestOptions property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpRequestOptionsHeader0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestOptionsHeader0300';
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions:http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: "content-type': 'application/xml",
          readTimeout: 60000,
          connectTimeout: 60000
        };
        let httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(caseName + JSON.stringify(err) + " data: " + JSON.stringify(data));
          try {
            expectTrue(data.responseCode == 200);
            httpRequest.destroy();
            console.info(`${caseName}---End`);
            done();
          } catch (error) {
            console.log("testNetworkMgrHttpHttpRequestOptionsHeader0300 : JSON parse error = " + error);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpRequestOptionsHeader0300 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOptionsHeader0400
     * @tc.number SUB_NetworkMgr_Http_HttpRequestOptions_Header_0400
     * @tc.desc   Test Test HttpRequestOptions property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpRequestOptionsHeader0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestOptionsHeader0400';
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions:http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: "content-type': 'application/xml",
          readTimeout: 60000,
          connectTimeout: 60000
        };
        let httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
          console.log(caseName + JSON.stringify(data));
          try {
            expectTrue(data.result.valueOf() != "");
            httpRequest.destroy();
            console.info(`${caseName}---End`);
            done();
          } catch (error) {
            console.log("testNetworkMgrHttpHttpRequestOptionsHeader0400 : JSON parse error = " + error);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          }
        }).catch((error:BusinessError) => {
          console.info(caseName + "errocode" + JSON.stringify(error));
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpRequestOptionsHeader0400 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOptionsReadTimeout0100
     * @tc.number SUB_NetworkMgr_Http_HttpRequestOptions_ReadTimeout_0100
     * @tc.desc   Test Test HttpRequestOptions property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpRequestOptionsReadTimeout0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestOptionsReadTimeout0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions:http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: "content-type': 'application/json",
          readTimeout: 0.1,
          connectTimeout: 60
        };
        let httpRequest = http.createHttp();
        let time = 60;
        if (time < 60000) {
          done();
          return;
        }
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(caseName + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expectTrue(data.responseCode == 408);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpRequestOptionsReadTimeout0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOptionsReadTimeout0200
     * @tc.number SUB_NetworkMgr_Http_HttpRequestOptions_ReadTimeout_0200
     * @tc.desc   Test Test HttpRequestOptions property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpRequestOptionsReadTimeout0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestOptionsReadTimeout0200';
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions:http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: "content-type': 'application/json",
          readTimeout: 0.1,
          connectTimeout: 60
        };
        let httpRequest = http.createHttp();
        let time = 60;
        if (time < 60000) {
          done();
          return;
        }
        httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
          console.log(caseName + JSON.stringify(data));
          expectTrue(data.responseCode == 408);
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
        console.log("testNetworkMgrHttpHttpRequestOptionsReadTimeout0200 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOptionsConnectTimeout0100
     * @tc.number SUB_NetworkMgr_Http_HttpRequestOptions_ConnectTimeout_0100
     * @tc.desc   Test Test HttpRequestOptions property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpRequestOptionsConnectTimeout0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestOptionsConnectTimeout0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions:http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: "content-type': 'application/json",
          readTimeout: 60,
          connectTimeout: 0.1
        };
        let time = 60;
        if (time < 60000) {
          done();
          return;
        }
        let httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(caseName + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expectTrue(data.responseCode == 504);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log("testNetworkMgrHttpHttpRequestOptionsConnectTimeout0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOptionsConnectTimeout0200
     * @tc.number SUB_NetworkMgr_Http_HttpRequestOptions_ConnectTimeout_0200
     * @tc.desc   Test Test HttpRequestOptions property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpRequestOptionsConnectTimeout0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestOptionsConnectTimeout0200';
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions:http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: "content-type': 'application/json",
          readTimeout: 60,
          connectTimeout: 0.1
        };
        let time = 60;
        if (time < 60000) {
          done();
          return;
        }
        let httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
          console.log(caseName + JSON.stringify(data));
          expectTrue(data.responseCode == 504);
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
        console.log("testNetworkMgrHttpHttpRequestOptionsConnectTimeout0200 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOptionsUsingProxy0100
     * @tc.number SUB_NetworkMgr_Http_HttpRequestOptions_UsingProxy_0100
     * @tc.desc   Test HttpRequestOptions usingProxy property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpRequestOptionsUsingProxy0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestOptionsUsingProxy0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", {
          connectTimeout: 60000,
          readTimeout: 60000,
          usingProxy: true,
        }, (err, data) => {
          if (!err) {
            console.info('testNetworkMgrHttpHttpRequestOptionsUsingProxy0100 code:' + data.responseCode);
            expectTrue(data.responseCode == http.ResponseCode.OK);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info('testNetworkMgrHttpHttpRequestOptionsUsingProxy0100 error:' + JSON.stringify(err));
            httpRequest.destroy();
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (error) {
        console.log("testNetworkMgrHttpHttpRequestOptionsUsingProxy0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOptionsUsingProxy0200
     * @tc.number SUB_NetworkMgr_Http_HttpRequestOptions_UsingProxy_0200
     * @tc.desc   Test HttpRequestOptions usingProxy 2300005 property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpRequestOptionsUsingProxy0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestOptionsUsingProxy0200';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        let ExclusionList = "";
        let array = ExclusionList.split(',');
        let httpProxy:http.HttpProxy = {
          host: "host",
          port: 1,
          exclusionList: array
        };
        httpRequest.request("https://www.baidu.com/", {
          connectTimeout: 60000,
          readTimeout: 60000,
          usingProxy: httpProxy,
        }, (err, data) => {
          if (!err) {
            console.info('testNetworkMgrHttpHttpRequestOptionsUsingProxy0200 code:' + data.responseCode);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info('testNetworkMgrHttpHttpRequestOptionsUsingProxy0200 error:' + JSON.stringify(err));
            httpRequest.destroy();
            expectTrue(err.code == 2300005);
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (error) {
        console.log("testNetworkMgrHttpHttpRequestOptionsUsingProxy0200 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
  })
};