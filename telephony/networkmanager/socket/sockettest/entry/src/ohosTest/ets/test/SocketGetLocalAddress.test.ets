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

import { describe, beforeAll, afterAll, it, expect, beforeEach, afterEach , Level, Size, TestType} from '@ohos/hypium';
import netSocket from '@ohos.net.socket';
import socket from '@ohos.net.socket';
import { BusinessError, Callback, ErrorCallback } from '@ohos.base';
import data from '@ohos.telephony.data';
import util from "@ohos.util";

let bindAddr: socket.NetAddress = {
  address: '127.0.0.1',
  port: 12221,
  family: 1
}

let netAddr: socket.NetAddress = {
  address: '127.0.0.1',
  port: 12345,
  family: 1
}

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


let tlsConnectOptions_server: socket.TLSConnectOptions = {
  address: netAddr,
  secureOptions: {
    ca: client_ca,
    key:  server_key,
    cert: server_ca,
    protocols: socket.Protocol.TLSv12,
    useRemoteCipherPrefer: true,
    signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
    cipherSuite: "AES256-SHA256",
    isBidirectionalAuthentication: false,
  },
  ALPNProtocols: ["spdy/1", "http/1.1"],
}
let tlsConnectOptions_client: socket.TLSConnectOptions = {
  address: netAddr,
  secureOptions: {
    ca: server_ca,
    key:  client_key,
    cert: client_ca,
    protocols: socket.Protocol.TLSv12,
    useRemoteCipherPrefer: true,
    signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
    cipherSuite: "AES256-SHA256",
    isBidirectionalAuthentication: false,
  },
  ALPNProtocols: ["spdy/1", "http/1.1"],
}

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(` exportFail failed err: ${JSON.stringify(err)}`);
  }
};

function expectTrue(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    console.info(`${info} test failed`);
  }
}


