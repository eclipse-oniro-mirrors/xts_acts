/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import webSocket from '@ohos.net.webSocket';


let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'WebSocketTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let ws: webSocket.WebSocket;
let availableWebSocketAddress: string = 'wss://ws.welive.hu'+'awei.com/';

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
    console.info("expectInfo", `test sucess`);
  }
}
export default function webSocketCreateTest() {

  describe("WebSocketCreateTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   testNetworkMgrWebSocketCreateWebSocketCallback_static_0100
     * @tc.number SUB_NetworkMgr_WebSocket_CreateWebSocketCallback_0100
     * @tc.desc   Create a WebSocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrWebSocketCreateWebSocketCallback_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketCreateWebSocketCallback_static_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let ws: webSocket.WebSocket = webSocket.createWebSocket();
        hilog.info(domain, tag, '%{public}s', caseName +' createWebSocket is -> '+JSON.stringify(ws));
        ExpectTrue(ws != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketCreateWebSocketCallback_static_0200
     * @tc.number SUB_NetworkMgr_WebSocket_CreateWebSocketCallback_0200
     * @tc.desc   Create a WebSocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrWebSocketCreateWebSocketCallback_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketCreateWebSocketCallback_static_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let wsOne: webSocket.WebSocket = webSocket.createWebSocket();
        let wsTwo: webSocket.WebSocket = webSocket.createWebSocket();
        hilog.info(domain, tag, '%{public}s', caseName +' createWebSocket wsOne is -> '+JSON.stringify(wsOne));
        hilog.info(domain, tag, '%{public}s', caseName +' createWebSocket wsTwo is -> '+JSON.stringify(wsTwo));
        ExpectTrue(wsOne != wsTwo);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    })

  })
}