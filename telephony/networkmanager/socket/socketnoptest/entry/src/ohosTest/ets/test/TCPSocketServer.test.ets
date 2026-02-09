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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium'
import socket from "@ohos.net.socket";
import { BusinessError, Callback } from '@ohos.base';



function expectFail(info: string = ''): void {
  try {
    expect(false).assertTrue();
  } catch (err) {
    console.info(`${info} test failed`);
  }
}


function expectTrue(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    console.info(`${info} test failed`);
  }
}



export default function TCPSocketServerTest() {
  describe('ActsTCPSocketServerTest', () => {

    /**
     * @tc.name   testNetworkMgrSocketNopTCPSocketServerGetSocketFd0100
     * @tc.number SUB_NetworkMgr_Socket_Nop_TCPSocketServer_GetSocketFd_0100
     * @tc.desc   Obtain TCPSocketServer FD without net
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketNopTCPSocketServerGetSocketFd0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketNopTCPSocketServerGetSocketFd0100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');

        tcpServer.getSocketFd().then((data: number) => {
          console.info(`${caseName} success data:${JSON.stringify(data)}`);
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectTrue(err.code === 201);
          console.info(`${caseName}---End`);
          done();
        })
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
  })
}
