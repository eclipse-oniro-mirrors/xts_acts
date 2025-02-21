// @ts-nocheck
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
import { describe, it, expect, beforeAll, afterAll, afterEach, beforeEach } from 'hypium/index';
import socket from "@ohos.net.socket";

let sendData = "hello!";
let instance = undefined;

let options = {
  ALPNProtocols: ["spdy/1", "http/1.1"],
  address: {
    address: "192.168.31.96",
    port: 5555,
    family: 1
  },
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

  describe("Telephony_NetworkManager_SocketTest", function () {

    beforeAll(async function () {
      console.log('Telephony_NetworkManager_ActsNetworkManagerSocketTest beforeAll start')
      console.log('Telephony_NetworkManager_ActsNetworkManagerSocketTest beforeAll end')
    })

    afterAll(async function () {
      console.log('Telephony_NetworkManager_ActsNetworkManagerSocketTest afterAll start')
      console.log('Telephony_NetworkManager_ActsNetworkManagerSocketTest afterAll end')
    })

    /**
    * @tc.number  Telephony_NetworkManager_constructTLSSocketInstance_0100
    * @tc.name    Test create TLSSocket object
    * @tc.desc    Function test
    */
    it('Telephony_NetworkManager_constructTLSSocketInstance_0100', 0, async function (done) {
      instance = socket.constructTLSSocketInstance()
      if (instance != "") {
        expect(instance).assertInstanceOf('Object');
        done();
      } else {
        expect().assertFail();
        done();
      }
    })

    /**
    * @tc.number  Telephony_NetworkManager_connect_Async_0100
    * @tc.name    Test connect() interface
    * @tc.desc    Function test
    */
    it('Telephony_NetworkManager_connect_Async_0100', 0, async function (done) {
      instance = socket.constructTLSSocketInstance()
      instance.connect(options, (err) => {
        expect(options.ALPNProtocols != undefined).assertEqual(true);
        expect(options.address != undefined).assertEqual(true);
        expect(options.secureOptions != undefined).assertEqual(true);
        expect(options.secureOptions.key != undefined).assertEqual(true);
        expect(options.secureOptions.cert != undefined).assertEqual(true);
        expect(options.secureOptions.ca != undefined).assertEqual(true);
        expect(options.secureOptions.password != undefined).assertEqual(true);
        expect(options.secureOptions.protocols != undefined).assertEqual(true);
        expect(options.secureOptions.protocols[0] == "TLSv1.2").assertEqual(true);
        expect(options.secureOptions.protocols[1] == "TLSv1.3").assertEqual(true);
        expect(options.secureOptions.useRemoteCipherPrefer != undefined).assertEqual(true);
        expect(options.secureOptions.signatureAlgorithms != undefined).assertEqual(true);
        expect(options.secureOptions.cipherSuite != undefined).assertEqual(true);
        expect(socket.X509CertRawData == undefined).assertEqual(true);
        if (err == undefined) {
          expect().assertFail();
          done();
        } else {
          expect(err != undefined).assertEqual(true);
          done();
        }
      })
    })

    /**
    * @tc.number  Telephony_NetworkManager_connect_Promise_0100
    * @tc.name    Test connect() interface
    * @tc.desc    Function test
    */
    it('Telephony_NetworkManager_connect_Promise_0100', 0, async function (done) {
      instance = socket.constructTLSSocketInstance()
      instance.connect(options).then(() => {
        expect().assertFail();
        done();
      }).catch((err) => {
        expect(err != undefined).assertEqual(true);
        done();
      })
    })

    /**
    * @tc.number  Telephony_NetworkManager_close_Async_0100
    * @tc.name    Test close() interface
    * @tc.desc    Function test
    */
    it('Telephony_NetworkManager_close_Async_0100', 0, async function (done) {
      instance = socket.constructTLSSocketInstance()
      instance.close((err) => {
        if (err == undefined) {
          expect().assertFail();
          done();
        } else {
          expect(err != undefined).assertEqual(true);
          done();
        }
      })
    })

    /**
    * @tc.number  Telephony_NetworkManager_close_Promise_0100
    * @tc.name    Test close() interface
    * @tc.desc    Function test
    */
    it('Telephony_NetworkManager_close_Promise_0100', 0, async function (done) {
      instance = socket.constructTLSSocketInstance()
      instance.close().then(() => {
        expect().assertFail();
        done();
      }).catch((err) => {
        expect(err != undefined).assertEqual(true);
        done();
      })
    })

    /**
    * @tc.number  Telephony_NetworkManager_getCertificate_Async_0100
    * @tc.name    Test getCertificate() interface
    * @tc.desc    Function test
    */
    it('Telephony_NetworkManager_getCertificate_Async_0100', 0, async function (done) {
      instance = socket.constructTLSSocketInstance()
      instance.getCertificate((err, data) => {
        if (err == undefined) {
          expect().assertFail();
          done();
        } else {
          expect(data).assertEqual(undefined);
          expect(err != undefined).assertEqual(true);
          done();
        }
      })
    })

    /**
    * @tc.number  Telephony_NetworkManager_getCertificate_Promise_0100
    * @tc.name    Test getCertificate() interface
    * @tc.desc    Function test
    */
    it('Telephony_NetworkManager_getCertificate_Promise_0100', 0, async function (done) {
      instance = socket.constructTLSSocketInstance()
      instance.getCertificate().then((data) => {
        expect(data).assertEqual(undefined);
        expect().assertFail();
        done();
      }).catch((err) => {
        expect(err != undefined).assertEqual(true);
        done();
      })
    })

    /**
    * @tc.number  Telephony_NetworkManager_getRemoteCertificate_Async_0100
    * @tc.name    Test getRemoteCertificate() interface
    * @tc.desc    Function test
    */
    it('Telephony_NetworkManager_getRemoteCertificate_Async_0100', 0, async function (done) {
      instance = socket.constructTLSSocketInstance()
      instance.getRemoteCertificate((err, data) => {
        if (err == undefined) {
          expect().assertFail();
          done();
        } else {
          expect(data).assertEqual(undefined);
          expect(err != undefined).assertEqual(true);
          done();
        }
      })
    })

    /**
    * @tc.number  Telephony_NetworkManager_getRemoteCertificate_Promise_0100
    * @tc.name    Test getRemoteCertificate() interface
    * @tc.desc    Function test
    */
    it('Telephony_NetworkManager_getRemoteCertificate_Promise_0100', 0, async function (done) {
      instance = socket.constructTLSSocketInstance()
      instance.getRemoteCertificate().then((data) => {
        expect(data).assertEqual(undefined);
        expect().assertFail();
        done();
      }).catch((err) => {
        expect(err != undefined).assertEqual(true);
        done();
      })
    })

    /**
    * @tc.number  Telephony_NetworkManager_getProtocol_Async_0100
    * @tc.name    Test getProtocol() interface
    * @tc.desc    Function test
    */
    it('Telephony_NetworkManager_getProtocol_Async_0100', 0, async function (done) {
      instance = socket.constructTLSSocketInstance()
      instance.getProtocol((err, data) => {
        if (err == undefined) {
          expect().assertFail();
          done();
        } else {
          expect(data).assertEqual(undefined);
          expect(err != undefined).assertEqual(true);
          done();
        }
      })
    })

    /**
    * @tc.number  Telephony_NetworkManager_getProtocol_Promise_0100
    * @tc.name    Test getProtocol() interface
    * @tc.desc    Function test
    */
    it('Telephony_NetworkManager_getProtocol_Promise_0100', 0, async function (done) {
      instance = socket.constructTLSSocketInstance()
      instance.getProtocol().then((data) => {
        expect(data).assertEqual(undefined);
        expect().assertFail();
        done();
      }).catch((err) => {
        expect(err != undefined).assertEqual(true);
        done();
      })
    })

    /**
    * @tc.number  Telephony_NetworkManager_getCipherSuites_Async_0100
    * @tc.name    Test getCipherSuite() interface
    * @tc.desc    Function test
    */
    it('Telephony_NetworkManager_getCipherSuites_Async_0100', 0, async function (done) {
      instance = socket.constructTLSSocketInstance()
      instance.getCipherSuite((err, data) => {
        if (err == undefined) {
          expect().assertFail();
          done();
        } else {
          expect(data).assertEqual(undefined);
          expect(err != undefined).assertEqual(true);
          done();
        }
      })
    })

    /**
    * @tc.number  Telephony_NetworkManager_getCipherSuites_Promise_0100
    * @tc.name    Test getCipherSuite() interface
    * @tc.desc    Function test
    */
    it('Telephony_NetworkManager_getCipherSuites_Promise_0100', 0, async function (done) {
      instance = socket.constructTLSSocketInstance()
      instance.getCipherSuite().then((data) => {
        expect(data).assertEqual(undefined);
        expect().assertFail();
        done();
      }).catch((err) => {
        expect(err != undefined).assertEqual(true);
        done();
      })
    })

    /**
    * @tc.number  Telephony_NetworkManager_getSignatureAlgorithms_Async_0100
    * @tc.name    Test getSignatureAlgorithms() interface
    * @tc.desc    Function test
    */
    it('Telephony_NetworkManager_getSignatureAlgorithms_Async_0100', 0, async function (done) {
      instance = socket.constructTLSSocketInstance()
      instance.getSignatureAlgorithms((err, data) => {
        if (err == undefined) {
          expect().assertFail();
          done();
        } else {
          expect(data).assertEqual(undefined);
          expect(err != undefined).assertEqual(true);
          done();
        }
      })
    })

    /**
    * @tc.number  Telephony_NetworkManager_getSignatureAlgorithms_Promise_0100
    * @tc.name    Test getSignatureAlgorithms() interface
    * @tc.desc    Function test
    */
    it('Telephony_NetworkManager_getSignatureAlgorithms_Promise_0100', 0, async function (done) {
      instance = socket.constructTLSSocketInstance()
      instance.getSignatureAlgorithms().then((data) => {
        expect(data).assertEqual(undefined);
        expect().assertFail();
        done();
      }).catch((err) => {
        expect(err != undefined).assertEqual(true);
        done();
      })
    })

    /**
    * @tc.number  Telephony_NetworkManager_send_Async_0100
    * @tc.name    Test send() interface
    * @tc.desc    Function test
    */
    it('Telephony_NetworkManager_send_Async_0100', 0, async function (done) {
      instance = socket.constructTLSSocketInstance()
      instance.send(sendData, (err) => {
        if (err == undefined) {
          expect().assertFail();
          done();
        } else {
          expect(err != undefined).assertEqual(true);
          done();
        }
      })
    })

    /**
    * @tc.number  Telephony_NetworkManager_send_Promise_0100
    * @tc.name    Test send() interface
    * @tc.desc    Function test
    */
    it('Telephony_NetworkManager_send_Promise_0100', 0, async function (done) {
      instance = socket.constructTLSSocketInstance()
      instance.send(sendData).then(() => {
        expect().assertFail();
        done();
      }).catch((err) => {
        expect(err != undefined).assertEqual(true);
        done();
      })
    })
  })
}