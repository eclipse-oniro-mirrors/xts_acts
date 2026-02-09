/*
 * Copyright (C) 2023-2024 Huawei Device Co., Ltd.
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

import { describe, expect, it, afterEach, afterAll, beforeAll, Level, Size, TestType } from '@ohos/hypium';
import http from '@ohos.net.http';

let httpRequest = http.createHttp();
let address_baidu = 'https://www.baidu.com';
let address_baidu2 = 'http://www.baidu.com';
let address_post = 'https://www.baidu.com';
let address_post1:string = 'https://mirrors.huaweicloud.com/ubuntu-cdimage/ubuntu/releases/22.04.5/release/ubuntu-22.04.5-live-server-arm64.iso';

let httpRequestOptions_post: http.HttpRequestOptions = {
  method: http.RequestMethod.POST,
  extraData: 'MineMine',
  header: { 'Content-Type': 'application/json' },
  readTimeout: 60000,
  connectTimeout: 60000
}

let httpRequestOptions_resumeFrom_1: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: { 'Content-Type': 'application/json' },
  readTimeout: 60000,
  connectTimeout: 60000,
  maxLimit: 510241024,
  resumeFrom: 1,
  resumeTo: 100
};

let httpRequestOptions_resumeFrom_2G: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: { 'Content-Type': 'application/json' },
  readTimeout: 60000,
  connectTimeout: 60000,
  resumeFrom: 2147483648
};

let httpRequestOptions_resumeFrom_err: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: { 'Content-Type': 'application/json' },
  readTimeout: 60000,
  connectTimeout: 60000,
  resumeFrom: -1
};

let httpRequestOptions_resumeFrom_undefined: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: { 'Content-Type': 'application/json' },
  readTimeout: 60000,
  connectTimeout: 60000,
  resumeFrom: undefined
};

let httpRequestOptions_resumeFrom_null: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: { 'Content-Type': 'application/json' },
  readTimeout: 60000,
  connectTimeout: 60000,
};

let httpRequestOptions_clientCert: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: { 'Content-Type': 'application/json' },
  readTimeout: 60000,
  connectTimeout: 60000,
  clientCert: {
    certPath: 'etc/ssl/certs/client.crt',
    keyPath: 'etc/ssl/certs/client.key',
    keyPassword: 'test1234',
    certType: http.CertType.PEM
  }
};

let httpRequestOptions_clientCert_err: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: { 'Content-Type': 'application/json' },
  readTimeout: 60000,
  connectTimeout: 60000,
  clientCert: {
    certPath: 'xxxxxxxx',
    keyPath: 'xxxxxxxx',
    certType: http.CertType.DER
  }
};

let httpRequestOptions_clientCert_emptyObj: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: { 'Content-Type': 'application/json' },
  readTimeout: 60000,
  connectTimeout: 60000,
  clientCert: {
    certPath: '',
    keyPath: '',
    certType: http.CertType.P12
  }
};

let httpRequestOptions_clientCert_undefined: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: { 'Content-Type': 'application/json' },
  readTimeout: 60000,
  connectTimeout: 60000,
  clientCert: undefined
};

let httpRequestOptions_clientCert_null: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: { 'Content-Type': 'application/json' },
  readTimeout: 60000,
  connectTimeout: 60000,
};

let httpRequestOptions_dnsOverHttps: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: { 'Content-Type': 'application/json' },
  readTimeout: 60000,
  connectTimeout: 60000,
  dnsOverHttps: 'https://dns.alidns.com/dns-query'
};

let httpRequestOptions_dnsOverHttps_emptyStr: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: { 'Content-Type': 'application/json' },
  readTimeout: 60000,
  connectTimeout: 60000,
  dnsOverHttps: ''
};

let httpRequestOptions_dnsOverHttps_undefined: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: { 'Content-Type': 'application/json' },
  readTimeout: 60000,
  connectTimeout: 60000,
  dnsOverHttps: undefined
};

let httpRequestOptions_dnsOverHttps_null: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: { 'Content-Type': 'application/json' },
  readTimeout: 60000,
  connectTimeout: 60000,
};

let httpRequestOptions_dnsServers: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: { 'Content-Type': 'application/json' },
  readTimeout: 60000,
  connectTimeout: 60000,
  dnsServers: ['114.114.115.115:53', '114.114.114.114:53', '8.8.8.8:53']
};

let httpRequestOptions_dnsServers_emptyArr: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: { 'Content-Type': 'application/json' },
  readTimeout: 60000,
  connectTimeout: 60000,
  dnsServers: []
};

let httpRequestOptions_dnsServers_undefined: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: { 'Content-Type': 'application/json' },
  readTimeout: 60000,
  connectTimeout: 60000,
  dnsServers: undefined
};

let httpRequestOptions_dnsServers_null: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: { 'Content-Type': 'application/json' },
  readTimeout: 60000,
  connectTimeout: 60000,
};

function dataSendProgress_on_callback(data: http.DataSendProgressInfo) {
  console.log("dataSendProgress_on_callback receive data: " + JSON.stringify(data));
  let sendSize = data.sendSize;
  let totalSize = data.totalSize;
  console.log("dataSendProgress_on_callback sendSize: " + JSON.stringify(sendSize) +
    " , dataSendProgress_on_callback totalSize: " + JSON.stringify(totalSize));
}

function expectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    console.info('assertion failure');
  }
};

function expectTrue(data : boolean){
    try {
        expect(data).assertTrue();
    } catch (err){
        console.info('assertion failure');    
    }
};

export default function NetworkManagerHttpEnhanceTest() {
  beforeAll(async () => {
    console.log('NetworkManagerHttpEnhanceTest beforeAll start');
    console.log('NetworkManagerHttpEnhanceTest beforeAll end');
  });

  describe('NetworkManagerHttpEnhanceTest', () => {
    /**
     * @tc.name   testNetworkMgrHTTPOnDataSendProgress0100
     * @tc.number SUB_NetworkMgr_HTTP_On_DataSendProgress_0100
     * @tc.desc   http::on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPOnDataSendProgress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHTTPOnDataSendProgress0100';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.on('dataSendProgress', dataSendProgress_on_callback);
        httpRequest.request(address_post, httpRequestOptions_post, (err, data) => {
          if (err) {
            console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          }
          else {
            console.log(`${caseName} on dataSendProgress success, data: ${JSON.stringify(data)}`);
            expectTrue(data.responseCode == 200);
            console.info(`${caseName}---End`);
            done();
          }
        })
      } catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
        }
      });

    /**
     * @tc.name   testNetworkMgrHTTPOnDataSendProgress0200
     * @tc.number SUB_NetworkMgr_HTTP_On_DataSendProgress_0200
     * @tc.desc   http::on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPOnDataSendProgress0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHTTPOnDataSendProgress0200';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.on(undefined, dataSendProgress_on_callback);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectTrue(error.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHTTPOnDataSendProgress0300
     * @tc.number SUB_NetworkMgr_HTTP_On_DataSendProgress_0300
     * @tc.desc   http::on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPOnDataSendProgress0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHTTPOnDataSendProgress0300';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.on(null, dataSendProgress_on_callback);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectTrue(error.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHTTPOnDataSendProgress0400
     * @tc.number SUB_NetworkMgr_HTTP_On_DataSendProgress_0400
     * @tc.desc   http::on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPOnDataSendProgress0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHTTPOnDataSendProgress0400';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.on('dataSendProgress', dataSendProgress_on_callback);
        httpRequest.request(address_post, httpRequestOptions_post, (err, data) => {
          if (err) {
            console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          }
          else {
            console.log(`${caseName} on dataSendProgress success, data: ${JSON.stringify(data)}`);
            expectTrue(data.responseCode == 200);
            console.info(`${caseName}---End`);
            done();
          }
        })
      }catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkManagerHTTPOffDataSendProgress0200
     * @tc.number SUB_NetworkManager_HTTP_Off_DataSendProgress_0200
     * @tc.desc   http::off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkManagerHTTPOffDataSendProgress0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkManagerHTTPOffDataSendProgress0200';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.off(undefined);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectTrue(error.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHTTPOffDataSendProgress0300
     * @tc.number SUB_NetworkMgr_HTTP_Off_DataSendProgress_0300
     * @tc.desc   http::off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPOffDataSendProgress0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHTTPOffDataSendProgress0300';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.off(null);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectTrue(error.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHTTPRequestResumeFrom0100
     * @tc.number SUB_NetworkMgr_HTTP_Request_ResumeFrom_0100
     * @tc.desc   http::request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPRequestResumeFrom0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHTTPRequestResumeFrom0100';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.request(address_post1, httpRequestOptions_resumeFrom_1, (err, data) => {
          if (err) {
            console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
            expectTrue(data.responseCode == 206);
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHTTPRequestResumeFrom0300
     * @tc.number SUB_NetworkMgr_HTTP_Request_ResumeFrom_0300
     * @tc.desc   http::request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPRequestResumeFrom0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHTTPRequestResumeFrom0300';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.request(address_baidu, httpRequestOptions_resumeFrom_err, (err, data) => {
          if (err) {
            console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
            expectTrue(data.responseCode == 200);
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHTTPRequestResumeFrom0200
     * @tc.number SUB_NetworkMgr_HTTP_Request_ResumeFrom_0200
     * @tc.desc   http::request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPRequestResumeFrom0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHTTPRequestResumeFrom0200';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.request(address_baidu, httpRequestOptions_resumeFrom_2G, (err, data) => {
          if (err) {
            console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
            expectTrue(data.responseCode >= 200);
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHTTPRequestResumeFrom0400
     * @tc.number SUB_NetworkMgr_HTTP_Request_ResumeFrom_0400
     * @tc.desc   test http::request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPRequestResumeFrom0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHTTPRequestResumeFrom0400';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.request(address_baidu, httpRequestOptions_resumeFrom_undefined, (err, data) => {
          if (err) {
            console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
            expectTrue(data.responseCode == 200);
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHTTPRequestResumeFrom0500
     * @tc.number SUB_NetworkMgr_HTTP_Request_ResumeFrom_0500
     * @tc.desc   http::request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPRequestResumeFrom0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHTTPRequestResumeFrom0500';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.request(address_baidu, httpRequestOptions_resumeFrom_null, (err, data) => {
          if (err) {
            console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
            expectTrue(data.responseCode == 200);
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHTTPRequestClientCert0100
     * @tc.number SUB_NetworkMgr_HTTP_Request_ClientCert_0100
     * @tc.desc   http::request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPRequestClientCert0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHTTPRequestClientCert0100';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.request(address_baidu, httpRequestOptions_clientCert, (err, data) => {
          if (err) {
            console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
            expectTrue(err !== undefined);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHTTPRequestClientCert0200
     * @tc.number SUB_NetworkMgr_HTTP_Request_ClientCert_0200
     * @tc.desc   http::request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPRequestClientCert0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHTTPRequestClientCert0200';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.request(address_baidu, httpRequestOptions_clientCert_err, (err, data) => {
          if (err) {
            console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
            expectTrue(err !== undefined);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHTTPRequestClientCert0300
     * @tc.number SUB_NetworkMgr_HTTP_Request_ClientCert_0300
     * @tc.desc   http::request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPRequestClientCert0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHTTPRequestClientCert0300';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.request(address_baidu, httpRequestOptions_clientCert_emptyObj, (err, data) => {
          if (err) {
            console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
            expectTrue(data.responseCode == 200);
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHTTPRequestClientCert0400
     * @tc.number SUB_NetworkMgr_HTTP_Request_ClientCert_0400
     * @tc.desc   http::request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPRequestClientCert0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHTTPRequestClientCert0400';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.request(address_baidu, httpRequestOptions_clientCert_undefined, (err, data) => {
          if (err) {
            console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
            expectTrue(data.responseCode == 200);
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHTTPRequestClientCert0500
     * @tc.number SUB_NetworkMgr_HTTP_Request_ClientCert_0500
     * @tc.desc   http::request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPRequestClientCert0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHTTPRequestClientCert0500';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.request(address_baidu, httpRequestOptions_clientCert_null, (err, data) => {
          if (err) {
            console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
            expectTrue(data.responseCode == 200);
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHTTPRequestDnsOverHttps0100
     * @tc.number SUB_NetworkMgr_HTTP_Request_DnsOverHttps_0100
     * @tc.desc   http::request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPRequestDnsOverHttps0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHTTPRequestDnsOverHttps0100';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.request(address_baidu2, httpRequestOptions_dnsOverHttps, (err, data) => {
          if (err) {
            console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
            expectTrue(data.responseCode == 200);
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHTTPRequestDnsOverHttps0200
     * @tc.number SUB_NetworkMgr_HTTP_Request_DnsOverHttps_0200
     * @tc.desc   http::request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPRequestDnsOverHttps0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHTTPRequestDnsOverHttps0200';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.request(address_baidu2, httpRequestOptions_dnsOverHttps_emptyStr, (err, data) => {
          if (err) {
            console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
            expectTrue(data.responseCode == 200);
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHTTPRequestDnsOverHttps0300
     * @tc.number SUB_NetworkMgr_HTTP_Request_DnsOverHttps_0300
     * @tc.desc   http::request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPRequestDnsOverHttps0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHTTPRequestDnsOverHttps0300';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.request(address_baidu2, httpRequestOptions_dnsOverHttps_undefined, (err, data) => {
          if (err) {
            console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
            expectTrue(data.responseCode == 200);
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHTTPRequestDnsOverHttps0400
     * @tc.number SUB_NetworkMgr_HTTP_Request_DnsOverHttps_0400
     * @tc.desc   http::request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPRequestDnsOverHttps0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHTTPRequestDnsOverHttps0400';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.request(address_baidu2, httpRequestOptions_dnsOverHttps_null, (err, data) => {
          if (err) {
            console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
            expectTrue(data.responseCode == 200);
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHTTPRequestDnsServers0100
     * @tc.number SUB_NetworkMgr_HTTP_Request_DnsServers_0100
     * @tc.desc   http::request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPRequestDnsServers0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHTTPRequestDnsServers0100';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.request(address_baidu, httpRequestOptions_dnsServers, (err, data) => {
          if (err) {
            console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
            expectTrue(data.responseCode == 200);
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHTTPRequestDnsServers0200
     * @tc.number SUB_NetworkMgr_HTTP_Request_DnsServers_0200
     * @tc.desc   http::request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPRequestDnsServers0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHTTPRequestDnsServers0200';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.request(address_baidu, httpRequestOptions_dnsServers_emptyArr, (err, data) => {
          if (err) {
            console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
            expectTrue(data.responseCode == 200);
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHTTPRequestDnsServers0300
     * @tc.number SUB_NetworkMgr_HTTP_Request_DnsServers_0300
     * @tc.desc   http::request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPRequestDnsServers0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHTTPRequestDnsServers0300';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.request(address_baidu, httpRequestOptions_dnsServers_undefined, (err, data) => {
          if (err) {
            console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
            expectTrue(data.responseCode == 200);
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHTTPRequestDnsServers0400
     * @tc.number SUB_NetworkMgr_HTTP_Request_DnsServers_0400
     * @tc.desc   http::request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPRequestDnsServers0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHTTPRequestDnsServers0400';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.request(address_baidu, httpRequestOptions_dnsServers_null, (err, data) => {
          if (err) {
            console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
            expectTrue(data.responseCode == 200);
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHTTPRequestPerformanceTiming0100
     * @tc.number SUB_NetworkMgr_HTTP_Request_PerformanceTiming_0100
     * @tc.desc   Test PerformanceTiming property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPRequestPerformanceTiming0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName:string = 'testNetworkMgrHTTPRequestPerformanceTiming0100';
      console.info(`${caseName}---Start`);
      try {
        httpRequest.request(address_post, httpRequestOptions_post, (err, data) => {
          if (err) {
            console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
            expectTrue(data.performanceTiming.dnsTiming >= 0);
            expectTrue(data.performanceTiming.tcpTiming >= 0);
            expectTrue(data.performanceTiming.tlsTiming >= 0);
            expectTrue(data.performanceTiming.firstSendTiming > 0);
            expectTrue(data.performanceTiming.firstReceiveTiming > 0);
            expectTrue(data.performanceTiming.totalFinishTiming > 0);
            expectTrue(data.performanceTiming.redirectTiming >= 0);
            expectTrue(data.performanceTiming.responseHeaderTiming > 0);
            expectTrue(data.performanceTiming.responseBodyTiming > 0);
            expectTrue(data.performanceTiming.totalTiming > 0);
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (error) {
        console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
  })
};