/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it } from '@ohos/hypium'
import Utils from './Utils'
import socket from 'libsocketndk.so'

export default function SocketNdkTest() {
  describe('MuslSocketTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SOCKET_SOCKET_0100
     * @tc.name       : testMuslSocketSocket001
     * @tc.desc       : test socket
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSocketSocket001', 0, async (done: Function) => {
      let c: number = socket.socket();
      expect(c).assertLarger(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SOCKET_SOCKETPAIR_0100
     * @tc.name       : testMuslSocketSocketpair001
     * @tc.desc       : test socketpair
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSocketSocketpair001', 0, async (done: Function) => {
      let c: number = socket.socketpair();
      expect(c).assertEqual(-1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SOCKET_SENDMSG_0100
     * @tc.name       : testMuslSocketSendmsg001
     * @tc.desc       : test sendmsg
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSocketSendmsg001', 0, async (done: Function) => {
      let a: number = socket.sendmsg();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SOCKET_SEND_0100
     * @tc.name       : testMuslSocketSend001
     * @tc.desc       : test send
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSocketSend001', 0, async (done: Function) => {
      let a: number = socket.send();
      expect(a).assertLarger(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SOCKET_SENDTO_0100
     * @tc.name       : testMuslSocketSendto001
     * @tc.desc       : test sendto
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSocketSendto001', 0, async (done: Function) => {
      let a: number = socket.sendto();
      expect(a).assertLarger(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SOCKET_SENDMMSG_0100
     * @tc.name       : testMuslSocketSendmmsg001
     * @tc.desc       : test sendmmsg
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSocketSendmmsg001', 0, async (done: Function) => {
      let a: number = socket.sendmmsg();
      expect(a).assertLarger(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SOCKET_SETSOCKOPT_0100
     * @tc.name       : testMuslSocketSetsockopt001
     * @tc.desc       : test setsockopt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSocketSetsockopt001', 0, async (done: Function) => {
      let a: number = socket.setsockopt();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SOCKET_SHUTDOWN_0100
     * @tc.name       : testMuslSocketShutdown001
     * @tc.desc       : test shutdown
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSocketShutdown001', 0, async (done: Function) => {
      let a: number = socket.shutdown();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SOCKET_RECV_0100
     * @tc.name       : testMuslSocketRecv001
     * @tc.desc       : test recv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSocketRecv001', 0, async (done: Function) => {
      let param = -1;
      let result: number = socket.recv(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SOCKET_RECV_0200
     * @tc.name       : testMuslSocketRecv002
     * @tc.desc       : test recv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSocketRecv002', 0, async (done: Function) => {
      let param = 0;
      let result: number = socket.recv(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SOCKET_CONNECT_0100
     * @tc.name       : testMuslSocketConnect001
     * @tc.desc       : test connect
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSocketConnect001', 0, async (done: Function) => {
      expect(socket.connect()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SOCKET_BIND_0100
     * @tc.name       : testMuslSocketBind001
     * @tc.desc       : test bind
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSocketBind001', 0, async (done: Function) => {
      let resultTrue = 0;
      let result: number = socket.bind();
      expect(result).assertEqual(resultTrue);
      done()
    });
    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_SOCKET_LISTEN_0100
     * @tc.name     : testMuslSocketListen001
     * @tc.desc     : test listen
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslSocketListen001', 0, async (done: Function) => {
      let result: number = socket.listen();
      expect(result).assertEqual(0)
      done()
    });
    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_SOCKET_GETPEERNAME_0100
     * @tc.name     : testMuslSocketGetpeername001
     * @tc.desc     : test getpeername
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslSocketGetpeername001', 0, async (done: Function) => {
      let result: number = socket.getpeername();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_SOCKET_GETSOCKNAME_0100
     * @tc.name     : testMuslSocketGetsockname001
     * @tc.desc     : test getsockname
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslSocketGetsockname001', 0, async (done: Function) => {
      let result: number = socket.getsockname();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_SOCKET_GETSOCKOPT_0100
     * @tc.name     : testMuslSocketGetsockopt001
     * @tc.desc     : test getsockopt
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslSocketGetsockopt001', 0, async (done: Function) => {
      let result: number = socket.getsockopt();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SOCKET_RECVFROM_0100
     * @tc.name       : testMuslSocketRecvfrom001
     * @tc.desc       : test recvfrom
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSocketRecvfrom001', 0, async (done: Function) => {
      let param = -1;
      let result: number = socket.recvfrom(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SOCKET_RECVMSG_0100
     * @tc.name       : testMuslSocketRecvmsg001
     * @tc.desc       : test recvmsg
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSocketRecvmsg001', 0, async (done: Function) => {
      let param = -1;
      let result: number = socket.recvmsg(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SOCKET_RECVMMSG_0100
     * @tc.name       : testMuslSocketRecvmmsg001
     * @tc.desc       : test recvmmsg
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSocketRecvmmsg001', 0, async (done: Function) => {
      let param = -1;
      let result: number = socket.recvmmsg(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done()
    });
  })
}