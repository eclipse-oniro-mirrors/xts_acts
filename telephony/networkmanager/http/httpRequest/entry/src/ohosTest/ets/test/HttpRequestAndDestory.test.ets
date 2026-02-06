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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import connection from '@ohos.net.connection';

export const ADDR_TEST_ILLEGAL: string = "abc";

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

export default function HttpRequestAndDestroyTest() {
  describe("HttpRequestAndDestroyTest", () => {
    /**
     * @tc.name   testNetworkMgrHttpCreateHttp0100
     * @tc.number SUB_NetworkMgr_Http_createHttp_0100
     * @tc.desc   test createHttp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrHttpCreateHttp0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testHttpCreateHttp0100";
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
            ExpectTrue(httpRequest != null);
            httpRequest.destroy();
            done();
          }
        });
      } catch (err) {
        console.log(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testNetworkMgrHttpRequest0200
     * @tc.number SUB_NetworkMgr_Http_Request_0200
     * @tc.desc   test Request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrHttpRequest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testNetworkMgrHttpRequest0200";
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
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} httpRequest fail err: ${JSON.stringify(err)}`);
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
        console.info(`${caseName} trycatch err:  ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testNetworkMgrHttpRequest0300
     * @tc.number SUB_NetworkMgr_Http_Request_0300
     * @tc.desc   test Request with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrHttpRequest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testNetworkMgrHttpRequest0300";
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
              header: {
                "content-type": "multipart/form-data"
              },
              multiFormDataList: [
                {
                  name: "Part",
                  contentType: 'form',
                  data: {
                    name: 'xyy',
                    password: ''
                  }
                }
              ]
            }, (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} httpRequest fail err: ${JSON.stringify(err)}`);
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
        console.info(`${caseName} trycatch err:  ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testNetworkMgrHttpRequest0400
     * @tc.number SUB_NetworkMgr_Http_Request_0400
     * @tc.desc   test Request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrHttpRequest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testNetworkMgrHttpRequest0400";
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
        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS).then((data: http.HttpResponse) => {
          console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
          ExpectTrue(data.responseCode == 200);
          httpRequest.destroy();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} httpRequest fail err: ${JSON.stringify(err)}`);
          ExpectFail();
          httpRequest.destroy();
          done();
        });
      } catch (err) {
        console.info(`${caseName} trycatch err:  ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequest0500
     * @tc.number SUB_NetworkMgr_Http_Request_0500
     * @tc.desc   test Request with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequest0500";
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
          }
        });
        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
          method: http.RequestMethod.POST,
          header: {
            "content-type": "multipart/form-data"
          },
          multiFormDataList: [
            {
              name: "Part",
              contentType: 'form',
              data: {
                name: 'xyy',
                password: ''
              }
            }
          ]
        }).then((data: http.HttpResponse) => {
          console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
          ExpectTrue(data.responseCode == 200);
          httpRequest.destroy();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} httpRequest fail err: ${JSON.stringify(err)}`);
          ExpectFail();
          httpRequest.destroy();
          done();
        });
      } catch (err) {
        console.info(`${caseName} trycatch err:  ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequest0600
     * @tc.number SUB_NetworkMgr_Http_Request_0600
     * @tc.desc   test Request with illegal url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequest0600";
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
            httpRequest.request(ADDR_TEST_ILLEGAL, (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} httpRequest fail err: ${JSON.stringify(err)}`);
                ExpectTrue(err.code == 2300006);
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
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpRequest0700
     * @tc.number SUB_NetworkMgr_Http_Request_0700
     * @tc.desc   test Request with illegal url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpRequest0700";
      console.info(`${caseName} test Start`);
      let httpRequest: http.HttpRequest = http.createHttp();
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail()
            done();
          } else {
            console.info(`${caseName} Network connected`);
            httpRequest.request(ADDR_TEST_ILLEGAL).then((data: http.HttpResponse) => {
              console.info(`${caseName} httpRequest success ${JSON.stringify(data)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} httpRequest fail err: ${JSON.stringify(data)}`);
              ExpectTrue(err.code == 2300006);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err:  ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /**
     * @tc.name   testHttpDestroy0800
     * @tc.number SUB_NetworkMgr_Http_Destroy_0800
     * @tc.desc   test destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpDestroy0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpDestroy0800";
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
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} httpRequest.destory fail ${JSON.stringify(err)}`);
                ExpectTrue(err.code == 2300023);
                done();
              } else {
                console.info(`${caseName} httpRequest.destory success ${JSON.stringify(data)}`);
                ExpectFail();
                done();
              }
            });
            httpRequest.destroy();
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err:  ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpDestroy0900
     * @tc.number SUB_NetworkMgr_Http_Destroy_0900
     * @tc.desc   test destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpDestroy0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpDestroy0900";
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
            httpRequest.destroy();
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS).then((data: http.HttpResponse) => {
              console.info(`${caseName} httpRequest.destory success ${JSON.stringify(data)}`);
              ExpectFail()
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} httpRequest.destory fail err: ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 2300999)
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err:  ${JSON.stringify(err)}`);
        ExpectFail()
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.name   testHttpDestroy1000
     * @tc.number SUB_NetworkMgr_Http_Destroy_1000
     * @tc.desc   test destroy in lifecycle 'headersReceive'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpDestroy1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpDestroy1000";
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
            httpRequest.on('headersReceive', () => {
              httpRequest.destroy();
            });
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, (err: BusinessError, res: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} httpRequest.destory success ${JSON.stringify(err)}`);
                ExpectFail()
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} httpRequest.destory fail err:${JSON.stringify(res)}`);
                ExpectTrue(res.responseCode == 200)
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
     * @tc.name   testHttpDestroy1100
     * @tc.number SUB_NetworkMgr_Http_Destroy_1100
     * @tc.desc   test destroy after httpRequest send an success request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpDestroy1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testHttpDestroy1100";
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
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, () => {
              httpRequest.destroy();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, (err: BusinessError) => {
                if (err) {
                  console.info(`${caseName} httpRequest.destory fail err:${JSON.stringify(err)}`);
                  ExpectTrue(err.code == 2300999);
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} httpRequest.destory success ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                }
              });
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