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

import { describe, it, expect, beforeEach, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import webSocket from '@ohos.net.webSocket';
import getWebsite from './utils/WsWebsite';
import { JSON } from '@kit.ArkTS';
import { expectEqual } from './utils';

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

let ws: webSocket.WebSocket;
let availableWebSocketAddress: string ;

function sleep (time:number):Promise<string>{
  return new Promise<string>((resolve)=>{
    setTimeout(()=>{
      resolve('ok')},time)
  });
}

export default function WebSocketOnOffInfoProtocolTest() {
  describe('WebSocketOnOffInfoProtocolTest', () => {

    beforeAll(async (done: Function)=>{
      console.log("beforeAll start");
      availableWebSocketAddress = await getWebsite();
      console.log("current url is "+ availableWebSocketAddress)
      done()
      console.log("beforeAll end ")
    })


    beforeEach(async (done: Function) => {
      ws = webSocket.createWebSocket();
      await sleep(1000);
      done();
    })

    /**
     * @tc.name   testNetSocketOnOffInfoTlsProtocol0100
     * @tc.number SUB_Network_WebSocket_OnOffInfoTlsProtocol_0100
     * @tc.desc   WebSocket supports the on.openInfo event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetSocketOnOffInfoTlsProtocol0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetSocketOnOffInfoTlsProtocol0100';
      console.info(`${caseName} test start`);
      let options: webSocket.WebSocketRequestOptions = {
        header: {
          'Content-Type': 'application/json'
        },
        protocol: 'Sec-WebSocket-Protocol'
      };
      try {
        class OutValue {
          status: number = 0
          message: string = ''
          protocol: string = ''

        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError+ ${JSON.stringify(err)}`)
          done();
        })
        ws.off('openInfo');
        ws.on('openInfo', async (err: BusinessError, value: webSocket.WebSocketOpenInfo) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)}  and value is ${JSON.stringify(value)}`)
          const status: number = (value as OutValue).status
          console.info(`${caseName} status is ${JSON.stringify(status)}`)
          expectEqual(status, 101)
          const message: string = (value as OutValue).message
          console.info(`${caseName} message is ${JSON.stringify(message)}`)
          expectEqual(message, 'Switching Protocols')
          const protocol: string | undefined = (value as OutValue).protocol
          console.info(`${caseName} protocol is ${JSON.stringify(protocol)}`)
          expectTrue(protocol == undefined);
          await ws.close();
          done();
        })
        ws.connect('wss://websocket-echo.moyufangge.com', options).then((value: boolean) => {
          console.info(`${caseName} options success is ${options.protocol}`);
          expectTrue(options.protocol == 'Sec-WebSocket-Protocol')
          expectTrue(value);
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
     * @tc.name   testNetSocketOnOffInfoTlsProtocol0200
     * @tc.number SUB_Network_WebSocket_OnOffInfoTlsProtocol_0200
     * @tc.desc   WebSocket supports the off.openInfo event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetSocketOnOffInfoTlsProtocol0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetSocketOnOffInfoTlsProtocol0200';
      console.info(`${caseName} test start`);
      let callback1 = (err: BusinessError, value: webSocket.WebSocketOpenInfo) => {
        if (value?.protocol != undefined) {
          console.info(`on openInfo exist protocol: status: ${value.status}, message: ${value.message}, protocol: ${value.protocol}`);
        } else {
          console.info(`on openInfo , status: ${value.status}, message: ${value.message}, protocol: ${value.protocol}`);
        }
        expectFail();
      }
      try {
        let options: webSocket.WebSocketRequestOptions = {
          header: {
            'Content-Type': 'application/json'
          },
          protocol: 'Sec-WebSocket-Protocol'
        };
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError+ ${JSON.stringify(err)}`)
          done();
        })
        ws.on('openInfo',callback1);
        ws.off('openInfo',callback1);

        ws.connect('wss://websocket-echo.moyufangge.com', options).then(async (value: boolean) => {
          console.info(`${caseName} options success is ${options.protocol}`);
          expectTrue(options.protocol == 'Sec-WebSocket-Protocol')
          expectTrue(value);
          console.info(`${caseName} test end`);
          await ws.close();
          done();
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
  });
}
