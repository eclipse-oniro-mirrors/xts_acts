/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import { describe, it, expect, Level, Size, TestType} from '@ohos/hypium';
import socket from '@ohos.net.socket';
import { BusinessError} from '@ohos.base';

let client_ca: string =
  "-----BEGIN CERTIFICATE-----\n" +
    "MIIDszCCApugAwIBAgIUIuYbMYsyGoVMZvmmyMjJajq8BC4wDQYJKoZIhvcNAQEL\n" +
    "BQAwaTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG\n" +
    "A1UECgwDQ09NMQowCAYDVQQLDAFXMQowCAYDVQQDDAFXMRowGAYJKoZIhvcNAQkB\n" +
    "FgszMjFAMzIxLmNvbTAeFw0yNTAyMDcwOTQ0MTFaFw0zNTAyMDUwOTQ0MTFaMGkx\n" +
    "CzAJBgNVBAYTAkNOMQswCQYDVQQIDAJHRDELMAkGA1UEBwwCU1oxDDAKBgNVBAoM\n" +
    "A0NPTTEKMAgGA1UECwwBVzEKMAgGA1UEAwwBVzEaMBgGCSqGSIb3DQEJARYLMzIx\n" +
    "QDMyMS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQD0ndDfq1m4\n" +
    "aRXk9kpKzBVtEdtovVj1jGF38i2lbaz7PzRp7c1BKoYceduchFlM7ISu9EsLOj2F\n" +
    "lUNHa2/B5fMiTU6Nnvy5REUpxONW3FtLNM2u5G7XrU5Dd39JGVpUKcj+5l2DU8nR\n" +
    "R9tbOhCkAmEYcsW0mUt/fSkVjQ//ooslvaDsZp4DvSt3E26S0k8yqjQL1BSzjiiW\n" +
    "stAq0S+fqMhWYbwU4Ze8I5/HZUN1mgSgr72vxEXnWBfu8M7rAWrCWrlaDIlbO76r\n" +
    "zyKBLsluFrluHkQYRq1yv4ICpA06atGX9KXV2cp0DzRCGVtl5GaGEUzzudZQ0hB+\n" +
    "rRyGGT+bw25LAgMBAAGjUzBRMB0GA1UdDgQWBBTi9Hh5GsXLZfAwmDeHwO5Lpd3K\n" +
    "WjAfBgNVHSMEGDAWgBTi9Hh5GsXLZfAwmDeHwO5Lpd3KWjAPBgNVHRMBAf8EBTAD\n" +
    "AQH/MA0GCSqGSIb3DQEBCwUAA4IBAQCx8lzV3JNGXpLt/byOpy6zxNBKyH8aQyn4\n" +
    "kHIQaOGe1rwBr/OxqLJ1EK5jVnsT8kkD+IcuUmo7xgy2HGeJsw2525qSk/OCRQXX\n" +
    "tZyLyphOnPczouNVDYEZkva1rpXZi248Z4TO7pYN7ibS6RKysXYCKmBag1W7INPh\n" +
    "uJrll1iLdIfGu9aUnq/Q9CLmwvLLWeNFTtCiil0RsiNRd9kEDJStca5lb566zfbc\n" +
    "kW22FwRilLKpl7Aa5J2kfp+3p2bJxe9B+JBB/6X4WtpetReuccbNh+cAwihBD4nU\n" +
    "+lbc8BaYcD7VbqlnvvYaPqLn6JFH1lPgGgErx8rmkMS3N67qegmS\n" +
    "-----END CERTIFICATE-----"

