/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';
import socket from "@ohos.net.socket";

let address = {
  address: "192.168.0.1",
  port: 5555,
  family: 1
}

let sendOptions1 = {
  data: "hello!",
  encoding: "UTF-8"
}
let sendOptions2 = {
  data: { [Symbol.toStringTag]: "hello" }.toString(),
  encoding: "UTF-8"
}

let TCPExtraOptions = {
  keepAlive: true,
  OOBInline: true,
  TCPNoDelay: true,
  socketLinger: { on: true, linger: 10 },
  receiveBufferSize: 1000,
  sendBufferSize: 1000,
  reuseAddress: true,
  socketTimeout: 3000,
}

function ExpectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    console.info('assertion failure');
  }
}

export default function NetTCPSocketServerTest() {
  describe('NetTCPSocketServerTest', function () {

    /**
     * @tc.number NetworkManager_constructTCPSocketServerInstance_0100
     * @tc.name Test create constructTCPSocketServerInstance object
     * @tc.desc Function test
     */
    it('NetworkManager_constructTCPSocketServerInstance_0100', 0, async function (done) {
      let server = socket.constructTCPSocketServerInstance();
      if (server != undefined) {
        expect(server).assertInstanceOf('Object');
        done();
      } else {
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_listen_Async_0100
     * @tc.name Test listen() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_listen_Async_0100', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_listen_Async_0100';
      let server = socket.constructTCPSocketServerInstance();
      server.listen(address, (err, data) => {
        if (err) {
          console.info(`${caseName} listen failed: ${JSON.stringify(err)}`);
          done();
        } else {
          console.info(`${caseName} listen failed: ${JSON.stringify(data)}`);
          expect(data).assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_listen_Async_0200
     * @tc.name Test listen() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_listen_Async_0200', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_listen_Async_0200';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.listen(null, (err, data) => {
          if (err) {
            console.info(`${caseName} listen failed, err: ${JSON.stringify(err)}`);
            expect(err.code).assertEqual(401);
            done();
          }
        });
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        expect(error.code == 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_listen_Promise_0100
     * @tc.name Test listen() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_listen_Promise_0100', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_listen_Promise_0100';
      let server = socket.constructTCPSocketServerInstance();
      server.listen(address).then((data) => {
        console.info(`${caseName} listen : ${JSON.stringify(data)}`);
        expect(data).assertFail();
        done();
      }).catch((err) => {
        console.info(`${caseName} listen failed: ${JSON.stringify(err)}`);
        done();
      });
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_on_connect_0100
     * @tc.name Test on() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_on_connect_0100', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_on_connect_0100';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', data => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          expect(data.clientId != undefined).assertTrue();
          done();
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_on_connect_0200
     * @tc.name Test on() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_on_connect_0200', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_on_connect_0200';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on(null, data => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          ExpectFalse();
          done();
        });
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        expect(error.code == 401).assertTrue();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_off_connect_0100
     * @tc.name Test off() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_off_connect_0100', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_off_connect_0100';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', data => {
          console.info(`${caseName} + data.clientId`);
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
        });
        server.off('connect', data => {
          console.info(`${caseName} off connect success ${JSON.stringify(data)}`);
          done();
        });
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_off_connect_0200
     * @tc.name Test off() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_off_connect_0200', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_off_connect_0200';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', data => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
        });
        server.off(null, data => {
          console.info(`${caseName} off connect success ${JSON.stringify(data)}`);
          ExpectFalse();
          done();
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        expect(error.code == 401).assertTrue();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_off_connect_0300
     * @tc.name Test off() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_off_connect_0300', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_off_connect_0300';
      let server = socket.constructTCPSocketServerInstance();
      server.on('connect', data => {
        console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
      });
      server.off('connect');
      expect(true).assertTrue();
      done();
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_send_Async_0100
     * @tc.name Test send() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_send_Async_0100', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_send_Async_0100';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          data.send(sendOptions1, (err, data) => {
            if (err) {
              console.info(`${caseName} send err ${JSON.stringify(err)}`);
              ExpectFalse();
              done();
              return;
            } else {
              console.info(`${caseName} send success ${JSON.stringify(data)}`);
              done();
              return;
            }
          });
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_send_Async_0200
     * @tc.name Test send() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_send_Async_0200', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_send_Async_0200';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          data.send(sendOptions2, (err, data) => {
            if (err) {
              console.info(`${caseName} send err ${JSON.stringify(err)}`);
              ExpectFalse();
              done();
              return;
            } else {
              console.info(`${caseName} send success ${JSON.stringify(data)}`);
              done();
              return;
            }
          });
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_send_Async_0300
     * @tc.name Test send() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_send_Async_0300', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_send_Async_0300';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          data.send(null, (err, data) => {
            if (err) {
              console.info(`${caseName} send failed ${JSON.stringify(err)}`);
              done();
              return;
            } else {
              console.info(`${caseName} on send data ${JSON.stringify(data)}`);
              ExpectFalse();
              done();
              return;
            }
          });
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect send error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(401);
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_send_Promise_0100
     * @tc.name Test send() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_send_Promise_0100', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_send_Promise_0100';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          data.send(sendOptions1).then((data) => {
            console.info(`${caseName} send success ${JSON.stringify(data)}`);
            done();
            return;
          }).catch((err) => {
            console.info(`${caseName} on send catch ${JSON.stringify(err)}`);
            ExpectFalse();
            done();
            return;
          });
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_send_Promise_0200
     * @tc.name Test send() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_send_Promise_0200', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_send_Promise_0200';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          data.send(sendOptions2).then((data) => {
            console.info(`${caseName} send success ${JSON.stringify(data)}`);
            done();
            return;
          }).catch((err) => {
            console.info(`${caseName} on send catch ${JSON.stringify(err)}`);
            ExpectFalse();
            done();
            return;
          });
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_close_Async_0100
     * @tc.name Test close() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_close_Async_0100', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_close_Async_0100';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          data.close((err, data) => {
            if (err) {
              ExpectFalse();
              done();
              return;
            } else {
              console.info(`${caseName} close success ${JSON.stringify(data)}`);
              done();
              return;
            }
          });
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_close_Promise_0100
     * @tc.name Test close() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_close_Promise_0100', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_close_Promise_0100';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          data.close().then((data) => {
            console.info(`${caseName} close success ${JSON.stringify(data)}`);
            done();
            return;
          }).catch((err) => {
            console.info(`${caseName} on close catch ${JSON.stringify(err)}`);
            ExpectFalse();
            done();
            return;
          });
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_getRemoteAddress_Async_0100
     * @tc.name Test getRemoteAddress() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_getRemoteAddress_Async_0100', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_getRemoteAddress_Async_0100';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          data.getRemoteAddress((data, err) => {
            if (err) {
              ExpectFalse();
              done();
              return;
            } else {
              console.info(`${caseName} getRemoteAddress success ${JSON.stringify(data)}`);
              done();
              return;
            }
          });
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_getRemoteAddress_Promise_0100
     * @tc.name Test getRemoteAddress() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_getRemoteAddress_Promise_0100', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_getRemoteAddress_Promise_0100';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          data.getRemoteAddress().then((data) => {
            console.info(`${caseName} getRemoteAddress success ${JSON.stringify(data)}`);
            done();
            return;
          }).catch((err) => {
            console.info(`${caseName} on connect catch ${JSON.stringify(err)}`);
            ExpectFalse();
            done();
            return;
          });
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_getState_Async_0100
     * @tc.name Test getState() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_getState_Async_0100', 0, async function (done) {
      let caseName = "NetworkManager_TCPSocketServer_getState_Async_0100";
      let server = socket.constructTCPSocketServerInstance();
      server.getState((err, data) => {
        if (err) {
          console.info(`${caseName} getState err ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        } else {
          console.info(`${caseName} getState data ${JSON.stringify(data)}`);
          expect(data.isBound).assertEqual(false);
          expect(data.isClose).assertEqual(false);
          expect(data.isConnected).assertEqual(false);
          done();
        }
      });
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_getState_Async_0200
     * @tc.name Test getState() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_getState_Async_0200', 0, async function (done) {
      let caseName = "NetworkManager_TCPSocketServer_getState_Async_0200";
      let server = socket.constructTCPSocketServerInstance();
      server.listen(address, (err, data) => {
        if (err) {
          console.info(`${caseName} listen failed: ${JSON.stringify(err)}`);
          done();
        } else {
          console.info(`${caseName} listen data ${JSON.stringify(data)}`);
          server.getState((err, data) => {
            if (err) {
              console.info(`${caseName} getState err ${JSON.stringify(err)}`);
              expect().assertFail();
              done();
            } else {
              console.info(`${caseName} getState data ${JSON.stringify(data)}`);
              expect(data.isBound).assertEqual(false);
              expect(data.isClose).assertEqual(false);
              expect(data.isConnected).assertEqual(false);
              done();
            }
          });
        }
      });
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_getState_Promise_0100
     * @tc.name Test getState() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_getState_Promise_0100', 0, async function (done) {
      let caseName = "NetworkManager_TCPSocketServer_getState_Promise_0100";
      let server = socket.constructTCPSocketServerInstance();
      server.getState().then((data) => {
        console.info(`${caseName} getState data ${JSON.stringify(data)}`);
        expect(data.isBound).assertEqual(false);
        expect(data.isClose).assertEqual(false);
        expect(data.isConnected).assertEqual(false);
        done();
      }).catch((err) => {
        console.info(`${caseName} getState err ${JSON.stringify(err)}`);
        expect(err).assertFail();
        done();
      });
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_getState_Promise_0200
     * @tc.name Test getState() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_getState_Promise_0200', 0, async function (done) {
      let caseName = "NetworkManager_TCPSocketServer_getState_Promise_0200";
      let server = socket.constructTCPSocketServerInstance();
      server.listen(address, (err, data) => {
        if (err) {
          console.info(`${caseName} listen failed: ${JSON.stringify(err)}`);
          done();
        } else {
          console.info(`${caseName} getState data ${JSON.stringify(data)}`);
          server.getState().then((data) => {
            console.info(`${caseName} getState data ${JSON.stringify(data)}`);
            expect(data.isBound).assertEqual(false);
            expect(data.isClose).assertEqual(false);
            expect(data.isConnected).assertEqual(false);
            done();
          }).catch((err) => {
            console.info(`${caseName} getState err ${JSON.stringify(err)}`);
            expect(err).assertFail();
            done();
          });
        }
      });
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_setExtraOptions_Async_0100
     * @tc.name Test setExtraOptions() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_setExtraOptions_Async_0100', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_setExtraOptions_Async_0100';
      let server = socket.constructTCPSocketServerInstance();
      server.setExtraOptions(TCPExtraOptions, (err, data) => {
        if (err) {
          console.info(`${caseName} setExtraOptions failed, err: ${JSON.stringify(err)}`);
          expect(err != undefined).assertEqual(true);
          done();
        } else {
          console.info(`${caseName} setExtraOptions success, data: ${JSON.stringify(data)}`);
          ExpectFalse();
          done();
        }
      });
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_setExtraOptions_Async_0200
     * @tc.name Test setExtraOptions() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_setExtraOptions_Async_0200', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_setExtraOptions_Async_0200';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.setExtraOptions(null, (err, data) => {
          if (err) {
            console.info(`${caseName} setExtraOptions failed, err: ${JSON.stringify(err)}`);
            expect(err.code).assertEqual(401);
            done();
          } else {
            console.info(`${caseName} setExtraOptions success, data: ${JSON.stringify(data)}`);
            expect(data).assertFail();
            done();
          }
        });
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        expect(error.code == 401).assertTrue();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_setExtraOptions_Async_0300
     * @tc.name Test setExtraOptions() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_setExtraOptions_Async_0300', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_setExtraOptions_Async_0300';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.setExtraOptions(TCPExtraOptions, (err, data) => {
          if (err) {
            console.info(`${caseName} setExtraOptions failed, err: ${JSON.stringify(err)}`);
            expect(err != undefined).assertEqual(true);
            done();
          } else {
            console.info(`${caseName} setExtraOptions success, data: ${JSON.stringify(data)}`);
            expect(data).assertFail();
            done();
          }
        });
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_setExtraOptions_Promise_0100
     * @tc.name Test setExtraOptions() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_setExtraOptions_Promise_0100', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_setExtraOptions_Promise_0100';
      let server = socket.constructTCPSocketServerInstance();
      server.setExtraOptions(TCPExtraOptions).then((data) => {
        console.info(`${caseName} setExtraOptions success, data: ${JSON.stringify(data)}`);
        expect(data).assertFail();
        done();
      }).catch((err) => {
        console.info(`${caseName} setExtraOptions failed, err: ${JSON.stringify(err)}`);
        expect(err != undefined).assertEqual(true);
        done();
      });
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_on_message_0100
     * @tc.name Test on() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_on_message_0100', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_on_message_0100';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          try {
            data.on('message', data => {
              console.info(`${caseName} on message success ${JSON.stringify(data)}`);
              expect(typeof (data)).assertEqual('object');
              done();
            });
          } catch (err) {
            console.info(`${caseName} catch err, expect err: [${err.code}, ${err.message}]`);
            ExpectFalse();
            done();
            return;
          }
          data.off('message');
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_on_message_0200
     * @tc.name Test on() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_on_message_0200', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_on_message_0200';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          try {
            data.on(null, data => {
              console.info(`${caseName} on message success ${JSON.stringify(data)}`);
              ExpectFalse();
              done();
            });
          } catch (err) {
            console.info(`${caseName} catch err, expect err: [${err.code}, ${err.message}]`);
            expect(err.code).assertEqual(401);
            done();
            return;
          }
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_off_message_0100
     * @tc.name Test off() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_off_message_0100', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_off_message_0100';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          try {
            data.on('message', data => {
              console.info(`${caseName} on message success ${JSON.stringify(data)}`);
            });
            data.off('message', data => {
              console.info(`${caseName} off message success ${JSON.stringify(data)}`);
              expect(typeof (data)).assertEqual('object');
              done();
            });
          } catch (err) {
            console.info(`${caseName} catch err, expect err: [${err.code}, ${err.message}]`);
            ExpectFalse();
            done();
            return;
          }
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_off_message_0200
     * @tc.name Test off() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_off_message_0200', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_off_message_0200';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          try {
            data.on('message', data => {
              console.info(`${caseName} on message success ${JSON.stringify(data)}`);
            });
            data.off(null, data => {
              console.info(`${caseName} off message success ${JSON.stringify(data)}`);
              ExpectFalse();
              done();
            });
          } catch (error) {
            console.info(`${caseName} catch err, expect err: [${error.code}, ${error.message}]`);
            expect(error.code).assertEqual(401);
            done();
            return;
          }
          data.off('message');
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_off_message_0300
     * @tc.name Test off() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_off_message_0300', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_off_message_0300';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          data.on('message', data => {
            console.info(`${caseName} on message success ${JSON.stringify(data)}`);
          });
          data.off('message');
          expect(true).assertTrue();
          done();
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_on_close_0100
     * @tc.name Test on() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_on_close_0100', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_on_close_0100';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          try {
            data.on('close', data => {
              console.info(`${caseName} on close success ${JSON.stringify(data)}`);
              expect(data != undefined).assertEqual(true);
              done();
            });
          } catch (err) {
            console.info(`${caseName} catch err, expect err: [${err.code}, ${err.message}]`);
            ExpectFalse();
            done();
            return;
          }
          data.off('close');
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_on_close_0200
     * @tc.name Test on() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_on_close_0200', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_on_close_0200';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          try {
            data.on(null, data => {
              console.info(`${caseName} on close success ${JSON.stringify(data)}`);
              ExpectFalse();
              done();
            });
          } catch (err) {
            console.info(`${caseName} catch err, expect err: [${err.code}, ${err.message}]`);
            expect(err.code).assertEqual(401);
            done();
            return;
          }
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_off_close_0100
     * @tc.name Test off() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_off_close_0100', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_off_close_0100';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          try {
            data.on('close', data => {
              console.info(`${caseName} on close success ${JSON.stringify(data)}`);
            });
            data.off('close', data => {
              console.info(`${caseName} off close success ${JSON.stringify(data)}`);
              expect(data != undefined).assertEqual(true);
              done();
            });
          } catch (err) {
            console.info(`${caseName} catch err, expect err: [${err.code}, ${err.message}]`);
            ExpectFalse();
            done();
            return;
          }
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_off_close_0200
     * @tc.name Test off() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_off_close_0200', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_off_close_0200';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          try {
            data.on('close', data => {
              console.info(`${caseName} on close success ${JSON.stringify(data)}`);
            });
            data.off(null, data => {
              console.info(`${caseName} off close success ${JSON.stringify(data)}`);
              ExpectFalse();
              done();
            });
          } catch (err) {
            console.info(`${caseName} catch err, expect err: [${err.code}, ${err.message}]`);
            expect(err.code).assertEqual(401);
            done();
            return;
          }
          data.off('close');
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_off_close_0300
     * @tc.name Test off() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_off_close_0300', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_off_close_0300';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          data.on('close', data => {
            console.info(`${caseName} on close success ${JSON.stringify(data)}`);
          });
          data.off('close');
          expect(true).assertTrue();
          done();
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_on_error_0100
     * @tc.name Test on() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_on_error_0100', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_on_error_0100';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          data.on("error", err => {
            console.info(`${caseName} on err failed, err: ${JSON.stringify(err)}`);
            done();
          });
          data.off("error");
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_on_error_0200
     * @tc.name Test on() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_on_error_0200', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_on_error_0200';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          try {
            data.on(null, err => {
              console.info(`${caseName} on err failed, err: ${JSON.stringify(err)}`);
              expect().assertFail();
              done();
            });
          } catch (error) {
            console.info(`${caseName} catch err, expect err: [${error.code}, ${error.message}]`);
            expect(error.code).assertEqual(401);
            done();
            return;
          }
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_off_error_0100
     * @tc.name Test off() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_off_error_0100', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_off_error_0100';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          data.on("error", err => {
            console.info(`${caseName} on err failed, err: ${JSON.stringify(err)}`);
          });
          data.off("error", err => {
            console.info(`${caseName} off err failed, err: ${JSON.stringify(err)}`);
            done();
          });
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_off_error_0200
     * @tc.name Test off() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_off_error_0200', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_off_error_0200';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          try {
            data.on("error", err => {
              console.info(`${caseName} on err failed, err: ${JSON.stringify(err)}`);
            });
            data.off(null, err => {
              console.info(`${caseName} off err failed, err: ${JSON.stringify(err)}`);
            });
            done();
          } catch (error) {
            console.info(`${caseName} catch err, expect err: [${error.code}, ${error.message}]`);
            expect(error.code).assertEqual(401);
            done();
            return;
          }
          data.off("error");
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_off_error_0300
     * @tc.name Test off() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_off_error_0300', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_off_error_0300';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on('connect', (data) => {
          console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
          data.on("error", err => {
            console.info(`${caseName} on err failed, err: ${JSON.stringify(err)}`);
          });
          data.off("error");
        });
        server.off('connect');
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_on_error_0300
     * @tc.name Test on() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_on_error_0300', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_on_error_0300';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on("error", err => {
          console.info(`${caseName} on err failed, err: ${JSON.stringify(err)}`);
        });
        server.off("error");
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_off_error_0400
     * @tc.name Test off() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_off_error_0400', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_off_error_0400';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on("error", err => {
          console.info(`${caseName} on err failed, err: ${JSON.stringify(err)}`);
        });
        server.off("error", err => {
          console.info(`${caseName} off err failed, err: ${JSON.stringify(err)}`);
        });
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_off_error_0500
     * @tc.name Test off() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_off_error_0500', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_off_error_0500';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on("error", err => {
          console.info(`${caseName} on err failed, err: ${JSON.stringify(err)}`);
        });
        server.off(null, err => {
          console.info(`${caseName} off err failed, err: ${JSON.stringify(err)}`);
        });
        server.off("error");
        done();
      } catch (error) {
        console.info(`${caseName} catch err, expect err: [${error.code}, ${error.message}]`);
        expect(error.code == 401).assertTrue();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocketServer_off_error_0600
     * @tc.name Test off() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocketServer_off_error_0600', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocketServer_off_error_0600';
      let server = socket.constructTCPSocketServerInstance();
      try {
        server.on("error", err => {
          console.info(`${caseName} on err failed, err: ${JSON.stringify(err)}`);
        });
        server.off("error");
        done();
      } catch (error) {
        console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        ExpectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number NetworkManager_TCPSocket_getSocketFd_Async_0100
     * @tc.name Test getSocketFd() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocket_getSocketFd_Async_0100', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocket_getSocketFd_Async_0100';
      let tcp = socket.constructTCPSocketInstance();
      tcp.getSocketFd((err, data) => {
        if (err) {
          console.info(caseName + ' getSocketFd err ' + JSON.stringify(err));
          expect().assertFail();
          done();
        } else {
          console.info(caseName + ' getSocketFd data ' + JSON.stringify(data));
          expect(data != -1).assertTrue();
          done();
        }
      });
    });

    /**
     * @tc.number NetworkManager_TCPSocket_getSocketFd_Promise_0100
     * @tc.name Test getSocketFd() interface
     * @tc.desc Function test
     */
    it('NetworkManager_TCPSocket_getSocketFd_Promise_0100', 0, async function (done) {
      let caseName = 'NetworkManager_TCPSocket_getSocketFd_Promise_0100';
      let tcp = socket.constructTCPSocketInstance();
      tcp.getSocketFd().then((data) => {
        console.info(caseName + ' getSocketFd data ' + JSON.stringify(data));
        expect(data != -1).assertTrue();
        done();
      }).catch((err) => {
        console.info(caseName + ' getSocketFd err ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
    });

  });
}