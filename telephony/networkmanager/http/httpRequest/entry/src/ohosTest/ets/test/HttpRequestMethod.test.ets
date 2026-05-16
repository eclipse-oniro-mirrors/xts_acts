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
import { BusinessError } from '@ohos.base';
import http from '@ohos.net.http';
import { describe, expect, it , Level, Size, TestType} from '@ohos/hypium';
import connection from '@ohos.net.connection';

export const ADDR_TEST_DOMAIN_HTTPS: string = "https://httpbin.org/anything";
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

export default function HttpRequestMethodTest() {
  describe("HttpRequestMethodTest", () => {

    /**
     * @tc.name   testHttpRequestMethodGET0100
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_GET_0100
     * @tc.desc   test RequestMethod.GET with http.HttpProtocol.HTTP1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodGET0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodGET0100";
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
              usingProtocol: http.HttpProtocol.HTTP1_1
            }, (err: BusinessError, data: http.HttpResponse) => {
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
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodGET0200
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_GET_0200
     * @tc.desc   test RequestMethod.GET with http.HttpProtocol.HTTP1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodGET0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodGET0200";
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
              usingProtocol: http.HttpProtocol.HTTP1_1
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(err)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodGET0300
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_GET_0300
     * @tc.desc   test RequestMethod.GET with http.HttpProtocol.HTTP2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodGET0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodGET0300";
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
              usingProtocol: http.HttpProtocol.HTTP2
            }, (err: BusinessError, data: http.HttpResponse) => {
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
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodGET0400
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_GET_0400
     * @tc.desc   test RequestMethod.GET with http.HttpProtocol.HTTP2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodGET0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodGET0400";
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
              usingProtocol: http.HttpProtocol.HTTP2
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName}  httpRequest fail ${JSON.stringify(err)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodGET0500
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_GET_0500
     * @tc.desc   test RequestMethod.GET with http.HttpProtocol.HTTP3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodGET0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodGET0500";
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
              usingProtocol: http.HttpProtocol.HTTP3
            }, (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                ExpectTrue(err.code == 2300999);//The device does not support HTTP3
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
                ExpectTrue(data.responseCode == 200);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodGET0600
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_GET_0600
     * @tc.desc   test RequestMethod.GET with http.HttpProtocol.HTTP3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodGET0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodGET0600";
      console.info(`${caseName} test Start`);
      let httpRequest: http.HttpRequest = http.createHttp();
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.GET,
              usingProtocol: http.HttpProtocol.HTTP3
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName}  httpRequest fail ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300999);//The device does not support HTTP3
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodHEAD0700
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_HEAD_0700
     * @tc.desc   test RequestMethod.HEAD with http.HttpProtocol.HTTP1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodHEAD0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodHEAD0700";
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
              method: http.RequestMethod.HEAD,
              usingProtocol: http.HttpProtocol.HTTP1_1
            }, (err: BusinessError, data: http.HttpResponse) => {
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
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodHEAD0800
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_HEAD_0800
     * @tc.desc   test RequestMethod.HEAD with http.HttpProtocol.HTTP1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodHEAD0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodHEAD0800";
      console.info(`${caseName} test Start`);
      let httpRequest: http.HttpRequest = http.createHttp();
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.HEAD,
              usingProtocol: http.HttpProtocol.HTTP1_1
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName}  httpRequest fail ${JSON.stringify(err)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodHEAD0900
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_HEAD_0900
     * @tc.desc   test RequestMethod.HEAD with http.HttpProtocol.HTTP2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodHEAD0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodHEAD0900";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
          }
        });
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
          method: http.RequestMethod.HEAD,
          usingProtocol: http.HttpProtocol.HTTP2
        }, (err: BusinessError, data: http.HttpResponse) => {
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
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodHEAD1000
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_HEAD_1000
     * @tc.desc   test RequestMethod.HEAD with http.HttpProtocol.HTTP2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodHEAD1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodHEAD1000";
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
              method: http.RequestMethod.HEAD,
              usingProtocol: http.HttpProtocol.HTTP2
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName}  httpRequest fail ${JSON.stringify(err)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodHEAD1100
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_HEAD_1100
     * @tc.desc   test RequestMethod.HEAD with http.HttpProtocol.HTTP3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodHEAD1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodHEAD1100";
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
              method: http.RequestMethod.HEAD,
              usingProtocol: http.HttpProtocol.HTTP3
            }, (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                ExpectTrue(err.code == 2300999);
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
                ExpectTrue(data.responseCode == 200);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodHEAD1200
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_HEAD_1200
     * @tc.desc   test RequestMethod.HEAD with http.HttpProtocol.HTTP3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodHEAD1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodHEAD1200";
      console.info(`${caseName} test Start`);
      let httpRequest: http.HttpRequest = http.createHttp();
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.HEAD,
              usingProtocol: http.HttpProtocol.HTTP3
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName}  httpRequest fail ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300999);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodOPTIONS1300
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_OPTIONS_1300
     * @tc.desc   test RequestMethod.OPTIONS with http.HttpProtocol.HTTP1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodOPTIONS1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodOPTIONS1300";
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
              method: http.RequestMethod.OPTIONS,
              usingProtocol: http.HttpProtocol.HTTP1_1
            }, (err: BusinessError, data: http.HttpResponse) => {
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
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodOPTIONS1400
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_OPTIONS_1400
     * @tc.desc   test RequestMethod.OPTIONS with http.HttpProtocol.HTTP1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodOPTIONS1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodOPTIONS1400";
      console.info(`${caseName} test Start`);
      let httpRequest: http.HttpRequest = http.createHttp();
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.OPTIONS,
              usingProtocol: http.HttpProtocol.HTTP1_1
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName}  httpRequest fail ${JSON.stringify(err)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);

    });

    /**
     * @tc.name   testHttpRequestMethodOPTIONS1500
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_OPTIONS_1500
     * @tc.desc   test RequestMethod.OPTIONS with http.HttpProtocol.HTTP2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodOPTIONS1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodOPTIONS1500";
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
              method: http.RequestMethod.OPTIONS,
              usingProtocol: http.HttpProtocol.HTTP2
            }, (err: BusinessError, data: http.HttpResponse) => {
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
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodOPTIONS1600
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_OPTIONS_1600
     * @tc.desc   test RequestMethod.OPTIONS with http.HttpProtocol.HTTP2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodOPTIONS1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodOPTIONS1600";
      console.info(`${caseName} test Start`);
      let httpRequest: http.HttpRequest = http.createHttp();
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.OPTIONS,
              usingProtocol: http.HttpProtocol.HTTP2
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName}  httpRequest fail ${JSON.stringify(err)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodOPTIONS1700
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_OPTIONS_1700
     * @tc.desc   test RequestMethod.OPTIONS with http.HttpProtocol.HTTP3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodOPTIONS1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodOPTIONS1700";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
          }
        });
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
          method: http.RequestMethod.OPTIONS,
          usingProtocol: http.HttpProtocol.HTTP3
        }, (err: BusinessError, data: http.HttpResponse) => {
          if (err) {
            console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 2300999);
            httpRequest.destroy();
            done();
          } else {
            console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
            ExpectTrue(data.responseCode == 200);
            httpRequest.destroy();
            done();
          }
        });
      }
      catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodOPTIONS1800
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_OPTIONS_1800
     * @tc.desc   test RequestMethod.OPTIONS with http.HttpProtocol.HTTP3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodOPTIONS1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodOPTIONS1800";
      console.info(`${caseName} test Start`);
      let httpRequest: http.HttpRequest = http.createHttp();
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.OPTIONS,
              usingProtocol: http.HttpProtocol.HTTP3
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName}  httpRequest fail ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300999);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodPOST1900
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_POST_1900
     * @tc.desc   test RequestMethod.POST with http.HttpProtocol.HTTP1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodPOST1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodPOST1900";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
          }
        });
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
          method: http.RequestMethod.POST,
          usingProtocol: http.HttpProtocol.HTTP1_1
        }, (err: BusinessError, data: http.HttpResponse) => {
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
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodPOST2000
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_POST_2000
     * @tc.desc   test RequestMethod.POST with http.HttpProtocol.HTTP1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodPOST2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodPOST2000";
      console.info(`${caseName} test Start`);
      let httpRequest: http.HttpRequest = http.createHttp();
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.POST,
              usingProtocol: http.HttpProtocol.HTTP1_1
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName}  httpRequest fail ${JSON.stringify(err)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodPOST2100
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_POST_2100
     * @tc.desc   test RequestMethod.POST with http.HttpProtocol.HTTP2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodPOST2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodPOST2100";
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
              method: http.RequestMethod.POST,
              usingProtocol: http.HttpProtocol.HTTP2
            }, (err: BusinessError, data: http.HttpResponse) => {
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
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodPOST2200
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_POST_2200
     * @tc.desc   test RequestMethod.POST with http.HttpProtocol.HTTP2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodPOST2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodPOST2200";
      console.info(`${caseName} test Start`);
      let httpRequest: http.HttpRequest = http.createHttp();
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.POST,
              usingProtocol: http.HttpProtocol.HTTP2
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName}  httpRequest fail ${JSON.stringify(err)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodPOST2300
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_POST_2300
     * @tc.desc   test RequestMethod.POST with http.HttpProtocol.HTTP3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodPOST2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodPOST2300";
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
              method: http.RequestMethod.POST,
              usingProtocol: http.HttpProtocol.HTTP3
            }, (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                ExpectTrue(err.code == 2300999);
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
                ExpectTrue(data.responseCode == 200);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodPOST2400
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_POST_2400
     * @tc.desc   test RequestMethod.POST with http.HttpProtocol.HTTP3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodPOST2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodPOST2400";
      console.info(`${caseName} test Start`);
      let httpRequest: http.HttpRequest = http.createHttp();
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.POST,
              usingProtocol: http.HttpProtocol.HTTP3
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName}  httpRequest fail ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300999);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodPUT2500
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_PUT_2500
     * @tc.desc   test RequestMethod.PUT with http.HttpProtocol.HTTP1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodPUT2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodPUT2500";
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
              method: http.RequestMethod.PUT,
              usingProtocol: http.HttpProtocol.HTTP1_1
            }, (err: BusinessError, data: http.HttpResponse) => {
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
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodPUT2600
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_PUT_2600
     * @tc.desc   test RequestMethod.PUT with http.HttpProtocol.HTTP1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodPUT2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodPUT2600";
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
              method: http.RequestMethod.PUT,
              usingProtocol: http.HttpProtocol.HTTP1_1
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName}  httpRequest fail ${JSON.stringify(err)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodPUT2700
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_PUT_2700
     * @tc.desc   test RequestMethod.PUT with http.HttpProtocol.HTTP2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodPUT2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodPUT2700";
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
              method: http.RequestMethod.PUT,
              usingProtocol: http.HttpProtocol.HTTP2
            }, (err: BusinessError, data: http.HttpResponse) => {
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
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodPUT2800
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_PUT_2800
     * @tc.desc   test RequestMethod.PUT with http.HttpProtocol.HTTP2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodPUT2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodPUT2800";
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
              method: http.RequestMethod.PUT,
              usingProtocol: http.HttpProtocol.HTTP2
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName}  httpRequest fail ${JSON.stringify(err)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodPUT2900
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_PUT_2900
     * @tc.desc   test RequestMethod.PUT with http.HttpProtocol.HTTP3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodPUT2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodPUT2900";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
          }
        });
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
          method: http.RequestMethod.PUT,
          usingProtocol: http.HttpProtocol.HTTP3
        }, (err: BusinessError, data: http.HttpResponse) => {
          if (err) {
            console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 2300999);
            httpRequest.destroy();
            done();
          } else {
            console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
            ExpectTrue(data.responseCode == 200);
            httpRequest.destroy();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodPUT3000
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_PUT_3000
     * @tc.desc   test RequestMethod.PUT with http.HttpProtocol.HTTP3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodPUT3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodPUT3000";
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
              method: http.RequestMethod.PUT,
              usingProtocol: http.HttpProtocol.HTTP3
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName}  httpRequest fail ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300999);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodDELETE3100
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_DELETE_3100
     * @tc.desc   test RequestMethod.DELETE with http.HttpProtocol.HTTP1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodDELETE3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodDELETE3100";
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
              method: http.RequestMethod.DELETE,
              usingProtocol: http.HttpProtocol.HTTP1_1
            }, (err: BusinessError, data: http.HttpResponse) => {
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
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodDELETE3200
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_DELETE_3200
     * @tc.desc   test RequestMethod.DELETE with http.HttpProtocol.HTTP1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodDELETE3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodDELETE3200";
      console.info(`${caseName} test Start`);
      let httpRequest: http.HttpRequest = http.createHttp();
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.DELETE,
              usingProtocol: http.HttpProtocol.HTTP1_1
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName}  httpRequest fail ${JSON.stringify(err)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodDELETE3300
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_DELETE_3300
     * @tc.desc   test RequestMethod.DELETE with http.HttpProtocol.HTTP2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodDELETE3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodDELETE3300";
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
              method: http.RequestMethod.DELETE,
              usingProtocol: http.HttpProtocol.HTTP2
            }, (err: BusinessError, data: http.HttpResponse) => {
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
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodDELETE3400
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_DELETE_3400
     * @tc.desc   test RequestMethod.DELETE with http.HttpProtocol.HTTP2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodDELETE3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodDELETE3400";
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
              method: http.RequestMethod.DELETE,
              usingProtocol: http.HttpProtocol.HTTP2
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName}  httpRequest fail ${JSON.stringify(err)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodDELETE3500
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_DELETE_3500
     * @tc.desc   test RequestMethod.DELETE with http.HttpProtocol.HTTP3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodDELETE3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodDELETE3500";
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
              method: http.RequestMethod.DELETE,
              usingProtocol: http.HttpProtocol.HTTP3
            }, (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                ExpectTrue(err.code == 2300999);
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
                ExpectTrue(data.responseCode == 200);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodDELETE3600
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_DELETE_3600
     * @tc.desc   test RequestMethod.DELETE with http.HttpProtocol.HTTP3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodDELETE3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodDELETE3600";
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
              method: http.RequestMethod.DELETE,
              usingProtocol: http.HttpProtocol.HTTP3
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName}  httpRequest fail ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300999);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodTRACE3700
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_TRACE_3700
     * @tc.desc   test RequestMethod.TRACE with http.HttpProtocol.HTTP1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodTRACE3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodTRACE3700";
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
              method: http.RequestMethod.TRACE,
              usingProtocol: http.HttpProtocol.HTTP1_1
            }, (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
                ExpectTrue(typeof data.responseCode == 'number');
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodTRACE3800
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_TRACE_3800
     * @tc.desc   test RequestMethod.TRACE with http.HttpProtocol.HTTP1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodTRACE3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodTRACE3800";
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
              method: http.RequestMethod.TRACE,
              usingProtocol: http.HttpProtocol.HTTP1_1
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(typeof data.responseCode == 'number');
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName}  httpRequest fail ${JSON.stringify(err)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    })

    /**
     * @tc.name   testHttpRequestMethodTRACE3900
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_TRACE_3900
     * @tc.desc   test RequestMethod.TRACE with http.HttpProtocol.HTTP2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodTRACE3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodTRACE3900";
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
              method: http.RequestMethod.TRACE,
              usingProtocol: http.HttpProtocol.HTTP2
            }, (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
                ExpectTrue(typeof data.responseCode == 'number');
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodTRACE4000
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_TRACE_4000
     * @tc.desc   test RequestMethod.TRACE with http.HttpProtocol.HTTP2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodTRACE4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodTRACE4000";
      console.info(`${caseName} test Start`);
      let httpRequest: http.HttpRequest = http.createHttp();
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.TRACE,
              usingProtocol: http.HttpProtocol.HTTP2
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(typeof data.responseCode == 'number');
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName}  httpRequest fail ${JSON.stringify(err)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodTRACE4100
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_TRACE_4100
     * @tc.desc   test RequestMethod.TRACE with http.HttpProtocol.HTTP3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodTRACE4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodTRACE4100";
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
              method: http.RequestMethod.TRACE,
              usingProtocol: http.HttpProtocol.HTTP3
            }, (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                ExpectTrue(err.code == 2300999);
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
                ExpectTrue(typeof data.responseCode == 'number');
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodTRACE4200
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_TRACE_4200
     * @tc.desc   test RequestMethod.TRACE with http.HttpProtocol.HTTP3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodTRACE4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodTRACE4200";
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
              method: http.RequestMethod.TRACE,
              usingProtocol: http.HttpProtocol.HTTP3
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(typeof data.responseCode == 'number');
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName}  httpRequest fail ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300999);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodCONNECT4300
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_CONNECT_4300
     * @tc.desc   test RequestMethod.CONNECT with http.HttpProtocol.HTTP1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodCONNECT4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodCONNECT4300";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
          }
        });
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
          method: http.RequestMethod.CONNECT,
          usingProtocol: http.HttpProtocol.HTTP1_1
        }, (err: BusinessError, data: http.HttpResponse) => {
          if (err) {
            console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
            ExpectFail();
            httpRequest.destroy();
            done();
          } else {
            console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
            ExpectTrue(typeof data.responseCode == 'number');
            httpRequest.destroy();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodCONNECT4400
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_CONNECT_4400
     * @tc.desc   test RequestMethod.CONNECT with http.HttpProtocol.HTTP1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodCONNECT4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodCONNECT4400";
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
              method: http.RequestMethod.CONNECT,
              usingProtocol: http.HttpProtocol.HTTP1_1
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(typeof data.responseCode == 'number');
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName}  httpRequest fail ${JSON.stringify(err)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodCONNECT4500
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_CONNECT_4500
     * @tc.desc   test RequestMethod.CONNECT with http.HttpProtocol.HTTP2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodCONNECT4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodCONNECT4500";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
          }
        });
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
          method: http.RequestMethod.CONNECT,
          usingProtocol: http.HttpProtocol.HTTP2
        }, (err: BusinessError, data: http.HttpResponse) => {
          if (err) {
            console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
            ExpectFail();
            httpRequest.destroy();
            done();
          } else {
            console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
            ExpectTrue(typeof data.responseCode == 'number');
            httpRequest.destroy();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodCONNECT4600
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_CONNECT_4600
     * @tc.desc   test RequestMethod.CONNECT with http.HttpProtocol.HTTP2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodCONNECT4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodCONNECT4600";
      console.info(`${caseName} test Start`);
      let httpRequest: http.HttpRequest = http.createHttp();
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              method: http.RequestMethod.CONNECT,
              usingProtocol: http.HttpProtocol.HTTP2
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(typeof data.responseCode == 'number');
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName}  httpRequest fail ${JSON.stringify(err)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodCONNECT4700
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_CONNECT_4700
     * @tc.desc   test RequestMethod.CONNECT with http.HttpProtocol.HTTP3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodCONNECT4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodCONNECT4700";
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
              method: http.RequestMethod.CONNECT,
              usingProtocol: http.HttpProtocol.HTTP3
            }, (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                ExpectTrue(err.code == 2300999);
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
                ExpectTrue(typeof data.responseCode == 'number');
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequestMethodCONNECT4800
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_CONNECT_4800
     * @tc.desc   test RequestMethod.CONNECT with http.HttpProtocol.HTTP3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestMethodCONNECT4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequestMethodCONNECT4800";
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
              method: http.RequestMethod.CONNECT,
              usingProtocol: http.HttpProtocol.HTTP3
            }).then((data: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success ${JSON.stringify(data)}`);
              ExpectTrue(typeof data.responseCode == 'number');
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName}  httpRequest fail ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300999);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });
  });
}