let client_key: string =
  "-----BEGIN PRIVATE KEY-----\n" +
    "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQD0ndDfq1m4aRXk\n" +
    "9kpKzBVtEdtovVj1jGF38i2lbaz7PzRp7c1BKoYceduchFlM7ISu9EsLOj2FlUNH\n" +
    "a2/B5fMiTU6Nnvy5REUpxONW3FtLNM2u5G7XrU5Dd39JGVpUKcj+5l2DU8nRR9tb\n" +
    "OhCkAmEYcsW0mUt/fSkVjQ//ooslvaDsZp4DvSt3E26S0k8yqjQL1BSzjiiWstAq\n" +
    "0S+fqMhWYbwU4Ze8I5/HZUN1mgSgr72vxEXnWBfu8M7rAWrCWrlaDIlbO76rzyKB\n" +
    "LsluFrluHkQYRq1yv4ICpA06atGX9KXV2cp0DzRCGVtl5GaGEUzzudZQ0hB+rRyG\n" +
    "GT+bw25LAgMBAAECggEACm6smM1q/yVkLKagVn5Lr6IiVF427An3ojDu5249AV4Z\n" +
    "sybUKSJSI+bCifNPB6vSoM+EX881DnxmKSaY1pEjBGR9pCaSqqgRtw1RkMPHFPcE\n" +
    "ip/tZj9a5h+ziv+MzagWjWBvvokVQ1qoLUTVrtj3IR7L9b7P7Hj/Bo9Ejmd1Pb+6\n" +
    "Qo0iHtgB5iZ9FjkEojsuFOCUxuETHsHHWTI5ss36rPJtTMIeRDQ1LVvhDz+d+hDM\n" +
    "3ZwpjIGyaXw5El5LWdxddYGFXEeLebhO/kQ527FpB8M7nJaC2Ho9Cjr3uLnHoSf0\n" +
    "EA+begUPhQotsd27AzkQ1EK80xCKkui9efqnQpniaQKBgQD/7ICWPPNzcq24myxp\n" +
    "qclZxzenruRWBu2WZ1T/tf/RMAZdF4y3B1QE5vJgYVi/vy9IpE9Rwg8UMoy8BrzL\n" +
    "Yz+qXPUJzodi/CHc7101sV8DE4F8f6NLCjuJjn+8haeGRxs4zSVLPtyHGUgXAt5D\n" +
    "eBFdQFrSKav/uaR+UMJRGrAShQKBgQD0sHPA4uUg4C7TTaS4FQgGgHObgT4ExP6k\n" +
    "7b+EW6FRvb/TM/lIitF+Vva9yhhOhvAF0HgNo3oGGcG4tfsCF/bxJDQWVBv4pqEG\n" +
    "UYA7W7Js4ZhZVfKp2eYcIbVPXD0ruO+pqquQL76r3jKP8jwv+TN/eGzuMF2x7jir\n" +
    "Jggj+H+ejwKBgERbhmkatKg0jGRPxkge2rJJPPtkAodb6GARD6oRkdftLPX2kVZd\n" +
    "9botebX2qn7k8RtFEA61d9OcQO0EG69zvhCiLa1F5fGxiNX7dXke/FLVBfQcH6Cu\n" +
    "hgKS9lmDlaCPI51DZl+31a2cOh4zXOzGiFTRGLEkAlYW3vICXjTNnRQFAoGBAN35\n" +
    "WPkJnKzHUxNTo3NveNlVHAtdIqL3Br8eAxiSe3UI+wUhaCq77DJ9t9cSiBxs4z+T\n" +
    "D+XngKIaKZhkVnJexSGbIzmCUeGvX/K4aujuVZ3axfd9NeeKCetJVQ7KcZ/BZIF5\n" +
    "l6v09Dc8GohlSt6GZoZj/AXUkJsCrhvtI4NmQnfXAoGBAJz+m6yXBnH0K9coBZrN\n" +
    "uNbPh3j6SLUG+Ddw/QMrls8myZwYtYVGk7aaIhkygGCRdYz7QdtgTEqBohLTwpfn\n" +
    "SbHGepSbrzc9eexoVaAs5Dz3jDwT6DUmrDmTnLXvCfMf5nNgmcuxmQ8xuY0Vcv8m\n" +
    "GBQERdXRmdkbVhBPrdAb6x+J\n" +
    "-----END PRIVATE KEY-----"

