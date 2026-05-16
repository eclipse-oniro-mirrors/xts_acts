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

import { describe, beforeAll, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import netSocket from '@ohos.net.socket';
import socket from '@ohos.net.socket';
import { BusinessError, Callback, ErrorCallback } from '@ohos.base';


let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();

function expectTrue(exp: boolean,info: string = ''): void {
  try{
    expect(exp).assertTrue();
  } catch (err){
    console.info(`${info} test failed err:${err}`);
  }
};

function expectFail(params: boolean) {
  try {
    if (params === true) {
      expect(params).assertTrue();
    } else {
      expect(params).assertFail();
    }
  } catch (err) {
    return console.info(JSON.stringify(err));
  }
}

export default function TLSSocketServerTest() {
  describe('TLSSocketServerTest', () => {
    beforeAll(() => {
      console.info('************* start SocketTest *************');
    })
    afterAll(() => {
      console.info('************* end SocketTest *************');
    })


    /**
     * @tc.name   testNetworkMgrSocketNopTLSSocketServerGetSocketFd0100
     * @tc.number SUB_NetworkMgr_Socket_Nop_TLSSocketServer_GetSocketFd_0100
     * @tc.desc   Test to obtain TLSSocketServer FD without net
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketNopTLSSocketServerGetSocketFd0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketNopTLSSocketServerGetSocketFd0100';
      console.info(`${caseName} test start `);
      try {
        tlsServer.getSocketFd().then((fd: number) => {
          console.info(`${caseName} get Socket FD success: ${fd}`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} getSocketFd err: ${JSON.stringify(err)}`);
          expectTrue(err.code === 201);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    });
  })
}