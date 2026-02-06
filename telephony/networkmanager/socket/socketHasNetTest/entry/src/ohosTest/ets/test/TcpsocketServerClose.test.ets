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
import socket from '@ohos.net.socket'
import { describe, it, expect, Level, Size, TestType, afterEach } from '@ohos/hypium';
import { BusinessError } from "@kit.BasicServicesKit";


const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}
const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(` exportFail failed err: ${JSON.stringify(err)}`);
  }
};

let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
let tcpClient: socket.TCPSocket = socket.constructTCPSocketInstance();
export default function TcpSocketServerCloseTest() {
  describe("TcpSocketServerCloseTest", () => {
    afterEach(async ()=>{
      tcpServer = socket.constructTCPSocketServerInstance();
      tcpClient = socket.constructTCPSocketInstance();
    })

    /**
     * @tc.number : SUB_NetworkMgr_Socket_TCPSocketServer_Close_0100
     * @tc.name   : testNetworkMgrSocketTCPSocketServerClose0100
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
     */
    it('testNetworkMgrSocketTCPSocketServerClose0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose0100';
      console.info(`${caseName} test start`);
      try {
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: Math.round(1024+ Math.random()*5000+Math.random()*4000),
          family: 1
        };
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        await tcpServer.listen(listenAddress).then(()=>{
          console.info(`${caseName} tcpServer  listen success`);
        }).catch((err:BusinessError) => {
          console.info(`${caseName} tcpServer  listen failed err is`+ JSON.stringify(err));
          ExpectFail();
          done();
          console.info(`${caseName}---End`);
        })
        tcpServer.on('connect', async (tcpSocketConnection: socket.TCPSocketConnection) => {
          console.log(`${caseName} tcpServer on connect  `)
          await tcpServer.close().then(()=>{
            console.info(`${caseName} tcpServer  close success`);
            ExpectTrue(true);
            console.info(`${caseName}---End`);
            done();
          }).catch((err: BusinessError)=>{
            console.info(`${caseName} tcpServer  close failed err is: `+ JSON.stringify(err));
            ExpectFail();
            done();
            console.info(`${caseName}---End`);
          })
        });
        await tcpClient.connect(tcpConnectOptions).catch((err:BusinessError) => {
          console.info(`${caseName} get connect err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).then(()=>{
          console.info(`${caseName} tcpClient  connect success`);
        })
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
   /**
     * @tc.number : SUB_NetworkMgr_Socket_TCPSocketServer_Close_0200
     * @tc.name   : testNetworkMgrSocketTCPSocketServerClose0200
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
     */
    it('testNetworkMgrSocketTCPSocketServerClose0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose0200';
      console.info(`${caseName} test start`);
      try {
        let listenAddress: socket.NetAddress = {
          address: '::1',
          port: Math.round(1024+ Math.random()*5000+Math.random()*4000),
          family: 2
        };
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        await tcpServer.listen(listenAddress).then(()=>{
          console.info(`${caseName} tcpServer  listen success`);
        }).catch((err:BusinessError) => {
          console.info(`${caseName} tcpServer  listen failed err is`+ JSON.stringify(err));
          ExpectFail();
          done();
          console.info(`${caseName}---End`);
        })
        tcpServer.on('connect', async (tcpSocketConnection: socket.TCPSocketConnection) => {
          console.log(`${caseName} tcpServer on connect  `)
          await tcpServer.close().then(()=>{
            console.info(`${caseName} tcpServer  close success`);
            ExpectTrue(true);
            console.info(`${caseName}---End`);
            done();
          }).catch((err: BusinessError)=>{
            console.info(`${caseName} tcpServer  close failed`+ JSON.stringify(err));
            ExpectFail();
            done();
            console.info(`${caseName}---End`);
          })
        });
        await tcpClient.connect(tcpConnectOptions).catch((err:BusinessError) => {
          console.info(`${caseName} get connect err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).then(()=>{
          console.info(`${caseName} tcpClient  connect success`);
        })
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
   /**
     * @tc.number : SUB_NetworkMgr_Socket_TCPSocketServer_Close_0300
     * @tc.name   : testNetworkMgrSocketTCPSocketServerClose0300
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
     */
    it('testNetworkMgrSocketTCPSocketServerClose0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose0300';
      console.info(`${caseName} test start`);
      try {
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: Math.round(1024+ Math.random()*5000+Math.random()*4000),
          family: 1
        };
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        await tcpServer.listen(listenAddress).then(()=>{
          console.info(`${caseName} tcpServer  listen success`);
        }).catch((err:BusinessError) => {
          console.info(`${caseName} tcpServer  listen failed :`+ JSON.stringify(err));
          ExpectFail();
          done();
          console.info(`${caseName}---End`);
        })
        tcpServer.on('connect', async (tcpSocketConnection: socket.TCPSocketConnection) => {
          console.log(`${caseName} tcpServer on connect  `)
          let tcpSendOption: socket.TCPSendOptions = {
            data: 'Hello, client!'
          };
          await tcpServer.close().then(()=>{
            console.info(`${caseName} tcpServer  close success`);
          }).catch((err: BusinessError)=>{
            console.info(`${caseName} tcpServer  close failed: `+ JSON.stringify(err));
            ExpectFail();
            done();
            console.info(`${caseName}---End`);
          })
          tcpSocketConnection.send(tcpSendOption, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName} fail err:${JSON.stringify(err)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} client send success`);
              ExpectTrue(true);
              tcpServer.off('connect');
              console.info(`${caseName} test end`);
              done();
            };
          });
        });
        await tcpClient.connect(tcpConnectOptions).catch((err:BusinessError) => {
          console.info(`${caseName} get connect err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).then(()=>{
          console.info(`${caseName} tcpClient  connect success`);
        })
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.number : SUB_NetworkMgr_Socket_TCPSocketServer_Close_0400
     * @tc.name   : testNetworkMgrSocketTCPSocketServerClose0400
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
     */
    it('testNetworkMgrSocketTCPSocketServerClose0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose0400';
      console.info(`${caseName} test start`);
      try {
        let listenAddress: socket.NetAddress = {
          address: '::1',
          port: Math.round(1024+ Math.random()*5000+Math.random()*4000),
          family: 2
        };
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        await tcpServer.listen(listenAddress).then(()=>{
          console.info(`${caseName} tcpServer  listen success`);
        }).catch((err:BusinessError) => {
          console.info(`${caseName} tcpServer  listen failed: err is`+JSON.stringify(err));
          ExpectFail();
          done();
          console.info(`${caseName}---End`);
        })
        tcpServer.on('connect', async (tcpSocketConnection: socket.TCPSocketConnection) => {
          console.log(`${caseName} tcpServer on connect  `)
          let tcpSendOption: socket.TCPSendOptions = {
            data: 'Hello, client!'
          };
          await tcpServer.close().then(()=>{
            console.info(`${caseName} tcpServer  close success`);
          }).catch((err: BusinessError)=>{
            console.info(`${caseName} tcpServer  close failed`+ JSON.stringify(err));
            ExpectFail();
            done();
            console.info(`${caseName}---End`);
          })
          tcpSocketConnection.send(tcpSendOption, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName} fail err:${JSON.stringify(err)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} client send success`);
              ExpectTrue(true);
              tcpServer.off('connect');
              console.info(`${caseName} test end`);
              done();
            };
          });
        });
        await tcpClient.connect(tcpConnectOptions).catch((err:BusinessError) => {
          console.info(`${caseName} get connect err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).then(()=>{
          console.info(`${caseName} tcpClient  connect success`);
        })
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.number : SUB_NetworkMgr_Socket_TCPSocketServer_Close_0500
     * @tc.name   : testNetworkMgrSocketTCPSocketServerClose0500
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
     */
    it('testNetworkMgrSocketTCPSocketServerClose0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose0500';
      console.info(`${caseName} test start`);
      try {
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: Math.round(1024+ Math.random()*5000+Math.random()*4000),
          family: 1
        };
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        await tcpServer.listen(listenAddress).then(()=>{
          console.info(`${caseName} tcpServer  listen success`);
        }).catch((err:BusinessError) => {
          console.info(`${caseName} tcpServer  listen failed err is `+JSON.stringify(err));
          ExpectFail();
          done();
          console.info(`${caseName}---End`);
        })
        tcpServer.on('connect', async (tcpSocketConnection: socket.TCPSocketConnection) => {
          console.log(`${caseName} tcpServer on connect  `)
          await tcpServer.close().then(()=>{
            console.info(`${caseName} tcpServer  close success`);
          }).catch((err: BusinessError)=>{
            console.info(`${caseName} tcpServer  close failed`+ JSON.stringify(err));
            ExpectFail();
            done();
            console.info(`${caseName}---End`);
          })
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Send a message after closing !'
          }
          await tcpClient.send(tcpSendOptions).then(()=>{
            console.info(`${caseName} tcpClient  send message  success`);
            ExpectTrue(true);
            done();
            console.info(`${caseName}---End`);
          }).catch((err:BusinessError)=>{
            console.info(`${caseName} tcpClient  send message  failed err is`+ JSON.stringify(err));
            ExpectFail();
            done();
            console.info(`${caseName}---End`);
          })
        });
        await tcpClient.connect(tcpConnectOptions).catch((err:BusinessError) => {
          console.info(`${caseName} get connect err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).then(()=>{
          console.info(`${caseName} tcpClient  connect success`);
        })
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.number : SUB_NetworkMgr_Socket_TCPSocketServer_Close_0600
     * @tc.name   : testNetworkMgrSocketTCPSocketServerClose0600
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
     */
    it('testNetworkMgrSocketTCPSocketServerClose0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose0600';
      console.info(`${caseName} test start`);
      try {
        let listenAddress: socket.NetAddress = {
          address: '::1',
          port: Math.round(1024+ Math.random()*5000+Math.random()*4000),
          family: 2
        };
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        await tcpServer.listen(listenAddress).then(()=>{
          console.info(`${caseName} tcpServer  listen success`);
        }).catch((err:BusinessError) => {
          console.info(`${caseName} tcpServer  listen failed`+JSON.stringify(err));
          ExpectFail();
          done();
          console.info(`${caseName}---End`);
        })
        tcpServer.on('connect', async (tcpSocketConnection: socket.TCPSocketConnection) => {
          console.log(`${caseName} tcpServer on connect  `);
          await tcpServer.close().then(()=>{
            console.info(`${caseName} tcpServer  close success`);
          }).catch((err: BusinessError)=>{
            console.info(`${caseName} tcpServer  close failed`+ JSON.stringify(err));
            ExpectFail();
            done();
            console.info(`${caseName}---End`);
          })
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Send a message after closing !'
          }
          await tcpClient.send(tcpSendOptions).then(()=>{
            console.info(`${caseName} tcpClient  send message  success`);
            ExpectTrue(true);
            done();
            console.info(`${caseName}---End`);
          }).catch((err:BusinessError)=>{
            console.info(`${caseName} tcpClient  send message  failed err is`+ JSON.stringify(err));
            ExpectFail();
            done();
            console.info(`${caseName}---End`);
          })
        });
        await tcpClient.connect(tcpConnectOptions).catch((err:BusinessError) => {
          console.info(`${caseName} get connect err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).then(()=>{
          console.info(`${caseName} tcpClient  connect success`);
        })
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.number : SUB_NetworkMgr_Socket_TCPSocketServer_Close_0700
     * @tc.name   : testNetworkMgrSocketTCPSocketServerClose0700
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
     */
    it('testNetworkMgrSocketTCPSocketServerClose0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose0700';
      console.info(`${caseName} test start`);
      try {
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: Math.round(1024+ Math.random()*5000+Math.random()*4000),
          family: 1
        };
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        await tcpServer.listen(listenAddress).then(()=>{
          console.info(`${caseName} tcpServer  listen success`);
        }).catch((err:BusinessError) => {
          console.info(`${caseName} tcpServer  listen failed`+ JSON.stringify(err));
          ExpectFail();
          done();
          console.info(`${caseName}---End`);
        })
        tcpServer.on('connect', async (tcpSocketConnection: socket.TCPSocketConnection) => {
          console.log(`${caseName} tcpServer on connect  `)
          await tcpServer.close().then(async ()=>{
            console.info(`${caseName} tcpServer  close success`);
            await tcpServer.listen(listenAddress).then(()=>{
              console.info(`${caseName} tcpServer again listen success`);
              ExpectTrue(true);
              console.info(`${caseName}---End`);
              done();
            }).catch((err:BusinessError) => {
              console.info(`${caseName} tcpServer  listen failed`+ JSON.stringify(err));
              ExpectFail();
              done();
              console.info(`${caseName}---End`);
            })
          }).catch((err: BusinessError)=>{
            console.info(`${caseName} tcpServer  close failed`+ JSON.stringify(err));
            ExpectFail();
            done();
            console.info(`${caseName}---End`);
          })
        });
        await tcpClient.connect(tcpConnectOptions).catch((err:BusinessError) => {
          console.info(`${caseName} get connect err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).then(()=>{
          console.info(`${caseName} tcpClient  connect success`);
        })
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.number : SUB_NetworkMgr_Socket_TCPSocketServer_Close_0800
     * @tc.name   : testNetworkMgrSocketTCPSocketServerClose0800
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
     */
    it('testNetworkMgrSocketTCPSocketServerClose0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose0800';
      console.info(`${caseName} test start`);
      try {
        let listenAddress: socket.NetAddress = {
          address: '::1',
          port: Math.round(1024+ Math.random()*5000+Math.random()*4000),
          family: 2
        };
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        await tcpServer.listen(listenAddress).then(()=>{
          console.info(`${caseName} tcpServer  listen success`);
        }).catch((err:BusinessError) => {
          console.info(`${caseName} tcpServer  listen failed`+ JSON.stringify(err));
          ExpectFail();
          done();
          console.info(`${caseName}---End`);
        })
        tcpServer.on('connect', async (tcpSocketConnection: socket.TCPSocketConnection) => {
          console.log(`${caseName} tcpServer on connect  `)
          await tcpServer.close().then(async ()=>{
            console.info(`${caseName} tcpServer  close success`);
            await tcpServer.listen(listenAddress).then(()=>{
              console.info(`${caseName} tcpServer again listen success`);
              ExpectTrue(true);
              console.info(`${caseName}---End`);
              done();
            }).catch((err:BusinessError) => {
              console.info(`${caseName} tcpServer listen failed`+ JSON.stringify(err));
              ExpectFail();
              done();
              console.info(`${caseName}---End`);
            })
          }).catch((err: BusinessError)=>{
            console.info(`${caseName} tcpServer  close failed`+ JSON.stringify(err));
            ExpectFail();
            done();
            console.info(`${caseName}---End`);
          })
        });
        await tcpClient.connect(tcpConnectOptions).catch((err:BusinessError) => {
          console.info(`${caseName} get connect err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).then(()=>{
          console.info(`${caseName} tcpClient  connect success`);
        })
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.number : SUB_NetworkMgr_Socket_TCPSocketServer_Close_0900
     * @tc.name   : testNetworkMgrSocketTCPSocketServerClose0900
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
     */
    it('testNetworkMgrSocketTCPSocketServerClose0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose0900';
      console.info(`${caseName} test start`);
      try {
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: Math.round(1024+ Math.random()*5000+Math.random()*4000),
          family: 1
        };
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        await tcpServer.listen(listenAddress).then(()=>{
          console.info(`${caseName} tcpServer listen success`);
        }).catch((err:BusinessError) => {
          console.info(`${caseName} tcpServer  listen failed err is: `+JSON.stringify(err));
          ExpectFail();
          done();
          console.info(`${caseName}---End`);
        })
        tcpServer.on('connect', async (tcpSocketConnection: socket.TCPSocketConnection) => {
          console.log(`${caseName} tcpServer on connect `)
          await tcpClient.close().then(()=>{
            console.log(`${caseName} tcpClient close success `);
            tcpServer.close().then(()=> {
              console.log(`${caseName} tcpServer close success `);
              ExpectTrue(true);
              done();
            }).catch((err: BusinessError)=>{
              console.log(`${caseName} tcpServer close failed `+ JSON.stringify(err));
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            })
          }).catch((err: BusinessError)=>{
            console.log(`${caseName} tcpClient close failed err is`+ JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          })
        });
        await tcpClient.connect(tcpConnectOptions).catch((err:BusinessError) => {
          console.info(`${caseName} get connect err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).then(()=>{
          console.info(`${caseName} tcpClient  connect success`);
        })
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.number : SUB_NetworkMgr_Socket_TCPSocketServer_Close_1000
     * @tc.name   : testNetworkMgrSocketTCPSocketServerClose1000
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
     */
    it('testNetworkMgrSocketTCPSocketServerClose1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose1000';
      console.info(`${caseName} test start`);
      try {
        let listenAddress: socket.NetAddress = {
          address: '::1',
          port: Math.round(1024+ Math.random()*5000+Math.random()*4000),
          family: 2
        };
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        await tcpServer.listen(listenAddress).then(()=>{
          console.info(`${caseName} tcpServer listen success`);
        }).catch((err:BusinessError) => {
          console.info(`${caseName} tcpServer  listen failed err is: `+JSON.stringify(err));
          ExpectFail();
          done();
          console.info(`${caseName}---End`);
        })
        tcpServer.on('connect', async (tcpSocketConnection: socket.TCPSocketConnection) => {
          console.log(`${caseName} tcpServer on connect `)
          await tcpClient.close().then(()=>{
            console.log(`${caseName} tcpClient close success `);
            tcpServer.close().then(()=> {
              console.log(`${caseName} tcpServer close success `);
              ExpectTrue(true);
              console.info(`${caseName}---End`);
              done();
            }).catch((err: BusinessError)=>{
              console.log(`${caseName} tcpServer close failed `+ JSON.stringify(err));
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            })
          }).catch((err: BusinessError)=>{
            console.log(`${caseName} tcpClient close failed err is`+ JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          })
        });
        await tcpClient.connect(tcpConnectOptions).catch((err:BusinessError) => {
          console.info(`${caseName} get connect err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).then(()=>{
          console.info(`${caseName} tcpClient  connect success`);
        })
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.number : SUB_NetworkMgr_Socket_TCPSocketServer_Close_1100
     * @tc.name   : testNetworkMgrSocketTCPSocketServerClose1100
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
     */
    it('testNetworkMgrSocketTCPSocketServerClose1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose1100';
      console.info(`${caseName} test start`);
      try {
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: Math.round(1024+ Math.random()*5000+Math.random()*4000),
          family: 1
        };
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        await tcpServer.listen(listenAddress).then(()=>{
          console.info(`${caseName} tcpServer listen success`);
        }).catch((err:BusinessError) => {
          console.info(`${caseName} tcpServer  listen failed err is: `+JSON.stringify(err));
          ExpectFail();
          done();
          console.info(`${caseName}---End`);
        })
        tcpServer.on('connect', async (tcpSocketConnection: socket.TCPSocketConnection) => {
          console.log(`${caseName} tcpServer on connect `)
          await tcpSocketConnection.close().then(()=>{
            console.log(`${caseName} tcpClient close success `);
            tcpServer.close().then(()=> {
              console.log(`${caseName} tcpServer close success `);
              ExpectTrue(true);
              done();
            }).catch((err: BusinessError)=>{
              console.log(`${caseName} tcpServer close failed `+ JSON.stringify(err));
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            })
          }).catch((err: BusinessError)=>{
            console.log(`${caseName} tcpClient close failed err is`+ JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          })
        });
        await tcpClient.connect(tcpConnectOptions).catch((err:BusinessError) => {
          console.info(`${caseName} get connect err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).then(()=>{
          console.info(`${caseName} tcpClient  connect success`);
        })
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.number : SUB_NetworkMgr_Socket_TCPSocketServer_Close_1200
     * @tc.name   : testNetworkMgrSocketTCPSocketServerClose1200
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
     */
    it('testNetworkMgrSocketTCPSocketServerClose1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose1000';
      console.info(`${caseName} test start`);
      try {
        let listenAddress: socket.NetAddress = {
          address: '::1',
          port: Math.round(1024+ Math.random()*5000+Math.random()*4000),
          family: 2
        };
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        await tcpServer.listen(listenAddress).then(()=>{
          console.info(`${caseName} tcpServer listen success`);
        }).catch((err:BusinessError) => {
          console.info(`${caseName} tcpServer  listen failed err is: `+JSON.stringify(err));
          ExpectFail();
          done();
          console.info(`${caseName}---End`);
        })
        tcpServer.on('connect', async (tcpSocketConnection: socket.TCPSocketConnection) => {
          console.log(`${caseName} tcpServer on connect `)
          await tcpSocketConnection.close().then(()=>{
            console.log(`${caseName} tcpClient close success `);
            tcpServer.close().then(()=> {
              console.log(`${caseName} tcpServer close success `);
              ExpectTrue(true);
              console.info(`${caseName}---End`);
              done();
            }).catch((err: BusinessError)=>{
              console.log(`${caseName} tcpServer close failed `+ JSON.stringify(err));
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            })
          }).catch((err: BusinessError)=>{
            console.log(`${caseName} tcpClient close failed err is`+ JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          })
        });
        await tcpClient.connect(tcpConnectOptions).catch((err:BusinessError) => {
          console.info(`${caseName} get connect err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).then(()=>{
          console.info(`${caseName} tcpClient  connect success`);
        })
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.number : SUB_NetworkMgr_Socket_TCPSocketServer_Close_1300
     * @tc.name   : testNetworkMgrSocketTCPSocketServerClose1300
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
     */
    it('testNetworkMgrSocketTCPSocketServerClose1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose1300';
      console.info(`${caseName} test start`);
      try {
        let listenAddress: socket.NetAddress = {
          address: '::1',
          port: Math.round(1024+ Math.random()*5000+Math.random()*4000),
          family: 2
        };
        await tcpServer.listen(listenAddress).then(()=>{
          console.info(`${caseName} tcpServer listen success`);
        }).catch((err:BusinessError) => {
          console.info(`${caseName} tcpServer  listen failed err is: `+JSON.stringify(err));
          ExpectFail();
          done();
          console.info(`${caseName}---End`);
        })
        await tcpServer.close().then(()=> {
          console.log(`${caseName} tcpServer close success `);
          ExpectTrue(true);
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError)=>{
          console.log(`${caseName} tcpServer close failed `+ JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        })
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.number : SUB_NetworkMgr_Socket_TCPSocketServer_Close_1400
     * @tc.name   : testNetworkMgrSocketTCPSocketServerClose1400
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
     */
    it('testNetworkMgrSocketTCPSocketServerClose1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose1400';
      console.info(`${caseName} test start`);
      try {
        let listenAddress01: socket.NetAddress = {
          address: '::1',
          port: Math.round(1024+ Math.random()*5000+Math.random()*4000),
          family: 2
        };
        let listenAddress02: socket.NetAddress = {
          address: '127.0.0.1',
          port: Math.round(1024+ Math.random()*5000+Math.random()*4000),
          family: 1
        };
        await tcpServer.listen(listenAddress01).then(()=>{
          console.info(`${caseName} tcpServer listen listenAddress01 success`);
        }).catch((err:BusinessError) => {
          console.info(`${caseName} tcpServer  listen listenAddress01 failed err is: `+JSON.stringify(err));
          ExpectFail();
          done();
          console.info(`${caseName}---End`);
        })
        await tcpServer.listen(listenAddress02).then(()=>{
          console.info(`${caseName} tcpServer listen listenAddress02 success`);
        }).catch((err:BusinessError) => {
          console.info(`${caseName} tcpServer  listen listenAddress02 failed err is: `+JSON.stringify(err));
          ExpectFail();
          done();
          console.info(`${caseName}---End`);
        })
        await tcpServer.close().then(()=> {
          console.log(`${caseName} tcpServer close success `);
          ExpectTrue(true);
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError)=>{
          console.log(`${caseName} tcpServer close failed `+ JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        })
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.number : SUB_NetworkMgr_Socket_TCPSocketServer_Close_1500
     * @tc.name   : testNetworkMgrSocketTCPSocketServerClose1500
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
     */
    it('testNetworkMgrSocketTCPSocketServerClose1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose1500';
      console.info(`${caseName} test start`);
      try {
        let listenAddress: socket.NetAddress = {
          address: '::1',
          port: Math.round(1024+ Math.random()*5000+Math.random()*4000),
          family: 2
        };
        await tcpServer.listen(listenAddress).then(()=>{
          console.info(`${caseName} tcpServer listen success`);
        }).catch((err:BusinessError) => {
          console.info(`${caseName} tcpServer  listen failed err is: `+JSON.stringify(err));
          ExpectFail();
          done();
          console.info(`${caseName}---End`);
        })
        await tcpServer.close().then(()=> {
          console.log(`${caseName} tcpServer close success `);
          tcpServer.close().then(()=> {
            console.log(`${caseName} tcpServer close again success `);
            ExpectTrue(true);
            console.info(`${caseName}---End`);
            done();
          }).catch((err: BusinessError)=>{
            console.log(`${caseName} tcpServer close again failed `+ JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          })
        }).catch((err: BusinessError)=>{
          console.log(`${caseName} tcpServer close failed `+ JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        })
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.number : SUB_NetworkMgr_Socket_TCPSocketServer_Close_1600
     * @tc.name   : testNetworkMgrSocketTCPSocketServerClose1600
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
     */
    it('testNetworkMgrSocketTCPSocketServerClose1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose1600';
      console.info(`${caseName} test start`);
      try {
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        await tcpServer.close().then(()=>{
          console.info(`${caseName} tcpServer  close success`);
          ExpectTrue(true);
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError)=>{
          console.info(`${caseName} tcpServer  close failed`+ JSON.stringify(err));
          ExpectFail();
          done();
          console.info(`${caseName}---End`);
        })
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });


  });
}

