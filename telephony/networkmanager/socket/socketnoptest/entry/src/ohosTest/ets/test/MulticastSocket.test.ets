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

import { describe, it , Level, Size, TestType} from '@ohos/hypium';
import socket from '@ohos.net.socket';
import { BusinessError, Callback } from '@ohos.base';
import {
  expectFail,
  expectEqual,
  expectTrue,
  SocketInfo,
  ArrayBufferToString,
  stringToArrayBuffer
} from './utils';

let addr: socket.NetAddress = {
  address: '239.255.0.1',
  port: 0,
  family: 1
};

export default function MulticastSocket() {
  describe('MulticastSocket', () => {

    /**
     * @tc.name   testNetworkMgrSocketNopMulticastSocketGetSocketFd0100
     * @tc.number SUB_NetworkMgr_Socket_Nop_MulticastSocket_GetSocketFd_0100
     * @tc.desc   Get Socket FD without net
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketNopMulticastSocketGetSocketFd0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketNopMulticastSocketGetSocketFd0100';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr).catch((err: BusinessError) => {
          console.info('fail to addMembership' + err.code.toString());
        });
        multicast.getSocketFd().then((data: number) => {
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
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
  });
}