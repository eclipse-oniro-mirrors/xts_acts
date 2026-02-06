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

import { socket } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

let smtpServer163: socket.NetAddress = {
  address: "smtp.163.com", port: 25
}

let httpsWebSite: socket.NetAddress = {
  address: "www.baidu.com", port: 443
}

let httpWebSite: socket.NetAddress = {
  address: "www.baidu.com", port: 80
}

let localServer: socket.NetAddress = {
  address: "127.0.0.1", port: 8080
}

function msgToString(value: socket.SocketMessageInfo): string {
  let messageView = '';
  let uint8Array = new Uint8Array(value.message)
  for (let i: number = 0; i < value.message.byteLength; i++) {
    messageView += String.fromCharCode(uint8Array[i]);
  }
  return messageView
}

function formatErrMsg(err: BusinessError): string {
  return `{"code": ${err.code}, "message":"${err.message}}"`;
}

function expectSuccess(): void {
  expect(true).assertTrue();
}

function expectFail(info: string = ''): void {
  try {
    expect(false).assertTrue();
  } catch (err) {
    console.info(`test failed: ${info}`);
  }
};

function expectTrue(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    console.info(`test failed: ${info}`);
  }
};

function expectFalse(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertFalse();
  } catch (err) {
    console.info(`test failed: ${info}`);
  }
};

function expectEqual(exp: string | number | boolean, assert: string | number | boolean, info: string = ''): void {
  try {
    console.info('JSON.stringify(exp),JSON.stringify(assert)' + JSON.stringify(exp), JSON.stringify(assert))
    expect(exp).assertEqual(assert);
  } catch (err) {
    console.info(`test failed: ${info}`);
  }
};

