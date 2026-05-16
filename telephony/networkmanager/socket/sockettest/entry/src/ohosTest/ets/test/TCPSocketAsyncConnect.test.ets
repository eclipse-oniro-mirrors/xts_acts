import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { socket } from '@kit.NetworkKit';

function expectSuccess(): void {
  expect(true).assertTrue();
}

function expectFail(info: string = ''): void {
  try {
    expect(false).assertTrue();
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

let netAddress: socket.NetAddress = {
  address: '1.1.1.1',
  port: 80
};

let tcpConnectOptions: socket.TCPConnectOptions = {
  address: netAddress,
  timeout: 6000
};

let netFAddress: socket.NetAddress = {
  address: '192.168.1.132',
  port: 80
};

let tcpConnectFOptions: socket.TCPConnectOptions = {
  address: netFAddress,
  timeout: 6000
};

export default function TCPSocketAsyncConnectTest() {
  describe('TCPSocketAsyncConnectTest', () => {

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketAsyncConnect0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_AsyncConnect_0100
     * @tc.desc   Test 20 async TCP socket connections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketAsyncConnect0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketAsyncConnect0100';
        try {
          console.info(`${caseName} test start`);
          let callbackFinished = 0;
          let totalFinished = 21;
          for (let i = 0; i < 20; i++) {
            let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
            tcp.connect(tcpConnectFOptions, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} fail to connect ${err.code.toString()}`);
              } else {
                console.info(`${caseName} success to connect`);
                tcp.close();
              }
              callbackFinished++;
              if (callbackFinished === totalFinished) {
                console.info(`${caseName} test end`);
                done();
              }
            });
          }
          let tcpInstance: socket.TCPSocket = socket.constructTCPSocketInstance();
          tcpInstance.connect(tcpConnectOptions, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName} fail to connect ${err.code.toString()}`);
              expectFail();
            } else {
              console.info(`${caseName} success to connect`);
              expectSuccess();
              tcpInstance.close();
            }
            callbackFinished++;
            if (callbackFinished == totalFinished) {
              console.info(`${caseName} test end`);
              done();
            }
          });
        } catch (err) {
          console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketAsyncConnect0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_AsyncConnect_0200
     * @tc.desc   Test 64 async TCP socket connections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketAsyncConnect0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketAsyncConnect0200';
        try {
          console.info(`${caseName} test start`);
          let callbackFinished = 0;
          let totalFinished = 64;
          for (let i = 0; i < 64; i++) {
            let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
            tcp.connect(tcpConnectOptions, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} fail to connect ${err.code.toString()}`);
                expectFail();
              } else {
                console.info(`${caseName} success to connect`);
                expectSuccess();
                tcp.close();
              }
              callbackFinished++;
              if (callbackFinished == totalFinished) {
                console.info(`${caseName} test end`);
                done();
              }
            });
          }
        } catch (err) {
          console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketAsyncConnect0300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_AsyncConnect_0300
     * @tc.desc   Test 64 async TCP socket connections (63 fail + 1 success)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketAsyncConnect0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketAsyncConnect0300';
        try {
          console.info(`${caseName} test start`);
          let callbackFinished = 0;
          let totalFinished = 64;
          for (let i = 0; i < 63; i++) {
            let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
            tcp.connect(tcpConnectFOptions, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} fail to connect ${err.code.toString()}`);
              } else {
                console.info(`${caseName} success to connect`);
                tcp.close();
              }
              callbackFinished++;
              if (callbackFinished == totalFinished) {
                console.info(`${caseName} test end`);
                done();
              }
            });
          }
          let tcpInstance: socket.TCPSocket = socket.constructTCPSocketInstance();
          tcpInstance.connect(tcpConnectOptions, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName} fail to connect ${err.code.toString()}`);
              expectFail();
            } else {
              console.info(`${caseName} success to connect`);
              expectSuccess();
              tcpInstance.close();
            }
            callbackFinished++;
            if (callbackFinished == totalFinished) {
              console.info(`${caseName} test end`);
              done();
            }
          });
        } catch (err) {
          console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketAsyncConnect0400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_AsyncConnect_0400
     * @tc.desc   Test 65 async TCP socket connections (64 fail + 1 success)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketAsyncConnect0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketAsyncConnect0400';
        try {
          console.info(`${caseName} test start`);
          let callbackFinished = 0;
          let totalFinished = 64;
          for (let i = 0; i < 64; i++) {
            let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
            tcp.connect(tcpConnectFOptions, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} fail to connect ${err.code.toString()}`);
              } else {
                console.info(`${caseName} success to connect`);
                tcp.close();
              }
              callbackFinished++;
              if (callbackFinished == totalFinished) {
                console.info(`${caseName} test end`);
                done();
              }
            });
          }
          let tcpInstance: socket.TCPSocket = socket.constructTCPSocketInstance();
          tcpInstance.connect(tcpConnectOptions, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName} fail to connect ${err.code.toString()}`);
              expectFail();
            } else {
              console.info(`${caseName} success to connect`);
              expectSuccess();
              tcpInstance.close();
            }
            callbackFinished++;
            if (callbackFinished == totalFinished) {
              console.info(`${caseName} test end`);
              done();
            }
          });
        } catch (err) {
          console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
  });
}
