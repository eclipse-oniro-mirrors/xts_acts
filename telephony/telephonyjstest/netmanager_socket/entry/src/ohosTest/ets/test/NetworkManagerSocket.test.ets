/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import { describe, it, expect, beforeAll, afterAll, Level, Size, TestType } from '@ohos/hypium';
import socket from '@ohos.net.socket';
import { BusinessError } from '@ohos.base';

let sendData = "hello!";
let instance = undefined;



let options:socket.TLSConnectOptions = {
  ALPNProtocols: ["spdy/1", "http/1.1"],
  address: {
    address: "192.168.31.96",
    port: 5555,
    family: 1
  } ,
  secureOptions: {
    key: "key",
    cert: "cert",
    ca: ["ca"],
    password: "123456",
    protocols: [socket.Protocol.TLSv12, socket.Protocol.TLSv13],
    useRemoteCipherPrefer: true,
    signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
    cipherSuite: "AES256-SHA256"
  },
}

export default function networkManagerSocketTest() {

  describe("Telephony_NetworkManager_SocketTest", () => {
    beforeAll(async () => {
      console.log('Telephony_NetworkManager_ActsNetworkManagerSocketTest beforeAll start');
      console.log('Telephony_NetworkManager_ActsNetworkManagerSocketTest beforeAll end');
    });
    afterAll(async () => {
      console.log('Telephony_NetworkManager_ActsNetworkManagerSocketTest afterAll start');
      console.log('Telephony_NetworkManager_ActsNetworkManagerSocketTest afterAll end');
    });
    /**
     * @tc.name   Telephony_NetworkManager_constructTLSSocketInstance_0100
     * @tc.number Telephony_NetworkManager_constructTLSSocketInstance_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_constructTLSSocketInstance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let instance = socket.constructTLSSocketInstance();
      if (instance != null) {
        expect(instance).assertInstanceOf('Object');
        done();
      } else {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_NetworkManager_connect_Async_0100
     * @tc.number Telephony_NetworkManager_connect_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_connect_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let instance = socket.constructTLSSocketInstance();
      instance.connect(options, (err) => {
        expect(options.ALPNProtocols != undefined).assertEqual(true);
        expect(options.address != undefined).assertEqual(true);
        expect(options.secureOptions != undefined).assertEqual(true);
        expect(options.secureOptions.key != undefined).assertEqual(true);
        expect(options.secureOptions.cert != undefined).assertEqual(true);
        expect(options.secureOptions.ca != undefined).assertEqual(true);
        expect(options.secureOptions.password != undefined).assertEqual(true);
        expect(options.secureOptions.protocols != undefined).assertEqual(true);
        // expect(options.secureOptions.protocols[0] == "TLSv1.2").assertEqual(true);
        // expect(options.secureOptions.protocols[1] == "TLSv1.3").assertEqual(true);
        expect(options.secureOptions.useRemoteCipherPrefer != undefined).assertEqual(true);
        expect(options.secureOptions.signatureAlgorithms != undefined).assertEqual(true);
        expect(options.secureOptions.cipherSuite != undefined).assertEqual(true);
        if (err == undefined) {
          expect().assertFail();
          done();
        } else {
          expect(err != undefined).assertEqual(true);
          done();
        }
      });
    });
    /**
     * @tc.name   Telephony_NetworkManager_connect_Promise_0100
     * @tc.number Telephony_NetworkManager_connect_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_connect_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let instance = socket.constructTLSSocketInstance();
      instance.connect(options).then(() => {
        expect().assertFail();
        done();
      }).catch((err:BusinessError) => {
        expect(err != undefined).assertEqual(true);
        done();
      });
    });
    /**
     * @tc.name   Telephony_NetworkManager_close_Async_0100
     * @tc.number Telephony_NetworkManager_close_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_close_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let instance = socket.constructTLSSocketInstance();
      instance.close((err) => {
        if (err == undefined) {
          expect().assertFail();
          done();
        } else {
          expect(err != undefined).assertEqual(true);
          done();
        }
      });
    });
    /**
     * @tc.name   Telephony_NetworkManager_close_Promise_0100
     * @tc.number Telephony_NetworkManager_close_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_close_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let instance = socket.constructTLSSocketInstance();
      instance.close().then(() => {
        expect().assertFail();
        done();
      }).catch((err:BusinessError) => {
        expect(err != undefined).assertEqual(true);
        done();
      });
    });
    /**
     * @tc.name   Telephony_NetworkManager_getCertificate_Async_0100
     * @tc.number Telephony_NetworkManager_getCertificate_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_getCertificate_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let instance = socket.constructTLSSocketInstance();
      instance.getCertificate((err, X509CertRawData) => {
        if (err == undefined) {
          expect().assertFail();
          done();
        } else {
          expect(X509CertRawData).assertEqual(undefined);
          expect(err != undefined).assertEqual(true);
          done();
        }
      });
    });
    /**
     * @tc.name   Telephony_NetworkManager_getCertificate_Promise_0100
     * @tc.number Telephony_NetworkManager_getCertificate_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_getCertificate_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let instance = socket.constructTLSSocketInstance();
      instance.getCertificate().then((data) => {
        expect(data).assertEqual(undefined);
        expect().assertFail();
        done();
      }).catch((err:BusinessError) => {
        expect(err != undefined).assertEqual(true);
        done();
      });
    });
    /**
     * @tc.name   Telephony_NetworkManager_getRemoteCertificate_Async_0100
     * @tc.number Telephony_NetworkManager_getRemoteCertificate_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_getRemoteCertificate_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let instance = socket.constructTLSSocketInstance();
      instance.getRemoteCertificate((err, data) => {
        if (err == undefined) {
          expect().assertFail();
          done();
        } else {
          expect(data).assertEqual(undefined);
          expect(err != undefined).assertEqual(true);
          done();
        }
      });
    });
    /**
     * @tc.name   Telephony_NetworkManager_getRemoteCertificate_Promise_0100
     * @tc.number Telephony_NetworkManager_getRemoteCertificate_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_getRemoteCertificate_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let instance = socket.constructTLSSocketInstance();
      instance.getRemoteCertificate().then((data) => {
        expect(data).assertEqual(undefined);
        expect().assertFail();
        done();
      }).catch((err:BusinessError) => {
        expect(err != undefined).assertEqual(true);
        done();
      });
    });
    /**
     * @tc.name   Telephony_NetworkManager_getProtocol_Async_0100
     * @tc.number Telephony_NetworkManager_getProtocol_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_getProtocol_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let instance = socket.constructTLSSocketInstance();
      instance.getProtocol((err, data) => {
        if (err == undefined) {
          expect().assertFail();
          done();
        } else {
          expect(data).assertEqual(undefined);
          expect(err != undefined).assertEqual(true);
          done();
        }
      });
    });
    /**
     * @tc.name   Telephony_NetworkManager_getProtocol_Promise_0100
     * @tc.number Telephony_NetworkManager_getProtocol_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_getProtocol_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let instance = socket.constructTLSSocketInstance();
      instance.getProtocol().then((data) => {
        expect(data).assertEqual(undefined);
        expect().assertFail();
        done();
      }).catch((err:BusinessError) => {
        expect(err != undefined).assertEqual(true);
        done();
      });
    });
    /**
     * @tc.name   Telephony_NetworkManager_getCipherSuites_Async_0100
     * @tc.number Telephony_NetworkManager_getCipherSuites_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_getCipherSuites_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let instance = socket.constructTLSSocketInstance();
      instance.getCipherSuite((err, data) => {
        if (err == undefined) {
          expect().assertFail();
          done();
        } else {
          expect(data).assertEqual(undefined);
          expect(err != undefined).assertEqual(true);
          done();
        }
      });
    });
    /**
     * @tc.name   Telephony_NetworkManager_getCipherSuites_Promise_0100
     * @tc.number Telephony_NetworkManager_getCipherSuites_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_getCipherSuites_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let instance = socket.constructTLSSocketInstance();
      instance.getCipherSuite().then((data) => {
        expect(data).assertEqual(undefined);
        expect().assertFail();
        done();
      }).catch((err:BusinessError) => {
        expect(err != undefined).assertEqual(true);
        done();
      });
    });
    /**
     * @tc.name   Telephony_NetworkManager_getSignatureAlgorithms_Async_0100
     * @tc.number Telephony_NetworkManager_getSignatureAlgorithms_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_getSignatureAlgorithms_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let instance = socket.constructTLSSocketInstance();
      instance.getSignatureAlgorithms((err, data) => {
        if (err == undefined) {
          expect().assertFail();
          done();
        } else {
          expect(data).assertEqual(undefined);
          expect(err != undefined).assertEqual(true);
          done();
        }
      });
    });
    /**
     * @tc.name   Telephony_NetworkManager_getSignatureAlgorithms_Promise_0100
     * @tc.number Telephony_NetworkManager_getSignatureAlgorithms_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_getSignatureAlgorithms_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let instance = socket.constructTLSSocketInstance();
      instance.getSignatureAlgorithms().then((data) => {
        expect(data).assertEqual(undefined);
        expect().assertFail();
        done();
      }).catch((err:BusinessError) => {
        expect(err != undefined).assertEqual(true);
        done();
      });
    });
    /**
     * @tc.name   Telephony_NetworkManager_send_Async_0100
     * @tc.number Telephony_NetworkManager_send_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_send_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let instance = socket.constructTLSSocketInstance();
      instance.send(sendData, (err) => {
        if (err == undefined) {
          expect().assertFail();
          done();
        } else {
          expect(err != undefined).assertEqual(true);
          done();
        }
      });
    });
    /**
     * @tc.name   Telephony_NetworkManager_send_Promise_0100
     * @tc.number Telephony_NetworkManager_send_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_send_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let instance = socket.constructTLSSocketInstance();
      instance.send(sendData).then(() => {
        expect().assertFail();
        done();
      }).catch((err:BusinessError) => {
        expect(err != undefined).assertEqual(true);
        done();
      });
    });
    /**
     * @tc.name   Telephony_TLSSocket_on_message_0100
     * @tc.number Telephony_TLSSocket_on_message_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_TLSSocket_on_message_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let tls = socket.constructTLSSocketInstance();
        tls.on('message', value => {
          console.log('message: ' + JSON.stringify(value.message));
          console.log('remoteInfo: ' + JSON.stringify(value.remoteInfo));
        });
        done();
      } catch (err) {
        expect(true).assertFalse();
        done();
      }
    });
    /**
     * @tc.name   Telephony_TLSSocket_off_message_0100
     * @tc.number Telephony_TLSSocket_off_message_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_TLSSocket_off_message_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let tls = socket.constructTLSSocketInstance();
        tls.on('message',value => {
          console.log('message: ' + JSON.stringify(value.message));
          console.log('remoteInfo: ' + JSON.stringify(value.remoteInfo));
        });
        tls.off('message',value=>{
          console.log('message: ' + JSON.stringify(value.message));
          console.log('remoteInfo: ' + JSON.stringify(value.remoteInfo));
        })
        done();
      } catch (err) {
        expect(true).assertFalse();
        done();
      }
    });
    /**
     * @tc.name   Telephony_TLSSocket_on_connect_on_close_0100
     * @tc.number Telephony_TLSSocket_on_connect_on_close_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_TLSSocket_on_connect_on_close_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let tls = socket.constructTLSSocketInstance();
        tls.on('connect', () => {
          console.log("on connect success");
        });
        tls.on('close', () => {
          console.log("on close success");
        });
        done();
      } catch (err) {
        expect(true).assertFalse();
        done();
      }
    });
    /**
     * @tc.name   Telephony_TLSSocket_off_connect_off_close_0100
     * @tc.number Telephony_TLSSocket_off_connect_off_close_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_TLSSocket_off_connect_off_close_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let tls = socket.constructTLSSocketInstance();
        let callback1 = () => {
          console.log("on connect success");
        };
        tls.on('connect', callback1);
        tls.off('connect', callback1);
        tls.off('connect');
        let callback2 = () => {
          console.log("on close success");
        };
        tls.on('close', callback2);
        tls.off('close', callback2);
        done();
      } catch (err) {
        expect(true).assertFalse();
        done();
      }
    });
    /**
     * @tc.name   Telephony_TLSSocket_on_error_0100
     * @tc.number Telephony_TLSSocket_on_error_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_TLSSocket_on_error_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let tls = socket.constructTLSSocketInstance();
        tls.on('error', err => {
          console.log("on error, err:" + JSON.stringify(err));
        });
        done();
      } catch (err) {
        expect(true).assertFalse();
        done();
      }
    });
    /**
     * @tc.name   Telephony_TLSSocket_off_error_0100
     * @tc.number Telephony_TLSSocket_off_error_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_TLSSocket_off_error_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let tls = socket.constructTLSSocketInstance();
        let callback = (err:BusinessError) => {
          console.log("on error, err:" + JSON.stringify(err));
        };
        tls.on('error', callback);
        tls.off('error', callback);
        done();
      } catch (err) {
        expect(true).assertFalse();
        done();
      }
    });
  })
}