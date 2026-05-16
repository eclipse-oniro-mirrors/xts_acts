import hilog from '@ohos.hilog';
import socket from "@ohos.net.socket";
import { BusinessError } from '@ohos.base'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';

// no permission.
const NOT_PERMISSION = 201;
let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();


export default function socketNopTest() {
  describe('socketNopTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      sleep(6000)
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   SUB_Communication_NetStack_Socket_Listen_NetAddress_Promise_Nop
     * @tc.number SUB_Communication_NetStack_Socket_Listen_NetAddress_Promise_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_NetStack_Socket_Listen_NetAddress_Promise_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_NetAddress_Promise_Nop begin');
      try {
        let listenAddr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8080,
          family: 1
        }
        await tcpServer.listen(listenAddr).then(() => {
          hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_NetAddress_Promise_Nop success');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_NetAddress_Promise_Nop fail' + JSON.stringify(err));
          expect(Number(err.code)).assertEqual(NOT_PERMISSION);
          done();
        });
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_NetAddress_Promise_Nop fail' + JSON.stringify(err));
        expect(Number(err.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });


    /**
     * @tc.name   SUB_Communication_NetStack_Socket_Listen_NetAddress_Callback_Nop
     * @tc.number SUB_Communication_NetStack_Socket_Listen_NetAddress_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_NetStack_Socket_Listen_NetAddress_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_NetAddress_Callback_Nop begin');
      try {
        let listenAddr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8080,
          family: 1
        }
        tcpServer.listen(listenAddr, (err: BusinessError) => {
          if (err) {
            hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_NetAddress_Callback_Nop fail' + JSON.stringify(err));
            expect(Number(err.code)).assertEqual(NOT_PERMISSION);
            done();
          } else {
            hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_NetAddress_Callback_Nop success');
            expect().assertFail();
            done();
          }
        })
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_NetAddress_Callback_Nop fail' + JSON.stringify(err));
        expect(Number(err.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_NetStack_Socket_Close_Callback_Nop
     * @tc.number SUB_Communication_NetStack_Socket_Close_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_NetStack_Socket_Close_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Close_Callback_Nop begin');
      try {
        tcp.close((err: BusinessError) => {
          if (err) {
            hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Close_Callback_Nop ' + JSON.stringify(err));
            expect(err.code).assertEqual(NOT_PERMISSION);
            done();
          } else {
            hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Close_Callback_Nop success');
            expect().assertFail();
            done();
          }
        })
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Close_Callback_Nop fail' + JSON.stringify(err));
        expect(Number(err.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_NetStack_Socket_Bind_NetAddress_Callback_Nop
     * @tc.number SUB_Communication_NetStack_Socket_Bind_NetAddress_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_NetStack_Socket_Bind_NetAddress_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Bind_NetAddress_Callback_Nop begin');
      try {
        // let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let bindAddr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8080
        }
        tcp.bind(bindAddr, (err: BusinessError) => {
          if (err) {
            hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Bind_NetAddress_Callback_Nop ' + JSON.stringify(err));
            expect(err.code).assertEqual(NOT_PERMISSION);
            done();
          } else {
            hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Bind_NetAddress_Callback_Nop success');
            expect().assertFail();
            done();
          }
        })
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Bind_NetAddress_Callback_Nop fail' + JSON.stringify(err));
        expect(Number(err.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_NetStack_Socket_Bind_NetAddress_Promise_Nop
     * @tc.number SUB_Communication_NetStack_Socket_Bind_NetAddress_Promise_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_NetStack_Socket_Bind_NetAddress_Promise_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Bind_NetAddress_Promise_Nop begin');
      try {
        // let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let bindAddr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8080
        }
        await tcp.bind(bindAddr).then(() => {
          hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Bind_NetAddress_Promise_Nop success');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Bind_NetAddress_Promise_Nop ' + JSON.stringify(err));
          expect(err.code).assertEqual(NOT_PERMISSION);
          done();
        });
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Bind_NetAddress_Promise_Nop fail' + JSON.stringify(err));
        expect(Number(err.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });


    /**
     * @tc.name   SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Callback_Nop
     * @tc.number SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Callback_Nop begin');
      try {
        tcp.getRemoteAddress((err: BusinessError, data: socket.NetAddress) => {
          if (err) {
            hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Callback_Nop ' + JSON.stringify(err));
            expect(err.code).assertEqual(NOT_PERMISSION);
            done();
          } else {
            hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Callback_Nop success');
            expect().assertFail();
            done();
          }
        })
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Callback_Nop fail' + JSON.stringify(err));
        expect(Number(err.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Promise_Nop
     * @tc.number SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Promise_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Promise_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Promise_Nop begin');
      try {
        await tcp.getRemoteAddress().then(() => {
          hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Promise_Nop success');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Promise_Nop ' + JSON.stringify(err));
          expect(err.code).assertEqual(NOT_PERMISSION);
          done();
        });
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Promise_Nop fail' + JSON.stringify(err));
        expect(Number(err.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_NetStack_Socket_GetState_SocketStateBase_Promise_Nop
     * @tc.number SUB_Communication_NetStack_Socket_GetState_SocketStateBase_Promise_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Communication_NetStack_Socket_GetState_SocketStateBase_Promise_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetState_SocketStateBase_Promise_Nop begin');
      try {
        await tcp.getState().then(() => {
          hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetState_SocketStateBase_Promise_Nop success');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetState_SocketStateBase_Promise_Nop ' + JSON.stringify(err));
          expect(err.code).assertEqual(NOT_PERMISSION);
          done();
        });
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetState_SocketStateBase_Promise_Nop fail' + JSON.stringify(err));
        expect(Number(err.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_NetStack_Socket_Close_Promise_Nop
     * @tc.number SUB_Communication_NetStack_Socket_Close_Promise_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Communication_NetStack_Socket_Close_Promise_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Close_Promise_Nop begin');
      try {
        await tcp.close().then(() => {
          hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Close_Promise_Nop success');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Close_Promise_Nop ' + JSON.stringify(err));
          expect(err.code).assertEqual(NOT_PERMISSION);
          done();
        });
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Close_Promise_Nop fail' + JSON.stringify(err));
        expect(Number(err.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Callback_Nop
     * @tc.number SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Callback_Nop begin');
      try {
        let tlsConnectOptions: socket.TLSConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 8080
          },
          secureOptions: {
            key: "pri_key_server",
            cert: "cert_server",
            ca: ["ca_common"],
            password: "123456",
            protocols: socket.Protocol.TLSv12,
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256"
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        }
        tlsServer.listen(tlsConnectOptions, (err: BusinessError) => {
          if (err.code) {
            hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Callback_Nop ' + JSON.stringify(err));
            expect(err.code).assertEqual(NOT_PERMISSION);
            done();
          } else {
            hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Callback_Nop success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Callback_Nop fail' + JSON.stringify(err));
        expect(Number(err.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Promise_Nop
     * @tc.number SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Promise_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Promise_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Promise_Nop begin');
      try {
        let tlsConnectOptions: socket.TLSConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 8080
          },
          secureOptions: {
            key: "pri_key_server",
            cert: "cert_server",
            ca: ["ca_common"],
            password: "123456",
            protocols: socket.Protocol.TLSv12,
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256"
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        }
        await tlsServer.listen(tlsConnectOptions).then(() => {
          hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Promise_Nop success');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Callback_Nop ' + JSON.stringify(err));
          expect(err.code).assertEqual(NOT_PERMISSION);
          done();
        });
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Callback_Nop fail' + JSON.stringify(err));
        expect(Number(err.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });




    /**
     * @tc.name   SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Callback_Nop
     * @tc.number SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Callback_Nop begin');
      try {
        let sendOptions: socket.UDPSendOptions = {
          data: 'Hello, server!',
          address: {
            address: '127.0.0.1',
            port: 8080
          }
        }
        udp.send(sendOptions, (err: BusinessError) => {
          if (err) {
            hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Callback_Nop ' + JSON.stringify(err));
            expect(err.code).assertEqual(NOT_PERMISSION);
            done();
          } else {
            hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Callback_Nop success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Callback_Nop fail' + JSON.stringify(err));
        expect(Number(err.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Callback_Nop
     * @tc.number SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Callback_Nop begin');
      try {

        udp.setExtraOptions({}, (err: BusinessError) => {
          if (err) {
            hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Callback_Nop ' + JSON.stringify(err));
            expect(err.code).assertEqual(NOT_PERMISSION);
            done();
          } else {
            hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Callback_Nop success');
            expect().assertFail();
            done();
          }
        })

      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Callback_Nop fail' + JSON.stringify(err));
        expect(Number(err.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

  });

  /**
   * @tc.name   SUB_Communication_NetStack_Socket_Send_TCPSendOptions_Promise_Nop
   * @tc.number SUB_Communication_NetStack_Socket_Send_TCPSendOptions_Promise_Nop
   * @tc.desc   Using the on method without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Communication_NetStack_Socket_Send_TCPSendOptions_Promise_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_TCPSendOptions_Promise_Nop begin');
    try {
      let tcpSendOptions: socket.TCPSendOptions = {
        data: 'Hello, server!'
      }
      await tcp.send(tcpSendOptions).then(() => {
        hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_TCPSendOptions_Promise_Nop success');
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_TCPSendOptions_Promise_Nop ' + JSON.stringify(err));
        expect(err.code).assertEqual(NOT_PERMISSION);
        done();
      });
    } catch (err) {
      hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_TCPSendOptions_Promise_Nop fail' + JSON.stringify(err));
      expect(Number(err.code)).assertEqual(NOT_PERMISSION);
      done();
    }
  });

  /**
   * @tc.name   SUB_Communication_NetStack_Socket_GetState_Callback_Nop
   * @tc.number SUB_Communication_NetStack_Socket_GetState_Callback_Nop
   * @tc.desc   Using the on method without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('SUB_Communication_NetStack_Socket_GetState_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
    hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetState_Callback_Nop begin');
    try {
      sleep(500)
      tcp.getState((err: BusinessError, data: socket.SocketStateBase) => {
        if (err) {
          hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetState_Callback_Nop ' + JSON.stringify(err));
          expect(err.code).assertEqual(NOT_PERMISSION);
          done();
        } else {
          hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetState_Callback_Nop success');
          expect().assertFail();
          done();
        }
      });

    } catch (err) {
      hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetState_Callback_Nop fail' + JSON.stringify(err));
      expect(Number(err.code)).assertEqual(NOT_PERMISSION);
      done();
    }
  });


  /**
   * @tc.name   SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Promise_Nop
   * @tc.number SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Promise_Nop
   * @tc.desc   Using the on method without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Promise_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
    hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Promise_Nop begin');
    try {
      let udpextraoptions: socket.UDPExtraOptions = {
        receiveBufferSize: 1000,
        sendBufferSize: 1000,
        reuseAddress: false,
        socketTimeout: 6000,
        broadcast: true
      }
      await udp.setExtraOptions(udpextraoptions).then(() => {
        hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Promise_Nop success');
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Promise_Nop ' + JSON.stringify(err));
        expect(err.code).assertEqual(NOT_PERMISSION);
        done();
      });
    } catch (err) {
      hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Promise_Nop fail' + JSON.stringify(err));
      expect(Number(err.code)).assertEqual(NOT_PERMISSION);
      done();
    }
  });

  /**
   * @tc.name   SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Promise_Nop
   * @tc.number SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Promise_Nop
   * @tc.desc   Using the on method without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Promise_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
    hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Promise_Nop begin');
    try {
      let sendOptions: socket.UDPSendOptions = {
        data: 'Hello, server!',
        address: {
          address: '127.0.0.1',
          port: 8080
        }
      }
      await udp.send(sendOptions).then(() => {
        hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Promise_Nop success');
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Promise_Nop ' + JSON.stringify(err));
        expect(err.code).assertEqual(NOT_PERMISSION);
        done();
      });
    } catch (err) {
      hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Promise_Nop fail' + JSON.stringify(err));
      expect(Number(err.code)).assertEqual(NOT_PERMISSION);
      done();
    }
  });

  /**
   * @tc.name   SUB_Communication_NetStack_Socket_Connect_TCPConnectOptions_Callback_Nop
   * @tc.number SUB_Communication_NetStack_Socket_Connect_TCPConnectOptions_Callback_Nop
   * @tc.desc   Using the on method without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('SUB_Communication_NetStack_Socket_Connect_TCPConnectOptions_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
    hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Connect_TCPConnectOptions_Callback_Nop begin');
    try {
      let tcpconnectoptions: socket.TCPConnectOptions = {
        address: {
          address: '127.0.0.1',
          port: 8080
        },
        timeout: 6000
      }
      tcp.connect(tcpconnectoptions, (err: BusinessError) => {
        if (err) {
          hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Connect_TCPConnectOptions_Callback_Nop ' + JSON.stringify(err));
          expect(err.code).assertEqual(NOT_PERMISSION);
          done();
        } else {
          hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Connect_TCPConnectOptions_Callback_Nop success');
          expect().assertFail();
          done();
        }
      })
    } catch (err) {
      hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Connect_TCPConnectOptions_Callback_Nop fail' + JSON.stringify(err));
      expect(Number(err.code)).assertEqual(NOT_PERMISSION);
      done();
    }
  });

  /**
   * @tc.name   SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Promise_Nop
   * @tc.number SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Promise_Nop
   * @tc.desc   Using the on method without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Promise_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
    hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Promise_Nop begin');
    try {
      let tcpExtraOptions: socket.TCPExtraOptions = {
        keepAlive: true,
        OOBInline: true,
        TCPNoDelay: true,
        socketLinger: {
          on: true, linger: 10
        },
        receiveBufferSize: 1000,
        sendBufferSize: 1000,
        reuseAddress: true,
        socketTimeout: 3000
      }
      await tcp.setExtraOptions(tcpExtraOptions).then(() => {
        hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Promise_Nop success');
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Promise_Nop ' + JSON.stringify(err));
        expect(err.code).assertEqual(NOT_PERMISSION);
        done();
      });
    } catch (err) {
      hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Promise_Nop fail' + JSON.stringify(err));
      expect(Number(err.code)).assertEqual(NOT_PERMISSION);
      done();
    }
  });

  /**
   * @tc.name   SUB_Communication_NetStack_Socket_Send_TCPConnectOptions_Callback_Nop
   * @tc.number SUB_Communication_NetStack_Socket_Send_TCPConnectOptions_Callback_Nop
   * @tc.desc   Using the on method without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('SUB_Communication_NetStack_Socket_Send_TCPConnectOptions_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
    hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_TCPConnectOptions_Callback_Nop begin');
    try {
      let tcpSendOptions: socket.TCPSendOptions = {
        data: 'Hello, server!'
      }
      tcp.send(tcpSendOptions, (err: BusinessError) => {
        if (err) {
          hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_TCPConnectOptions_Callback_Nop ' + JSON.stringify(err));
          expect(err.code).assertEqual(NOT_PERMISSION);
          done();
        } else {
          hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_TCPConnectOptions_Callback_Nop success');
          expect().assertFail();
          done();
        }
      })
    } catch (err) {
      hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_TCPConnectOptions_Callback_Nop fail' + JSON.stringify(err));
      expect(Number(err.code)).assertEqual(NOT_PERMISSION);
      done();
    }
  });

  /**
   * @tc.name   SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Callback_Nop
   * @tc.number SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Callback_Nop
   * @tc.desc   Using the on method without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
    hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Callback_Nop begin');
    try {
      let tcpExtraOptions: socket.TCPExtraOptions = {
        keepAlive: true,
        OOBInline: true,
        TCPNoDelay: true,
        socketLinger: {
          on: true, linger: 10
        },
        receiveBufferSize: 1000,
        sendBufferSize: 1000,
        reuseAddress: true,
        socketTimeout: 3000
      }
      tcp.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
        if (err) {
          hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Callback_Nop ' + JSON.stringify(err));
          expect(err.code).assertEqual(NOT_PERMISSION);
          done();
        } else {
          hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Callback_Nop success');
          expect().assertFail();
          done();
        }
      });
    } catch (err) {
      hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Callback_Nop fail' + JSON.stringify(err));
      expect(Number(err.code)).assertEqual(NOT_PERMISSION);
      done();
    }
  });

  /**
   * @tc.name   SUB_Communication_NetStack_Socket_Connect_TCPSendOptions_Promise_Nop
   * @tc.number SUB_Communication_NetStack_Socket_Connect_TCPSendOptions_Promise_Nop
   * @tc.desc   Using the on method without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('SUB_Communication_NetStack_Socket_Connect_TCPSendOptions_Promise_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
    hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Connect_TCPSendOptions_Promise_Nop begin');
    try {
      let tcpconnectoptions: socket.TCPConnectOptions = {
        address: {
          address: '127.0.0.1',
          port: 8080
        },
        timeout: 6000
      }
      await tcp.connect(tcpconnectoptions).then(() => {
        hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Connect_TCPSendOptions_Promise_Nop success');
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Connect_TCPSendOptions_Promise_Nop ' + JSON.stringify(err));
        expect(err.code).assertEqual(NOT_PERMISSION);
        done();
      });
    } catch (err) {
      hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Connect_TCPSendOptions_Promise_Nop fail' + JSON.stringify(err));
      expect(Number(err.code)).assertEqual(NOT_PERMISSION);
      done();
    }
  });
}

async function sleep(timeOut: number): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(() => {
      hilog.error(0x0000, 'socketTag', '%{public}s', 'sleep time: ' + JSON.stringify(timeOut));
      resolve();
    }, timeOut);
  });
}