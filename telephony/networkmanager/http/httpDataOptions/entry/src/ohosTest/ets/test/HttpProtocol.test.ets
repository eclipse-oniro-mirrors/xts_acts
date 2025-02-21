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
import { describe, expect, it } from '@ohos/hypium';
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

export default function HttpHttpProtocolTest() {
  describe("HttpHttpProtocolTest", () => {

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpProtocol_0100
     * @tc.name  :  testHttpProtocolHTTP0100
     * @tc.desc  :  test HttpProtocol.HTTP1_1
     * @tc.size  :  smallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testHttpProtocolHTTP0100', 0, async (done: Function) => {
      const caseName: string = "testHttpProtocolHTTP0100";
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
              usingProtocol: http.HttpProtocol.HTTP1_1
            }, (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                ExpectFail();
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
      }
      catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpProtocol_0200
     * @tc.name  :  testHttpProtocolHTTP0200
     * @tc.desc  :  test HttpProtocol.HTTP1_1
     * @tc.size  :  smallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testHttpProtocolHTTP0200', 0, async (done: Function) => {
      const caseName: string = "testHttpProtocolHTTP0200";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            let httpRequest: http.HttpRequest = http.createHttp();
            console.info(`${caseName} Network connected`);
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
              usingProtocol: http.HttpProtocol.HTTP1_1
            }).then((res: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success`);
              ExpectTrue(res.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err:${JSON.stringify(err)}`);
              ExpectFail();
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

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpProtocol_0300
     * @tc.name  :  testHttpProtocolHTTP0300
     * @tc.desc  :  test HttpProtocol.HTTP2
     * @tc.size  :  smallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testHttpProtocolHTTP0300', 0, async (done: Function) => {
      const caseName: string = "testHttpProtocolHTTP0300";
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
              usingProtocol: http.HttpProtocol.HTTP2
            }, (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                ExpectFail();
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
      }
      catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpProtocol_0400
     * @tc.name  :  testHttpProtocolHTTP0400
     * @tc.desc  :  test HttpProtocol.HTTP2
     * @tc.size  :  smallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testHttpProtocolHTTP0400', 0, async (done: Function) => {
      const caseName: string = "testHttpProtocolHTTP0400";
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
              usingProtocol: http.HttpProtocol.HTTP2
            }).then((res: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success`);
              ExpectTrue(res.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err:${JSON.stringify(err)}`);
              ExpectFail();
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

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpProtocol_0500
     * @tc.name  :  testHttpProtocolHTTP0500
     * @tc.desc  :  test HttpProtocol.HTTP3
     * @tc.size  :  smallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testHttpProtocolHTTP0500', 0, async (done: Function) => {
      const caseName: string = "testHttpProtocolHTTP0500";
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
              usingProtocol: http.HttpProtocol.HTTP3
            }, (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                ExpectTrue(err.code == 2300999);//The device does not support HTTP3
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
      }
      catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpProtocol_0600
     * @tc.name  :  testHttpProtocolHTTP0600
     * @tc.desc  :  test HttpProtocol.HTTP3
     * @tc.size  :  smallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testHttpProtocolHTTP0600', 0, async (done: Function) => {
      const caseName: string = "testHttpProtocolHTTP0600";
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
              usingProtocol: http.HttpProtocol.HTTP3
            }).then((res: http.HttpResponse) => {
              console.info(`${caseName}  httpRequest success`);
              ExpectTrue(res.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err:${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300999);//The device does not support HTTP3
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

    /* *
    * @tc.number:  SUB_NetworkMgr_Http_HttpProtocol_0700
    * @tc.name  :  testHttpProtocolHTTP0700
    * @tc.desc  :  test HttpProtocol.HTTP1_1
    * @tc.size  :  smallTest
    * @tc.type  :  Function
    * @tc.level :  level 2
    */
    it('testHttpProtocolHTTP0700', 0, async (done: Function) => {
      const caseName: string = "testHttpProtocolHTTP0700";
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
              usingProtocol: http.HttpProtocol.HTTP1_1
            }, (err: BusinessError, data: number) => {
              if (err) {
                console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
                ExpectTrue(data == 200);
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

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpProtocol_0800
     * @tc.name  :  testHttpProtocolHTTP0800
     * @tc.desc  :  test HttpProtocol.HTTP1_1
     * @tc.size  :  smallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testHttpProtocolHTTP0800', 0, async (done: Function) => {
      const caseName: string = "testHttpProtocolHTTP0800";
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
              usingProtocol: http.HttpProtocol.HTTP1_1
            }).then((res: number) => {
              console.info(`${caseName}  httpRequest success`);
              ExpectTrue(res == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err:${JSON.stringify(err)}`);
              ExpectFail();
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

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpProtocol_0900
     * @tc.name  :  testHttpProtocolHTTP0900
     * @tc.desc  :  test HttpProtocol.HTTP2
     * @tc.size  :  smallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testHttpProtocolHTTP0900', 0, async (done: Function) => {
      const caseName: string = "testHttpProtocolHTTP0900";
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
              usingProtocol: http.HttpProtocol.HTTP2
            }, (err: BusinessError, data: number) => {
              if (err) {
                console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
                ExpectTrue(data == 200);
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

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpProtocol_1000
     * @tc.name  :  testHttpProtocolHTTP1000
     * @tc.desc  :  test HttpProtocol.HTTP2
     * @tc.size  :  smallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testHttpProtocolHTTP1000', 0, async (done: Function) => {
      const caseName: string = "testHttpProtocolHTTP1000";
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
              usingProtocol: http.HttpProtocol.HTTP2
            }).then((res: number) => {
              console.info(`${caseName}  httpRequest success`);
              ExpectTrue(res == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err:${JSON.stringify(err)}`);
              ExpectFail();
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

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpProtocol_1100
     * @tc.name  :  testHttpProtocolHTTP1100
     * @tc.desc  :  test HttpProtocol.HTTP3
     * @tc.size  :  smallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testHttpProtocolHTTP1100', 0, async (done: Function) => {
      const caseName: string = "testHttpProtocolHTTP1100";
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
              usingProtocol: http.HttpProtocol.HTTP3
            }, (err: BusinessError, data: number) => {
              if (err) {
                console.info(`${caseName} httpRequest fail ${JSON.stringify(err)}`);
                ExpectTrue(err.code == 2300999);//The device does not support HTTP3
                done();
              } else {
                console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
                ExpectTrue(data == 200);
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

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpProtocol_1200
     * @tc.name  :  testHttpProtocolHTTP1200
     * @tc.desc  :  test HttpProtocol.HTTP3
     * @tc.size  :  smallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testHttpProtocolHTTP1200', 0, async (done: Function) => {
      const caseName: string = "testHttpProtocolHTTP1200";
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
              usingProtocol: http.HttpProtocol.HTTP3
            }).then((res: number) => {
              console.info(`${caseName}  httpRequest success`);
              ExpectTrue(res == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err:${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300999);//The device does not support HTTP3
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

