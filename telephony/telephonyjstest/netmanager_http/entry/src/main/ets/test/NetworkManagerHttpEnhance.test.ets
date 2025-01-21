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

import { describe, expect, it, afterEach, afterAll, beforeAll } from '@ohos/hypium';
import http from '@ohos.net.http';

let httpRequest = http.createHttp();
let address_baidu = 'https://www.baidu.com';
let address_baidu2 = 'http://www.baidu.com';
let address_post = 'https://httpbin.org/post';

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

function dataSendProgress_on_callback(data: Object) {
  console.log('dataSendProgress_on_callback receive len:' + JSON.stringify(data));
}

function expectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    console.info('assertion failure');
  }
};

let dataSendProgress_01 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_on_dataSendProgress_0100';
  try {
    httpRequest.on('dataSendProgress', dataSendProgress_on_callback);
    httpRequest.request(address_post, httpRequestOptions_post, (err, data) => {
      console.log(`${caseName} on dataSendProgress success, data: ${JSON.stringify(data)}`);
      expect(data.responseCode == 200).assertTrue();
      done();
    })
  } catch (error) {
    console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
    expectFalse();
    done();
  }
};

let dataSendProgress_02 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_on_dataSendProgress_0200';
  try {
    httpRequest.on(undefined, dataSendProgress_on_callback);
    expectFalse();
    done();
  } catch (error) {
    console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
    expect(error.code == 401).assertTrue();
    done();
  }
};

let dataSendProgress_03 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_on_dataSendProgress_0300';
  try {
    httpRequest.on(null, dataSendProgress_on_callback);
    expectFalse();
    done();
  } catch (error) {
    console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
    expect(error.code == 401).assertTrue();
    done();
  }
};

let dataSendProgress_0100 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_on_dataSendProgress_0100';
  try {
    httpRequest.on('dataSendProgress', dataSendProgress_on_callback);
    httpRequest.request(address_post, httpRequestOptions_post, (err, data) => {
      console.log(`${caseName} on dataSendProgress success, data: ${JSON.stringify(data)}`);
      expect(data.responseCode == 200).assertTrue();
      done();
    })
  } catch (error) {
    console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
    expectFalse();
    done();
  }
};

let dataSendProgress_0200 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_off_dataSendProgress_0200';
  try {
    httpRequest.off(undefined);
    expectFalse();
    done();
  } catch (error) {
    console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
    expect(error.code == 401).assertTrue();
    done();
  }
};

let dataSendProgress_0300 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_off_dataSendProgress_0300';
  try {
    httpRequest.off(null);
    expectFalse();
    done();
  } catch (error) {
    console.log(`${caseName} catch error: ${JSON.stringify(error)}`);
    expect(error.code == 401).assertTrue();
    done();
  }
};

let resumeFrom_0100 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_request_resumeFrom_0100';
  httpRequest.request(address_baidu, httpRequestOptions_resumeFrom_1, (err, data) => {
    if (err) {
      console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
      expectFalse();
      done();
    } else {
      console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
      expect(data.responseCode == 206).assertTrue();
      done();
    }
  });
};

let resumeFrom_0300 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_request_resumeFrom_0300';
  httpRequest.request(address_baidu, httpRequestOptions_resumeFrom_err, (err, data) => {
    if (err) {
      console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
      expectFalse();
      done();
    } else {
      console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
      expect(data.responseCode == 200).assertTrue();
      done();
    }
  });
};

let resumeFrom_0200 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_request_resumeFrom_0200';
  httpRequest.request(address_baidu, httpRequestOptions_resumeFrom_2G, (err, data) => {
    if (err) {
      console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
      expectFalse();
      done();
    } else {
      console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
      expect(data.responseCode >= 200).assertTrue();
      done();
    }
  });
};

let resumeFrom_0400 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_request_resumeFrom_0400';
  httpRequest.request(address_baidu, httpRequestOptions_resumeFrom_undefined, (err, data) => {
    if (err) {
      console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
      expectFalse();
      done();
    } else {
      console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
      expect(data.responseCode == 200).assertTrue();
      done();
    }
  });
};

let resumeFrom_0500 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_request_resumeFrom_0500';
  httpRequest.request(address_baidu, httpRequestOptions_resumeFrom_null, (err, data) => {
    if (err) {
      console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
      expectFalse();
      done();
    } else {
      console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
      expect(data.responseCode == 200).assertTrue();
      done();
    }
  });
};

