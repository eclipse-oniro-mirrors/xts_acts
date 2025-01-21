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

export default function HttpFlushTest() {
  describe('HttpFlushTest', () => {
    let XTS_TEST_HTTP_URL: string = 'http://www.baidu.com/';
    let XTS_TEST_SECOND_HTTP_URL: string = 'http://httpbin.org/anything';

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpResponseCache_Flush_0100
     * @tc.name   : testNetworkMgrHttpHttpResponseCacheFlush0100
     * @tc.desc   : Write cached data to the file system.Use callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush0100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush0100';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpResponseCache.flush((err: BusinessError) => {
              if (err) {
                console.info(`${caseName} flush failed ${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} failed err: ${JSON.stringify(err)}`);
                ExpectTrue(true);
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpResponseCache_Flush_0200
     * @tc.name   : testNetworkMgrHttpHttpResponseCacheFlush0200
     * @tc.desc   : Write cached data to the file system.Use Promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush0200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush0200';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpResponseCache.flush().then(() => {
              ExpectTrue(true);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} flush fail err:${JSON.stringify(err)}`);
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpResponseCache_Flush_0300
     * @tc.name   : testNetworkMgrHttpHttpResponseCacheFlush0300
     * @tc.desc   : Write cached data to the file system.Use callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush0300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush0300';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} request fail err:${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                httpResponseCache.flush((err: BusinessError) => {
                  if (err) {
                    console.info(`${caseName} flush fail err:${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                      if (err) {
                        console.info(`${caseName} secondResponse fail err:${JSON.stringify(err)}`);
                        ExpectFail();
                        done();
                      } else {
                        console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                        console.info(`${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                        ExpectTrue(data?.performanceTiming.tcpTiming == 0);
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
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpResponseCache_Flush_0400
     * @tc.name   : testNetworkMgrHttpHttpResponseCacheFlush0400
     * @tc.desc   : Write cached data to the file system.Use callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush0400', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush0400';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} firstResponse fail err:${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                httpResponseCache.flush((err: BusinessError) => {
                  if (err) {
                    console.info(`${caseName} flush fail err:${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                      if (err) {
                        console.info(`${caseName} secondResponse fail err:${JSON.stringify(err)}`);
                        ExpectFail();
                        done();
                      } else {
                        console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                        console.info(`${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                        httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                          if (err) {
                            console.info(`${caseName} thirdResponse fail err:${JSON.stringify(err)}`);
                            ExpectFail();
                            done();
                          } else {
                            console.info(`${caseName} thirdResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                            console.info(`${caseName} thirdResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                            ExpectTrue(data?.performanceTiming.tcpTiming == 0);
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
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpResponseCache_Flush_0500
     * @tc.name   : testNetworkMgrHttpHttpResponseCacheFlush0500
     * @tc.desc   : Write cached data to the file system.Use callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush0500', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush0500';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} firstResponse fail err:${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                httpResponseCache.flush((err: BusinessError) => {
                  if (err) {
                    console.info(`${caseName} flush fail err:${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                      if (err) {
                        console.info(`${caseName} secondResponse fail err:${JSON.stringify(err)}`);
                        ExpectFail();
                        done();
                      } else {
                        console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                        console.info(`${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                        httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                          if (err) {
                            console.info(`${caseName} thirdResponse fail err:${JSON.stringify(err)}`);
                            ExpectFail();
                            done();
                          } else {
                            console.info(`${caseName} thirdResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                            console.info(`${caseName} thirdResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                            httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                              if (err) {
                                console.info(`${caseName} fourthResponse fail err:${JSON.stringify(err)}`);
                                ExpectFail();
                                done();
                              } else {
                                console.info(`${caseName} fourthResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                                console.info(`${caseName} fourthResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                                ExpectTrue(data?.performanceTiming.tcpTiming == 0);
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
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpResponseCache_Flush_0600
     * @tc.name   : testNetworkMgrHttpHttpResponseCacheFlush0600
     * @tc.desc   : Write cached data to the file system.Use callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush0600', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush0600';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} firstResponse fail err:${JSON.stringify(err)}`);
                ExpectFail();
                done();
              }
              console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
              httpResponseCache.flush((err: BusinessError) => {
                if (err) {
                  console.info(`${caseName} flush fail err:${JSON.stringify(err)}`);
                  ExpectFail();
                  done();
                } else {
                  httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                    if (err) {
                      console.info(`${caseName} secondResponse fail err:${JSON.stringify(err)}`);
                      ExpectFail();
                      done();
                    } else {
                      console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                      console.info(`${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                      httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                        if (err) {
                          console.info(`${caseName} thirdResponse fail err:${JSON.stringify(err)}`);
                          ExpectFail();
                          done();
                        } else {
                          console.info(`${caseName} thirdResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                          console.info(`${caseName} thirdResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                          httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                            if (err) {
                              console.info(`${caseName} fourthResponse fail err:${JSON.stringify(err)}`);
                              ExpectFail();
                              done();
                            } else {
                              console.info(`${caseName} fourthResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                              console.info(`${caseName} fourthResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                              httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                                if (err) {
                                  console.info(`${caseName} fifthResponse fail err:${JSON.stringify(err)}`);
                                  ExpectFail();
                                  done();
                                } else {
                                  console.info(`${caseName} fifthResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                                  console.info(`${caseName} fifthResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                                  ExpectTrue(data?.performanceTiming.tcpTiming == 0);
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
                }
              });
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });
    
    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpResponseCache_Flush_0800
     * @tc.name   : testNetworkMgrHttpHttpResponseCacheFlush0800
     * @tc.desc   : Write cached data to the file system.Use callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush0800', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush0800';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL).then(() => {
              httpResponseCache.flush();
            }).catch((err: Error) => {
              console.info(`${caseName} secondResponse fail err : ${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
            httpRequest.request(XTS_TEST_SECOND_HTTP_URL, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} secondResponse fail err : ${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                console.info(`${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                ExpectTrue(data?.performanceTiming.tcpTiming > 0);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpResponseCache_Flush_0900
     * @tc.name   : testNetworkMgrHttpHttpResponseCacheFlush0900
     * @tc.desc   : Write cached data to the file system.Use Promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush0900', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush0900';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                httpResponseCache.flush().then(() => {
                  httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                    if (err) {
                      console.info(`${caseName} secondResponse fail err : ${JSON.stringify(err)}`);
                      ExpectFail();
                      done();
                    } else {
                      console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                      console.info(`${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                      ExpectTrue(data?.performanceTiming.tcpTiming == 0);
                      httpRequest.destroy();
                      done();
                    }
                  });
                }).catch((err: BusinessError) => {
                  console.info(`${caseName} flush fail err:${JSON.stringify(err)}`);
                  ExpectFail();
                  done();
                });
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpResponseCache_Flush_1000
     * @tc.name   : testNetworkMgrHttpHttpResponseCacheFlush1000
     * @tc.desc   : Write cached data to the file system.Use Promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush1000', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush1000';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} firstResponse fail err : ${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                httpResponseCache.flush().then(() => {
                  httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                    if (err) {
                      console.info(`${caseName} secondResponse fail err : ${JSON.stringify(err)}`);
                      ExpectFail();
                      done();
                    } else {
                      console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                      console.info(`${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                      httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                        if (err) {
                          console.info(`${caseName} thirdResponse fail err : ${JSON.stringify(err)}`);
                          ExpectFail();
                          done();
                        } else {
                          console.info(`${caseName} thirdResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                          console.info(`${caseName} thirdResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                          ExpectTrue(data?.performanceTiming.tcpTiming == 0);
                          httpRequest.destroy();
                          done();
                        }
                      });
                    }
                  });
                }).catch((err: BusinessError) => {
                  console.info(`${caseName} flush fail err:${JSON.stringify(err)}`);
                  ExpectFail();
                  done();
                });
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpResponseCache_Flush_1100
     * @tc.name   : testNetworkMgrHttpHttpResponseCacheFlush1100
     * @tc.desc   : Write cached data to the file system.Use Promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush1100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush1100';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} firstResponse fail err : ${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                httpResponseCache.flush().then(() => {
                  httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                    if (err) {
                      console.info(`${caseName} secondResponse fail err : ${JSON.stringify(err)}`);
                      ExpectFail();
                      done();
                    } else {
                      console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                      console.info(`${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                      httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                        if (err) {
                          console.info(`${caseName} thirdResponse fail err : ${JSON.stringify(err)}`);
                          ExpectFail();
                          done();
                        } else {
                          console.info(`${caseName} thirdResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                          console.info(`${caseName} thirdResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                          httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                            if (err) {
                              console.info(`${caseName} fourthResponse fail err : ${JSON.stringify(err)}`);
                              ExpectFail();
                              done();
                            } else {
                              console.info(`${caseName} fourthResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                              console.info(`${caseName} fourthResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                              ExpectTrue(data?.performanceTiming.tcpTiming == 0);
                              httpRequest.destroy();
                              done();
                            }
                          });
                        }
                      });
                    }
                  });
                }).catch((err: BusinessError) => {
                  console.info(`${caseName} flush fail err:${JSON.stringify(err)}`);
                  ExpectFail();
                  done();
                });
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpResponseCache_Flush_1200
     * @tc.name   : testNetworkMgrHttpHttpResponseCacheFlush1200
     * @tc.desc   : Write cached data to the file system.Use Promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush1200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush1200';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} firstResponse fail err : ${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                httpResponseCache.flush().then(() => {
                  httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                    if (err) {
                      console.info(`${caseName} secondResponse fail err : ${JSON.stringify(err)}`);
                      ExpectFail();
                      done();
                    } else {
                      console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                      console.info(`${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                      httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                        if (err) {
                          console.info(`${caseName} thirdResponse fail err : ${JSON.stringify(err)}`);
                          ExpectFail();
                          done();
                        } else {
                          console.info(`${caseName} thirdResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                          console.info(`${caseName} thirdResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                          httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                            if (err) {
                              console.info(`${caseName} fourthResponse fail err : ${JSON.stringify(err)}`);
                              ExpectFail();
                              done();
                            } else {
                              console.info(`${caseName} fourthResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                              console.info(`${caseName} fourthResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                              httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                                if (err) {
                                  console.info(`${caseName} fifthResponse fail err : ${JSON.stringify(err)}`);
                                  ExpectFail();
                                  done();
                                } else {
                                  console.info(`${caseName} fifthResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                                  console.info(`${caseName} fifthResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                                  ExpectTrue(data?.performanceTiming.tcpTiming == 0);
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
                }).catch((err: BusinessError) => {
                  console.info(`${caseName} flush fail err:${JSON.stringify(err)}`);
                  ExpectFail();
                  done();
                });
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpResponseCache_Flush_1300
     * @tc.name   : testNetworkMgrHttpHttpResponseCacheFlush1300
     * @tc.desc   : Write cached data to the file system.Use Promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush1300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush1300';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_SECOND_HTTP_URL, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} request success data : ${JSON.stringify(JSON.stringify(data))}`);
                httpRequest.request(XTS_TEST_HTTP_URL, (err: Error) => {
                  if (err) {
                    console.info(`${caseName} secondRequest fail err : ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    httpResponseCache.flush().then(() => {
                      httpRequest.request(XTS_TEST_SECOND_HTTP_URL);
                      httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                        if (err) {
                          console.info(`${caseName} baidu fail err : ${JSON.stringify(err)}`);
                          ExpectFail();
                          done();
                        } else {
                          console.info(`${caseName} baidu tcpTiming: ${data?.performanceTiming.tcpTiming}`);
                          ExpectTrue(data?.performanceTiming.tcpTiming == 0);
                          httpRequest.destroy();
                          done();
                        }
                      });
                    }).catch((err: BusinessError) => {
                      console.info(`${caseName} flush fail err:${JSON.stringify(err)}`);
                      ExpectFail();
                      done();
                    });
                  }
                });
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpResponseCache_Flush_1400
     * @tc.name   : testNetworkMgrHttpHttpResponseCacheFlush1400
     * @tc.desc   : Write cached data to the file system.Use Promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush1400', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush1400';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL).then(() => {
              httpResponseCache.flush().then().catch((err: BusinessError) => {
                console.info(`${caseName} flush fail err:${JSON.stringify(err)}`);
                ExpectFail();
                done();
              });
              httpRequest.request(XTS_TEST_SECOND_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} secondRequest fail err : ${JSON.stringify(err)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                  console.info(`${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                  ExpectTrue(data?.performanceTiming.tcpTiming > 0);
                  httpRequest.destroy();
                  done();
                }
              });
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpResponseCache_Flush_1500
     * @tc.name   : testNetworkMgrHttpHttpResponseCacheFlush1500
     * @tc.desc   : Write cached data to the file system.Use callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush1500', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush1500';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL).then((data: http.HttpResponse) => {
              console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
              httpResponseCache.flush((err: BusinessError) => {
                if (err) {
                  console.info(`${caseName} flush fail err : ${JSON.stringify(err)}`);
                  ExpectFail();
                  done();
                } else {
                  httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                    if (err) {
                      console.info(`${caseName} secondRequest fail err : ${JSON.stringify(err)}`);
                      ExpectFail();
                      done();
                    } else {
                      console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                      console.info(`${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                      ExpectTrue(data?.performanceTiming.tcpTiming == 0);
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
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpResponseCache_Flush_1600
     * @tc.name   : testNetworkMgrHttpHttpResponseCacheFlush1600
     * @tc.desc   : Write cached data to the file system.Use callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush1600', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush1600';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL).then((data: http.HttpResponse) => {
              console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
              httpResponseCache.flush((err: BusinessError) => {
                if (err) {
                  console.info(`${caseName} flush fail err : ${JSON.stringify(err)}`);
                  ExpectFail();
                  done();
                } else {
                  httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                    if (err) {
                      console.info(`${caseName} secondRequest fail err : ${JSON.stringify(err)}`);
                      ExpectFail();
                      done();
                    } else {
                      console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                      console.info(`${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                      httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                        if (err) {
                          console.info(`${caseName} thirdResponse fail err : ${JSON.stringify(err)}`);
                          ExpectFail();
                          done();
                        } else {
                          console.info(`${caseName} thirdResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                          console.info(`${caseName} thirdResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                          ExpectTrue(data?.performanceTiming.tcpTiming == 0);
                          httpRequest.destroy();
                          done();
                        }
                      });
                    }
                  });
                }
              });
            }).catch((err: Error) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
              ExpectFail();
              done();
            })
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpResponseCache_Flush_1700
     * @tc.name   : testNetworkMgrHttpHttpResponseCacheFlush1700
     * @tc.desc   : Write cached data to the file system.Use callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush1700', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush1700';
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
              usingCache: false
            }
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                httpResponseCache.flush((err: BusinessError) => {
                  if (err) {
                    console.info(`${caseName} flush fail err : ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
                      if (err) {
                        console.info(`${caseName} secondRequest fail err : ${JSON.stringify(err)}`);
                        ExpectFail();
                        done();
                      } else {
                        console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                        console.info(`${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                        ExpectTrue(data?.performanceTiming.tcpTiming == 0);
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
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpResponseCache_Flush_1800
     * @tc.name   : testNetworkMgrHttpHttpResponseCacheFlush1800
     * @tc.desc   : Write cached data to the file system.Use callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush1800', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush1800';
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
                console.info(`${caseName} firstResponse fail err : ${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                httpResponseCache.flush().then(() => {
                  httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: Error, data: http.HttpResponse) => {
                    if (err) {
                      console.info(`${caseName} secondResponse fail err : ${JSON.stringify(err)}`);
                      ExpectFail();
                      done();
                    } else {
                      console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                      console.info(`${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                      ExpectTrue(data?.performanceTiming.tcpTiming == 0);
                      httpRequest.destroy();
                      done();
                    }
                  });
                }).catch((err: BusinessError) => {
                  console.info(`${caseName} flush fail err : ${JSON.stringify(err)}`);
                  ExpectFail();
                  done();
                });
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpResponseCache_Flush_1900
     * @tc.name   : testNetworkMgrHttpHttpResponseCacheFlush1900
     * @tc.desc   : Write cached data to the file system.Use callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush1900', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush1900';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
              if (err) {
                console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                httpResponseCache.flush();
              }
            });
            const secondRequest: () => void = () => httpRequest.request(XTS_TEST_HTTP_URL,
              (err: Error, data: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} err： ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                  console.info(`${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                  ExpectTrue(data?.performanceTiming.tcpTiming == 0);
                  httpRequest.destroy();
                  done();
                }
              });
            setTimeout(() => {
              secondRequest();
            }, 10000);
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpResponseCache_Flush_2000
     * @tc.name   : testNetworkMgrHttpHttpResponseCacheFlush2000
     * @tc.desc   : Write cached data to the file system.Use callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush2000', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush2000';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL).then((data: http.HttpResponse) => {
              console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
              httpResponseCache.flush();
            }).catch((err: Error) => {
              console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
            const secondRequest: () => void = () => {
              httpRequest.request(XTS_TEST_HTTP_URL).then((data: http.HttpResponse) => {
                console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                console.info(`${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                ExpectTrue(data?.performanceTiming.tcpTiming == 0);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              });
            }
            setTimeout(() => {
              secondRequest();
            }, 10000);
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });
  });
}
