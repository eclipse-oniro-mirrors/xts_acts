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
import { describe, expect, it, Level, Size, TestType  } from '@ohos/hypium';
import connection from '@ohos.net.connection';

export const ADDR_TEST_STREAM_HTTPS = "https://cn.bing.com/rp/Q5BJPjebyYN5QiqznkcMQmLrF9U.svg";

/**
 * @description assert whether the input argument is true
 * @param data
 */
function ExpectTrue(data: Boolean): void {
  try {
    expect(data).assertTrue();
  } catch (e) {
    const error: BusinessError = e as BusinessError;
    console.info(`expect true catch error, code: ${error.code}, message: ${error.message}`);
  }
}

/**
 * @description failure assertions
 */
function ExpectFail(): void {
  try {
    expect().assertFail();
  } catch (e) {
    const error: BusinessError = e as BusinessError;
    console.info(`expect fail catch error, code: ${error.code}, message: ${error.message}`);
  }
}

type emptyFunc = () => void;

const TEST_MORE_LEN: number = 2;
const TEST_MORE_REQUEST_LEN: number = 2;

export default function HttpRequestOnOffTest() {
  describe("HttpRequestOnTest", () => {

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_0100
     * @tc.name:    testHttpRequestOn0100
     * @tc.desc:    test on with type headerReceive  send one request with httpRequest.requestInStream only one listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 0
     */
    it('testHttpRequestOn0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn0100";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: 1
              }).forEach(() => {
                httpRequest.on('headerReceive', callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                      if (err) {
                        reject(err);
                      } else {
                        resolve();
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called == 1);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_0200
     * @tc.name:    testHttpRequestOn0200
     * @tc.desc:    test on with type headerReceive send one request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 0
     */
    it('testTypeHeaderReceive0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn0200SUB_Global_httpRequest_on_0200";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: TEST_MORE_LEN
              }).forEach(() => {
                httpRequest.on('headerReceive', callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                      if (err) {
                        reject(err);
                      } else {
                        resolve();
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called == 1);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_0300
     * @tc.name:    testHttpRequestOn0300
     * @tc.desc:    test on with type headerReceive  send more request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 0
     */
    it('testOnTypeHeaderReceive0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testHttpRequestOn0300";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: TEST_MORE_LEN
              }).forEach(() => {
                httpRequest.on('headerReceive', callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < TEST_MORE_REQUEST_LEN; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                      if (err) {
                        reject(err);
                      } else {
                        resolve();
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called == TEST_MORE_REQUEST_LEN);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_0400
     * @tc.name:    testHttpRequestOn0400
     * @tc.desc:    test on with type headersReceive  send one request with httpRequest.requestInStream only one listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 0
     */
    it('testHttpRequestOn0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn0400";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: 1
              }).forEach(() => {
                httpRequest.on('headersReceive', callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                      if (err) {
                        reject(err);
                      } else {
                        resolve();
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called == 1);
                httpRequest.destroy();
                httpRequest.off('headersReceive');
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_0500
     * @tc.name:    testHttpRequestOn0500
     * @tc.desc:    test on with type headersReceive  send one request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn0500";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: TEST_MORE_LEN
              }).forEach(() => {
                httpRequest.on('headersReceive', callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                      if (err) {
                        reject(err);
                      } else {
                        resolve();
                      }
                    });
                  })
                )
                ;
              }
              Promise.all(list).then(() => {
                ExpectTrue(called == 1);
                httpRequest.destroy();
                httpRequest.off('headersReceive');
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_0600
     * @tc.name:    testHttpRequestOn0600
     * @tc.desc:    test on with type headersReceive  send more request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn0600";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: TEST_MORE_LEN
              }).forEach(() => {
                httpRequest.on('headersReceive', callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < TEST_MORE_REQUEST_LEN; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                      if (err) {
                        reject(err);
                      } else {
                        resolve();
                      }
                    });
                  })
                )
                ;
              }
              Promise.all(list).then(() => {
                ExpectTrue(called == TEST_MORE_REQUEST_LEN);
                httpRequest.destroy();
                httpRequest.off('headersReceive');
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_0700
     * @tc.name:    testHttpRequestOn0700
     * @tc.desc:    test on with type dataReceive send one request with httpRequest.requestInStream only one listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn0700";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: 1
              }).forEach(() => {
                httpRequest.on('dataReceive', callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                      if (err) {
                        reject(err);
                      } else {
                        resolve();
                      }
                    });
                  })
                )
                ;
              }
              Promise.all(list).then(() => {
                ExpectTrue(called >= 1);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_0800
     * @tc.name:    testHttpRequestOn0800
     * @tc.desc:    test on with type dataReceive send one request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn0800";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: TEST_MORE_LEN
              }).forEach(() => {
                httpRequest.on('dataReceive', callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                      if (err) {
                        reject(err);
                      } else {
                        resolve();
                      }
                    });
                  })
                )
                ;
              }
              Promise.all(list).then(() => {
                ExpectTrue(called >= 1);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_0900
     * @tc.name:    testHttpRequestOn0900
     * @tc.desc:    test on with type dataReceive send more request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn0900";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: TEST_MORE_LEN
              }).forEach(() => {
                httpRequest.on('dataReceive', callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < TEST_MORE_REQUEST_LEN; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                      if (err) {
                        reject(err);
                      } else {
                        resolve();
                      }
                    });
                  })
                )
                ;
              }
              Promise.all(list).then(() => {
                ExpectTrue(called >= TEST_MORE_REQUEST_LEN);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_1000
     * @tc.name:    testHttpRequestOn1000
     * @tc.desc:    test on with type dataEnd send one request with httpRequest.requestInStream only one listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn0900";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: 1
              }).forEach(() => {
                httpRequest.on('dataEnd', callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                      setTimeout(() => {
                        if (err) {
                          reject(err);
                        } else {
                          resolve();
                        }
                      }, 0);
                    });
                  })
                )
                ;
              }
              Promise.all(list).then(() => {
                ExpectTrue(called == 1);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_1100
     * @tc.name:    testHttpRequestOn1100
     * @tc.desc:    test on with type dataEnd send one request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn1100";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: 2
              }).forEach(() => {
                httpRequest.on('dataEnd', callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                      setTimeout(() => {
                        if (err) {
                          reject(err);
                        } else {
                          resolve();
                        }
                      }, 0);
                    });
                  })
                )
                ;
              }
              Promise.all(list).then(() => {
                ExpectTrue(called == 1);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_1200
     * @tc.name:    testHttpRequestOn1200
     * @tc.desc:    test on with type dataEnd send more request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn1200";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: 2
              }).forEach(() => {
                httpRequest.on('dataEnd', callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 2; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                      setTimeout(() => {
                        if (err) {
                          reject(err);
                        } else {
                          resolve();
                        }
                      }, 0);
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called == 2);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_1300
     * @tc.name:    testHttpRequestOn1300
     * @tc.desc:    test on with type dataReceiveProgress send one request with httpRequest.requestInStream only one listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn1300";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: 1
              }).forEach(() => {
                httpRequest.on('dataReceiveProgress', callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                      if (err) {
                        reject(err);
                      } else {
                        resolve();
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called >= 1);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_1400
     * @tc.name:    testHttpRequestOn1400
     * @tc.desc:    test on with type dataReceiveProgress send one request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn1400";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: TEST_MORE_LEN
              }).forEach(() => {
                httpRequest.on('dataReceiveProgress', callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                      if (err) {
                        reject(err);
                      } else {
                        resolve();
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called >= 1);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_1500
     * @tc.name:    testHttpRequestOn1500
     * @tc.desc:    test on with type dataReceiveProgress send more request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn1500";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: TEST_MORE_LEN
              }).forEach(() => {
                httpRequest.on('dataReceiveProgress', callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < TEST_MORE_REQUEST_LEN; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                      if (err) {
                        reject(err);
                      } else {
                        resolve();
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called >= TEST_MORE_REQUEST_LEN);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_1600
     * @tc.name  :  SUB_NetworkMgr_Http_HttpRequest_On_1600
     * @tc.desc  :  test on with type dataSendProgress send one request with httpRequest.requestInStream only one listener
     * @tc.size  :  MediumTest
     * @tc.type  :  method
     * @tc.level :  level 2
     */
    it('testHttpRequestOn1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn1600";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: 1
              }).forEach(() => {
                httpRequest.on('dataSendProgress', callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, {
                      method: http.RequestMethod.POST
                    }, (err) => {
                      if (err) {
                        reject(err);
                      } else {
                        resolve();
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called >= 0);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_1700
     * @tc.name:    testHttpRequestOn1700
     * @tc.desc:    test on with type dataSendProgress send one request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn1700";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: TEST_MORE_LEN
              }).forEach(() => {
                httpRequest.on('dataSendProgress', callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                      if (err) {
                        reject(err);
                      } else {
                        resolve();
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called >= 0);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_1800
     * @tc.name:    testHttpRequestOn1800
     * @tc.desc:    test on with type dataSendProgress send more request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn1800";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: TEST_MORE_LEN
              }).forEach(() => {
                httpRequest.on('dataSendProgress', callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < TEST_MORE_REQUEST_LEN; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream('http://www.baidu.com', {
                      method: http.RequestMethod.POST,
                    }, (err) => {
                      if (err) {
                        reject(err);
                      } else {
                        resolve();
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called >= 0);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_Once_1900
     * @tc.name:   SUB_NetworkMgr_Http_HttpRequest_Once_1900
     * @tc.desc:    test once with type headersReceive  send one request with httpRequest.requestInStream only one listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOnce1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOnce1900";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: 1
              }).forEach(() => {
                httpRequest.once('headersReceive', callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                      if (err) {
                        reject(err);
                      } else {
                        resolve();
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called == 1);
                httpRequest.destroy();
                httpRequest.off('headersReceive');
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_Once_2000
     * @tc.name:    testHttpRequestOnce2000
     * @tc.desc:    test once with type headersReceive  send more request with httpRequest.requestInStream only one listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOnce2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOnce2000";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: 1
              }).forEach(() => {
                httpRequest.once('headersReceive', callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < TEST_MORE_REQUEST_LEN; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                      if (err) {
                        reject(err);
                      } else {
                        resolve();
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called == 1);
                httpRequest.destroy();
                httpRequest.off('headersReceive');
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_Once_2100
     * @tc.name:    testHttpRequestOnce2100
     * @tc.desc:    test once with type headersReceive  send more request with httpRequest.requestInStream  one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOnce2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOnce2100";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: TEST_MORE_LEN
              }).forEach(() => {
                httpRequest.once('headersReceive', callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < TEST_MORE_REQUEST_LEN; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                      if (err) {
                        reject(err);
                      } else {
                        resolve();
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called == 1);
                httpRequest.destroy();
                httpRequest.off('headersReceive');
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_Once_2200
     * @tc.name:    testHttpRequestOnce2200
     * @tc.desc:    test once with type headersReceive  send more request with httpRequest.request only one listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOnce2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOnce2200";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: 1
              }).forEach(() => {
                httpRequest.once('headersReceive', callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.request(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                      if (err) {
                        reject(err);
                      } else {
                        resolve();
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called == 1);
                httpRequest.destroy();
                httpRequest.off('headersReceive');
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_Once_2300
     * @tc.name:    testHttpRequestOnce2300
     * @tc.desc:    test once with type headersReceive  send one request with httpRequest.request  one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOnce2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOnce2300";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: TEST_MORE_LEN
              }).forEach(() => {
                httpRequest.once('headersReceive', callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.request(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                      if (err) {
                        reject(err);
                      } else {
                        resolve();
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called == 1);
                httpRequest.destroy();
                httpRequest.off('headersReceive');
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_Once_2400
     * @tc.name:    testHttpRequestOnce2400
     * @tc.desc:    test once with type headersReceive  send more request with httpRequest.request  one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOnce2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOnce2400";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: TEST_MORE_LEN
              }).forEach(() => {
                httpRequest.once('headersReceive', callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < TEST_MORE_REQUEST_LEN; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.request(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                      if (err) {
                        reject(err);
                      } else {
                        resolve();
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called == 1);
                httpRequest.destroy();
                httpRequest.off('headersReceive');
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_2500
     * @tc.name:    testHttpRequestOn2500
     * @tc.desc:    test on with type dataReceive with httpRequest.request not support
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn2500";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              httpRequest.on('dataReceive', callback);
              const promise: Promise<void> = new Promise<void>((resolve, reject) => {
                httpRequest.request(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                  if (err) {
                    reject(err);
                  } else {
                    resolve();
                  }
                });
              });
              promise.then(() => {
                ExpectTrue(called == 0);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promise catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_2600
     * @tc.name:    testHttpRequestOn2600
     * @tc.desc:    test on with type dataReceiveProgress with httpRequest.request not support
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn2600";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              httpRequest.on('dataReceiveProgress', callback);
              const promise: Promise<void> = new Promise<void>((resolve, reject) => {
                httpRequest.request(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                  if (err) {
                    reject(err);
                  } else {
                    resolve();
                  }
                });
              });
              promise.then(() => {
                ExpectTrue(called == 0);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promise catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_2700
     * @tc.name:    testHttpRequestOn2700
     * @tc.desc:    test on with type dataEnd with httpRequest.request not support
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn2700";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              httpRequest.on('dataEnd', callback);
              const promise: Promise<void> = new Promise<void>((resolve, reject) => {
                httpRequest.request(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                  if (err) {
                    reject(err);
                  } else {
                    resolve();
                  }
                });
              });
              promise.then(() => {
                ExpectTrue(called == 0);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promise catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_2800
     * @tc.name:    testHttpRequestOn2800
     * @tc.desc:    test on with type dataSendProgress with httpRequest.request not support
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn2800";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              httpRequest.on('dataSendProgress', callback);
              const promise: Promise<void> = new Promise<void>((resolve, reject) => {
                httpRequest.request(ADDR_TEST_STREAM_HTTPS, (err: BusinessError) => {
                  if (err) {
                    reject(err);
                  } else {
                    resolve();
                  }
                });
              });
              promise.then(() => {
                ExpectTrue(called >= 0);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
    * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_2900
    * @tc.name:    testHttpRequestOn2900
    * @tc.desc:    test on with type headerReceive  send one request with httpRequest.requestInStream only one listener Promise
    * @tc.size:    MediumTest
    * @tc.type:    Function
    * @tc.level:   level 2
    */
    it('testHttpRequestOn2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn2900";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: 1
              }).forEach(() => {
                httpRequest.on('headerReceive', callback);
              });
              let list: Promise<number>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called == 1);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_3000
     * @tc.name:    testHttpRequestOn3000
     * @tc.desc:    test on with type headerReceive  send one request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn3000";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: TEST_MORE_LEN
              }).forEach(() => {
                httpRequest.on('headerReceive', callback);
              });
              let list: Promise<number>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called == 1);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_3100
     * @tc.name:    testHttpRequestOn3100
     * @tc.desc:    test on with type headerReceive  send more request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn3100";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: TEST_MORE_LEN
              }).forEach(() => {
                httpRequest.on('headerReceive', callback);
              });
              let list: Promise<number>[] = [];
              for (let i = 0; i < TEST_MORE_REQUEST_LEN; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called == TEST_MORE_REQUEST_LEN);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_3200
     * @tc.name:    testHttpRequestOn3200
     * @tc.desc:    test on with type headersReceive  send one request with httpRequest.requestInStream only one listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn3200";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: 1
              }).forEach(() => {
                httpRequest.on('headersReceive', callback);
              });
              let list: Promise<number>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called == 1);
                httpRequest.off('headersReceive');
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_3300
     * @tc.name:    testHttpRequestOn3300
     * @tc.desc:    test on with type headersReceive  send one request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn3300";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: TEST_MORE_LEN
              }).forEach(() => {
                httpRequest.on('headersReceive', callback);
              });
              let list: Promise<number>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called == 1);
                httpRequest.destroy();
                httpRequest.off('headersReceive');
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_3400
     * @tc.name:    testHttpRequestOn3400
     * @tc.desc:    test on with type headersReceive  send more request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn3400";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: TEST_MORE_LEN
              }).forEach(() => {
                httpRequest.on('headersReceive', callback);
              });
              let list: Promise<number>[] = [];
              for (let i = 0; i < TEST_MORE_REQUEST_LEN; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called == TEST_MORE_REQUEST_LEN);
                httpRequest.destroy();
                httpRequest.off('headersReceive');
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_3500
     * @tc.name:    testHttpRequestOn3500
     * @tc.desc:    test on with type dataReceive send one request with httpRequest.requestInStream only one listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn3500";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: 1
              }).forEach(() => {
                httpRequest.on('dataReceive', callback);
              });
              let list: Promise<number>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called >= 1);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_3600
     * @tc.name:    testHttpRequestOn3600
     * @tc.desc:    test on with type dataReceive send one request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn3600";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: TEST_MORE_LEN
              }).forEach(() => {
                httpRequest.on('dataReceive', callback);
              });
              let list: Promise<number>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called >= 1);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_3700
     * @tc.name:    testHttpRequestOn3700
     * @tc.desc:    test on with type dataReceive send more request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn3700";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: TEST_MORE_LEN
              }).forEach(() => {
                httpRequest.on('dataReceive', callback);
              });
              let list: Promise<number>[] = [];
              for (let i = 0; i < TEST_MORE_REQUEST_LEN; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called >= TEST_MORE_REQUEST_LEN);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_3800
     * @tc.name:    testHttpRequestOn3800
     * @tc.desc:    test on with type dataEnd send one request with httpRequest.requestInStream only one listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn3800";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: 1
              }).forEach(() => {
                httpRequest.on('dataEnd', callback);
              });
              let list: Promise<number>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                setTimeout(() => {
                  console.info(`${caseName} called: ${called}}`);
                  ExpectTrue(called == 1);
                  httpRequest.destroy();
                  done();
                }, 0)
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_3900
     * @tc.name:    testHttpRequestOn3900
     * @tc.desc:    test on with type dataEnd send one request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn3900";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: 2
              }).forEach(() => {
                httpRequest.on('dataEnd', callback);
              });

              let list: Promise<number>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                setTimeout(() => {
                  console.info(`${caseName} called: ${called}}`);
                  ExpectTrue(called == 1);
                  httpRequest.destroy();
                  done();
                }, 0)
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_4000
     * @tc.name:    testHttpRequestOn4000
     * @tc.desc:    test on with type dataEnd send more request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn4000";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: 2
              }).forEach(() => {
                httpRequest.on('dataEnd', callback);
              });
              let list: Promise<number>[] = [];
              for (let i = 0; i < 2; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                setTimeout(() => {
                  console.info(`${caseName} called: ${called}}`);
                  ExpectTrue(called == 2);
                  httpRequest.destroy();
                  done();
                }, 0)
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_4100
     * @tc.name:    testHttpRequestOn4100
     * @tc.desc:    test on with type dataReceiveProgress send one request with httpRequest.requestInStream only one listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn4100";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: 1
              }).forEach(() => {
                httpRequest.on('dataReceiveProgress', callback);
              });
              let list: Promise<number>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called >= 1);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_4200
     * @tc.name:    testHttpRequestOn4200
     * @tc.desc:    test on with type dataReceiveProgress send one request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn4200";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: TEST_MORE_LEN
              }).forEach(() => {
                httpRequest.on('dataReceiveProgress', callback);
              });
              let list: Promise<number>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called >= 1);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_4300
     * @tc.name:    testHttpRequestOn4300
     * @tc.desc:    test on with type dataReceiveProgress send more request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn4300";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: TEST_MORE_LEN
              }).forEach(() => {
                httpRequest.on('dataReceiveProgress', callback);
              });
              let list: Promise<number>[] = [];
              for (let i = 0; i < TEST_MORE_REQUEST_LEN; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called >= TEST_MORE_REQUEST_LEN);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_4400
     * @tc.name  :  SUB_NetworkMgr_Http_HttpRequest_On_4400
     * @tc.desc  :  test on with type dataSendProgress send one request with httpRequest.requestInStream only one listener
     * @tc.size  :  MediumTest
     * @tc.type  :  method
     * @tc.level :  level 2
     */
    it('testHttpRequestOn4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn4400";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: 1
              }).forEach(() => {
                httpRequest.on('dataSendProgress', callback);
              });
              let list: Promise<number>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called >= 0);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_4500
     * @tc.name:    testHttpRequestOn4500
     * @tc.desc:    test on with type dataSendProgress send one request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn4500";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: TEST_MORE_LEN
              }).forEach(() => {
                httpRequest.on('dataSendProgress', callback);
              });
              let list: Promise<number>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called == 0);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_4600
     * @tc.name:    testHttpRequestOn4600
     * @tc.desc:    test on with type dataSendProgress send more request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn4600";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              Array.from<void>({
                length: TEST_MORE_LEN
              }).forEach(() => {
                httpRequest.on('dataSendProgress', callback);
              });
              let list: Promise<number>[] = [];
              for (let i = 0; i < TEST_MORE_REQUEST_LEN; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                ExpectTrue(called >= 0);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} promiseAll catch error, code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_5300
     * @tc.name:    testHttpRequestOn5300
     * @tc.desc:    test on with type dataReceive with httpRequest.request not support
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn5300";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              httpRequest.on('dataReceive', () => {
                called++;
              });
              httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS).then((res: number) => {
                console.info(`${caseName} request sunccess, data: ${JSON.stringify(res)}`);
                console.info(`${caseName} called: ${called}`);
                ExpectTrue(called == 1);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_5400
     * @tc.name:    testHttpRequestOn5400
     * @tc.desc:    test on with type dataReceiveProgress with httpRequest.request not support
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn5400";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              httpRequest.on('dataReceiveProgress', () => {
                called++;
              });
              httpRequest.request(ADDR_TEST_STREAM_HTTPS).then((res: http.HttpResponse) => {
                console.info(`${caseName} request sunccess, data: ${JSON.stringify(res)}`);
                console.info(`${caseName} called: ${called}`);
                ExpectTrue(called == 0);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_5500
     * @tc.name:    testHttpRequestOn5500
     * @tc.desc:    test on with type dataEnd with httpRequest.request not support
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn5500";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              httpRequest.on('dataEnd', () => {
                called++;
              });
              httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS).then((res: number) => {
                console.info(`${caseName} request sunccess, data: ${JSON.stringify(res)}`);
                console.info(`${caseName} called: ${called}`);
                ExpectTrue(called == 1);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_5600
     * @tc.name:    testHttpRequestOn5600
     * @tc.desc:    test on with type dataSendProgress with httpRequest.request not support
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it('testHttpRequestOn5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = "testHttpRequestOn5600";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              httpRequest.on('dataSendProgress', () => {
                called++;
              });
              httpRequest.request(ADDR_TEST_STREAM_HTTPS).then((res: http.HttpResponse) => {
                console.info(`${caseName} request sunccess, data: ${JSON.stringify(res)}`);
                ExpectTrue(called == 0);
                httpRequest.destroy();
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });
  });
}
