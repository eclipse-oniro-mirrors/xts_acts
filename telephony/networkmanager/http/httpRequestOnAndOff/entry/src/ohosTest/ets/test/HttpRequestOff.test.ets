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

export default function HttpRequestOffTest() {
  describe('HttpRequestOffTest', () => {
    let XTS_TEST_HTTP_URL: string = 'http://www.baidu.com/';
    let XTS_TEST_STREAM_HTTPS_URL: string = "https://cn.bing.com/rp/Q5BJPjebyYN5QiqznkcMQmLrF9U.svg";
    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_0100
     * @tc.name   : testNetworkMgrHttpHttpRequestOff0100
     * @tc.desc   : Unsubscribe from HTTP Response Header event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff0100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff0100';
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
            let count: number = 1;
            const callback: (header: Object) => void = (header: Object) => {
              count = count + 1;
              console.info(`${caseName} callback header: ${JSON.stringify(header)}`);
              console.info(`${caseName} callback  count: ${count}`);
            }
            httpRequest.on("headersReceive", callback);
            httpRequest.off("headersReceive", callback);
            httpRequest.request(XTS_TEST_HTTP_URL,
              (err: BusinessError) => {
                if (err) {
                  console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${caseName} count: ${count}`);
                  ExpectTrue(count == 1);
                  httpRequest.destroy();
                  done();
                }
              });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch failed ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_0200
     * @tc.name   : testNetworkMgrHttpHttpRequestOff0200
     * @tc.desc   : Unsubscribe from HTTP Response Header event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff0200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff0200';
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
            let count: number = 1;
            httpRequest.on("headersReceive", (header: Object) => {
              count = count + 1;
              console.info(`${caseName} header: ${JSON.stringify(header)}`);
            });
            httpRequest.off("headersReceive");
            httpRequest.request(XTS_TEST_HTTP_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch failed ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_0300
     * @tc.name   : testNetworkMgrHttpHttpRequestOff0300
     * @tc.desc   : Unsubscribe from HTTP streaming response data receiving events.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff0300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff0300';
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
            let count: number = 1;
            httpRequest.on("dataReceive", (data: ArrayBuffer) => {
              count = count + 1;
              console.info(`${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
            });
            httpRequest.off("dataReceive");
            httpRequest.request(XTS_TEST_STREAM_HTTPS_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch failed ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_0400
     * @tc.name   : testNetworkMgrHttpHttpRequestOff0400
     * @tc.desc   : Unsubscribe from HTTP streaming response data receiving events.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff0400', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff0400';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            let httpRequest: http.HttpRequest = http.createHttp();
            let count: number = 1;
            const callback: (data: ArrayBuffer) => void = (data: ArrayBuffer) => {
              count = count + 1;
              console.info(`${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
            }
            httpRequest.on("dataReceive", callback);
            httpRequest.off("dataReceive", callback);
            httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch failed ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_0500
     * @tc.name   : testNetworkMgrHttpHttpRequestOff0500
     * @tc.desc   : Unsubscribe from the HTTP streaming response data reception completion event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff0500', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff0500';
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
            let count: number = 1;
            httpRequest.on("dataEnd", () => {
              count = count + 1;
              console.info(`${caseName} Receive dataEnd`);
            });
            httpRequest.off("dataEnd");
            httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch failed ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_0600
     * @tc.name   : testNetworkMgrHttpHttpRequestOff0600
     * @tc.desc   : Unsubscribe from the HTTP streaming response data reception completion event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff0600', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff0600';
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
            let count: number = 1;
            const callback: () => void = () => {
              count = count + 1;
              console.info(`${caseName} Receive dataEnd`);
            }
            httpRequest.on("dataEnd", callback);
            httpRequest.off("dataEnd", callback);
            httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch failed ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_0700
     * @tc.name   : testNetworkMgrHttpHttpRequestOff0700
     * @tc.desc   : Unsubscribe from HTTP streaming response data receiving progress events.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff0700', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff0700';
      console.info(`${caseName}---Start`);

      class RequestData {
        receiveSize: number = 2000;
        totalSize: number = 2000;
      }

      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let count: number = 1;
            httpRequest.on("dataReceiveProgress", (data: RequestData) => {
              count = count + 1;
              console.info(`${caseName} dataReceiveProgress:${JSON.stringify(data)}`);
            });
            httpRequest.off("dataReceiveProgress");
            httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch failed ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_0800
     * @tc.name   : testNetworkMgrHttpHttpRequestOff0800
     * @tc.desc   : Unsubscribe from HTTP streaming response data receiving progress events.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff0800', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff0800';
      console.info(`${caseName}---Start`);

      class RequestData {
        receiveSize: number = 2000;
        totalSize: number = 2000;
      }

      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let count: number = 1;
            const callback: (data: RequestData) => void = (data: RequestData) => {
              count = count + 1;
              console.info(`${caseName} dataReceiveProgress:${JSON.stringify(data)}`);
            }
            httpRequest.on("dataReceiveProgress", callback);
            httpRequest.off("dataReceiveProgress", callback);
            httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch failed ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_0900
     * @tc.name   : testNetworkMgrHttpHttpRequestOff0900
     * @tc.desc   : Unsubscribe from HTTP network request data sending progress event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff0900', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff0900';
      console.info(`${caseName}---Start`);

      class SendData {
        sendSize: number = 2000;
        totalSize: number = 2000;
      }

      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let count: number = 1;
            httpRequest.on("dataSendProgress", (data: SendData) => {
              count = count + 1;
              console.info(`${caseName} dataSendProgress: ${JSON.stringify(data)}`);
            });
            httpRequest.off("dataSendProgress");
            httpRequest.request(XTS_TEST_HTTP_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch failed ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_1000
     * @tc.name   : testNetworkMgrHttpHttpRequestOff1000
     * @tc.desc   : Unsubscribe from HTTP network request data sending progress event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff1000', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff1000';
      console.info(`${caseName}---Start`);

      class SendData {
        sendSize: number = 2000;
        totalSize: number = 2000;
      }

      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let count: number = 1;
            const callback: (data: SendData) => void = (data: SendData) => {
              count = count + 1;
              console.info(`${caseName} dataSendProgress: ${JSON.stringify(data)}`);
            }
            httpRequest.on("dataSendProgress", callback);
            httpRequest.off("dataSendProgress", callback);
            httpRequest.request(XTS_TEST_HTTP_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch failed ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_1100
     * @tc.name   : testNetworkMgrHttpHttpRequestOff1100
     * @tc.desc   : Unsubscribe from HTTP Response Header event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff1100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff1100';
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
            let count: number = 1;
            const callback: (data: BusinessError) => void = (data: BusinessError) => {
              count = count + 1;
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
            }
            httpRequest.on("headerReceive", callback);
            httpRequest.off("headerReceive", callback);
            httpRequest.request(XTS_TEST_HTTP_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch failed ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_1200
     * @tc.name   : testNetworkMgrHttpHttpRequestOff1200
     * @tc.desc   : Unsubscribe from HTTP Response Header event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff1200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff1200';
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
            let count: number = 1;
            httpRequest.on("headerReceive", (data: BusinessError) => {
              count = count + 1;
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
            });
            httpRequest.off("headerReceive");
            httpRequest.request(XTS_TEST_HTTP_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch failed ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_1300
     * @tc.name   : testNetworkMgrHttpHttpRequestOff1300
     * @tc.desc   : Unsubscribe from HTTP Response Header event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff1300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff1300';
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
            let count: number = 1;
            const callback: (data: BusinessError) => void = (data: BusinessError) => {
              count = count + 1;
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
            }
            httpRequest.off("headerReceive", callback);
            httpRequest.request(XTS_TEST_HTTP_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch failed ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_1400
     * @tc.name   : testNetworkMgrHttpHttpRequestOff1400
     * @tc.desc   : Unsubscribe from HTTP Response Header event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff1400', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff1400';
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
            let count: number = 1;
            const callback: (header: Object) => void = (header: Object) => {
              count = count + 1;
              console.info(`${caseName} header: ${JSON.stringify(header)}`);
            }
            httpRequest.off("headersReceive", callback);
            httpRequest.request(XTS_TEST_HTTP_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch failed ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_1500
     * @tc.name   : testNetworkMgrHttpHttpRequestOff1500
     * @tc.desc   : Unsubscribe from HTTP streaming response data receiving events.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff1500', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff1500';
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
            let count: number = 1;
            const callback: (data: ArrayBuffer) => void = (data: ArrayBuffer) => {
              count = count + 1;
              console.info(`${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
            }
            httpRequest.off("dataReceive", callback);
            httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch failed ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_1600
     * @tc.name   : testNetworkMgrHttpHttpRequestOff1600
     * @tc.desc   : Unsubscribe from the HTTP streaming response data reception completion event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff1600', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff1600';
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
            let count: number = 1;
            const callback: () => void = () => {
              count = count + 1;
              console.info(`${caseName} Receive dataEnd`);
            }
            httpRequest.off("dataEnd", callback);
            httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch failed ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_1700
     * @tc.name   : testNetworkMgrHttpHttpRequestOff1700
     * @tc.desc   : Unsubscribe from HTTP streaming response data receiving progress events.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff1700', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff1700';
      console.info(`${caseName}---Start`);

      class RequestData {
        receiveSize: number = 2000;
        totalSize: number = 2000;
      }

      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          console.info(`${caseName} error：${error}`);
          console.info(`${caseName} data:${data}`);
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let count: number = 1;
            const callback: (data: RequestData) => void = (data: RequestData) => {
              count = count + 1;
              console.info(`${caseName} dataReceiveProgress:${JSON.stringify(data)}`);
            }
            httpRequest.off("dataReceiveProgress", callback);
            httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch failed ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_1800
     * @tc.name   : testNetworkMgrHttpHttpRequestOff1800
     * @tc.desc   : Unsubscribe from HTTP network request data sending progress event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff1800', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff1800';
      console.info(`${caseName}---Start`);

      class SendData {
        sendSize: number = 2000;
        totalSize: number = 2000;
      }

      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let count: number = 1;
            const callback: (data: SendData) => void = (data: SendData) => {
              count = count + 1;
              console.info(`${caseName} dataSendProgress: ${JSON.stringify(data)}`);
            }
            httpRequest.off("dataSendProgress", callback);
            httpRequest.request(XTS_TEST_HTTP_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch failed ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_1900
     * @tc.name   : testNetworkMgrHttpHttpRequestOff1900
     * @tc.desc   : Unsubscribe from HTTP Response Header event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff1900', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff1900';
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
            let count: number = 1;
            const callback: (header: Object) => void = (header: Object) => {
              count = count + 1;
              console.info(`${caseName} header: ${JSON.stringify(header)}`);
            }
            httpRequest.off("headersReceive", callback);
            httpRequest.on("headersReceive", callback);
            httpRequest.request(XTS_TEST_HTTP_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 2);
                httpRequest.destroy();
                httpRequest.off("headersReceive");
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch failed ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_2000
     * @tc.name   : testNetworkMgrHttpHttpRequestOff2000
     * @tc.desc   : Unsubscribe from HTTP Response Header event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff2000', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff2000';
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
            let count: number = 1;
            httpRequest.off("headersReceive");
            httpRequest.on("headersReceive", (header: Object) => {
              count = count + 1;
              console.info(`${caseName} header: ${JSON.stringify(header)}`);
            });
            httpRequest.request(XTS_TEST_HTTP_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 2);
                httpRequest.destroy();
                httpRequest.off("headersReceive");
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch failed ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_2100
     * @tc.name   : testNetworkMgrHttpHttpRequestOff2100
     * @tc.desc   : Unsubscribe from HTTP streaming response data receiving events.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff2100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff2100';
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
            let count: number = 1;
            httpRequest.off("dataReceive");
            httpRequest.on("dataReceive", (data: ArrayBuffer) => {
              count = count + 1;
              console.info(`${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
            });
            httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 2);
                httpRequest.destroy();
                httpRequest.off("dataReceive");
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch failed ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_2200
     * @tc.name   : testNetworkMgrHttpHttpRequestOff2200
     * @tc.desc   : Unsubscribe from HTTP streaming response data receiving events.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff2200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff2200';
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
            let count: number = 1;
            const callback: (data: ArrayBuffer) => void = (data: ArrayBuffer) => {
              count = count + 1;
              console.info(`${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
            }
            httpRequest.off("dataReceive", callback);
            httpRequest.on("dataReceive", callback);
            httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 2);
                httpRequest.destroy();
                httpRequest.off("dataReceive");
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch failed ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_2900
     * @tc.name   : testNetworkMgrHttpHttpRequestOff2900
     * @tc.desc   : Unsubscribe from HTTP Response Header event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff2900', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff2900';
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
            let count: number = 1;
            const callback: (data: BusinessError) => void = (data: BusinessError) => {
              count = count + 1;
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
            }
            httpRequest.off("headerReceive", callback);
            httpRequest.on("headerReceive", callback);
            httpRequest.request(XTS_TEST_HTTP_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 2);
                httpRequest.destroy();
                httpRequest.off("headerReceive");
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_3000
     * @tc.name   : testNetworkMgrHttpHttpRequestOff3000
     * @tc.desc   : Unsubscribe from HTTP Response Header event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff3000', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff3000';
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
            let count: number = 1;
            httpRequest.off("headerReceive");
            httpRequest.on("headerReceive", (data: BusinessError) => {
              count = count + 1;
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
            });
            httpRequest.request(XTS_TEST_HTTP_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 2);
                httpRequest.destroy();
                httpRequest.off("headerReceive");
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_3100
     * @tc.name   : testNetworkMgrHttpHttpRequestOff3100
     * @tc.desc   : Unsubscribe from HTTP Response Header event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff3100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff3100';
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
            let count: number = 1;
            httpRequest.on("headerReceive", (data: BusinessError) => {
              count = count + 1;
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
            });
            httpRequest.on("headersReceive", (header: Object) => {
              count = count + 1;
              console.info(`${caseName} header: ${JSON.stringify(header)}`);
            });
            httpRequest.off("headersReceive");
            httpRequest.request(XTS_TEST_HTTP_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 2);
                httpRequest.destroy();
                httpRequest.off("headerReceive");
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_3200
     * @tc.name   : testNetworkMgrHttpHttpRequestOff3200
     * @tc.desc   : Unsubscribe from HTTP Response Header event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff3200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff3200';
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
            let count: number = 1;
            httpRequest.on("headerReceive", (data: BusinessError) => {
              count = count + 1;
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
            });
            httpRequest.off("headersReceive");
            httpRequest.request(XTS_TEST_HTTP_URL, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} request err: ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              } else {
                console.info(`${caseName} count: ${count}`);
                ExpectTrue(count == 2);
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_3300
     * @tc.name   : testNetworkMgrHttpHttpRequestOff3300
     * @tc.desc   : Unsubscribe from HTTP Response Header event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff3300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff3300';
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
            let count: number = 1;
            httpRequest.on("headersReceive", (header: Object) => {
              count = count + 1;
              console.info(`${caseName} header: ${JSON.stringify(header)}`);
            });
            httpRequest.off("headersReceive");
            httpRequest.request(XTS_TEST_HTTP_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 1);
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_3400
     * @tc.name   : testNetworkMgrHttpHttpRequestOff3400
     * @tc.desc   : Unsubscribe from HTTP streaming response data receiving events.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff3400', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff3400';
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
            let count: number = 1;
            const callback: (header: Object) => void = (header: Object) => {
              count = count + 1;
              console.info(`${caseName} header: ${JSON.stringify(header)}`);
            }
            httpRequest.on("headersReceive", callback);
            httpRequest.off("headersReceive", callback);
            httpRequest.request(XTS_TEST_HTTP_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 1);
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_3500
     * @tc.name   : testNetworkMgrHttpHttpRequestOff3500
     * @tc.desc   : Unsubscribe from the HTTP streaming response data reception completion event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff3500', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff3500';
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
            let count: number = 1;
            httpRequest.on("dataEnd", () => {
              count = count + 1;
              console.info(`${caseName} Receive dataEnd`);
            });
            httpRequest.off("dataEnd");
            httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 1);
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_3600
     * @tc.name   : testNetworkMgrHttpHttpRequestOff3600
     * @tc.desc   : Unsubscribe from the HTTP streaming response data reception completion event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff3600', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff3600';
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
            let count: number = 1;
            const callback: () => void = () => {
              count = count + 1;
              console.info(`${caseName} Receive dataEnd`);
            }
            httpRequest.on("dataEnd", callback);
            httpRequest.off("dataEnd", callback);
            httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 1);
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_3700
     * @tc.name   : testNetworkMgrHttpHttpRequestOff3700
     * @tc.desc   : Unsubscribe from HTTP streaming response data receiving progress events.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff3700', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff3700';
      console.info(`${caseName}---Start`);

      class RequestData {
        receiveSize: number = 2000;
        totalSize: number = 2000;
      }

      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let count: number = 1;
            httpRequest.on("dataReceiveProgress", (data: RequestData) => {
              count = count + 1;
              console.info(`${caseName} dataReceiveProgress: ${JSON.stringify(data)}`);
            });
            httpRequest.off("dataReceiveProgress");
            httpRequest.request(XTS_TEST_STREAM_HTTPS_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 1);
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_3800
     * @tc.name   : testNetworkMgrHttpHttpRequestOff3800
     * @tc.desc   : Unsubscribe from HTTP streaming response data receiving progress events.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff3800', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff3800';
      console.info(`${caseName}---Start`);

      class RequestData {
        receiveSize: number = 2000;
        totalSize: number = 2000;
      }

      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let count: number = 1;
            const callback: (data: RequestData) => void = (data: RequestData) => {
              count = count + 1;
              console.info(`${caseName} dataReceiveProgress:${JSON.stringify(data)}`);
            }
            httpRequest.on("dataReceiveProgress", callback);
            httpRequest.off("dataReceiveProgress", callback);
            httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 1);
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_3900
     * @tc.name   : testNetworkMgrHttpHttpRequestOff3900
     * @tc.desc   : Unsubscribe from HTTP network request data sending progress event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff3900', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff3900';
      console.info(`${caseName}---Start`);

      class SendData {
        sendSize: number = 2000;
        totalSize: number = 2000;
      }

      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let count: number = 1;
            httpRequest.on("dataSendProgress", (data: SendData) => {
              count = count + 1;
              console.info(`${caseName} dataSendProgress: ${JSON.stringify(data)}`);
            });
            httpRequest.off("dataSendProgress");
            httpRequest.request(XTS_TEST_HTTP_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 1);
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_4000
     * @tc.name   : testNetworkMgrHttpHttpRequestOff4000
     * @tc.desc   : Unsubscribe from HTTP network request data sending progress event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff4000', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff4000';
      console.info(`${caseName}---Start`);

      class SendData {
        sendSize: number = 2000;
        totalSize: number = 2000;
      }

      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let count: number = 1;
            const callback: (data: SendData) => void = (data: SendData) => {
              count = count + 1;
              console.info(`${caseName} dataSendProgress: ${JSON.stringify(data)}`);
            }
            httpRequest.on("dataSendProgress", callback);
            httpRequest.off("dataSendProgress", callback);
            httpRequest.request(XTS_TEST_HTTP_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 1);
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_4100
     * @tc.name   : testNetworkMgrHttpHttpRequestOff4100
     * @tc.desc   : Unsubscribe from HTTP Response Header event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff4100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff4100';
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
            let count: number = 1;
            const callback: (data: BusinessError) => void = (data: BusinessError) => {
              count = count + 1;
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
            }
            httpRequest.on("headerReceive", callback);
            httpRequest.off("headerReceive", callback);
            httpRequest.request(XTS_TEST_HTTP_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 1);
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_4200
     * @tc.name   : testNetworkMgrHttpHttpRequestOff4200
     * @tc.desc   : Unsubscribe from HTTP Response Header event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff4200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff4200';
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
            let count: number = 1;
            httpRequest.on("headerReceive", (data: BusinessError) => {
              count = count + 1;
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
            });
            httpRequest.off("headerReceive");
            httpRequest.request(XTS_TEST_HTTP_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 1);
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_4300
     * @tc.name   : testNetworkMgrHttpHttpRequestOff4300
     * @tc.desc   : Unsubscribe from HTTP Response Header event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff4300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff4300';
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
            let count: number = 1;
            const callback: (data: BusinessError) => void = (data: BusinessError) => {
              count = count + 1;
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
            }
            httpRequest.off("headerReceive", callback);
            httpRequest.request(XTS_TEST_HTTP_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 1);
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_4400
     * @tc.name   : testNetworkMgrHttpHttpRequestOff4400
     * @tc.desc   : Unsubscribe from HTTP Response Header event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff4400', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff4400';
      ;
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
            let count: number = 1;
            const callback: (header: Object) => void = (header: Object) => {
              count = count + 1;
              console.info(`${caseName} header: ${JSON.stringify(header)}`);
            }
            httpRequest.off("headersReceive", callback);
            httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 1);
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_4500
     * @tc.name   : testNetworkMgrHttpHttpRequestOff4500
     * @tc.desc   : Unsubscribe from HTTP streaming response data receiving events.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff4500', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff4500';
      ;
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
            let count: number = 1;
            const callback: (data: ArrayBuffer) => void = (data: ArrayBuffer) => {
              count = count + 1;
              console.info(`${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
            }
            httpRequest.off("dataReceive", callback);
            httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 1);
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_4600
     * @tc.name   : testNetworkMgrHttpHttpRequestOff4600
     * @tc.desc   : Unsubscribe from the HTTP streaming response data reception completion event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff4600', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff4600';
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
            let count: number = 1;
            const callback: () => void = () => {
              count = count + 1;
              console.info(`${caseName} Receive dataEnd`);
            }
            httpRequest.off("dataEnd", callback);
            httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 1);
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_4700
     * @tc.name   : testNetworkMgrHttpHttpRequestOff4700
     * @tc.desc   : Unsubscribe from HTTP streaming response data receiving progress events.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff4700', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff4700';
      ;
      console.info(`${caseName}---Start`);

      class RequestData {
        receiveSize: number = 2000;
        totalSize: number = 2000;
      }

      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let count: number = 1;
            const callback: (data: RequestData) => void = (data: RequestData) => {
              count = count + 1;
              console.info(`${caseName} dataReceiveProgress:${JSON.stringify(data)}`);
            }
            httpRequest.off("dataReceiveProgress", callback);
            httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 1);
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_4800
     * @tc.name   : testNetworkMgrHttpHttpRequestOff4800
     * @tc.desc   : Unsubscribe from HTTP network request data sending progress event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff4800', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff4800';
      console.info(`${caseName}---Start`);

      class SendData {
        sendSize: number = 2000;
        totalSize: number = 2000;
      }

      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (data.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let count: number = 1;
            const callback: (data: SendData) => void = (data: SendData) => {
              count = count + 1;
              console.info(`${caseName} dataSendProgress: ${JSON.stringify(data)}`);
            }
            httpRequest.off("dataSendProgress", callback);
            httpRequest.request(XTS_TEST_HTTP_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 1);
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_4900
     * @tc.name   : testNetworkMgrHttpHttpRequestOff4900
     * @tc.desc   : Unsubscribe from HTTP Response Header event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff4900', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff4900';
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
            let count: number = 1;
            const callback: (header: Object) => void = (header: Object) => {
              count = count + 1;
              console.info(`${caseName} header: ${JSON.stringify(header)}`);
            }
            httpRequest.off("headersReceive", callback);
            httpRequest.on("headersReceive", callback);
            httpRequest.request(XTS_TEST_HTTP_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 2);
              httpRequest.destroy();
              httpRequest.off("headersReceive", callback);
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_5000
     * @tc.name   : testNetworkMgrHttpHttpRequestOff5000
     * @tc.desc   : Unsubscribe from HTTP Response Header event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff5000', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff5000';
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
            let count: number = 1;
            httpRequest.off("headersReceive");
            httpRequest.on("headersReceive", (header: Object) => {
              count = count + 1;
              console.info(`${caseName} header: ${JSON.stringify(header)}`);
            });
            httpRequest.request(XTS_TEST_HTTP_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 2);
              httpRequest.destroy();
              httpRequest.off("headersReceive");
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_5100
     * @tc.name   : testNetworkMgrHttpHttpRequestOff5100
     * @tc.desc   : Unsubscribe from HTTP streaming response data receiving events.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff5100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff5100';
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
            let count: number = 1;
            httpRequest.off("dataReceive");
            httpRequest.on("dataReceive", (data: ArrayBuffer) => {
              count = count + 1;
              console.info(`${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
            });
            httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 2);
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_5200
     * @tc.name   : testNetworkMgrHttpHttpRequestOff5200
     * @tc.desc   : Unsubscribe from HTTP streaming response data receiving events.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff5200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff5200';
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
            let count: number = 1;
            const callback: (data: ArrayBuffer) => void = (data: ArrayBuffer) => {
              count = count + 1;
              console.info(`${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
            }
            httpRequest.off("dataReceive", callback);
            httpRequest.on("dataReceive", callback);
            httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 2);
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
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_5900
     * @tc.name   : testNetworkMgrHttpHttpRequestOff5900
     * @tc.desc   : Unsubscribe from HTTP Response Header event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff5900', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff5900';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          console.info(`${caseName} error：${error}`);
          console.info(`${caseName} data:${data}`);
          if (data.netId === 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let count: number = 1;
            const callback: (data: BusinessError) => void = (data: BusinessError) => {
              count = count + 1;
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
            }
            httpRequest.off("headerReceive", callback);
            httpRequest.on("headerReceive", callback);
            httpRequest.request(XTS_TEST_HTTP_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 2);
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
        console.info(`${caseName} trycatch err： ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_6000
     * @tc.name   : testNetworkMgrHttpHttpRequestOff6000
     * @tc.desc   : Unsubscribe from HTTP Response Header event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff6000', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff6000';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          console.info(`${caseName} error：${error}`);
          console.info(`${caseName} data:${data}`);
          if (data.netId === 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let count: number = 1;
            httpRequest.off("headerReceive");
            httpRequest.on("headerReceive", (data: BusinessError) => {
              count = count + 1;
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
            });
            httpRequest.request(XTS_TEST_HTTP_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 2);
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
        console.info(`${caseName} trycatch err： ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_6100
     * @tc.name   : testNetworkMgrHttpHttpRequestOff6100
     * @tc.desc   : Unsubscribe from HTTP Response Header event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff6100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff6100';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          console.info(`${caseName} error：${error}`);
          console.info(`${caseName} data:${data}`);
          if (data.netId === 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let count: number = 1;
            httpRequest.on("headerReceive", (data: BusinessError) => {
              count = count + 1;
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
            });
            httpRequest.on("headersReceive", (header: Object) => {
              count = count + 1;
              console.info(`${caseName} header: ${JSON.stringify(header)}`);
            });
            httpRequest.off("headersReceive");
            httpRequest.request(XTS_TEST_HTTP_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 2);
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
        console.info(`${caseName} trycatch err： ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_6200
     * @tc.name   : testNetworkMgrHttpHttpRequestOff6200
     * @tc.desc   : Unsubscribe from HTTP Response Header event.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff6200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff6200';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          console.info(`${caseName} error：${error}`);
          console.info(`${caseName} data:${data}`);
          if (data.netId === 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let count: number = 1;
            httpRequest.on("headerReceive", (data: BusinessError) => {
              count = count + 1;
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
            });
            httpRequest.off("headersReceive");
            httpRequest.request(XTS_TEST_HTTP_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 2);
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
        console.info(`${caseName} trycatch err： ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_6300
     * @tc.name   : testNetworkMgrHttpHttpRequestOff6300
     * @tc.desc   : Unsubscribe from HTTP streaming response data receiving events.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff6300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff6300';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          console.info(`${caseName} error：${error}`);
          console.info(`${caseName} data:${data}`);
          if (data.netId === 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let count: number = 1;
            httpRequest.on("dataReceive", (data: ArrayBuffer) => {
              count = count + 1;
              console.info(`${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
            });
            httpRequest.off("dataReceive");
            httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 1);
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
        console.info(`${caseName} trycatch err： ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_6400
     * @tc.name   : testNetworkMgrHttpHttpRequestOff6400
     * @tc.desc   : Unsubscribe from HTTP streaming response data receiving events.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpHttpRequestOff6400', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpHttpRequestOff6400';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          console.info(`${caseName} error：${error}`);
          console.info(`${caseName} data:${data}`);
          if (data.netId === 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let count: number = 1;
            const callback: (data: ArrayBuffer) => void = (data: ArrayBuffer) => {
              count = count + 1;
              console.info(`${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
            }
            httpRequest.on("dataReceive", callback);
            httpRequest.off("dataReceive", callback);
            httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL).then(() => {
              console.info(`${caseName} count---${count}`);
              ExpectTrue(count == 1);
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
        console.info(`${caseName} trycatch err： ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End`);
    });
  });
}

