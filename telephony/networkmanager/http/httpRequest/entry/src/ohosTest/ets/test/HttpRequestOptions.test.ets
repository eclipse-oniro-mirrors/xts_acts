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

import { describe, expect, it } from '@ohos/hypium';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';
import connection from '@ohos.net.connection';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

export default function HttpRequestOptionsTest() {
  describe('HttpRequestOptionsTest', () => {
    let XTS_TEST_HTTP_URL: string = 'http://www.baidu.com/';
    let XTS_TEST_HTTPS_URL: string = 'https://www.baidu.com/';

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_0100
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest0100
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest0100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest0100';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              extraData: {
                letter: "test",
                characters: "测试文字",
              },
              header: "content-type': 'application/json",
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions,
              (err: Error, data: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_0200
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest0200
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest0200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest0200';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              extraData: 'testInformation测试',
              header: "content-type': 'application/x-www-form-urlencoded",
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions,
              (err: Error, data: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_0300
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest0300
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest0300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest0300';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              extraData: 'testInformation测试',
              header: "content-type': 'text/xml",
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_0400
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest0400
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest0400', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest0400';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              extraData: {
                letter: "test",
                characters: "测试文字",
              },
              header: "content-type': 'application/json",
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: Error) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_0500
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest0500
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest0500', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest0500';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              extraData: 'testInformation测试',
              header: "content-type': 'application/x-www-form-urlencoded",
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: Error) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_0600
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest0600
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest0600', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest0600';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              extraData: 'testInformation测试',
              header: "content-type': 'text/xml",
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: Error) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_0700
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest0700
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest0700', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest0700';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              extraData: ''
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: Error) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_0800
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest0800
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest0800', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest0800';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              usingCache: true
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} firstResponse err ---${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data.performanceTiming)}`);
                httpResponseCache.flush((err: BusinessError) => {
                  if (err) {
                    console.info(`${caseName} flush err ---${JSON.stringify(err)}`);
                    ExpectFail();
                    httpRequest.destroy();
                    done();
                  } else {
                    httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
                      if (err) {
                        console.info(`${caseName} secondResponse err ---${JSON.stringify(err)}`);
                        ExpectFail();
                        httpRequest.destroy();
                        done();
                      } else {
                        console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data.performanceTiming)}`);
                        console.info(`${caseName} secondResponse tcpTiming ${data.performanceTiming.tcpTiming}`);
                        ExpectTrue(data.performanceTiming.tcpTiming == 0);
                        httpRequest.destroy();
                        done();
                      }
                    });
                  }
                });
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_1000
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest1000
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest1000', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest1000';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              usingCache: true
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request('http://httpbin.org/anything', httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data.performanceTiming)}`);
              httpResponseCache.flush((err: BusinessError) => {
                if (err) {
                  console.info(`${caseName} flush err ---${JSON.stringify(err)}`);
                  ExpectFail();
                  done();
                } else {
                  httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
                    if (err) {
                      console.info(`${caseName} secondResponse err ---${JSON.stringify(err)}`);
                      ExpectFail();
                      done();
                    } else {
                      console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data.performanceTiming)}`);
                      console.info(`${caseName} secondResponse tcpTiming ${data.performanceTiming.tcpTiming}`);
                      ExpectTrue(data.performanceTiming.tcpTiming == 0);
                      httpRequest.destroy();
                      done();
                    }
                  });
                }
              });
            }).catch((err: Error) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_1100
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest1100
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest1100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest1100';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              priority: 0.5
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_1200
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest1200
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest1200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest1200';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              priority: 1
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_1300
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest1300
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest1300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest1300';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              priority: 1000
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_1400
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest1400
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest1400', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest1400';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              priority: 1001
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_1500
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest1500
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest1500', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest1500';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              priority: 0.5
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: Error) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_1600
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest1600
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest1600', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest1600';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              priority: 1
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: Error) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_1700
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest1700
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest1700', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest1700';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              priority: 1000
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: Error) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_1800
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest1800
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest1800', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest1800';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              priority: 1001
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: Error) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_2000
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest2000
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest2000', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest2000';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              maxLimit: 999999999999
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_2200
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest2200
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest2200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest2200';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              maxLimit: 999999999999
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: Error) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_2300
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest2300
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest2300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest2000';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              usingProxy: false
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_2400
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest2400
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest2400', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest2400';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              usingProxy: true
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_2500
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest2500
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest2500', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest2500';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              usingProxy: false
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: Error) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_2600
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest2600
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest2600', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest2600';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              usingProxy: true
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: Error) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_2700
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest2700
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest2700', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest2700';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              dnsOverHttps: 'https://dns.xtstest.com/dns-query'
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_2800
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest2800
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest2800', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest2800';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              dnsOverHttps: 'https://dns.xtstest.com/dns-query'
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_2900
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest2900
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest2900', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest2900';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              dnsOverHttps: undefined
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_3000
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest3000
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest3000', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest3000';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              dnsOverHttps: undefined
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_3100
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest3100
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest3100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest3100';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              dnsServers: ['http://dns.xtstest1.com/dns-query', 'http://dns.xtstest2.com/dns-query', 'http://dns.xtstest3.com/dns-query']
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_3200
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest3200
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest3200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest3200';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              dnsServers: ['http://dns.xtstest1.com/dns-query', 'http://dns.xtstest2.com/dns-query', 'http://dns.xtstest3.com/dns-query']
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_3300
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest3300
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest3300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest3300';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              dnsServers: undefined
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_3400
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest3400
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest3400', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest3400';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              dnsServers: undefined
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_3500
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest3500
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest3500', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest3500';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              header: ""
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_3600
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest3600
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest3600', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest3600';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              header: "xts-test’: ‘xts/test"
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });


    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_3700
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest3700
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest3700', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest3700';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              header: undefined
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_3800
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest3800
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest3800', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest3800';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              header: ""
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_3900
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest3900
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest3900', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest3900';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              header: "xts-test’: ‘xts/test"
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_4000
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest4000
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest4000', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest4000';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              header: undefined
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_4100
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest4100
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest4100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest4100';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              readTimeout: 1
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions,
              (err: BusinessError, data: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                  ExpectTrue(err.code == 2300028);
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_4200
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest4200
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest4200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest4200';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              connectTimeout: 1
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectTrue(err.code == 2300028);
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_4300
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest4300
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest4300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest4300';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              readTimeout: 1
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectFail();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
              ExpectTrue(err?.code == 2300028);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_4400
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest4400
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest4400', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest4400';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              connectTimeout: 1
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectFail();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
              ExpectTrue(err?.code == 2300028);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_4500
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest4500
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest4500', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest4500';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              readTimeout: 0,
              connectTimeout: 0
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_4600
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest4600
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest4600', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest4600';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              readTimeout: 0,
              connectTimeout: 0
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_4700
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest4700
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest4700', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest4700';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              caPath: '/xts/test/cacert.pem'
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTPS_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_4800
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest4800
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest4800', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest4800';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              caPath: ' '
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTPS_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_4900
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest4900
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest4900', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest4900';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              caPath: '/xts/test/cacert.pem'
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTPS_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_5000
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest5000
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest5000', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest5000';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              caPath: ' '
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTPS_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_5200
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest5200
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest5200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest5200';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              method: http.RequestMethod.GET,
              resumeFrom: 4294967299
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_5300
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest5300
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest5300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest5300';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              method: http.RequestMethod.GET,
              resumeFrom: 0
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_5600
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest5600
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest5600', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest5600';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              method: http.RequestMethod.GET,
              resumeFrom: 4294967299
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_5700
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest5700
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest5700', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest5700';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              method: http.RequestMethod.GET,
              resumeFrom: 0
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_6000
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest6000
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest6000', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest6000';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              method: http.RequestMethod.GET,
              resumeTo: 4294967299
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_6100
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest6100
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest6100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest6100';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              method: http.RequestMethod.GET,
              resumeTo: 0
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_6400
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest6400
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest6400', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest6400';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              method: http.RequestMethod.GET,
              resumeTo: 4294967299,
              addressFamily: http.AddressFamily.ONLY_V6
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_6500
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest6500
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest6500', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest6500';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              method: http.RequestMethod.GET,
              resumeTo: 0,
              addressFamily: http.AddressFamily.ONLY_V4
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_6800
     * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest6800
     * @tc.desc   : Test HttpRequestOptions property.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOptionsTest6800', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest6800';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequestOptions: http.HttpRequestOptions = {
              method: http.RequestMethod.GET,
              resumeFrom: 9999,
              resumeTo: 333,
              addressFamily: http.AddressFamily.DEFAULT
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
              console.info(`${caseName} data:--- ${JSON.stringify(data)}`);
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
              ExpectFail();
              done();
            });
          }
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
