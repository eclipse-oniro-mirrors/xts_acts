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

import { beforeEach, describe, expect, it , TestType, Size, Level } from "@ohos/hypium"
import Utils from './Utils'
import socket from 'libsocketndk.so'

export default function SocketNdkTest() {
  describe('MuslSocketTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslSocketSocket001
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKET_SOCKET_0100
     * @tc.desc   test socket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSocketSocket001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let c: number = socket.socket();
      expect(c).assertLarger(0);
      done()
    });

    /**
     * @tc.name   testMuslSocketSocketpair001
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKET_SOCKETPAIR_0100
     * @tc.desc   test socketpair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSocketSocketpair001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let c: number = socket.socketpair();
      expect(c).assertEqual(-1);
      done()
    });
    /**
     * @tc.name   testMuslSocketSendmsg001
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKET_SENDMSG_0100
     * @tc.desc   test sendmsg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSocketSendmsg001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = socket.sendmsg();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSocketSend001
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKET_SEND_0100
     * @tc.desc   test send
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSocketSend001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = socket.send();
      expect(a).assertLarger(0);
      done()
    });

    /**
     * @tc.name   testMuslSocketSendto001
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKET_SENDTO_0100
     * @tc.desc   test sendto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSocketSendto001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = socket.sendto();
      expect(a).assertLarger(0);
      done()
    });

    /**
     * @tc.name   testMuslSocketSendmmsg001
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKET_SENDMMSG_0100
     * @tc.desc   test sendmmsg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSocketSendmmsg001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = socket.sendmmsg();
      expect(a).assertLarger(0);
      done()
    });

    /**
     * @tc.name   testMuslSocketSetsockopt001
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKET_SETSOCKOPT_0100
     * @tc.desc   test setsockopt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSocketSetsockopt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = socket.setsockopt();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSocketShutdown001
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKET_SHUTDOWN_0100
     * @tc.desc   test shutdown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSocketShutdown001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = socket.shutdown();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSocketRecv001
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKET_RECV_0100
     * @tc.desc   test recv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSocketRecv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = -1;
      let result: number = socket.recv(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslSocketRecv002
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKET_RECV_0200
     * @tc.desc   test recv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSocketRecv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 0;
      let result: number = socket.recv(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslSocketConnect001
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKET_CONNECT_0100
     * @tc.desc   test connect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSocketConnect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(socket.connect()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSocketBind001
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKET_BIND_0100
     * @tc.desc   test bind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSocketBind001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue = 0;
      let result: number = socket.bind();
      expect(result).assertEqual(resultTrue);
      done()
    });
    /**
     * @tc.name   testMuslSocketListen001
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKET_LISTEN_0100
     * @tc.desc   test listen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSocketListen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = socket.listen();
      expect(result).assertEqual(0)
      done()
    });
    /**
     * @tc.name   testMuslSocketGetpeername001
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKET_GETPEERNAME_0100
     * @tc.desc   test getpeername
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSocketGetpeername001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = socket.getpeername();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.name   testMuslSocketGetsockname001
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKET_GETSOCKNAME_0100
     * @tc.desc   test getsockname
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSocketGetsockname001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = socket.getsockname();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.name   testMuslSocketGetsockopt001
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKET_GETSOCKOPT_0100
     * @tc.desc   test getsockopt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSocketGetsockopt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = socket.getsockopt();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.name   testMuslSocketRecvfrom001
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKET_RECVFROM_0100
     * @tc.desc   test recvfrom
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSocketRecvfrom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = -1;
      let result: number = socket.recvfrom(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslSocketRecvmsg001
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKET_RECVMSG_0100
     * @tc.desc   test recvmsg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSocketRecvmsg001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = -1;
      let result: number = socket.recvmsg(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslSocketRecvmmsg001
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKET_RECVMMSG_0100
     * @tc.desc   test recvmmsg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSocketRecvmmsg001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = -1;
      let result: number = socket.recvmmsg(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done()
    });
  })
}