let clientCert_0100 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_request_clientCert_0100';
  httpRequest.request(address_baidu, httpRequestOptions_clientCert, (err, data) => {
    if (err) {
      console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
      expect(err !== undefined).assertTrue();
      done();
    } else {
      console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
      expectFalse();
      done();
    }
  });
};

let clientCert_0200 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_request_clientCert_0200';
  httpRequest.request(address_baidu, httpRequestOptions_clientCert_err, (err, data) => {
    if (err) {
      console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
      expect(err !== undefined).assertTrue();
      done();
    } else {
      console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
      expectFalse();
      done();
    }
  });
};

let clientCert_0300 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_request_clientCert_0300';
  httpRequest.request(address_baidu, httpRequestOptions_clientCert_emptyObj, (err, data) => {
    if (err) {
      console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
      expectFalse();
      done();
    } else {
      console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
      expect(data.responseCode == 200).assertTrue();
      done();
    }
  });
};

let clientCert_0400 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_request_clientCert_0400';
  httpRequest.request(address_baidu, httpRequestOptions_clientCert_undefined, (err, data) => {
    if (err) {
      console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
      expectFalse();
      done();
    } else {
      console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
      expect(data.responseCode == 200).assertTrue();
      done();
    }
  });
};

let clientCert_0500 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_request_clientCert_0500';
  httpRequest.request(address_baidu, httpRequestOptions_clientCert_null, (err, data) => {
    if (err) {
      console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
      expectFalse();
      done();
    } else {
      console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
      expect(data.responseCode == 200).assertTrue();
      done();
    }
  });
};

let dnsOverHttps_0100 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_request_dnsOverHttps_0100';
  httpRequest.request(address_baidu2, httpRequestOptions_dnsOverHttps, (err, data) => {
    if (err) {
      console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
      expectFalse();
      done();
    } else {
      console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
      expect(data.responseCode == 200).assertTrue();
      done();
    }
  });
};

let dnsOverHttps_0200 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_request_dnsOverHttps_0200';
  httpRequest.request(address_baidu2, httpRequestOptions_dnsOverHttps_emptyStr, (err, data) => {
    if (err) {
      console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
      expectFalse();
      done();
    } else {
      console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
      expect(data.responseCode == 200).assertTrue();
      done();
    }
  });
};

let dnsOverHttps_0300 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_request_dnsOverHttps_0300';
  httpRequest.request(address_baidu2, httpRequestOptions_dnsOverHttps_undefined, (err, data) => {
    if (err) {
      console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
      expectFalse();
      done();
    } else {
      console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
      expect(data.responseCode == 200).assertTrue();
      done();
    }
  });
};

let dnsOverHttps_0400 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_request_dnsOverHttps_0400';
  httpRequest.request(address_baidu2, httpRequestOptions_dnsOverHttps_null, (err, data) => {
    if (err) {
      console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
      expectFalse();
      done();
    } else {
      console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
      expect(data.responseCode == 200).assertTrue();
      done();
    }
  });
};

let dnsServers_0100 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_request_dnsServers_0100';
  httpRequest.request(address_baidu, httpRequestOptions_dnsServers, (err, data) => {
    if (err) {
      console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
      expectFalse();
      done();
    } else {
      console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
      expect(data.responseCode == 200).assertTrue();
      done();
    }
  });
};

let dnsServers_0200 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_request_dnsServers_0200';
  httpRequest.request(address_baidu, httpRequestOptions_dnsServers_emptyArr, (err, data) => {
    if (err) {
      console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
      expectFalse();
      done();
    } else {
      console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
      expect(data.responseCode == 200).assertTrue();
      done();
    }
  });
};

let dnsServers_0300 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_request_dnsServers_0300';
  httpRequest.request(address_baidu, httpRequestOptions_dnsServers_undefined, (err, data) => {
    if (err) {
      console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
      expectFalse();
      done();
    } else {
      console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
      expect(data.responseCode == 200).assertTrue();
      done();
    }
  });
};

let dnsServers_0400 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_request_dnsServers_0400';
  httpRequest.request(address_baidu, httpRequestOptions_dnsServers_null, (err, data) => {
    if (err) {
      console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
      expectFalse();
      done();
    } else {
      console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
      expect(data.responseCode == 200).assertTrue();
      done();
    }
  });
};