let server_ca: string =
  "-----BEGIN CERTIFICATE-----\n" +
    "MIIDmzCCAoOgAwIBAgIUR8tx5XRdaM9B/fsgr8VQXlhlG5wwDQYJKoZIhvcNAQEL\n" +
    "BQAwXTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQKDAJTWjEMMAoG\n" +
    "A1UECwwDQ09NMQowCAYDVQQDDAFIMRowGAYJKoZIhvcNAQkBFgsxMjNAMTIzLmNv\n" +
    "bTAeFw0yNTAyMDcwOTQzMDhaFw0zNTAyMDUwOTQzMDhaMF0xCzAJBgNVBAYTAkNO\n" +
    "MQswCQYDVQQIDAJHRDELMAkGA1UECgwCU1oxDDAKBgNVBAsMA0NPTTEKMAgGA1UE\n" +
    "AwwBSDEaMBgGCSqGSIb3DQEJARYLMTIzQDEyMy5jb20wggEiMA0GCSqGSIb3DQEB\n" +
    "AQUAA4IBDwAwggEKAoIBAQDE7kHngZaWZaYLIkEhMSEDXC1ui2KV0FMEZ2Uzoeq0\n" +
    "ogc8ZoC3rp/G4Nlib0MW3SRVzG5DWVxQe+hq5+W5yGy2Fm8AbgKnPUhtlHUhvbxY\n" +
    "/ftlsulQCkdoM3PFD5bW0x3UDrmt6y9H9C3W4fJ820tXeFpzOrpoQiz3febLlucy\n" +
    "iDMj2TsunLzov3jg46uGVktu0pfQGIls6Yax8QwZT9EW9lKRnHVZu6ied5xZXDI0\n" +
    "li3+OkR0Yru6sJ84EnutWRiVQd9GXo9hjqXGWzmAoGBEB4vN5ESlvzIdtK813Aa1\n" +
    "IKtvxkNPQrfKVovIi/cLGn3jdXXYqJwDJjfjMt1qup4JAgMBAAGjUzBRMB0GA1Ud\n" +
    "DgQWBBSFFkqKMPjN5ZxRjipneN1efWuBPjAfBgNVHSMEGDAWgBSFFkqKMPjN5ZxR\n" +
    "jipneN1efWuBPjAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IBAQBc\n" +
    "2blhcu3vAgEHWrC05AF0K82Z71JmwLid11xXJQ7F7OnAoZs/jPLvfGh6TIUrhyOY\n" +
    "7qbelzTUkp9ip8fRI4q0Da8grQaRnmhaeBoiKg0Ku7fLiWsQa2+2BGSQVGVlNfTS\n" +
    "ZOa9R414AxICnvUHN5mix8Y2uKLmnTvrEZCdgfOdtdr5YKsXSmdDu1KBWaFyWg1z\n" +
    "ZVuJqqNlpbNsY1ns8KzqEJMNfvdVEHT5+FSyOAjx4QU9VMVCnkEpRFajxx5QN50/\n" +
    "hsPkIEN8btr61QIKKF3DPFr+bajcx71IwHze8pGRJzdgjWu/soOrsd7nZHFE1psP\n" +
    "JqeW+nhsUwBSuhUwYLED\n" +
    "-----END CERTIFICATE-----"