export default function SocketGetLocalSocketTest() {
  describe('SocketGetLocalSocketTest', () => {

    /**
     * @tc.name   testNetworkMgrSocketGetLocalAdrressTest0100
     * @tc.number SUB_NetworkMgr_Socket GetLocalAddress_0100
     * @tc.desc   test UDP GetLocalAddress function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketGetLocalAdrressTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrSocketGetLocalAddressTest0100';
      console.info(`${caseName}---Start`);
      let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
      try {
        udp.bind(bindAddr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            ExpectFail();
            done();
          }
          udp.getLocalAddress().then((localAddress: socket.NetAddress) => {
            expectTrue(localAddress != null);
            console.log("UDP_Socket get SUCCESS! IP Port: " + JSON.stringify(localAddress));
          }).catch((err: BusinessError) => {
            console.log("UDP_Socket get FAILED! error: " + JSON.stringify(err));
            ExpectFail();
            done();
          })
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testNetworkMgrSocketGetLocalAddressTest0200
     * @tc.number SUB_NetworkMgr_Socket GetLocalAddress_0200
     * @tc.desc   test Multicast GetLocalAddress function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketGetLocalAddressTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketGetLocalAddressTest0200';
      console.info(`${caseName} test start`);
      let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
      try {
        multicast.bind(bindAddr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            ExpectFail();
            done();
          }
          multicast.getLocalAddress().then((localAddress: socket.NetAddress) => {
            expectTrue(localAddress != null);
            console.log("UDP_Socket get SUCCESS! IP Port: " + JSON.stringify(localAddress));
          }).catch((err: BusinessError) => {
            console.log("UDP_Socket get FAILED! error: " + JSON.stringify(err));
            ExpectFail();
            done();
          })
          console.info(`${caseName} test end`);
          multicast.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testNetworkMgrSocketGetLocalAddressTest0300
     * @tc.number SUB_NetworkMgr_Socket GetLocalAddress_0300
     * @tc.desc   test TlsSocket GetLocalAddress function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketGetLocalAddressTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketGetLocalAddressTest0300';
      console.info(`${caseName} test start`);
      try {
        let tls: socket.TLSSocket = socket.constructTLSSocketInstance();
        let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();

        tlsServer.listen(tlsConnectOptions_server).then(() => {
          tls.bind(bindAddr, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName} err: ${JSON.stringify(err)}`);
              tls.close();
              ExpectFail();
              done();
            } else {
              tls.connect(tlsConnectOptions_client).then(() => {
                console.log("connect successfully");
                tls.getLocalAddress().then((localAddress: socket.NetAddress) => {
                  tls.close();
                  expectTrue(localAddress != null);
                  console.log("Family IP Port: " + JSON.stringify(localAddress));
                }).catch((err: BusinessError) => {
                  console.log("TLS Client Get Family IP Port failed, error: " + JSON.stringify(err));
                  tls.close();
                  ExpectFail();
                  done();
                })
              }).catch((err: BusinessError) => {
                tls.close();
                console.log("connect failed " + JSON.stringify(err));
                ExpectFail();
                done();
              });
            }
            done();
          });
        })
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testNetworkMgrSocketGetLocalAddressTest0400
     * @tc.number SUB_NetworkMgr_Socket GetLocalAddress_0400
     * @tc.desc   test TlsSocket GetLocalAddress function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketGetLocalAddressTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketGetLocalAddressTest0400';
      console.info(`${caseName} test start`);
      try {
        let tls: socket.TLSSocket = socket.constructTLSSocketInstance();
        let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();

        tlsServer.listen(tlsConnectOptions_server).then(() => {
          tls.bind(bindAddr, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName} err: ${JSON.stringify(err)}`);
              ExpectFail();
            } else {
              tls.connect(tlsConnectOptions_client).then(() => {
                console.log("connect successfully");

                tlsServer.getLocalAddress().then((localAddress: socket.NetAddress) => {
                  expectTrue(localAddress != null);
                  console.log("Family IP Port: " + JSON.stringify(localAddress));
                }).catch((err: BusinessError) => {
                  console.log("TLS Server Get Family IP Port failed, error: " + JSON.stringify(err));
                })
              }).catch((err: BusinessError) => {
                console.log("connect failed " + JSON.stringify(err));
              });
            }
            console.info(`${caseName} test end`);
            done();
            tls.close();
          });
        })
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        ExpectFail();
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketGetLocalAddressTest0500
     * @tc.number SUB_NetworkMgr_Socket GetLocalAddress_0500
     * @tc.desc   test TlsServer GetLocalAddress function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketGetLocalAddressTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketGetLocalAddressTest0500';
      console.info(`${caseName} test start`);
      try {
        let listenAddr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8080,
          family: 1
        }
        let netAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8080,
          family: 1
        }
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let options: socket.TCPConnectOptions = {
          address: netAddress,
          timeout: 6000
        }
        tcpServer.listen(listenAddr, (err: BusinessError) => {
          if (err) {
            console.log("listen fail");
            ExpectFail();
          }
          tcp.connect(options, (err: BusinessError) => {
            if (err) {
              console.log('connect fail');
              ExpectFail();
            }
            console.log('connect success!');
          })
          tcpServer.on('connect', (client: socket.TCPSocketConnection) => {
            client.getLocalAddress().then((localAddress: socket.NetAddress) => {
              expectTrue(localAddress != null);
              console.log("Family IP Port: " + JSON.stringify(localAddress));
            }).catch((err: BusinessError) => {
              console.log("TCP Get Family IP Port failed, error: " + JSON.stringify(err));
              ExpectFail();
            })
            console.info(`${caseName} test end`);
            done();
            tcp.close();
          })
        })
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        ExpectFail();
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketGetLocalAddressTest0600
     * @tc.number SUB_NetworkMgr_Socket GetLocalAddress_0600
     * @tc.desc   test TcpSocket GetLocalAddress function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketGetLocalAddressTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketGetLocalAddressTest0600';
      console.info(`${caseName} test start`);
      try {
        let tcp = socket.constructTCPSocketInstance()

        tcp.bind(bindAddr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            ExpectFail();
          } else {
            tcp.getLocalAddress().then((localAddress: socket.NetAddress) => {
              expectTrue(localAddress != null);
              console.log("Family IP Port: " + JSON.stringify(localAddress));
            }).catch((err: BusinessError) => {
              console.log("TCP Get Family IP Port failed, error: " + JSON.stringify(err));
            })
          }
          console.info(`${caseName} test end`);
          done();
          tcp.close();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        ExpectFail();
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketGetLocalAddressTest0700
     * @tc.number SUB_NetworkMgr_Socket GetLocalAddress_0700
     * @tc.desc   test TcpServer GetLocalAddress function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketGetLocalAddressTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketGetLocalAddressTest0700';
      console.info(`${caseName} test start`);
      try {
        let tcpServer = socket.constructTCPSocketServerInstance()
        tcpServer.listen(netAddr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            ExpectFail();
          } else {
            tcpServer.getLocalAddress().then((localAddress: socket.NetAddress) => {
              expectTrue(localAddress != null);
              console.log("Family IP Port: " + JSON.stringify(localAddress));
            }).catch((err: BusinessError) => {
              console.log("TCP Get Family IP Port failed, error: " + JSON.stringify(err));
            })
            console.info(`${caseName} success`);
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        ExpectFail();
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketGetLocalAddressTest0800
     * @tc.number SUB_NetworkMgr_Socket GetLocalAddress_0800
     * @tc.desc   test LocalSocket GetLocalAddress function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketGetLocalAddressTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketGetLocalAddressTest0800';
      console.info(`${caseName} test start`);
      try {
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let sandboxPath: string = getContext().filesDir + '/testSocket1'
        let address: socket.LocalAddress = {
          address: sandboxPath
        }
        client.bind(address).then(() => {
          client.getLocalAddress().then((localPath) => {
            expectTrue(localPath != null);
            console.log("localPath is " + JSON.stringify(localPath));
          }).catch((err: BusinessError) => {
            console.log("Get failed, error: " + JSON.stringify(err));
          })
          console.info(`${caseName} success`);
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        ExpectFail();
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketGetLocalAddressTest0900
     * @tc.number SUB_NetworkMgr_Socket GetLocalAddress_0900
     * @tc.desc   test LocalServer GetLocalAddress function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketGetLocalAddressTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketGetLocalAddressTest0900';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        let sandboxPath: string = getContext().filesDir + '/testSocket2'
        let listenAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        server.listen(listenAddr).then(() => {
          server.getLocalAddress().then((localPath) => {
            expectTrue(localPath != null);
            console.log("localPath is " + JSON.stringify(localPath));
          }).catch((err: BusinessError) => {
            console.log("Get failed, error: " + JSON.stringify(err));
          })
          console.info(`${caseName} success`);
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        ExpectFail();
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketGetLocalAddressTest1000
     * @tc.number SUB_NetworkMgr_Socket GetLocalAddress_1000
     * @tc.desc   test LocalConnection GetLocalAddress function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketGetLocalAddressTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketGetLocalAddressTest1000';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        let sandboxPath: string = getContext().filesDir + '/testSocket3'
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        server.listen(localAddr).then(() => {
          console.log('listen success');
          let client: socket.LocalSocket = socket.constructLocalSocketInstance();
          let connectOpt: socket.LocalConnectOptions = {
            address: localAddr,
            timeout: 6000
          }
          client.connect(connectOpt).then(() => {
            server.getLocalAddress().then((localPath) => {
              expectTrue(localPath != null);
              console.log("localPath is " + JSON.stringify(localPath));
            }).catch((err: BusinessError) => {
              console.log("FAIL FAIL FAIL" + JSON.stringify(err));
            })
          }).catch((err: Object) => {
            console.error('connect fail: ' + JSON.stringify(err));
          });
          console.info(`${caseName} success`);
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        ExpectFail();
        done();
      }
    });

  })
}
