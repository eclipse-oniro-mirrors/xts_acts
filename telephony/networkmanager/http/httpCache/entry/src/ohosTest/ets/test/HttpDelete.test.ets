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

export default function HttpDeleteTest() {
  describe('HttpDeleteTest', () => {
    let XTS_TEST_HTTP_URL: string = 'http://www.baidu.com/';

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpResponseCache_Delete_0100
     * @tc.name   : testNetworkMgrHttpHttpResponseCacheDelete0100
     * @tc.desc   : Disable cache and delete data within it.Use callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
     it('testNetworkMgrHttpHttpResponseCacheDelete0100', 0, async (done: Function) => {
       const caseName: string = 'testNetworkMgrHttpHttpResponseCacheDelete0100';
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
             httpResponseCache.delete((err: BusinessError) => {
               if (err) {
                 console.info(`${caseName} delete fail err:${JSON.stringify(err)}`);
                 ExpectFail();
                 done();
               } else {
                 console.info(`${caseName} delete success httpResponseCache:${JSON.stringify(httpResponseCache)}`);
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
       console.info(`${caseName}---End `);
     });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpResponseCache_Delete_0200
     * @tc.name   : testNetworkMgrHttpHttpResponseCacheDelete0200
     * @tc.desc   : Disable cache and delete data within it.Use Promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpResponseCacheDelete0200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpResponseCacheDelete0200';
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
            httpResponseCache.delete().then(() => {
              console.info(`${caseName} delete success httpResponseCache:${JSON.stringify(httpResponseCache)}`);
              ExpectTrue(true);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} delete fail err:${JSON.stringify(err)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpResponseCache_Delete_0300
     * @tc.name   : testNetworkMgrHttpHttpResponseCacheDelete0300
     * @tc.desc   : Disable cache and delete data within it.Use callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpResponseCacheDelete0300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpResponseCacheDelete0300';
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
                console.info(`${caseName} firstResponse failed err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data.performanceTiming)}`);
                httpResponseCache.flush((err: BusinessError) => {
                  if (err) {
                    console.info(`${caseName} flush err: ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    httpResponseCache.delete((err: BusinessError) => {
                      if (err) {
                        console.info(`${caseName} delete err: ${JSON.stringify(err)}`);
                        ExpectFail();
                        done();
                      } else {
                        httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                          if (err) {
                            console.info(`${caseName} secondResponse failed err: ${JSON.stringify(err)}`);
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
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpResponseCache_Delete_0400
     * @tc.name   : testNetworkMgrHttpHttpResponseCacheDelete0400
     * @tc.desc   : Disable cache and delete data within it.Use callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpResponseCacheDelete0400', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpResponseCacheDelete0400';
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
                console.info(`${caseName} firstResponse failed err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data.performanceTiming)}`);
                httpResponseCache.flush((err: BusinessError) => {
                  if (err) {
                    console.info(`${caseName} flush err: ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                      if (err) {
                        console.info(`${caseName} secondResponse failed err: ${JSON.stringify(err)}`);
                        ExpectFail();
                        done();
                      } else {
                        console.info(`${caseName} secondResponse performanceTiming ${JSON.stringify(data.performanceTiming)}`);
                        console.info(`${caseName} secondResponse tcpTiming ${data.performanceTiming.tcpTiming}`);
                        httpResponseCache.delete((err: BusinessError) => {
                          if (err) {
                            console.info(`${caseName} delete err: ${JSON.stringify(err)}`);
                            ExpectFail();
                            done();
                          } else {
                            httpRequest.request(XTS_TEST_HTTP_URL, (err: Error, data: http.HttpResponse) => {
                              if (err) {
                                console.info(`${caseName} thirdResponse failed err: ${JSON.stringify(err)}`);
                                ExpectFail();
                                done();
                              } else {
                                console.info(`${caseName} thirdResponse performanceTiming ${JSON.stringify(data.performanceTiming)}`);
                                console.info(`${caseName} thirdResponse tcpTiming ${data.performanceTiming.tcpTiming}`);
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
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });
  });
}
