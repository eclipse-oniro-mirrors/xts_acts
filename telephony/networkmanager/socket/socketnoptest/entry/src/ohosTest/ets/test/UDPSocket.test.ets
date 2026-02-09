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

import { describe, it, Level, Size, TestType } from '@ohos/hypium';
import socket from '@ohos.net.socket';
import { BusinessError, Callback } from '@ohos.base';
import {
  expectFail,
  expectEqual,
  expectTrue,
  expectFalse,
  SocketInfo,
  ArrayBufferToString,
  stringToArrayBuffer
} from './utils';


export default function UDPSocketTest() {
  describe('UDPSocketTest', () => {

    /**
     * @tc.name   testNetworkMgrSocketNopUDPSocketGetSocketFd0100
     * @tc.number SUB_NetworkMgr_Socket_Nop_UDPSocket_GetSocketFd_0100
     * @tc.desc   Get Socket FD without net
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketNopUDPSocketGetSocketFd0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketNopUDPSocketGetSocketFd0100';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        udp.getSocketFd().then((fd: number) => {
          console.info(`${caseName} get Socket FD: ${fd}`);
          udp.close();
          expectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} getSocketFd err: ${JSON.stringify(err)}`);
          expectTrue(err.code === 201);
          udp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });
  });
}
