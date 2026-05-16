
/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';
import connection from '@ohos.net.connection';

const baiduUrl: string = "https://www.baidu.com";
const baiduPinRight: string = 'Q6TCQAWqP4t+eq41xnKaUgJdrPWqyG5L+Ni2YzMhqdY=';
const baiduPinWrong: string= 'AAAAQAWqP4t+eq41xnKaUgJdrPWqyG5L+Ni2YzMhqdY=';

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(` exportFail failed err: ${JSON.stringify(err)}`);
  }
};


export default function HttpCertificatePinTest() {
  describe('HttpCertificatePinTest', () => {

    /**
     * @tc.name   testHttpCertificatePin0100
     * @tc.number SUB_NetworkMgr_Http_CertificatePin_0100
     * @tc.desc   test certificatePin with wrong baidu's PIN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpCertificatePin0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      const caseName: string = 'testHttpCertificatePin0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        let requestOptions: http.HttpRequestOptions = {
          usingProtocol: http.HttpProtocol.HTTP1_1,
          header: { 'content-type': 'application/json' },
          certificatePinning: { publicKeyHash: baiduPinWrong, hashAlgorithm: 'SHA-256' }
        }
        httpRequest.on("headersReceive", (data: Object) => {
          console.info("Rcv headers");
        });
        httpRequest.on("dataEnd", () => {
          console.info("Rcv data end");
        });
        httpRequest.request(baiduUrl, requestOptions, (err, data) => {
          if (err) {
            console.info("HTTP Request error: " + JSON.stringify(err));
            httpRequest.destroy();
            done();
          } else {
            console.info("HTTP Request data: " + JSON.stringify(data));
            httpRequest.destroy();
            done();
          }
        })
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.name   testHttpCertificatePin0200
     * @tc.number SUB_NetworkMgr_Http_CertificatePin_0200
     * @tc.desc   test certificatePin with correct baidu's PIN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpCertificatePin0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = 'testHttpCertificatePin0200';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        let requestOptions: http.HttpRequestOptions = {
          usingProtocol: http.HttpProtocol.HTTP1_1,
          header: { 'content-type': 'application/json' },
          certificatePinning: {publicKeyHash: baiduPinRight, hashAlgorithm: 'SHA-256'},
        }

        httpRequest.on("headersReceive", (data: Object) => {
          console.info("Rcv headers");
        });
        httpRequest.on("dataEnd", () => {
          console.info("Rcv data end");
        });
        httpRequest.request(baiduUrl, requestOptions, (err, data) => {
          if (err) {
            console.info("HTTP Request error: " + JSON.stringify(err));
            httpRequest.destroy();
            done();
          } else {
            console.info("HTTP Request data: " + JSON.stringify(data));
            httpRequest.destroy();
            done();
          }
        })
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });
    /**
     * @tc.name   testHttpCertificatePin0300
     * @tc.number SUB_NetworkMgr_Http_CertificatePin_0300
     * @tc.desc   test certificatePin with correct baidu's PIN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpCertificatePin0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = 'testHttpCertificatePin0300';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        let requestOptions: http.HttpRequestOptions = {
          usingProtocol: http.HttpProtocol.HTTP1_1,
          header: { 'content-type': 'application/json' },
          certificatePinning: [],
        }

        httpRequest.on("headersReceive", (data: Object) => {
          console.info("Rcv headers");
        });
        httpRequest.on("dataEnd", () => {
          console.info("Rcv data end");
        });
        httpRequest.request(baiduUrl, requestOptions, (err, data) => {
          if (err) {
            console.info("HTTP Request error: " + JSON.stringify(err));
            httpRequest.destroy();
            done();
          } else {
            console.info("HTTP Request data: " + JSON.stringify(data));
            httpRequest.destroy();
            done();
          }
        })
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });
    /**
     * @tc.name   testHttpCertificatePin0400
     * @tc.number SUB_NetworkMgr_Http_CertificatePin_0400
     * @tc.desc   test certificatePin with correct baidu's PIN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpCertificatePin0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = 'testHttpCertificatePin0400';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        let requestOptions: http.HttpRequestOptions = {
          usingProtocol: http.HttpProtocol.HTTP1_1,
          header: { 'content-type': 'application/json' },
          certificatePinning: [],
        }

        httpRequest.on("headersReceive", (data: Object) => {
          console.info("Rcv headers");
        });
        httpRequest.on("dataEnd", () => {
          console.info("Rcv data end");
        });
        httpRequest.request(baiduUrl, requestOptions).then((res) => {
          console.info(`${caseName} data: --- ${JSON.stringify(res)}`);
          httpRequest.destroy();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} catch ERROR: ${JSON.stringify(err)}`);
          ExpectFail();
          httpRequest.destroy();
          done();
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });
    /**
     * @tc.name   testHttpCertificatePin0500
     * @tc.number SUB_NetworkMgr_Http_CertificatePin_0500
     * @tc.desc   test certificatePin with correct baidu's PIN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpCertificatePin0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = 'testHttpCertificatePin0500';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        let requestOptions: http.HttpRequestOptions = {
          usingProtocol: http.HttpProtocol.HTTP1_1,
          header: { 'content-type': 'application/json' },
          certificatePinning: [],
        }

        httpRequest.on("headersReceive", (data: Object) => {
          console.info("Rcv headers");
        });
        httpRequest.on("dataEnd", () => {
          console.info("Rcv data end");
        });
        httpRequest.requestInStream(baiduUrl, requestOptions, (err, data) => {
          if (err) {
            console.info("HTTP Request error: " + JSON.stringify(err));
            httpRequest.destroy();
            done();
          } else {
            console.info("HTTP Request data: " + JSON.stringify(data));
            httpRequest.destroy();
            done();
          }
        })
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });
    /**
     * @tc.name   testHttpCertificatePin0600
     * @tc.number SUB_NetworkMgr_Http_CertificatePin_0600
     * @tc.desc   test certificatePin with correct baidu's PIN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpCertificatePin0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = 'testHttpCertificatePin0600';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        let requestOptions: http.HttpRequestOptions = {
          usingProtocol: http.HttpProtocol.HTTP1_1,
          header: { 'content-type': 'application/json' },
          certificatePinning: [],
        }

        httpRequest.on("headersReceive", (data: Object) => {
          console.info("Rcv headers");
        });
        httpRequest.on("dataEnd", () => {
          console.info("Rcv data end");
        });
        httpRequest.requestInStream(baiduUrl, requestOptions).then((res) => {
          console.info(`${caseName} data: --- ${JSON.stringify(res)}`);
          httpRequest.destroy();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} catch ERROR: ${JSON.stringify(err)}`);
          ExpectFail();
          httpRequest.destroy();
          done();
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });
    /**
     * @tc.name   testHttpCertificatePin0700
     * @tc.number SUB_NetworkMgr_Http_CertificatePin_0700
     * @tc.desc   test certificatePin with wrong baidu's PIN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpCertificatePin0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      const caseName: string = 'testHttpCertificatePin0700';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        let requestOptions: http.HttpRequestOptions = {
          usingProtocol: http.HttpProtocol.HTTP1_1,
          header: { 'content-type': 'application/json' },
          certificatePinning: { publicKeyHash: baiduPinWrong, hashAlgorithm: 'SHA-256' }
        }
        httpRequest.on("headersReceive", (data: Object) => {
          console.info("Rcv headers");
        });
        httpRequest.on("dataEnd", () => {
          console.info("Rcv data end");
        });
        httpRequest.requestInStream(baiduUrl, requestOptions, (err, data) => {
          if (err) {
            console.info(`${caseName} HTTP Request error: ${JSON.stringify(err)}`);
            httpRequest.destroy();
            done();
          } else {
            console.info(`${caseName} HTTP Request data: ${JSON.stringify(err)}`);

            httpRequest.destroy();
            done();
          }
        })
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });
    /**
     * @tc.name   testHttpCertificatePin0800
     * @tc.number SUB_NetworkMgr_Http_CertificatePin_0800
     * @tc.desc   test certificatePin with correct baidu's PIN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpCertificatePin0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = 'testHttpCertificatePin0800';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        let requestOptions: http.HttpRequestOptions = {
          usingProtocol: http.HttpProtocol.HTTP1_1,
          header: { 'content-type': 'application/json' },
          certificatePinning: { publicKeyHash: baiduPinWrong, hashAlgorithm: 'SHA-256' }
        }
        httpRequest.on("headersReceive", (data: Object) => {
          console.info("Rcv headers");
        });
        httpRequest.on("dataEnd", () => {
          console.info("Rcv data end");
        });
        httpRequest.requestInStream(baiduUrl, requestOptions).then((res) => {
          console.info(`${caseName} data: --- ${JSON.stringify(res)}`);
          httpRequest.destroy();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} catch ERROR: ${JSON.stringify(err)}`);
          httpRequest.destroy();
          done();
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });
    /**
     * @tc.name   testHttpCertificatePin0900
     * @tc.number SUB_NetworkMgr_Http_CertificatePin_0900
     * @tc.desc   test certificatePin with correct baidu's PIN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpCertificatePin0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = 'testHttpCertificatePin0900';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        let requestOptions: http.HttpRequestOptions = {
          usingProtocol: http.HttpProtocol.HTTP1_1,
          header: { 'content-type': 'application/json' },
          certificatePinning: { publicKeyHash: baiduPinWrong, hashAlgorithm: 'SHA-256' }
        }
        httpRequest.on("headersReceive", (data: Object) => {
          console.info("Rcv headers");
        });
        httpRequest.on("dataEnd", () => {
          console.info("Rcv data end");
        });
        httpRequest.request(baiduUrl, requestOptions).then((res) => {
          console.info(`${caseName} data: --- ${JSON.stringify(res)}`);
          httpRequest.destroy();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} catch ERROR: ${JSON.stringify(err)}`);
          httpRequest.destroy();
          done();
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });
  });
}