export default function TLSSocketUpgradeTest() {
  describe('TLSSocketUpgradeTest', () => {

    /**
     * @tc.name   testSTARTTLSWith163Com
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketUpgrade_STARTTLS_0100
     * @tc.desc   Test STARTTLS feature by visiting smtp.163.com
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSTARTTLSWith163Com', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const testName = 'testSTARTTLSWith163Com '
      const printLog = (msg: string) => {
        console.info("testSTARTTLSWith163Com " + msg)
      }

      const handleStartTLS = (sock: socket.TCPSocket): void => {
        let tlsOpts: socket.TLSConnectOptions = {
          address: smtpServer163,
          secureOptions: {} as socket.TLSSecureOptions
        };

        try {
          let tlsSock: socket.TLSSocket = socket.constructTLSSocketInstance(sock);
          tlsSock.on('message', (value: socket.SocketMessageInfo) => {
            let message = msgToString(value)
            if (message.search("250-AUTH") >= 0) {
              expectSuccess();
              tlsSock.close();
              done();
            } else if (message.search("250") >= 0) {
              printLog("waiting for 250-AUTH")
            } else {
              expectFail(testName + `Unsupported CMD2: ${message}`);
              tlsSock.close();
              done();
            }
          });

          tlsSock.connect(tlsOpts).then(() => {
            printLog("success to start tls")
            tlsSock.send("EHLO Jonny\r\n").then().catch((err: BusinessError) => {
              tlsSock.close()
              expectFail(testName + formatErrMsg(err))
              done();
            });
          }).catch((err: BusinessError) => {
            expectFail(testName + formatErrMsg(err))
            done();
          });
        } catch (err) {
          sock.close()
          expectFail(testName + formatErrMsg(err))
          done();
        }
      }

      let tcpOpts: socket.TCPConnectOptions = {
        address: smtpServer163
      }
      let sock: socket.TCPSocket = socket.constructTCPSocketInstance();
      sock.on('message', (value: socket.SocketMessageInfo) => {
        let message = msgToString(value)
        if (message.search("Coremail System") >= 0 || message.search("Mail Server") >= 0) {
          sock.send({
            data: "EHLO Jonny\r\n"
          }).then().catch((err: BusinessError) => {
            sock.close()
            expectFail(testName + formatErrMsg(err))
            done();
          });
        } else if (message.search("250-STARTTLS") >= 0) {
          sock.send({
            data: "STARTTLS\r\n"
          }).then().catch((err: BusinessError) => {
            sock.close()
            expectFail(testName + formatErrMsg(err))
            done();
          });
        } else if (message.search("Ready to start TLS") >= 0) {
          printLog("ready to start TLS")
          handleStartTLS(sock)
        } else if (message.search("250") >= 0) {
          printLog("waiting for 250-STARTTLS")
        } else {
          sock.close()
          expectFail(testName + `Unsupported CMD1: ${message}`)
          done();
        }
      });

      sock.connect(tcpOpts).then(() => {
        printLog("success to connect to smtp.163.com")
      }).catch((err: BusinessError) => {
        expectFail(testName + formatErrMsg(err))
        done();
      });
    });

    /**
     * @tc.name   testOneWayTLSWithBaidu
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketUpgrade_OneWayTLS_0100
     * @tc.desc   Test oneway TLS with upgraded TLSSocket by visiting baidu.com
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOneWayTLSWithBaidu', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const testName = 'testOneWayTLSWithBaidu '
      const printLog = (msg: string) => {
        console.info(testName + msg)
      }

      let tcpOpts: socket.TCPConnectOptions = {
        address: httpsWebSite
      }
      let sock: socket.TCPSocket = socket.constructTCPSocketInstance();
      sock.connect(tcpOpts).then(() => {
        printLog("success to connect to www.baidu.com")
        let tlsOpts: socket.TLSConnectOptions = {
          address: httpsWebSite,
          secureOptions: {} as socket.TLSSecureOptions
        };

        try {
          let tlsSock: socket.TLSSocket = socket.constructTLSSocketInstance(sock);
          tlsSock.connect(tlsOpts).then(() => {
            printLog("success to upgrade to TLSSocket")
            tlsSock.close();
            expectSuccess();
            done();
          }).catch((err: BusinessError) => {
            expectFail(testName + formatErrMsg(err))
            done();
          });
        } catch (err) {
          sock.close()
          expectFail(testName + formatErrMsg(err))
          done();
        }
      }).catch((err: BusinessError) => {
        expectFail(testName + formatErrMsg(err))
        done();
      });
    });

    /**
     * @tc.name   testUpgradeWithNotConnectedTCPSocket
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketUpgrade_NotConnectedTCPSocket_0100
     * @tc.desc   Test upgrading TLSSocket with not connected TCPSocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUpgradeWithNotConnectedTCPSocket', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const testName = 'testUpgradeWithNotConnectedTCPSocket '
      const printLog = (msg: string) => {
        console.info(testName + msg)
      }

      let sock: socket.TCPSocket = socket.constructTCPSocketInstance();
      sock.bind({
        address: "127.0.0.1"
      }).then(() => {
        try {
          let tlsSock: socket.TLSSocket = socket.constructTLSSocketInstance(sock);
          expectFail(testName + "TLSSocket is constructed, but it should not be happened")
          done();
        } catch (err) {
          if ((err as BusinessError).code == 2303602) {
            printLog(formatErrMsg(err))
            expectSuccess();
          } else {
            expectFail(testName + formatErrMsg(err))
          }
          done();
        }
      });
    });

    /**
     * @tc.name   testUpgradeWithClosedTCPSocket
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketUpgrade_ClosedTCPSocket_0100
     * @tc.desc   Test upgrading TLSSocket with closed TCPSocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUpgradeWithClosedTCPSocket', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const testName = 'testUpgradeWithClosedTCPSocket '
      const printLog = (msg: string) => {
        console.info(testName + msg)
      }

      let tcpOpts: socket.TCPConnectOptions = {
        address: httpsWebSite
      }
      let sock: socket.TCPSocket = socket.constructTCPSocketInstance();
      sock.connect(tcpOpts).then(() => {
        printLog("success to connect to www.baidu.com")
        sock.close(() => {
          printLog("success to close connection")
          try {
            let tls: socket.TLSSocket = socket.constructTLSSocketInstance(sock);
            expectFail(testName + "TLSSocket is constructed, but it should not be happened")
            done();
          } catch (err) {
            if ((err as BusinessError).code == 2303601) {
              printLog(formatErrMsg(err))
              expectSuccess();
            } else {
              expectFail(testName + formatErrMsg(err))
            }
            done();
          }
        })
      }).catch((err: BusinessError) => {
        expectFail(testName + formatErrMsg(err))
        done();
      });
    });

    /**
     * @tc.name   testUpgradeWithUDPSocket
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketUpgrade_UDPSocket_0100
     * @tc.desc   Test upgrading TLSSocket with UDPSocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUpgradeWithUDPSocket', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const testName = 'testUpgradeWithUDPSocket '
      const printLog = (msg: string) => {
        console.info(testName + msg)
      }

      let sock: socket.UDPSocket = socket.constructUDPSocketInstance();
      sock.bind({
        address: "127.0.0.1"
      }).then(() => {
        try {
          let tls: socket.TLSSocket = socket.constructTLSSocketInstance(sock);
          expectFail(testName + "TLSSocket is constructed, but it should not be happened")
          done();
        } catch (err) {
          if ((err as BusinessError).code == 401) {
            printLog(formatErrMsg(err))
            expectSuccess();
          } else {
            expectFail(testName + formatErrMsg(err))
          }
          done();
        }
      }).catch((err: BusinessError) => {
        expectFail(testName + formatErrMsg(err))
        done();
      });
    });

    /**
     * @tc.name   testUpgradeWithNumber
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketUpgrade_ParaNumber_0100
     * @tc.desc   Test upgrading TLSSocket with parameter number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUpgradeWithNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const testName = 'testUpgradeWithNumber '
      const printLog = (msg: string) => {
        console.info(testName + msg)
      }

      try {
        let tls: socket.TLSSocket = socket.constructTLSSocketInstance(123456);
        expectFail(testName + "TLSSocket is constructed, but it should not be happened")
        done();
      } catch (err) {
        if ((err as BusinessError).code == 401) {
          printLog(formatErrMsg(err))
          expectSuccess();
        } else {
          expectFail(testName + formatErrMsg(err))
        }
        done();
      }
    });

    /**
     * @tc.name   testUpgradeWithString
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketUpgrade_ParaString_0100
     * @tc.desc   Test upgrading TLSSocket with parameter string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUpgradeWithString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const testName = 'testUpgradeWithString '
      const printLog = (msg: string) => {
        console.info(testName + msg)
      }

      try {
        let tls: socket.TLSSocket = socket.constructTLSSocketInstance("hello");
        expectFail(testName + "TLSSocket is constructed, but it should not be happened")
        done();
      } catch (err) {
        if ((err as BusinessError).code == 401) {
          printLog(formatErrMsg(err))
          expectSuccess();
        } else {
          expectFail(testName + formatErrMsg(err))
        }
        done();
      }
    });

    /**
     * @tc.name   testUpgradeWithInvalidObject
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketUpgrade_ParaObject_0100
     * @tc.desc   Test upgrading TLSSocket with invalid object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUpgradeWithInvalidObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const testName = 'testUpgradeWithInvalidObject '
      const printLog = (msg: string) => {
        console.info(testName + msg)
      }

      try {
        let tls: socket.TLSSocket = socket.constructTLSSocketInstance(localServer);
        expectFail(testName + "TLSSocket is constructed, but it should not be happened")
        done();
      } catch (err) {
        if ((err as BusinessError).code == 401) {
          printLog(formatErrMsg(err))
          expectSuccess();
        } else {
          expectFail(testName + formatErrMsg(err))
        }
        done();
      }
    });

    /**
     * @tc.name   testConnectToNoSSLServer
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketUpgrade_NoSSLServer_0100
     * @tc.desc   Test connecting to HTTP server with upgraded TLSSocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConnectToNoSSLServer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const testName = 'testConnectToNoSSLServer '
      const printLog = (msg: string) => {
        console.info(testName + msg)
      }

      let tcpOpts: socket.TCPConnectOptions = {
        address: httpWebSite
      }
      let sock: socket.TCPSocket = socket.constructTCPSocketInstance();
      sock.connect(tcpOpts).then(() => {
        printLog("success to connect to httpforever.com")
        try {
          let tlsOpts: socket.TLSConnectOptions = {
            address: httpWebSite,
            secureOptions: {} as socket.TLSSecureOptions
          };

          let tlsSock: socket.TLSSocket = socket.constructTLSSocketInstance(sock);
          tlsSock.connect(tlsOpts).then(() => {
            expectFail(testName + "TLS connect OK, but it should not be happened")
            done();
          }).catch((err: BusinessError) => {
            printLog(formatErrMsg(err))
            expectSuccess();
            done();
          });
        } catch (err) {
          expectFail(testName + formatErrMsg(err))
          done();
        }
      }).catch((err: BusinessError) => {
        expectFail(testName + formatErrMsg(err))
        done();
      });
    });

    /**
     * @tc.name   testConcurrentUpgradeAndCloseTCPSocket
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketUpgrade_ConcurrentUpgradeClosed_0100
     * @tc.desc   Test upgrade and close Socket concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConcurrentUpgradeAndCloseTCPSocket', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const testName = 'testConcurrentUpgradeAndCloseTCPSocket '
      const printLog = (msg: string) => {
        console.info(testName + msg)
      }

      let tcpOpts: socket.TCPConnectOptions = {
        address: httpsWebSite
      }
      let sock: socket.TCPSocket = socket.constructTCPSocketInstance();
      sock.connect(tcpOpts).then(() => {
        printLog("success to connect to www.baidu.com")
        sock.close()
        try {
          let tls: socket.TLSSocket = socket.constructTLSSocketInstance(sock);
          printLog("TLSSocket is constructed before TCPSocket close")
          expectSuccess();
          done();
        } catch (err) {
          if ((err as BusinessError).code == 2303601 || (err as BusinessError).code == 2303602) {
            printLog(formatErrMsg(err))
            expectSuccess();
          } else {
            expectFail(testName + formatErrMsg(err))
          }
          done();
        }
      }).catch((err: BusinessError) => {
        expectFail(testName + formatErrMsg(err))
        done();
      });
    });

    /**
     * @tc.name   testConcurrentUpgradeAndSendTCPSocket
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketUpgrade_ConcurrentUpgradeSend_0100
     * @tc.desc   Test upgrade and send Socket concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConcurrentUpgradeAndSendTCPSocket', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const testName = 'testConcurrentUpgradeAndSendTCPSocket '
      const printLog = (msg: string) => {
        console.info(testName + msg)
      }

      let tcpOpts: socket.TCPConnectOptions = {
        address: httpsWebSite
      }
      let sock: socket.TCPSocket = socket.constructTCPSocketInstance();
      sock.connect(tcpOpts).then(() => {
        printLog("success to connect to www.baidu.com")
        sock.send({
          data: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        })
        sock.send({
          data: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        })
        sock.send({
          data: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        })
        try {
          let tlsOpts: socket.TLSConnectOptions = {
            address: httpsWebSite,
            secureOptions: {} as socket.TLSSecureOptions
          };

          let tlsSock: socket.TLSSocket = socket.constructTLSSocketInstance(sock);
          tlsSock.connect(tlsOpts).then(() => {
            printLog("TLS connect OK")
            tlsSock.close()
            expectSuccess();
            done();
          }).catch((err: BusinessError) => {
            if (err.code == 2303501 || err.code == 2303505) {
              printLog(formatErrMsg(err))
              expectSuccess();
            } else {
              expectFail(testName + formatErrMsg(err))
            }
            done();
          });
        } catch (err) {
          expectFail(testName + formatErrMsg(err))
          sock.close()
          done();
        }
      }).catch((err: BusinessError) => {
        expectFail(testName + formatErrMsg(err))
        done();
      });
    });

    /**
     * @tc.name   testConcurrentUpgrade10TCPSocket
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketUpgrade_Concurrent10Upgrade_0100
     * @tc.desc   Test upgrade 10 Sockets concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConcurrentUpgrade10TCPSocket', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const testName = 'testConcurrentUpgrade10TCPSocket '
      const printLog = (msg: string) => {
        console.info(testName + msg)
      }

      let count: number = 0;
      let tcpOpts: socket.TCPConnectOptions = {
        address: httpsWebSite
      }

      for (let i = 0; i < 10; i++) {
        let sock: socket.TCPSocket = socket.constructTCPSocketInstance();
        sock.connect(tcpOpts).then(() => {
          try {
            let tlsOpts: socket.TLSConnectOptions = {
              address: httpsWebSite,
              secureOptions: {} as socket.TLSSecureOptions
            };
            let tls: socket.TLSSocket = socket.constructTLSSocketInstance(sock);
            tls.connect(tlsOpts).then(() => {
              count++;
              printLog("success to upgrade: " + count.toString() + " TCPSocket")
              if (count == 10) {
                tls.close()
                expectSuccess();
                done();
              }
            }).catch((err: BusinessError) => {
              expectFail(testName + formatErrMsg(err))
              done();
            })
          } catch (err) {
            sock.close()
            expectFail(testName + formatErrMsg(err))
            done();
          }
        }).catch((err: BusinessError) => {
          expectFail(testName + formatErrMsg(err))
          done();
        });
      }
    });

    /**
     * @tc.name   testTCPSocketSendAfterUpgrade
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketUpgrade_SendAfterUpgrade_0100
     * @tc.desc   Test TCPSocket send after upgraded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTCPSocketSendAfterUpgrade', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const testName = 'testTCPSocketSendAfterUpgrade '
      const printLog = (msg: string) => {
        console.info(testName + msg)
      }

      let tcpOpts: socket.TCPConnectOptions = {
        address: httpsWebSite
      }
      let sock: socket.TCPSocket = socket.constructTCPSocketInstance();
      sock.connect(tcpOpts).then(() => {
        printLog("success to connect to www.baidu.com")
        sock.send({
          data: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        })
        sock.send({
          data: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        })
        sock.send({
          data: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        })

        try {
          let tlsSock: socket.TLSSocket = socket.constructTLSSocketInstance(sock);
          sock.send({
            data: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
          }).then(() => {
            printLog("TCP send OK")
            tlsSock.close()
            expectFail(testName + "TCPSocket send ok, but it should not be happened")
            done();
          }).catch((err: BusinessError) => {
            if (err.code == 2301009 || err.code == 2301011) {
              printLog(formatErrMsg(err))
              expectSuccess();
            } else {
              expectFail(testName + formatErrMsg(err))
            }
            done();
          });
        } catch (err) {
          expectFail(testName + formatErrMsg(err))
          sock.close()
          done();
        }
      }).catch((err: BusinessError) => {
        expectFail(testName + formatErrMsg(err))
        done();
      });
    });

    /**
     * @tc.name   testTLSSocketSendAfterUpgradeNotConnect
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketUpgrade_SendAfterUpgrade_0100
     * @tc.desc   Test upgraded TLSSocket send before connect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTLSSocketSendAfterUpgradeNotConnect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const testName = 'testTLSSocketSendAfterUpgradeNotConnect '
      const printLog = (msg: string) => {
        console.info(testName + msg)
      }

      let tcpOpts: socket.TCPConnectOptions = {
        address: httpsWebSite
      }
      let sock: socket.TCPSocket = socket.constructTCPSocketInstance();
      sock.connect(tcpOpts).then(() => {
        printLog("success to connect to www.baidu.com")
        sock.send({
          data: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        })
        sock.send({
          data: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        })
        sock.send({
          data: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        })

        try {
          let tlsSock: socket.TLSSocket = socket.constructTLSSocketInstance(sock);
          tlsSock.send("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX").then(() => {
            printLog("TLS send OK")
            tlsSock.close()
            expectFail(testName + "TLSSocket send ok, but it should not be happened")
            done();
          }).catch((err: BusinessError) => {
            if (err.code == 2303501) {
              printLog(formatErrMsg(err))
              expectSuccess();
            } else {
              expectFail(testName + formatErrMsg(err))
            }
            done();
          });
        } catch (err) {
          expectFail(testName + formatErrMsg(err))
          sock.close()
          done();
        }
      }).catch((err: BusinessError) => {
        expectFail(testName + formatErrMsg(err))
        done();
      });
    });

  })
}