let server_key: string =
  "-----BEGIN PRIVATE KEY-----\n" +
    "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDE7kHngZaWZaYL\n" +
    "IkEhMSEDXC1ui2KV0FMEZ2Uzoeq0ogc8ZoC3rp/G4Nlib0MW3SRVzG5DWVxQe+hq\n" +
    "5+W5yGy2Fm8AbgKnPUhtlHUhvbxY/ftlsulQCkdoM3PFD5bW0x3UDrmt6y9H9C3W\n" +
    "4fJ820tXeFpzOrpoQiz3febLlucyiDMj2TsunLzov3jg46uGVktu0pfQGIls6Yax\n" +
    "8QwZT9EW9lKRnHVZu6ied5xZXDI0li3+OkR0Yru6sJ84EnutWRiVQd9GXo9hjqXG\n" +
    "WzmAoGBEB4vN5ESlvzIdtK813Aa1IKtvxkNPQrfKVovIi/cLGn3jdXXYqJwDJjfj\n" +
    "Mt1qup4JAgMBAAECggEBAISwfNt+J3cC2pRZ6kRxE+ttqnb3l9+V1Ln86OWXTcuT\n" +
    "+QgrkMMy+BlK225FxZCcRKVC73CVv2vDcWDHC7TYZNdz2isR9Nu2oRykkR/A9i2I\n" +
    "RGHL4QS7SE3fjTvUOzBYY5rEqTuUYfE7h79n0rlqESPIxjkp8vvYyu+fd2jqLrGO\n" +
    "gTjxk1ZkiBt3z6/vNfObCbFDnQvo648iBsZqbQ4vZ1BIHE6f4CN7ykaP2CFjD5fj\n" +
    "AcCzjEd93Z7mGed4rJ8qW6N1XlNMkyq1k20wU7TFilV8LUVOlAr+Of6Yu+yyu7gs\n" +
    "LaRFualJS+rdp4rU1LfSuBci+U+bsMQF7DDYQ7YyidkCgYEA5C2VOi08OGHnhAmu\n" +
    "X/k79bd83CaVlEjjuWXlphZd2GaDUu1yB0xzF+Ur7Tb1ZeGE7BIgmi0UgbymXNs1\n" +
    "hcpjqPTM1boBXCogxV0T6yekxb2g7GAyk8XVFRz3WxpV+Y/vYrz4y752UnML4PoM\n" +
    "tdkZrIh8CzDh5mLnhgdR4yYOz38CgYEA3PFPYHEXzeL205Os30lWaUNbWs10lUxi\n" +
    "5YQQM6btQVrxAbZkP5V8tU2aZY8GkVwbmiL7bpgtjse4a0KEPLJNNBbDkdQwLM8M\n" +
    "lZ7txDCmLciggsfp3wM4CSXfjZvresefp7/ZsDMzQd8sOostCgApJQ785HdZz0N4\n" +
    "s7KxE5mc1ncCgYEA5BgxCZP4lABCt/oZhzUVXD8NIOGtOytWAZo75DiNnWp0sqxM\n" +
    "BcHFd8iOjbYXv72d64L/dj/ENSDJSR+UtGaqE1aLgMdM3r36PnEaHUNm8ojqWgCb\n" +
    "7p6fsFhhaH++HBhnW9O9/aYqj6cT49TyacJZaOCS53j5CR4rhQ7CLAh6W68CgYBi\n" +
    "QyQ1VTbsB2QVJxl8WOaIfD91++g8ujNFtl1qS3Q7W9HSHCcrrDVBgRkIz/pwzZEt\n" +
    "FR/TyPSCCss3UOb1A6uYXgNuqPsgApmrNXqzhZtyw0a3w2d9GrZiQyjQlya8fWnB\n" +
    "Nm7/kVXblwDZrKpER1wFMkxA49/acTyOVwuwFuKM8wKBgQDawB92QDtj66iXbW07\n" +
    "SnfEVMS/DrQQHKPs1TvQdEszH5pwawzBZF7zW9863ngAwVyAl5dMDorvidntt2Wj\n" +
    "+472xnlmpbU/DfB1ZdndAjw7rE41ypooEKerLzUbvCMqhYWsMSekk0DufAbaHzjd\n" +
    "tDCfoR6d5SaZSL+shSrqCdWunA==\n" +
    "-----END PRIVATE KEY-----"

function expectFail(params: boolean) {
  try {
    if (params === true) {
      expect(params).assertTrue();
    } else {
      expect(params).assertFail();
    }
  } catch (err) {
    return console.info(JSON.stringify(err));
  }
}

