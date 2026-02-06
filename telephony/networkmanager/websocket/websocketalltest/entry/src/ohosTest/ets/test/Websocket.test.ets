/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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

import { describe, it, expect, beforeEach, beforeAll, Level, Size, TestType } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import webSocket from '@ohos.net.webSocket';
import getWebsite from './utils/WsWebsite';
let activeUrl: string;

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

function expectTrue(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

function expectFail(info: string = ''): void {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

function expectEqual(exp: string | number | boolean, assert: string | number | boolean, info: string = ''): void {
  try {
    expect(exp).assertEqual(assert);
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

let options: webSocket.WebSocketRequestOptions = {
  header: {
    'Content-Type': 'application/json'
  }
};
let ws: webSocket.WebSocket;
let availableWebSocketAddress: string ;

export default function WebSocketTest() {
  describe('webSocketTest', () => {
    beforeAll(async (done: Function)=>{
      console.log("beforeAll start")
      availableWebSocketAddress = await getWebsite();
      activeUrl = availableWebSocketAddress;
      console.log("current url is "+ availableWebSocketAddress)
      done()
      console.log("beforeAll end")
    })

  
    beforeEach((done: Function) => {
      ws = webSocket.createWebSocket();
      done();
    })


    /* *
    * @tc.number: SUB_Network_WebSocket_ConnectCallback_0100
    * @tc.name  : testWebSocketConnectCallback0100
    * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,options is options,callback)
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testWebSocketConnectCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testWebSocketConnectCallback0100';
      console.info(`${caseName} test start`);
      try {
        ws.connect(availableWebSocketAddress, options, async (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            await ws.close();
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectTrue(value);
            await ws.close();
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        console.info(`${caseName} test end`);
      }
    });

    /* *
    * @tc.number: SUB_Network_WebSocket_ConnectCallback_0200
    * @tc.name  : testWebSocketConnectCallback0200
    * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,options is null,callback)
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testWebSocketConnectCallback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testWebSocketConnectCallback0200';
      console.info(`${caseName} test start`);
      try {
        ws.connect(availableWebSocketAddress, null, async (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectEqual(err.code, 401)
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectFail('test connect success')
            await ws.close();
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        expectFail(`${caseName} catch error ${JSON.stringify(err)}`)
        done()
        console.info(`${caseName} test end`);
      }
    });

    /* *
    * @tc.number: SUB_Network_WebSocket_ConnectCallback_0300
    * @tc.name  : testWebSocketConnectCallback0300
    * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,options is {},callback)
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testWebSocketConnectCallback0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testWebSocketConnectCallback0300';
      console.info(`${caseName} test start`);
      try {
        ws.connect(availableWebSocketAddress, {}, async (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            await ws.close();
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectTrue(value);
            await ws.close();
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        console.info(`${caseName} test end`);
      }
    });

    /* *
    * @tc.number: SUB_Network_WebSocket_ConnectCallback_0400
    * @tc.name  : testWebSocketConnectCallback0400
    * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,The protocol in the option is '',callback)
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testWebSocketConnectCallback0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testWebSocketConnectCallback0400';
      console.info(`${caseName} test start`);
      try {
        ws.connect(availableWebSocketAddress, {
          protocol: ''
        }, async (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            await ws.close();
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectTrue(value);
            await ws.close();
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        console.info(`${caseName} test end`);
      }
    });

    /* *
    * @tc.number: SUB_Network_WebSocket_ConnectCallback_0500
    * @tc.name  : testWebSocketConnectCallback0500
    * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,The protocol in the option is '123',callback)
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testWebSocketConnectCallback0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testWebSocketConnectCallback0500';
      console.info(`${caseName} test start`);
      try {
        ws.connect(availableWebSocketAddress, {
          protocol: '123'
        }, async (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            await ws.close();
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectTrue(value);
            await ws.close();
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        console.info(`${caseName} test end`);
      }
    });

    /* *
    * @tc.number: SUB_Network_WebSocket_ConnectCallback_0700
    * @tc.name  : testWebSocketConnectCallback0700
    * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,The protocol in the option is undefined,callback)
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testWebSocketConnectCallback0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testWebSocketConnectCallback0700';
      console.info(`${caseName} test start`);
      try {
        ws.connect(availableWebSocketAddress, {
          protocol: undefined
        }, async (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectEqual(err.code, 401);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectFail('test connect success');
            await ws.close();
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        expectFail(`${caseName} catch error ${JSON.stringify(err)}`)
        done()
        console.info(`${caseName} test end`);
      }
    });

    /* *
    * @tc.number: SUB_Network_WebSocket_ConnectCallback_0800
    * @tc.name  : testWebSocketConnectCallback0800
    * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,The proxy in the option is proxy,callback)
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testWebSocketConnectCallback0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let proxy: webSocket.ProxyConfiguration = 'no-proxy'
      let caseName: string = 'testWebSocketConnectCallback0800';
      console.info(`${caseName} test start`);
      try {
        ws.connect(availableWebSocketAddress, {
          proxy
        }, async (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            await ws.close();
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectTrue(value);
            await ws.close();
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        console.info(`${caseName} test end`);
      }
    });

    /* *
    * @tc.number: SUB_Network_WebSocket_ConnectCallback_0900
    * @tc.name  : testWebSocketConnectCallback0900
    * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,The proxy in the option is proxy,callback)
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testWebSocketConnectCallback0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let proxy: webSocket.ProxyConfiguration = 'system'
      let caseName: string = 'testWebSocketConnectCallback0900';
      console.info(`${caseName} test start`);
      try {
        ws.connect(availableWebSocketAddress, {
          proxy
        }, async (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            await ws.close();
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectTrue(value);
            await ws.close();
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        console.info(`${caseName} test end`);
      }
    });


    /* *
    * @tc.number: SUB_Network_WebSocket_ConnectPromise_0100
    * @tc.name  : testWebSocketConnectPromise0100
    * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,options is options,promise)
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testWebSocketConnectPromise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testWebSocketConnectPromise0100';
      console.info(`${caseName} test start`);
      try {
        ws.connect(availableWebSocketAddress, options).then(async (value: boolean) => {
          console.info(`${caseName} test connect success and value is ${value}`);
          expectTrue(value);
          await ws.close();
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          expectFail(`${caseName} test connect fail`);
          done();
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        console.info(`${caseName} test end`);
      }
    });

    /* *
    * @tc.number: SUB_Network_WebSocket_ConnectPromise_0200
    * @tc.name  : testWebSocketConnectPromise0200
    * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,options is {},promise)
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testWebSocketConnectPromise0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testWebSocketConnectPromise0200';
      console.info(`${caseName} test start`);
      try {
        ws.connect(availableWebSocketAddress, {}).then(async (value: boolean) => {
          console.info(`${caseName} test connect success and value is ${value}`);
          expectTrue(value);
          await ws.close();
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          expectFail(`${caseName} test connect fail`);
          done();
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        console.info(`${caseName} test end`);
      }
    });

    /* *
    * @tc.number: SUB_Network_WebSocket_ConnectPromise_0300
    * @tc.name  : testWebSocketConnectPromise0300
    * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,options Parameter rejection,promise)
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testWebSocketConnectPromise0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testWebSocketConnectPromise0300';
      console.info(`${caseName} test start`);
      try {
        ws.connect(availableWebSocketAddress).then(async (value: boolean) => {
          console.info(`${caseName} test connect success and value is ${value}`);
          expectTrue(value);
          await ws.close();
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          expectFail(`${caseName} test connect fail`);
          done();
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        console.info(`${caseName} test end`);
      }
    });

    /* *
    * @tc.number: SUB_Network_WebSocket_ConnectPromise_0400
    * @tc.name  : testWebSocketConnectPromise0400
    * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,The protocol in the option is '',promise)
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testWebSocketConnectPromise0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testWebSocketConnectPromise0400';
      console.info(`${caseName} test start`);
      try {
        ws.connect(availableWebSocketAddress, {
          protocol: ''
        }).then(async (value: boolean) => {
          console.info(`${caseName} test connect success and value is ${value}`);
          expectTrue(value);
          await ws.close();
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          expectFail(`${caseName} test connect fail`);
          done();
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        console.info(`${caseName} test end`);
      }
    });

    /* *
    * @tc.number: SUB_Network_WebSocket_ConnectPromise_0500
    * @tc.name  : testWebSocketConnectPromise0500
    * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,The protocol in the option is '123',promise)
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testWebSocketConnectPromise0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testWebSocketConnectPromise0500';
      console.info(`${caseName} test start`);
      try {
        ws.connect(availableWebSocketAddress, {
          protocol: '123'
        }).then(async (value: boolean) => {
          console.info(`${caseName} test connect success and value is ${value}`);
          expectTrue(value);
          await ws.close();
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          expectFail(`${caseName} test connect fail`);
          done();
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        console.info(`${caseName} test end`);
      }
    });

    /* *
    * @tc.number: SUB_Network_WebSocket_ConnectPromise_0600
    * @tc.name  : testWebSocketConnectPromise0600
    * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,The protocol in the option is undefined,promise)
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testWebSocketConnectPromise0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testWebSocketConnectPromise0600';
      console.info(`${caseName} test start`);
      try {
        ws.connect(availableWebSocketAddress, {
          protocol: undefined
        }).then(async (value: boolean) => {
          console.info(`${caseName} test connect success and value is ${value}`);
          expectFail(`${caseName} test connect success`);
          await ws.close();
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          expectEqual(err.code, 401);
          done();
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        console.info(`${caseName} test end`);
      }
    });

    /* *
    * @tc.number: SUB_Network_WebSocket_ConnectPromise_0700
    * @tc.name  : testWebSocketConnectPromise0700
    * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,The proxy in the option is proxy,promise)
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testWebSocketConnectPromise0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let proxy: webSocket.ProxyConfiguration = 'system'
      let caseName: string = 'testWebSocketConnectPromise0700';
      console.info(`${caseName} test start`);
      try {
        ws.connect(availableWebSocketAddress, {
          proxy
        }).then(async (value: boolean) => {
          console.info(`${caseName} test connect success and value is ${value}`);
          expectTrue(value);
          await ws.close();
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          expectFail('test connect fail');
          done();
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        console.info(`${caseName} test end`);
      }
    });

    /* *
    * @tc.number: SUB_Network_WebSocket_ConnectPromise_0800
    * @tc.name  : testWebSocketConnectPromise0800
    * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,The proxy in the option is proxy,promise)
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testWebSocketConnectPromise0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let proxy: webSocket.ProxyConfiguration = 'no-proxy'
      let caseName: string = 'testWebSocketConnectPromise0800';
      console.info(`${caseName} test start`);
      try {
        ws.connect(availableWebSocketAddress, {
          proxy
        }).then(async (value: boolean) => {
          console.info(`${caseName} test connect success and value is ${value}`);
          expectTrue(value);
          await ws.close();
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          expectFail('test connect fail');
          done();
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_Network_WebSocket_OnHeaderReceiveCallback_0100
     * @tc.name  : testWebSocketOnHeaderReceiveCallback0100
     * @tc.desc  : Subscribe to the headerReceive event of WebSocket(on_HeaderReceive)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testWebSocketOnHeaderReceiveCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testWebSocketOnHeaderReceiveCallback0100';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ''
        }

        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError+ ${JSON.stringify(err)}`)
        })
        ws.on('headerReceive', (data) => {
          console.info(`${caseName} on headerReceive"+${JSON.stringify(data)}`)
          expectTrue(data != null)
          done()
        })
        ws.on('open', (err: BusinessError, value: object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)}  and value is ${JSON.stringify(value)}`)
          const status: number = (value as OutValue).status
          expectEqual(status, 101)
        })
        ws.connect(availableWebSocketAddress, options).then(async (value: boolean) => {
          console.info(`${caseName} test connect success and value is ${value}`);
          expectTrue(value);
          await ws.close();
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          expectFail('test connect fail')
          done();
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_Network_WebSocket_OffHeaderReceiveCallback_0100
     * @tc.name  : testWebSocketOffHeaderReceiveCallback0100
     * @tc.desc  : Subscribe to the headerReceive event of WebSocket(off twice)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testWebSocketOffHeaderReceiveCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testWebSocketOffHeaderReceiveCallback0100';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ''
        }

        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError+ ${JSON.stringify(err)}`)
        })
        ws.on('headerReceive', (data) => {
          console.info(`${caseName} on headerReceive"+${JSON.stringify(data)}`)
          expectTrue(data != null)
          done()
        })
        ws.off('headerReceive')
        ws.off('headerReceive')
        ws.on('open', (err: BusinessError, value: object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)}  and value is ${JSON.stringify(value)}`)
          const status: number = (value as OutValue).status
          expectEqual(status, 101)
        })
        ws.connect(availableWebSocketAddress, options).then(async (value: boolean) => {
          console.info(`${caseName} test connect success and value is ${value}`);
          expectTrue(value);
          await ws.close();
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          expectFail('test connect fail')
          done();
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_Network_WebSocket_OffHeaderReceiveCallback_0200
     * @tc.name  : testWebSocketOffHeaderReceiveCallback0200
     * @tc.desc  : Subscribe to the headerReceive event of WebSocket(off-->on)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testWebSocketOffHeaderReceiveCallback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testWebSocketOffHeaderReceiveCallback0200';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ''
        }

        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError+ ${JSON.stringify(err)}`)
        })
        ws.off('headerReceive')
        ws.on('headerReceive', (data) => {
          console.info(`${caseName} on headerReceive"+${JSON.stringify(data)}`)
          expectTrue(data != null)
          done()
        })
        ws.on('open', (err: BusinessError, value: object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)}  and value is ${JSON.stringify(value)}`)
          const status: number = (value as OutValue).status
          expectEqual(status, 101)
        })
        ws.connect(availableWebSocketAddress, options).then(async (value: boolean) => {
          console.info(`${caseName} test connect success and value is ${value}`);
          expectTrue(value);
          await ws.close();
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          expectFail('test connect fail')
          done();
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_Network_WebSocket_OffHeaderReceiveCallback_0300
     * @tc.name  : testWebSocketOffHeaderReceiveCallback0300
     * @tc.desc  : Subscribe to the headerReceive event of WebSocket(on-->off)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testWebSocketOffHeaderReceiveCallback0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testWebSocketOffHeaderReceiveCallback0300';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ''
        }

        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError+ ${JSON.stringify(err)}`)
        })
        ws.on('headerReceive', (data) => {
          console.info(`${caseName} on headerReceive"+${JSON.stringify(data)}`)
          expectTrue(data != null)
          done()
        })
        ws.off('headerReceive')
        ws.on('open', (err: BusinessError, value: object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)}  and value is ${JSON.stringify(value)}`)
          const status: number = (value as OutValue).status
          expectEqual(status, 101)
        })
        ws.connect(availableWebSocketAddress, options).then(async (value: boolean) => {
          console.info(`${caseName} test connect success and value is ${value}`);
          expectTrue(value);
          await ws.close();
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          expectFail('test connect fail')
          done();
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_WebSocket_CloseResult_0100
     * @tc.name   : testNetworkMgrWebSocketCloseResult0100
     * @tc.desc   : Closure result obtained by subscribing to the close event when the WebSocket connection is closed.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrWebSocketCloseResult0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketCloseResult0100';
      console.info(`${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.on('close', (err: BusinessError, value: webSocket.CloseResult) => {
          console.info(`${caseName} onclose err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          ExpectTrue(value.reason != undefined)
          done();
        })
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          ws.close((err: BusinessError,value: boolean) => {
            if (err) {
              console.info(`${caseName} close fail ${JSON.stringify(err)}`);
              ExpectTrue(false)
              done();
            } else {
              console.info(`${caseName} close success and value is ${value}`);
            }
          })
        });
        ws.connect(activeUrl, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catch err is ${JSON.stringify(err)}`);
        ExpectTrue(false)
        done();
        console.info(`${caseName} test end`);
      }
    })

    /*
      * @tc.number: SUB_NetworkMgr_WebSocket_Connect_0100
      * @tc.name  : testNetworkMgrWebSocketConnect0100
      * @tc.desc  : Establish a WebSocket connection based on the URL address and header(connect twice)
      * @tc.size  : MediumTest
      * @tc.type  : Function
      * @tc.level : level 3
      */
    it('testNetworkMgrWebSocketConnect0100',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnect0100';
      console.info(`${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.connect(activeUrl, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect1 fail ${JSON.stringify(err)}`);
            ExpectTrue(false)
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect1 success and value is ${value}`);
            ws.connect(activeUrl, (err: BusinessError, value: boolean) => {
              if (err) {
                console.info(`${caseName} test connect2 fail ${JSON.stringify(err)}`);
                ExpectTrue(err.code == 2302003);
                done();
                console.info(`${caseName} test end`);
              } else {
                console.info(`${caseName} test connect2 success and value is ${value}`);
                ExpectTrue(false)
                done();
                console.info(`${caseName} test end`);
              }
            })
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        ExpectTrue(false)
        done();
        console.info(`${caseName} test end`);
      }
    })

  });
}