let performanceTiming_0100 = async (done: Function) => {
  let caseName = 'test SUB_NetworkManager_HTTP_request_performanceTiming_0100';
  httpRequest.request(address_post, httpRequestOptions_post, (err, data) => {
    if (err) {
      console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
      expectFalse();
      done();
    } else {
      console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
      expect(data.performanceTiming.dnsTiming > 0).assertTrue();
      expect(data.performanceTiming.tcpTiming > 0).assertTrue();
      expect(data.performanceTiming.tlsTiming > 0).assertTrue();
      expect(data.performanceTiming.firstSendTiming > 0).assertTrue();
      expect(data.performanceTiming.firstReceiveTiming > 0).assertTrue();
      expect(data.performanceTiming.totalFinishTiming > 0).assertTrue();
      expect(data.performanceTiming.redirectTiming >= 0).assertTrue();
      expect(data.performanceTiming.responseHeaderTiming > 0).assertTrue();
      expect(data.performanceTiming.responseBodyTiming > 0).assertTrue();
      expect(data.performanceTiming.totalTiming > 0).assertTrue();
      done();
    }
  });
};

export default function NetworkManagerHttpEnhanceTest() {
  beforeAll(async () => {
    console.log('NetworkManagerHttpEnhanceTest beforeAll start');
    console.log('NetworkManagerHttpEnhanceTest beforeAll end');
  });

  describe('NetworkManagerHttpEnhanceTest', () => {
    /**
     * @tc.number test SUB_NetworkManager_HTTP_on_dataSendProgress_0100
     * @tc.name test SUB_NetworkManager_HTTP_on_dataSendProgress_0100
     * @tc.desc http::on
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_on_dataSendProgress_0100', 0, dataSendProgress_01);

    /**
     * @tc.number test SUB_NetworkManager_HTTP_on_dataSendProgress_0200
     * @tc.name test SUB_NetworkManager_HTTP_on_dataSendProgress_0200
     * @tc.desc http::on
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_on_dataSendProgress_0200', 0, dataSendProgress_02);

    /**
     * @tc.number test SUB_NetworkManager_HTTP_on_dataSendProgress_0300
     * @tc.name test SUB_NetworkManager_HTTP_on_dataSendProgress_0300
     * @tc.desc http::on
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_on_dataSendProgress_0300', 0, dataSendProgress_03);

    /**
     * @tc.number test SUB_NetworkManager_HTTP_off_dataSendProgress_0100
     * @tc.name test SUB_NetworkManager_HTTP_off_dataSendProgress_0100
     * @tc.desc http::off
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_off_dataSendProgress_0100', 0, dataSendProgress_0100);

    /**
     * @tc.number test SUB_NetworkManager_HTTP_off_dataSendProgress_0200
     * @tc.name test SUB_NetworkManager_HTTP_off_dataSendProgress_0200
     * @tc.desc http::off
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_off_dataSendProgress_0200', 0, dataSendProgress_0200);

    /**
     * @tc.number test SUB_NetworkManager_HTTP_off_dataSendProgress_0300
     * @tc.name test SUB_NetworkManager_HTTP_off_dataSendProgress_0300
     * @tc.desc http::off
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_off_dataSendProgress_0300', 0, dataSendProgress_0300);

    /**
     * @tc.number test SUB_NetworkManager_HTTP_request_resumeFrom_0100
     * @tc.name test SUB_NetworkManager_HTTP_request_resumeFrom_0100
     * @tc.desc http::request
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_request_resumeFrom_0100', 0, resumeFrom_0100);

    /**
     * @tc.number test SUB_NetworkManager_HTTP_request_resumeFrom_0300
     * @tc.name test SUB_NetworkManager_HTTP_request_resumeFrom_0300
     * @tc.desc http::request
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_request_resumeFrom_0300', 0, resumeFrom_0300);

    /**
     * @tc.number test SUB_NetworkManager_HTTP_request_resumeFrom_0200
     * @tc.name test SUB_NetworkManager_HTTP_request_resumeFrom_0200
     * @tc.desc http::request
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_request_resumeFrom_0200', 0, resumeFrom_0200);

    /**
     * @tc.number test SUB_NetworkManager_HTTP_request_resumeFrom_0400
     * @tc.name test SUB_NetworkManager_HTTP_request_resumeFrom_0400
     * @tc.desc test http::request
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_request_resumeFrom_0400', 0, resumeFrom_0400);

    /**
     * @tc.number test SUB_NetworkManager_HTTP_request_resumeFrom_0500
     * @tc.name test SUB_NetworkManager_HTTP_request_resumeFrom_0500
     * @tc.desc http::request
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_request_resumeFrom_0500', 0, resumeFrom_0500);

    /**
     * @tc.number test SUB_NetworkManager_HTTP_request_clientCert_0100
     * @tc.name test SUB_NetworkManager_HTTP_request_clientCert_0100
     * @tc.desc http::request
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_request_clientCert_0100', 0, clientCert_0100);

    /**
     * @tc.number test SUB_NetworkManager_HTTP_request_clientCert_0200
     * @tc.name test SUB_NetworkManager_HTTP_request_clientCert_0200
     * @tc.desc http::request
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_request_clientCert_0200', 0, clientCert_0200);

    /**
     * @tc.number test SUB_NetworkManager_HTTP_request_clientCert_0300
     * @tc.name test SUB_NetworkManager_HTTP_request_clientCert_0300
     * @tc.desc http::request
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_request_clientCert_0300', 0, clientCert_0300);

    /**
     * @tc.number test SUB_NetworkManager_HTTP_request_clientCert_0400
     * @tc.name test SUB_NetworkManager_HTTP_request_clientCert_0400
     * @tc.desc http::request
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_request_clientCert_0400', 0, clientCert_0400);

    /**
     * @tc.number test SUB_NetworkManager_HTTP_request_clientCert_0500
     * @tc.name test SUB_NetworkManager_HTTP_request_clientCert_0500
     * @tc.desc http::request
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_request_clientCert_0500', 0, clientCert_0500);

    /**
     * @tc.number test SUB_NetworkManager_HTTP_request_dnsOverHttps_0100
     * @tc.name test SUB_NetworkManager_HTTP_request_dnsOverHttps_0100
     * @tc.desc http::request
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_request_dnsOverHttps_0100', 0, dnsOverHttps_0100);

    /**
     * @tc.number test SUB_NetworkManager_HTTP_request_dnsOverHttps_0200
     * @tc.name test SUB_NetworkManager_HTTP_request_dnsOverHttps_0200
     * @tc.desc http::request
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_request_dnsOverHttps_0200', 0, dnsOverHttps_0200);

    /**
     * @tc.number test SUB_NetworkManager_HTTP_request_dnsOverHttps_0300
     * @tc.name test SUB_NetworkManager_HTTP_request_dnsOverHttps_0300
     * @tc.desc http::request
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_request_dnsOverHttps_0300', 0, dnsOverHttps_0300);

    /**
     * @tc.number test SUB_NetworkManager_HTTP_request_dnsOverHttps_0400
     * @tc.name test SUB_NetworkManager_HTTP_request_dnsOverHttps_0400
     * @tc.desc http::request
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_request_dnsOverHttps_0400', 0, dnsOverHttps_0400);

    /**
     * @tc.number test SUB_NetworkManager_HTTP_request_dnsServers_0100
     * @tc.name test SUB_NetworkManager_HTTP_request_dnsServers_0100
     * @tc.desc http::request
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_request_dnsServers_0100', 0, dnsServers_0100);

    /**
     * @tc.number test SUB_NetworkManager_HTTP_request_dnsServers_0200
     * @tc.name test SUB_NetworkManager_HTTP_request_dnsServers_0200
     * @tc.desc http::request
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_request_dnsServers_0200', 0, dnsServers_0200);

    /**
     * @tc.number test SUB_NetworkManager_HTTP_request_dnsServers_0300
     * @tc.name test SUB_NetworkManager_HTTP_request_dnsServers_0300
     * @tc.desc http::request
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_request_dnsServers_0300', 0, dnsServers_0300);

    /**
     * @tc.number test SUB_NetworkManager_HTTP_request_dnsServers_0400
     * @tc.name test SUB_NetworkManager_HTTP_request_dnsServers_0400
     * @tc.desc http::request
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_request_dnsServers_0400', 0, dnsServers_0400);

    /**
     * @tc.number test SUB_NetworkManager_HTTP_request_performanceTiming_0100
     * @tc.name test SUB_NetworkManager_HTTP_request_performanceTiming_0100
     * @tc.desc Test PerformanceTiming property
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('test SUB_NetworkManager_HTTP_request_performanceTiming_0100', 0, performanceTiming_0100);
  })
};