export default function TlsSkipRemoteValidationTest() {
  describe('TlsSkipRemoteValidationTest', () => {

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TlsSkipRemoteValidationTest0100
     * @tc.name  :  testNetworkMgrSocketGetLocalAddressTest0100
     * @tc.desc  :  test Tls with right CA.
     * @tc.size  :  SmallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrTlsSkipRemoteValidation0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrTlsSkipRemoteValidation0100';
      console.info(`${caseName}---Start`);
      let tls: socket.TLSSocket = socket.constructTLSSocketInstance();
      let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
      let bindAddr: socket.NetAddress = {
        address: '127.0.0.1',
        port: 9000 + Math.floor(Math.random() * 10000),
        family: 1
      }
      let netAddr: socket.NetAddress = {
        address: '127.0.0.1',
        port: 9000 + Math.floor(Math.random() * 10000),
        family: 1
      }

      let tlsConnectOptions_server: socket.TLSConnectOptions = {
        address: netAddr,
        secureOptions: {
          ca: client_ca,
          key:  server_key,
          cert: server_ca,
          protocols: socket.Protocol.TLSv12,
          useRemoteCipherPrefer: true,
          signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
          cipherSuite: "AES256-SHA256"
        },
        ALPNProtocols: ["spdy/1", "http/1.1"]
      }
      let tlsConnectOptions_client_rightCA: socket.TLSConnectOptions = {
        address: netAddr,
        secureOptions: {
          ca: server_ca,
          key:  client_key,
          cert: client_ca,
          protocols: socket.Protocol.TLSv12,
          useRemoteCipherPrefer: true,
          signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
          cipherSuite: "AES256-SHA256"
        },
        ALPNProtocols: ["spdy/1", "http/1.1"]
      }

      try {
        tlsServer.listen(tlsConnectOptions_server).then(() => {
          console.log("listen success!");
          tls.bind(bindAddr).then(() => {
            tls.connect(tlsConnectOptions_client_rightCA).then(() => {
              console.log("connect success!");
              tls.close();
              expectFail(true);
              done();
            }).catch((err: BusinessError) => {
              console.log("connect failed " + JSON.stringify(err));
              expectFail(false);
              done();
            });
          }).catch((err: BusinessError) => {
            console.log("bind failed " + JSON.stringify(err));
            expectFail(false);
            done();
          });
        }).catch((err: BusinessError) => {
          console.log("listen fail: " + JSON.stringify(err));
          expectFail(false);
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      let tcpExtraOptions: socket.TCPExtraOptions = {
        keepAlive: true,
        OOBInline: true,
        TCPNoDelay: true,
        socketLinger: { on: true, linger: 10 },
        receiveBufferSize: 1000,
        sendBufferSize: 1000,
        reuseAddress: true,
        socketTimeout: 3000
      }
      tlsServer.setExtraOptions(tcpExtraOptions).then(() => {
        console.log('setExtraOptions success');
      }).catch((err: BusinessError) => {
        console.log('setExtraOptions fail' + JSON.stringify(err));
      });
      console.info(`${caseName} test end `);
    })

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TlsSkipRemoteValidationTest0200
     * @tc.name  :  testNetworkMgrSocketGetLocalAddressTest0200
     * @tc.desc  :  test Tls with wrong CA.
     * @tc.size  :  SmallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrTlsSkipRemoteValidation0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrTlsSkipRemoteValidation0200';
      console.info(`${caseName}---Start`);
      let tls: socket.TLSSocket = socket.constructTLSSocketInstance();
      let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
      let bindAddr: socket.NetAddress = {
        address: '127.0.0.1',
        port: 8000 + Math.floor(Math.random() * 10000),
        family: 1
      }
      let netAddr: socket.NetAddress = {
        address: '127.0.0.1',
        port: 8000 + Math.floor(Math.random() * 10000),
        family: 1
      }

      let tlsConnectOptions_server: socket.TLSConnectOptions = {
        address: netAddr,
        secureOptions: {
          ca: client_ca,
          key:  server_key,
          cert: server_ca,
          protocols: socket.Protocol.TLSv12,
          useRemoteCipherPrefer: true,
          signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
          cipherSuite: "AES256-SHA256"
        },
        ALPNProtocols: ["spdy/1", "http/1.1"]
      }
      let tlsConnectOptions_client_wrongCA: socket.TLSConnectOptions = {
        address: netAddr,
        secureOptions: {
          ca: client_ca,
          key:  client_key,
          cert: client_ca,
          protocols: socket.Protocol.TLSv12,
          useRemoteCipherPrefer: true,
          signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
          cipherSuite: "AES256-SHA256"
        },
        ALPNProtocols: ["spdy/1", "http/1.1"]
      }

      try {
        await tlsServer.listen(tlsConnectOptions_server);
        tls.bind(bindAddr).then(() => {
          tls.connect(tlsConnectOptions_client_wrongCA).then(() => {
            console.log("connect success!");
            expectFail(false);
            done();
          }).catch((err: BusinessError) => {
            console.log("connect failed " + JSON.stringify(err));
            tls.close();
            expectFail(true);
            done();
          });
        }).catch((err: BusinessError) => {
          console.log("bind failed " + JSON.stringify(err));
          expectFail(false);
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      let tcpExtraOptions: socket.TCPExtraOptions = {
        keepAlive: true,
        OOBInline: true,
        TCPNoDelay: true,
        socketLinger: { on: true, linger: 10 },
        receiveBufferSize: 1000,
        sendBufferSize: 1000,
        reuseAddress: true,
        socketTimeout: 3000
      }
      tlsServer.setExtraOptions(tcpExtraOptions).then(() => {
        console.log('setExtraOptions success');
      }).catch((err: BusinessError) => {
        console.log('setExtraOptions fail' + JSON.stringify(err));
      });
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TlsSkipRemoteValidationTest0300
     * @tc.name  :  testNetworkMgrSocketGetLocalAddressTest0300
     * @tc.desc  :  test Tls with wrong CA and no skip.
     * @tc.size  :  SmallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrTlsSkipRemoteValidation0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrTlsSkipRemoteValidation0300';
      console.info(`${caseName}---Start`);
      let tls: socket.TLSSocket = socket.constructTLSSocketInstance();
      let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
      let bindAddr: socket.NetAddress = {
        address: '127.0.0.1',
        port: 8000 + Math.floor(Math.random() * 10000),
        family: 1
      }
      let netAddr: socket.NetAddress = {
        address: '127.0.0.1',
        port: 8000 + Math.floor(Math.random() * 10000),
        family: 1
      }

      let tlsConnectOptions_server: socket.TLSConnectOptions = {
        address: netAddr,
        secureOptions: {
          ca: client_ca,
          key:  server_key,
          cert: server_ca,
          protocols: socket.Protocol.TLSv12,
          useRemoteCipherPrefer: true,
          signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
          cipherSuite: "AES256-SHA256"
        },
        ALPNProtocols: ["spdy/1", "http/1.1"]
      }
      let tlsConnectOptions_client_wrongCA_noSkip: socket.TLSConnectOptions = {
        address: netAddr,
        secureOptions: {
          ca: client_ca,
          key:  client_key,
          cert: client_ca,
          protocols: socket.Protocol.TLSv12,
          useRemoteCipherPrefer: true,
          signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
          cipherSuite: "AES256-SHA256"
        },
        ALPNProtocols: ["spdy/1", "http/1.1"],
        skipRemoteValidation: false
      }

      try {
        await tlsServer.listen(tlsConnectOptions_server);
        tls.bind(bindAddr).then(() => {
          tls.connect(tlsConnectOptions_client_wrongCA_noSkip).then(() => {
            console.log("connect success!");
            expectFail(false);
            done();
          }).catch((err: BusinessError) => {
            console.log("connect failed " + JSON.stringify(err));
            tls.close();
            expectFail(true);
            done();
          });
        }).catch((err: BusinessError) => {
          console.log("bind failed " + JSON.stringify(err));
          expectFail(false);
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      let tcpExtraOptions: socket.TCPExtraOptions = {
        keepAlive: true,
        OOBInline: true,
        TCPNoDelay: true,
        socketLinger: { on: true, linger: 10 },
        receiveBufferSize: 1000,
        sendBufferSize: 1000,
        reuseAddress: true,
        socketTimeout: 3000
      }
      tlsServer.setExtraOptions(tcpExtraOptions).then(() => {
        console.log('setExtraOptions success');
      }).catch((err: BusinessError) => {
        console.log('setExtraOptions fail' + JSON.stringify(err));
      });
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TlsSkipRemoteValidationTest0400
     * @tc.name  :  testNetworkMgrSocketGetLocalAddressTest0400
     * @tc.desc  :  test Tls with right CA and no skip.
     * @tc.size  :  SmallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrTlsSkipRemoteValidation0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrTlsSkipRemoteValidation0400';
      console.info(`${caseName}---Start`);
      let tls: socket.TLSSocket = socket.constructTLSSocketInstance();
      let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
      let bindAddr: socket.NetAddress = {
        address: '127.0.0.1',
        port: 8000 + Math.floor(Math.random() * 10000),
        family: 1
      }
      let netAddr: socket.NetAddress = {
        address: '127.0.0.1',
        port: 8000 + Math.floor(Math.random() * 10000),
        family: 1
      }

      let tlsConnectOptions_server: socket.TLSConnectOptions = {
        address: netAddr,
        secureOptions: {
          ca: client_ca,
          key:  server_key,
          cert: server_ca,
          protocols: socket.Protocol.TLSv12,
          useRemoteCipherPrefer: true,
          signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
          cipherSuite: "AES256-SHA256"
        },
        ALPNProtocols: ["spdy/1", "http/1.1"]
      }
      let tlsConnectOptions_client_rightCA_noSkip: socket.TLSConnectOptions = {
        address: netAddr,
        secureOptions: {
          ca: server_ca,
          key:  client_key,
          cert: client_ca,
          protocols: socket.Protocol.TLSv12,
          useRemoteCipherPrefer: true,
          signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
          cipherSuite: "AES256-SHA256"
        },
        ALPNProtocols: ["spdy/1", "http/1.1"],
        skipRemoteValidation: false
      }
      try {
        await tlsServer.listen(tlsConnectOptions_server);
        tls.bind(bindAddr).then(() => {
          tls.connect(tlsConnectOptions_client_rightCA_noSkip).then(() => {
            console.log("connect success!");
            tls.close();
            expectFail(true);
            done();
          }).catch((err: BusinessError) => {
            console.log("connect failed " + JSON.stringify(err));
            expectFail(false);
            done();
          });
        }).catch((err: BusinessError) => {
          console.log("bind failed " + JSON.stringify(err));
          expectFail(false);
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      let tcpExtraOptions: socket.TCPExtraOptions = {
        keepAlive: true,
        OOBInline: true,
        TCPNoDelay: true,
        socketLinger: { on: true, linger: 10 },
        receiveBufferSize: 1000,
        sendBufferSize: 1000,
        reuseAddress: true,
        socketTimeout: 3000
      }
      tlsServer.setExtraOptions(tcpExtraOptions).then(() => {
        console.log('setExtraOptions success');
      }).catch((err: BusinessError) => {
        console.log('setExtraOptions fail' + JSON.stringify(err));
      });
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TlsSkipRemoteValidationTest0500
     * @tc.name  :  testNetworkMgrSocketGetLocalAddressTest0500
     * @tc.desc  :  test Tls with wrong CA and skip.
     * @tc.size  :  SmallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrTlsSkipRemoteValidation0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrTlsSkipRemoteValidation0500';
      console.info(`${caseName}---Start`);
      let tls: socket.TLSSocket = socket.constructTLSSocketInstance();
      let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
      let bindAddr: socket.NetAddress = {
        address: '127.0.0.1',
        port: 8000 + Math.floor(Math.random() * 10000),
        family: 1
      }
      let netAddr: socket.NetAddress = {
        address: '127.0.0.1',
        port: 8000 + Math.floor(Math.random() * 10000),
        family: 1
      }

      let tlsConnectOptions_server: socket.TLSConnectOptions = {
        address: netAddr,
        secureOptions: {
          ca: client_ca,
          key:  server_key,
          cert: server_ca,
          protocols: socket.Protocol.TLSv12,
          useRemoteCipherPrefer: true,
          signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
          cipherSuite: "AES256-SHA256"
        },
        ALPNProtocols: ["spdy/1", "http/1.1"]
      }
      let tlsConnectOptions_client_wrongCA_skip: socket.TLSConnectOptions = {
        address: netAddr,
        secureOptions: {
          ca: client_ca,
          key:  client_key,
          cert: client_ca,
          protocols: socket.Protocol.TLSv12,
          useRemoteCipherPrefer: true,
          signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
          cipherSuite: "AES256-SHA256"
        },
        ALPNProtocols: ["spdy/1", "http/1.1"],
        skipRemoteValidation: true
      }
      try {
        await tlsServer.listen(tlsConnectOptions_server);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: true,
          OOBInline: true,
          TCPNoDelay: true,
          socketLinger: { on: true, linger: 10 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: true,
          socketTimeout: 3000
        }
        tlsServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.log('setExtraOptions success');
        }).catch((err: BusinessError) => {
          console.log('setExtraOptions fail' + JSON.stringify(err));
        });
        tls.bind(bindAddr).then(() => {
          tls.connect(tlsConnectOptions_client_wrongCA_skip).then(() => {
            console.log("connect success!");
            tls.close();
            expectFail(true);
            done();
          }).catch((err: BusinessError) => {
            console.log("connect failed " + JSON.stringify(err));
            expectFail(false);
            done();
          });
        }).catch((err: BusinessError) => {
          console.log("bind failed " + JSON.stringify(err));
          expectFail(false);
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TlsSkipRemoteValidationTest0600
     * @tc.name  :  testNetworkMgrSocketGetLocalAddressTest0600
     * @tc.desc  :  test Tls with wrong CA and skip TLS13.
     * @tc.size  :  SmallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrTlsSkipRemoteValidation0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrTlsSkipRemoteValidation0600';
      console.info(`${caseName}---Start`);
      let tls: socket.TLSSocket = socket.constructTLSSocketInstance();
      let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
      let bindAddr: socket.NetAddress = {
        address: '127.0.0.1',
        port: 8000 + Math.floor(Math.random() * 10000),
        family: 1
      }
      let netAddr: socket.NetAddress = {
        address: '127.0.0.1',
        port: 8000 + Math.floor(Math.random() * 10000),
        family: 1
      }

      let tlsConnectOptions_server_TLS13: socket.TLSConnectOptions = {
        address: netAddr,
        secureOptions: {
          ca: client_ca,
          key:  server_key,
          cert: server_ca,
          protocols: socket.Protocol.TLSv13,
          useRemoteCipherPrefer: true,
          signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
          cipherSuite: "AES256-SHA256"
        },
        ALPNProtocols: ["spdy/1", "http/1.1"]
      }
      let tlsConnectOptions_client_wrongCA_skip_TLS13: socket.TLSConnectOptions = {
        address: netAddr,
        secureOptions: {
          ca: client_ca,
          key:  client_key,
          cert: client_ca,
          protocols: socket.Protocol.TLSv13,
          useRemoteCipherPrefer: true,
          signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
          cipherSuite: "AES256-SHA256"
        },
        ALPNProtocols: ["spdy/1", "http/1.1"],
        skipRemoteValidation: true
      }

      try {
        await tlsServer.listen(tlsConnectOptions_server_TLS13);
        tls.bind(bindAddr).then(() => {
          tls.connect(tlsConnectOptions_client_wrongCA_skip_TLS13).then(() => {
            console.log("connect success!");
            tls.close();
            expectFail(true);
            done();
          }).catch((err: BusinessError) => {
            console.log("connect failed " + JSON.stringify(err));
            expectFail(false);
            done();
          });
        }).catch((err: BusinessError) => {
          console.log("bind failed " + JSON.stringify(err));
          expectFail(false);
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      let tcpExtraOptions: socket.TCPExtraOptions = {
        keepAlive: true,
        OOBInline: true,
        TCPNoDelay: true,
        socketLinger: { on: true, linger: 10 },
        receiveBufferSize: 1000,
        sendBufferSize: 1000,
        reuseAddress: true,
        socketTimeout: 3000
      }
      tlsServer.setExtraOptions(tcpExtraOptions).then(() => {
        console.log('setExtraOptions success');
      }).catch((err: BusinessError) => {
        console.log('setExtraOptions fail' + JSON.stringify(err));
      });
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket_TlsSkipRemoteValidationTest0700
     * @tc.name  :  testNetworkMgrSocketGetLocalAddressTest0700
     * @tc.desc  :  test Tls with right CA and skip.
     * @tc.size  :  SmallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrTlsSkipRemoteValidation0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrTlsSkipRemoteValidation0700';
      console.info(`${caseName}---Start`);
      let tls: socket.TLSSocket = socket.constructTLSSocketInstance();
      let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
      let bindAddr: socket.NetAddress = {
        address: '127.0.0.1',
        port: 8000 + Math.floor(Math.random() * 10000),
        family: 1
      }
      let netAddr: socket.NetAddress = {
        address: '127.0.0.1',
        port: 8000 + Math.floor(Math.random() * 10000),
        family: 1
      }

      let tlsConnectOptions_server: socket.TLSConnectOptions = {
        address: netAddr,
        secureOptions: {
          ca: client_ca,
          key:  server_key,
          cert: server_ca,
          protocols: socket.Protocol.TLSv12,
          useRemoteCipherPrefer: true,
          signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
          cipherSuite: "AES256-SHA256"
        },
        ALPNProtocols: ["spdy/1", "http/1.1"]
      }
      let tlsConnectOptions_client_rightCA_skip: socket.TLSConnectOptions = {
        address: netAddr,
        secureOptions: {
          ca: server_ca,
          key:  client_key,
          cert: client_ca,
          protocols: socket.Protocol.TLSv12,
          useRemoteCipherPrefer: true,
          signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
          cipherSuite: "AES256-SHA256"
        },
        ALPNProtocols: ["spdy/1", "http/1.1"],
        skipRemoteValidation: true
      }

      try {
        await tlsServer.listen(tlsConnectOptions_server);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: true,
          OOBInline: true,
          TCPNoDelay: true,
          socketLinger: { on: true, linger: 10 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: true,
          socketTimeout: 3000
        }
        tlsServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.log('setExtraOptions success');
        }).catch((err: BusinessError) => {
          console.log('setExtraOptions fail' + JSON.stringify(err));
        });
        tls.bind(bindAddr).then(() => {
          tls.connect(tlsConnectOptions_client_rightCA_skip).then(() => {
            console.log("connect success!");
            tls.close();
            expectFail(true);
            done();
          }).catch((err: BusinessError) => {
            console.log("connect failed " + JSON.stringify(err));
            expectFail(false);
            done();
          });
        }).catch((err: BusinessError) => {
          console.log("bind failed " + JSON.stringify(err));
          expectFail(false);
          done();
        });
      } catch (err) {
        expectFail(false);
        done();
      }
      console.info(`${caseName} test end `);
    });
  })
}
