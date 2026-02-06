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
import { describe, it, expect , Level, Size, TestType} from '@ohos/hypium';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';

function expectFalse() {
  try {
    expect().assertFail();
  } catch(err) {
    console.info('assertion failure');
  }
}

function expectTrue(data : boolean){
  try {
    expect(data).assertTrue();
  } catch (err){
    console.info('assertion failure');
  }
};

export default function requestMethodJsunit() {
  describe('requestMethodJsunit', () => {
    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequestMethod_Options_0100
     * @tc.name: testNetworkMgrHttpHttpRequestMethodOptions0100
     * @tc.desc: Test Test HttpRequestMethod property.
     * @tc.level: level1
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testNetworkMgrHttpHttpRequestMethodOptions0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestMethodOptions0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.OPTIONS,
          header: 'content-type: application/json',
          readTimeout: 60000,
          connectTimeout: 60000
        };
        let httpRequest = http.createHttp();
        httpRequest.request('https://www.baidu.com/', httpRequestOptions, (err, data) => {
          console.log(caseName + JSON.stringify(err) + ' data: ' + JSON.stringify(data));
          expectTrue(data.responseCode == 200);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        });
      }
      catch (error) {
        console.log('testNetworkMgrHttpHttpRequestMethodOptions0100 : error = ' + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequestMethod_Options_0200
     * @tc.name: testNetworkMgrHttpHttpRequestMethodOptions0200
     * @tc.desc: Test Test HttpRequestMethod property.
     * @tc.level: level1
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testNetworkMgrHttpHttpRequestMethodOptions0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestMethodOptions0200';
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.OPTIONS,
          header: 'content-type: application/json',
          readTimeout: 60000,
          connectTimeout: 60000
        };
        let httpRequest = http.createHttp();
        httpRequest.request('https://www.baidu.com/', httpRequestOptions).then(data => {
          console.log(caseName + JSON.stringify(data));
          expectTrue(data.responseCode == 200);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.info(caseName + 'errocode' + JSON.stringify(error));
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      }
      catch (error) {
        console.log('testNetworkMgrHttpHttpRequestMethodOptions0200 : error = ' + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequestMethod_GET_0100
     * @tc.name: testNetworkMgrHttpHttpRequestMethodGET0100
     * @tc.desc: Test Test HttpRequestMethod property.
     * @tc.level: level1
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testNetworkMgrHttpHttpRequestMethodGET0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestMethodGET0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: 'content-type: application/json',
          readTimeout: 60000,
          connectTimeout: 60000
        };
        let httpRequest = http.createHttp();
        httpRequest.request('https://www.baidu.com/', httpRequestOptions, (err, data) => {
          console.log(caseName + JSON.stringify(err) + ' data: ' + JSON.stringify(data));
          expectTrue(data.responseCode == 200);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        });
      }
      catch (error) {
        console.log('testNetworkMgrHttpHttpRequestMethodGET0100 : error = ' + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequestMethod_GET_0200
     * @tc.name: testNetworkMgrHttpHttpRequestMethodGET0200
     * @tc.desc: Test Test HttpRequestMethod property.
     * @tc.level: level1
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testNetworkMgrHttpHttpRequestMethodGET0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestMethodGET0200';
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: 'content-type: application/json',
          readTimeout: 60000,
          connectTimeout: 60000
        };
        let httpRequest = http.createHttp();
        httpRequest.request('https://www.baidu.com/', httpRequestOptions).then(data => {
          console.log(caseName + JSON.stringify(data));
          expectTrue(data.responseCode == 200);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.info(caseName + 'errocode' + JSON.stringify(error));
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      }
      catch (error) {
        console.log('testNetworkMgrHttpHttpRequestMethodGET0200 : error = ' + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequestMethod_POST_0100
     * @tc.name: testNetworkMgrHttpHttpRequestMethodPOST0100
     * @tc.desc: Test Test HttpRequestMethod property.
     * @tc.level: level1
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testNetworkMgrHttpHttpRequestMethodPOST0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestMethodPOST0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.POST,
          extraData: {
            q: "Hello World",
            from: "en",
            to: "zh",
            appid: "YOUR_APP_ID",
            salt: "1435660288",
            sign: "YOUR_SIGNATURE"
          },
          header: 'content-type: application/x-www-form-urlencoded',
          readTimeout: 60000,
          connectTimeout: 60000
        }
        let httpRequest = http.createHttp();
        httpRequest.request('https://fanyi-api.baidu.com/api/trans/vip/translate', httpRequestOptions, (err, data) => {
          console.log(caseName + JSON.stringify(err) + ' data: ' + JSON.stringify(data));
          expectTrue(data.responseCode == 200);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        });
      }
      catch (error) {
        console.log('testNetworkMgrHttpHttpRequestMethodPOST0100 : error = ' + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequestMethod_POST_0200
     * @tc.name: testNetworkMgrHttpHttpRequestMethodPOST0200
     * @tc.desc: Test Test HttpRequestMethod property.
     * @tc.level: level1
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testNetworkMgrHttpHttpRequestMethodPOST0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestMethodPOST0200'
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.POST,
          extraData: {
            q: "Hello World",
            from: "en",
            to: "zh",
            appid: "YOUR_APP_ID",
            salt: "1435660288",
            sign: "YOUR_SIGNATURE"
          },
          header: 'content-type: application/x-www-form-urlencoded',
          readTimeout: 60000,
          connectTimeout: 60000
        }
        let httpRequest = http.createHttp();
        httpRequest.request('https://fanyi-api.baidu.com/api/trans/vip/translate', httpRequestOptions).then(data => {
          console.log(caseName + JSON.stringify(data));
          expectTrue(data.responseCode == 200);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.info(caseName + 'errocode' + JSON.stringify(error));
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log('testNetworkMgrHttpHttpRequestMethodPOST0200 : error = ' + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequestMethod_TRACE_0100
     * @tc.name: testNetworkMgrHttpHttpRequestMethodTRACE0100
     * @tc.desc: Test Test HttpRequestMethod property.
     * @tc.level: level1
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testNetworkMgrHttpHttpRequestMethodTRACE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestMethodTRACE0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.TRACE,
          header: 'content-type: application/json',
          readTimeout: 60000,
          connectTimeout: 60000
        };
        let httpRequest = http.createHttp();
        httpRequest.request('https://www.baidu.com/', httpRequestOptions, (err, data) => {
          console.log(caseName + JSON.stringify(err) + ' data: ' + JSON.stringify(data));
          expectTrue(data.responseCode == 200);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log('testNetworkMgrHttpHttpRequestMethodTRACE0100 : error = ' + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequestMethod_TRACE_0200
     * @tc.name: testNetworkMgrHttpHttpRequestMethodTRACE0200
     * @tc.desc: Test Test HttpRequestMethod property.
     * @tc.level: level1
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testNetworkMgrHttpHttpRequestMethodTRACE0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestMethodTRACE0200';
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.TRACE,
          header: 'content-type: application/json',
          readTimeout: 60000,
          connectTimeout: 60000
        };
        let httpRequest = http.createHttp();
        httpRequest.request('https://www.baidu.com/', httpRequestOptions).then(data => {
          console.log(caseName + JSON.stringify(data));
          expectTrue(data.responseCode == 200);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.info(caseName + 'errocode' + JSON.stringify(error));
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log('testNetworkMgrHttpHttpRequestMethodTRACE0200 : error = ' + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequestMethod_PUT_0100
     * @tc.name: testNetworkMgrHttpHttpRequestMethodPUT0100
     * @tc.desc: Test Test HttpRequestMethod property.
     * @tc.level: level1
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testNetworkMgrHttpHttpRequestMethodPUT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestMethodPUT0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.PUT,
          header: 'content-type: application/json',
          readTimeout: 60000,
          connectTimeout: 60000
        };
        let httpRequest = http.createHttp();
        httpRequest.request('https://httpbin.org/anything', httpRequestOptions, (err, data) => {
          console.log(caseName + JSON.stringify(err) + ' data: ' + JSON.stringify(data));
          expectTrue(data.responseCode == 200);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log('testNetworkMgrHttpHttpRequestMethodPUT0100 : error = ' + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequestMethod_PUT_0200
     * @tc.name: testNetworkMgrHttpHttpRequestMethodPUT0200
     * @tc.desc: Test Test HttpRequestMethod property.
     * @tc.level: level1
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testNetworkMgrHttpHttpRequestMethodPUT0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestMethodPUT0200';
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.PUT,
          header: 'content-type: application/json',
          readTimeout: 60000,
          connectTimeout: 60000
        };
        let httpRequest = http.createHttp();
        httpRequest.request('https://httpbin.org/anything', httpRequestOptions).then(data => {
          console.log(caseName + JSON.stringify(data));
          expectTrue(data.responseCode == 200);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.info(caseName + 'errocode' + JSON.stringify(error));
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log('testNetworkMgrHttpHttpRequestMethodPUT0200 : error = ' + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequestMethod_Head_0100
     * @tc.name: testNetworkMgrHttpHttpRequestMethodHead0100
     * @tc.desc: Test Test HttpRequestMethod property.
     * @tc.level: level1
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testNetworkMgrHttpHttpRequestMethodHead0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestMethodHead0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.HEAD,
          header: 'content-type: application/json',
          readTimeout: 60000,
          connectTimeout: 60000
        };
        let httpRequest = http.createHttp();
        httpRequest.request('https://www.baidu.com/', httpRequestOptions, (err, data) => {
          console.log(caseName + JSON.stringify(err) + ' data: ' + JSON.stringify(data));
          expectTrue(data.responseCode == 200);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log('testNetworkMgrHttpHttpRequestMethodHead0100 : error = ' + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequestMethod_HEAD_0200
     * @tc.name: testNetworkMgrHttpHttpRequestMethodHEAD0200
     * @tc.desc: Test Test HttpRequestMethod property.
     * @tc.level: level1
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testNetworkMgrHttpHttpRequestMethodHEAD0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestMethodHEAD0200';
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.HEAD,
          header: 'content-type: application/json',
          readTimeout: 60000,
          connectTimeout: 60000
        };
        let httpRequest = http.createHttp();
        httpRequest.request('https://www.baidu.com/', httpRequestOptions).then(data => {
          console.log(caseName + JSON.stringify(data));
          expectTrue(data.responseCode == 200);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.info(caseName + 'errocode' + JSON.stringify(error));
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log('testNetworkMgrHttpHttpRequestMethodHEAD0200 : error = ' + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequestMethod_DELETE_0100
     * @tc.name: testNetworkMgrHttpHttpRequestMethodDELETE0100
     * @tc.desc: Test Test HttpRequestMethod property.
     * @tc.level: level1
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testNetworkMgrHttpHttpRequestMethodDELETE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestMethodDELETE0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.DELETE,
          header: 'content-type: application/json',
          readTimeout: 60000,
          connectTimeout: 60000
        };
        let httpRequest = http.createHttp();
        httpRequest.request('https://www.openharmony.cn/', httpRequestOptions, (err, data) => {
          console.log(caseName + JSON.stringify(err) + ' data: ' + JSON.stringify(data));
          expectTrue(data.responseCode == 405);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log('testNetworkMgrHttpHttpRequestMethodDELETE0100 : error = ' + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequestMethod_DELETE_0200
     * @tc.name: testNetworkMgrHttpHttpRequestMethodDELETE0200
     * @tc.desc: Test Test HttpRequestMethod property.
     * @tc.level: level1
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testNetworkMgrHttpHttpRequestMethodDELETE0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestMethodDELETE0200';
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.DELETE,
          header: 'content-type: application/json',
          readTimeout: 60000,
          connectTimeout: 60000
        };
        let httpRequest = http.createHttp();
        httpRequest.request('https://www.openharmony.cn/', httpRequestOptions).then(data => {
          console.log(caseName + JSON.stringify(data));
          expectTrue(data.responseCode == 405);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.info(caseName + 'errocode' + JSON.stringify(error));
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log('testNetworkMgrHttpHttpRequestMethodDELETE0200 : error = ' + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequestMethod_CONNECT_0100
     * @tc.name: testNetworkMgrHttpHttpRequestMethodCONNECT0100
     * @tc.desc: Test Test HttpRequestMethod property.
     * @tc.level: level1
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testNetworkMgrHttpHttpRequestMethodCONNECT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestMethodCONNECT0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.CONNECT,
          header: 'content-type: application/json',
          readTimeout: 60000,
          connectTimeout: 60000
        };
        let httpRequest = http.createHttp();
        httpRequest.request('https://www.baidu.com/', httpRequestOptions, (err, data) => {
          console.log(caseName + JSON.stringify(err) + ' data: ' + JSON.stringify(data));
          expectTrue(data.responseCode == 200);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.log('testNetworkMgrHttpHttpRequestMethodCONNECT0100 : error = ' + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_HttpRequestMethod_CONNECT_0200
     * @tc.name: testNetworkMgrHttpHttpRequestMethodCONNECT0200
     * @tc.desc: Test Test HttpRequestMethod property.
     * @tc.level: level1
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testNetworkMgrHttpHttpRequestMethodCONNECT0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHttpHttpRequestMethodCONNECT0200';
      console.info(`${caseName}---Start`);
      try {
        let httpRequestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.CONNECT,
          header: 'content-type: application/json',
          readTimeout: 60000,
          connectTimeout: 60000
        };
        let httpRequest = http.createHttp();
        httpRequest.request('https://www.baidu.com/', httpRequestOptions).then(data => {
          console.log(caseName + JSON.stringify(data));
          expectTrue(data.responseCode == 200);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.info(caseName + 'errocode' + JSON.stringify(error));
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      }
      catch (error) {
        console.log('testNetworkMgrHttpHttpRequestMethodCONNECT0200 : error = ' + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
  })
};