/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, afterEach, afterAll, beforeAll } from '@ohos/hypium';
import socket from '@ohos.net.socket';
import { BusinessError } from '@ohos.base';

let localExtraOptions: socket.ExtraOptionsBase = {
  sendBufferSize: 5000,
  receiveBufferSize: 5000,
  reuseAddress: false,
  socketTimeout: 500
}

function expectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    console.info('assertion failure');
  }
}

export default function NetworkManagerSocketTest() {
  describe("NetworkManagerSocketTest", ()=> {

    /**
     * @tc.number: SUB_Telephony_Netstack_UNIX_Socket_Xts_0100
     * @tc.name: Test create constructLocalSocketInstance object
     * @tc.desc: Function Test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Netstack_UNIX_Socket_Xts_0100", 0, async (done:Function)=> {
      let caseName = "SUB_Telephony_Netstack_UNIX_Socket_Xts_0100";
      let client = socket.constructLocalSocketInstance();
      client.getExtraOptions().then((data) => {
        console.info(`${caseName} getExtraOptions success, data: ${JSON.stringify(data)}`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} getExtraOptions fail, data: ${JSON.stringify(err)}`);
        expect(Error != undefined).assertEqual(true);
        done();
      })
    })

    /**
     * @tc.number: SUB_Telephony_Netstack_UNIX_Socket_Xts_0200
     * @tc.name: Test create constructLocalSocketInstance object
     * @tc.desc: Function Test
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Netstack_UNIX_Socket_Xts_0200", 0, async (done:Function)=> {
      let caseName = "SUB_Telephony_Netstack_UNIX_Socket_Xts_0200";
      let server = socket.constructLocalSocketServerInstance();
      server.getExtraOptions().then((data) => {
        console.info(`${caseName} getExtraOptions success, data: ${JSON.stringify(data)}`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} getExtraOptions fail, data: ${JSON.stringify(err)}`);
        expect(Error != undefined).assertEqual(true);
        done();
        })
    })
  })
}

