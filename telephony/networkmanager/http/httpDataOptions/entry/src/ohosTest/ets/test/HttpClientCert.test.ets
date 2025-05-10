/*
 *  Copyright (c) 2024 Huawei Device Co., Ltd.
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';
import connection from '@ohos.net.connection';
const certPath_legitimate: string = "xtsTest";
const keyPath_legitimate: string = "xtsTest";
const pwd: string = "123";

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
  }
}

export const ADDR_TEST_DOMAIN_HTTPS: string = "https://httpbin.org/anything";

export default function HttpClientCertTest() {
  describe("HttpClientCertTest", () => {
    /**
     * @tc.number: SUB_NetworkMgr_Http_ClientCert_0100
     * @tc.name  : testHttpClientCert0100
     * @tc.desc  : test clientCert with no certPath no keyPath certType any
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpClientCert0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = "testHttpClientCert0100";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(
                ADDR_TEST_DOMAIN_HTTPS,
                {
                  method: http.RequestMethod.GET,
                  extraData: "MineMine",
                  header: {
                    "Content-Type": "application/json",
                  },
                  readTimeout: 60000,
                  connectTimeout: 60000,
                  clientCert: {
                    certPath: "",
                    keyPath: "",
                    keyPassword: pwd,
                    certType: http.CertType.P12,
                  },
                },
                (err: BusinessError, data: http.HttpResponse) => {
                  if (err) {
                    console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                    ExpectFail();
                    httpRequest.destroy();
                    done();
                  } else {
                    console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
                    ExpectTrue(data.responseCode == 200);
                    httpRequest.destroy();
                    done();
                  }
                }
              );
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_ClientCert_0200
     * @tc.name  : testHttpClientCert0200
     * @tc.desc  : test clientCert with no certPath no keyPath certType any
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpClientCert0200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = "testHttpClientCert0200";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet(async (error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.GET,
              extraData: "MineMine",
              header: {
                "Content-Type": "application/json",
              },
              readTimeout: 60000,
              connectTimeout: 60000,
              clientCert: {
                certPath: "",
                keyPath: "",
                keyPassword: pwd,
                certType: http.CertType.P12,
              },
            }).then((res: http.HttpResponse) => {
              console.info(`${caseName} request success res: ${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request failed err: ${JSON.stringify(err)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_ClientCert_0300
     * @tc.name  : testHttpClientCert0300
     * @tc.desc  : test clientCert with illegal certPath illegal keyPath certType any legitimated
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpClientCert0300",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = "testHttpClientCert0300";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(
              ADDR_TEST_DOMAIN_HTTPS,
              {
                method: http.RequestMethod.GET,
                extraData: "MineMine",
                header: {
                  "Content-Type": "application/json",
                },
                readTimeout: 60000,
                connectTimeout: 60000,
                clientCert: {
                  certPath: "aaa",
                  keyPath: "aaa",
                  keyPassword: pwd,
                  certType: http.CertType.P12,
                },
              },
              (err: BusinessError, data: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
                  ExpectTrue(err?.code == 2300058);
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} request failed err: ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                }
              }
            );
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_ClientCert_0400
     * @tc.name  : testHttpClientCert0400
     * @tc.desc  : test clientCert with illegal certPath illegal keyPath certType any legitimated
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpClientCert0400",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = "testHttpClientCert0400";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet(async (error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.GET,
              extraData: "MineMine",
              header: {
                "Content-Type": "application/json",
              },
              readTimeout: 60000,
              connectTimeout: 60000,
              clientCert: {
                certPath: "aaa",
                keyPath: "aaa",
                keyPassword: pwd,
                certType: http.CertType.P12,
              },
            }).then((res: http.HttpResponse) => {
              console.info(`${caseName} request success res: ${JSON.stringify(res)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} httpRequest fail:${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300058);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} test fail:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_ClientCert_0500
     * @tc.name  : testHttpClientCert0500
     * @tc.desc  : test clientCert with  legitimated certPath and keyPath http.CertType.P12
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpClientCert0500",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = "testHttpClientCert0500";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(
              ADDR_TEST_DOMAIN_HTTPS,
              {
                method: http.RequestMethod.GET,
                extraData: "MineMine",
                header: {
                  "Content-Type": "application/json",
                },
                readTimeout: 60000,
                connectTimeout: 60000,
                clientCert: {
                  certPath: certPath_legitimate,
                  keyPath: keyPath_legitimate,
                  keyPassword: pwd,
                  certType: http.CertType.P12,
                },
              },
              (err: BusinessError, data: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                  ExpectTrue(err.code == 2300058);
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                }
              });
          }
        });
      }
      catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_ClientCert_0600
     * @tc.name  : testHttpClientCert0600
     * @tc.desc  : test clientCert with  legitimated certPath and keyPath http.CertType.P12
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpClientCert0600",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = "testHttpClientCert0600";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet(async (error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.GET,
              extraData: "MineMine",
              header: {
                "Content-Type": "application/json",
              },
              readTimeout: 60000,
              connectTimeout: 60000,
              clientCert: {
                certPath: certPath_legitimate,
                keyPath: keyPath_legitimate,
                keyPassword: pwd,
                certType: http.CertType.P12,
              },
            }).then((res: http.HttpResponse) => {
              console.info(`${caseName} request success res: ${JSON.stringify(res)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} httpRequest fail:${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300058);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_ClientCert_0700
     * @tc.name  : testHttpClientCert0700
     * @tc.desc  : test clientCert with  legitimated certPath and keyPath http.CertType.PEM
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpClientCert0700",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = "testHttpClientCert0700";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(
              ADDR_TEST_DOMAIN_HTTPS,
              {
                method: http.RequestMethod.GET,
                extraData: "MineMine",
                header: {
                  "Content-Type": "application/json",
                },
                readTimeout: 60000,
                connectTimeout: 60000,
                clientCert: {
                  certPath: certPath_legitimate,
                  keyPath: keyPath_legitimate,
                  keyPassword: pwd,
                  certType: http.CertType.PEM,
                },
              },
              (err: BusinessError, data: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                  ExpectTrue(err.code == 2300058);
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                }
              });
          }
        });
      }
      catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_ClientCert_0800
     * @tc.name  : testHttpClientCert0800
     * @tc.desc  : test clientCert with  legitimated certPath and keyPath http.CertType.PEM
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpClientCert0800",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = "testHttpClientCert0800";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.GET,
              extraData: "MineMine",
              header: {
                "Content-Type": "application/json",
              },
              readTimeout: 60000,
              connectTimeout: 60000,
              clientCert: {
                certPath: certPath_legitimate,
                keyPath: keyPath_legitimate,
                keyPassword: pwd,
                certType: http.CertType.PEM,
              },
            }).then((res: http.HttpResponse) => {
              console.info(`${caseName} request success res: ${JSON.stringify(res)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} httpRequest fail:${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300058);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_ClientCert_0900
     * @tc.name  : testHttpClientCert0900
     * @tc.desc  : test clientCert with  legitimated certPath and keyPath http.CertType.DER
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpClientCert0900",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = "testHttpClientCert0900";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(
              ADDR_TEST_DOMAIN_HTTPS,
              {
                method: http.RequestMethod.GET,
                extraData: "MineMine",
                header: {
                  "Content-Type": "application/json",
                },
                readTimeout: 60000,
                connectTimeout: 60000,
                clientCert: {
                  certPath: certPath_legitimate,
                  keyPath: keyPath_legitimate,
                  keyPassword: pwd,
                  certType: http.CertType.DER,
                },
              },
              (err: BusinessError, data: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                  ExpectTrue(err.code == 2300058);
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                }
              });
          }
        });
      }
      catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_ClientCert_1000
     * @tc.name  : testHttpClientCert1000
     * @tc.desc  : test clientCert with  legitimated certPath and keyPath http.CertType.DER
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpClientCert1000",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = "testHttpClientCert1000";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.GET,
              extraData: "MineMine",
              header: {
                "Content-Type": "application/json",
              },
              readTimeout: 60000,
              connectTimeout: 60000,
              clientCert: {
                certPath: certPath_legitimate,
                keyPath: keyPath_legitimate,
                keyPassword: pwd,
                certType: http.CertType.DER,
              },
            }).then((res: http.HttpResponse) => {
              console.info(`${caseName} request success res: ${JSON.stringify(res)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} httpRequest fail:${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300058);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_ClientCert_1100
     * @tc.name  : testHttpRequestInStreamClientCert1100
     * @tc.desc  : test clientCert with no certPath no keyPath certType any
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpClientCert1100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = "testHttpClientCert1100";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream(
              ADDR_TEST_DOMAIN_HTTPS,
              {
                method: http.RequestMethod.GET,
                extraData: "MineMine",
                header: {
                  "Content-Type": "application/json",
                },
                readTimeout: 60000,
                connectTimeout: 60000,
                clientCert: {
                  certPath: "",
                  keyPath: "",
                  keyPassword: pwd,
                  certType: http.CertType.P12,
                },
              },
              (err: BusinessError, data: number) => {
                if (err) {
                  console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} data:${data}`);
                  ExpectTrue(data == 200);
                  httpRequest.destroy();
                  done();
                }
              }
            );
          }
        });
      }
      catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_ClientCert_1200
     * @tc.name  : testHttpRequestInStreamClientCert1200
     * @tc.desc  : test clientCert with no certPath no keyPath certType any
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpClientCert1200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = "testHttpClientCert1200";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.GET,
              extraData: "MineMine",
              header: {
                "Content-Type": "application/json",
              },
              readTimeout: 60000,
              connectTimeout: 60000,
              clientCert: {
                certPath: "",
                keyPath: "",
                keyPassword: pwd,
                certType: http.CertType.P12,
              },
            }).then((data: number) => {
              console.info(`${caseName} httpRequest success res:${JSON.stringify(data)}`);
              ExpectTrue(data == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request failed err: ${JSON.stringify(err)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_ClientCert_1300
     * @tc.name  : testHttpClientCert1300
     * @tc.desc  : test clientCert with illegal certPath illegal keyPath certType any legitimated
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpClientCert1300",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = "testHttpClientCert1300";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream(
              ADDR_TEST_DOMAIN_HTTPS,
              {
                method: http.RequestMethod.GET,
                extraData: "MineMine",
                header: {
                  "Content-Type": "application/json",
                },
                readTimeout: 60000,
                connectTimeout: 60000,
                clientCert: {
                  certPath: "aaa",
                  keyPath: "aaa",
                  keyPassword: pwd,
                  certType: http.CertType.P12,
                },
              },
              (err: BusinessError, data: number) => {
                if (err) {
                  console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                  ExpectTrue(err.code == 2300058);
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                }
              }
            );
          }
        });
      }
      catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_ClientCert_1400
     * @tc.name  : testHttpClientCert1400
     * @tc.desc  : test clientCert with illegal certPath illegal keyPath certType any legitimated
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpClientCert1400",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = "testHttpClientCert1400";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.GET,
              extraData: "MineMine",
              header: {
                "Content-Type": "application/json",
              },
              readTimeout: 60000,
              connectTimeout: 60000,
              clientCert: {
                certPath: "aaa",
                keyPath: "aaa",
                keyPassword: pwd,
                certType: http.CertType.P12,
              },
            }).then((data: number) => {
              console.info(`${caseName} httpRequest success res:${JSON.stringify(data)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} httpRequest fail:${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300058);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_ClientCert_1500
     * @tc.name  : testHttpClientCert1500
     * @tc.desc  : test clientCert with  legitimated certPath and keyPath http.CertType.P12
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpClientCert1500",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = "testHttpClientCert1500";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream(
              ADDR_TEST_DOMAIN_HTTPS,
              {
                method: http.RequestMethod.GET,
                extraData: "MineMine",
                header: {
                  "Content-Type": "application/json",
                },
                readTimeout: 60000,
                connectTimeout: 60000,
                clientCert: {
                  certPath: certPath_legitimate,
                  keyPath: keyPath_legitimate,
                  keyPassword: pwd,
                  certType: http.CertType.P12,
                },
              },
              (err: BusinessError, data: number) => {
                if (err) {
                  console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                  ExpectTrue(err.code == 2300058);
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                }
              }
            );
          }
        });
      }
      catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_ClientCert_1600
     * @tc.name  : testHttpClientCert1600
     * @tc.desc  : test clientCert with  legitimated certPath and keyPath http.CertType.P12
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpClientCert1600",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = "testHttpClientCert1600";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.GET,
              extraData: "MineMine",
              header: {
                "Content-Type": "application/json",
              },
              readTimeout: 60000,
              connectTimeout: 60000,
              clientCert: {
                certPath: certPath_legitimate,
                keyPath: keyPath_legitimate,
                keyPassword: pwd,
                certType: http.CertType.P12,
              },
            }).then((data: number) => {
              console.info(`${caseName} httpRequest success res:${JSON.stringify(data)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} httpRequest fail:${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300058);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_ClientCert_1700
     * @tc.name  : testHttpClientCert1700
     * @tc.desc  : test clientCert with  legitimated certPath and keyPath http.CertType.PEM
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpClientCert1700",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = "testHttpClientCert1700";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream(
              ADDR_TEST_DOMAIN_HTTPS,
              {
                method: http.RequestMethod.GET,
                extraData: "MineMine",
                header: {
                  "Content-Type": "application/json",
                },
                readTimeout: 60000,
                connectTimeout: 60000,
                clientCert: {
                  certPath: certPath_legitimate,
                  keyPath: keyPath_legitimate,
                  keyPassword: pwd,
                  certType: http.CertType.PEM,
                },
              },
              (err: BusinessError, data: number) => {
                if (err) {
                  console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                  ExpectTrue(err.code == 2300058);
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                }
              }
            );
          }
        });
      }
      catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_ClientCert_1800
     * @tc.name  : testHttpClientCert1800
     * @tc.desc  : test clientCert with  legitimated certPath and keyPath http.CertType.PEM
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpClientCert1800",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = "testHttpClientCert1800";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.GET,
              extraData: "MineMine",
              header: {
                "Content-Type": "application/json",
              },
              readTimeout: 60000,
              connectTimeout: 60000,
              clientCert: {
                certPath: certPath_legitimate,
                keyPath: keyPath_legitimate,
                keyPassword: pwd,
                certType: http.CertType.PEM,
              },
            }).then((data: number) => {
              console.info(`${caseName} httpRequest success res:${JSON.stringify(data)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} httpRequest fail:${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300058);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_ClientCert_1900
     * @tc.name  : testHttpClientCert1900
     * @tc.desc  : test clientCert with  legitimated certPath and keyPath http.CertType.DER
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpClientCert1900",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = "testHttpClientCert1900";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream(
              ADDR_TEST_DOMAIN_HTTPS,
              {
                method: http.RequestMethod.GET,
                extraData: "MineMine",
                header: {
                  "Content-Type": "application/json",
                },
                readTimeout: 60000,
                connectTimeout: 60000,
                clientCert: {
                  certPath: certPath_legitimate,
                  keyPath: keyPath_legitimate,
                  keyPassword: pwd,
                  certType: http.CertType.DER,
                },
              },
              (err: BusinessError, data: number) => {
                if (err) {
                  console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                  ExpectTrue(err.code == 2300058);
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                }
              }
            );
          }
        });
      }
      catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number: SUB_NetworkMgr_Http_ClientCert_2000
     * @tc.name  : testHttpClientCert2000
     * @tc.desc  : test clientCert with  legitimated certPath and keyPath http.CertType.DER
     * @tc.size  : smallTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it("testHttpClientCert2000",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = "testHttpClientCert2000";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.GET,
              extraData: "MineMine",
              header: {
                "Content-Type": "application/json",
              },
              readTimeout: 60000,
              connectTimeout: 60000,
              clientCert: {
                certPath: certPath_legitimate,
                keyPath: keyPath_legitimate,
                keyPassword: pwd,
                certType: http.CertType.DER,
              },
            }).then((data: number) => {
              console.info(`${caseName} httpRequest success res:${JSON.stringify(data)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} httpRequest fail:${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300058);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });
  });
}
