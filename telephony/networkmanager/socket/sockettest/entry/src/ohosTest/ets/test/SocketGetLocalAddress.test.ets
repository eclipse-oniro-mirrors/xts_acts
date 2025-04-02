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

import { describe, beforeAll, afterAll, it, expect, beforeEach, afterEach } from '@ohos/hypium';
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
    "MIIDazCCAlOgAwIBAgIURbEi4CXEaH9XNkI5fYJaET0/TtQwDQYJKoZIhvcNAQEL\n" +
    "BQAwRTELMAkGA1UEBhMCQVUxEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoM\n" +
    "GEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDAeFw0yNDAyMDUwODQyMTdaFw0yNTAy\n" +
    "MDQwODQyMTdaMEUxCzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEw\n" +
    "HwYDVQQKDBhJbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQwggEiMA0GCSqGSIb3DQEB\n" +
    "AQUAA4IBDwAwggEKAoIBAQC18uHdYs6dTxvrjWKUaDDlw0E7Q4GyA5xy2dFZGCjT\n" +
    "/gJWPkYkx1tfpoRMlJm0eq4GqNnWnCjlIlkB86RbBbYrvTbnc3hPG7Cb4eRYKa0J\n" +
    "YQd1o/rdUSlcwjgzexI2MfwCPvVn8mr+LGTO9DI4xdoydk6DuwGhz/+bV5YQKaUA\n" +
    "piK9UplkCqJuQoKp02FHRTLi5r5hse8cFHo/9vI6JjpG8P4pHeI4nFsIR6Gs6X8a\n" +
    "3lF1VvSSMCGmJEkSB8Yj44XSdI87bMQR3JFbJDtqHk9uCCE0pZI6/gUTBcj8vYhq\n" +
    "ufQHWpJbSkFQHONomNz8ETUGe1JFhojBAzKdQ53vn5OnAgMBAAGjUzBRMB0GA1Ud\n" +
    "DgQWBBRCy+tupSv+6zxgjJzAczIA7JEJCTAfBgNVHSMEGDAWgBRCy+tupSv+6zxg\n" +
    "jJzAczIA7JEJCTAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IBAQBS\n" +
    "StAubW6cZxrbt2yUjsos3WvJ3W7U8HmcoJ/dXA1oEn79F7ERIZnFujNf78EcCv/r\n" +
    "1EC16bKdC+eZ4YnOk3uqG9cmyPUkkinLREGR4yb5t5xpytC0QE5E7L9Ey1JjfEXF\n" +
    "N0hY7C98JoovSocaT+R7Ohn/zTsagfi58yaO7lCTRp+9a2kDWkn+DskDJWF1MZ4Q\n" +
    "a0zyM9HmySrAH9UMsN/TjSfzb7iANe5vScIKYOt8cMi0fYJtxse7rGOe89p59Eu7\n" +
    "ooq6CHKKexboL492pSADmrYTc7yn67PQk8WzJLieUZ6pqWr2R9u/abAFCrCgn9BK\n" +
    "JF/0rKL3sMGKgJ3MYlos\n" +
    "-----END CERTIFICATE-----"

let client_key: string =
  "-----BEGIN PRIVATE KEY-----\n" +
    "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC18uHdYs6dTxvr\n" +
    "jWKUaDDlw0E7Q4GyA5xy2dFZGCjT/gJWPkYkx1tfpoRMlJm0eq4GqNnWnCjlIlkB\n" +
    "86RbBbYrvTbnc3hPG7Cb4eRYKa0JYQd1o/rdUSlcwjgzexI2MfwCPvVn8mr+LGTO\n" +
    "9DI4xdoydk6DuwGhz/+bV5YQKaUApiK9UplkCqJuQoKp02FHRTLi5r5hse8cFHo/\n" +
    "9vI6JjpG8P4pHeI4nFsIR6Gs6X8a3lF1VvSSMCGmJEkSB8Yj44XSdI87bMQR3JFb\n" +
    "JDtqHk9uCCE0pZI6/gUTBcj8vYhqufQHWpJbSkFQHONomNz8ETUGe1JFhojBAzKd\n" +
    "Q53vn5OnAgMBAAECggEAJTi1yhNvjzDi1lJLK28RKb/C9Xu+6Yrhk4FJ2X8ewxeA\n" +
    "pOICeX2rDKtE/2Ga/BfoyAX84nF50D4xlTuhkNlfRh1kQP8XSp+whoM0snB8LKID\n" +
    "46YTKPl0i7xTwPxZYmrhUhhNHeGyz6KHUOsV5xVaqN4Y+8vi7pZdhQrq8Q2D6ti5\n" +
    "Z5WhKlXEQHIwkZ8aaW0+PoO4L2TntPZnf8X3HD5HsV7LhC+2l5l6MVjC8VW85BGh\n" +
    "RT1JnteVCGl2rQ/X+eO9c9h7jktjoCJF68Is1GRgAYyADbeTw6IIRa7zEjWcMUs6\n" +
    "l4w+YnIgDTCfxuxDzabpnCnQKXKV+Fp6+OFNUQlY+QKBgQDk83QVqXuv+Myqqwk6\n" +
    "mEvcvvuJHvSG6uZVq936HyMQcZbuyv02ZAmdIa/oyxnubgZH2pcWc03sVSXI85zA\n" +
    "/fJZbKpft++aCxCbnCzW5aes2SwhWLOk/KcQTmZV9Y/BeOY3hxwHRE7sWKAZtItx\n" +
    "DPNbobnuP1ROANf3TqZDJxgcqwKBgQDLcdyqy/lPtlqnItPGK3UmymKmX9aSVhGW\n" +
    "eUyQkjY+D6g3S24CF+YrbiBWfHt829g40+OALFdkxC6KYbJ4lF76uLzP0PTUuK7b\n" +
    "30+FikOlKSM6wvUWVLQGSHw5gype4aVghulTaoeST7XS5Xy/b5b/shlkHVzXJ6cI\n" +
    "wc57JFxs9QKBgQCQx48Z/7ISpm+uYTgV0KbwcekYXfXdt39un59ggv4mcN40JTMY\n" +
    "iQw3TE00FfNQ/kyEdatjbAjTsUiSmdL/i9cMS5Y1r1gZ/nNDI/CK+HEe8bphX/lC\n" +
    "FO8Edb9rDj0Y6H4UkSDdS4npFWYwuyYOmFTwFgZArdV++jOX1Sl4f6lUvwKBgAa2\n" +
    "7FSKxOC3oQhRIvIwbv5nwZfCI//SbWQs/rTqznV/6MpiZ/ATv9oBGXohQ6YcT2eY\n" +
    "vrJ1RDEkNHEGxnAqXXQi8sBdIid/LO4+0Y4TwSXLVMlUs+gXxZVLgSYYySY2hlHI\n" +
    "Qh0pr+3JSbP7NQHQeghYZXQjb/P98Ape8ySnT5GdAoGAU9BaC1hYA7CimvJDNGCK\n" +
    "XqC9gnSLSnX6gJP+l0S1STQtZiHePCUpe3JNtH9BtALqH+ErnQgTWmpFKQL82F03\n" +
    "IvHGZg2ODuFbqBhYGorDF4s8QhBi/qwPdL2t6b9FBIQf1xOoptW8lyD5bb8L/Jg0\n" +
    "XsEJk5PDRBPhdhCceGrQM7I=\n" +
    "-----END PRIVATE KEY-----"

let server_ca: string =
  "-----BEGIN CERTIFICATE-----\n" +
    "MIIDazCCAlOgAwIBAgIUUkPBvZGXiOfpNTu6MGDlDw8OaLEwDQYJKoZIhvcNAQEL\n" +
    "BQAwRTELMAkGA1UEBhMCQVUxEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoM\n" +
    "GEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDAeFw0yNDAyMDUwODQyMDNaFw0yNTAy\n" +
    "MDQwODQyMDNaMEUxCzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEw\n" +
    "HwYDVQQKDBhJbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQwggEiMA0GCSqGSIb3DQEB\n" +
    "AQUAA4IBDwAwggEKAoIBAQCenbm9Vs2F+Mu951dRqoQy68pP2OmIWbl+mFLbgydi\n" +
    "lRgmsdBuWM/qGJtXGOR77Z89uXv18hIrVNBv1Tt0DlGJmnO9i8AlRYhKj1lYsdnN\n" +
    "RBHItkOZI7s4+NSGqOqYbM0Jmo4pp66c4mwzMVuLLoO1+i5ROxROGa+b78hoQoCp\n" +
    "UvtBX81pX1ds6To22bqig2zmdGjHHFkNk3mQyyG2JeIm4q7bt25S/D3HpX7Vpkmq\n" +
    "S1jewXu0tzAul+tydzqziQE4XeV0Oz+QUT/VpiPile0xKqmJX3l+YbkvHSIlfeFM\n" +
    "JsM0ZngUkmKmFponIy0uZTY8VRnuRf7bs+FtFCDjf1BbAgMBAAGjUzBRMB0GA1Ud\n" +
    "DgQWBBR2f3W2xNpqseiAN81AmkbhSzQDVjAfBgNVHSMEGDAWgBR2f3W2xNpqseiA\n" +
    "N81AmkbhSzQDVjAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IBAQCG\n" +
    "gybJtcyHNSOkvfa7FOVDGqKK2J+j51EGTINwPqf2oUF0sFJPNx0Rm+s7JBPb/EC1\n" +
    "70abbejtFOSBZMjoEMa5VFXDOAJ9bMILqk4owmnUWvkfVwLA5tRXxcVx34d02OLj\n" +
    "qIc9h0s7d2rbU1LOw3/8f4oVgDzcr8FMEWYG0y6h8g6NOUFky17wTODSgZIrWRxY\n" +
    "0fHpDe+jlQnxCoiAv7m3hGiNE0yquA4B4y4aduqyxNW1yQPxeHtrPeONJV6/8MIR\n" +
    "JxWsJPT2P9ao/DHCItMK1gEibmkATbHvpQfU/V75QoqVXY8GdYlLt0P247aiPyYr\n" +
    "As8jWsq731gdVsRCnGzE\n" +
    "-----END CERTIFICATE-----"

let server_key: string =
  "-----BEGIN PRIVATE KEY-----\n" +
    "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCenbm9Vs2F+Mu9\n" +
    "51dRqoQy68pP2OmIWbl+mFLbgydilRgmsdBuWM/qGJtXGOR77Z89uXv18hIrVNBv\n" +
    "1Tt0DlGJmnO9i8AlRYhKj1lYsdnNRBHItkOZI7s4+NSGqOqYbM0Jmo4pp66c4mwz\n" +
    "MVuLLoO1+i5ROxROGa+b78hoQoCpUvtBX81pX1ds6To22bqig2zmdGjHHFkNk3mQ\n" +
    "yyG2JeIm4q7bt25S/D3HpX7VpkmqS1jewXu0tzAul+tydzqziQE4XeV0Oz+QUT/V\n" +
    "piPile0xKqmJX3l+YbkvHSIlfeFMJsM0ZngUkmKmFponIy0uZTY8VRnuRf7bs+Ft\n" +
    "FCDjf1BbAgMBAAECggEADQuP0SCoepJBv3adWdwaT03RL8v5OPuYI+9HMUKSJKt6\n" +
    "dwQ8zjaDsw8fB4TGleKvLBZrOYkVMXciRXBWGW9sCVMonbg2r1oOoYM0p/TIovcs\n" +
    "N0O2P4wOw9rDL+gIk0yveFC7zHU8CS8eEv/GNaY3sunGkWu4ecvnA34vD1QY3NQT\n" +
    "BPSv2+ZXSOV+nfSYg9noxJXHTgx+ALlSVe2731BFE1sBwkUpTpBvy/cnINwmsiVe\n" +
    "JIPH3JGzBydmvtYI+FjiqItqcsGaU8TKkqQmasZ9a92/8LMBWFS2cyLsKUiDaLHK\n" +
    "AwlL/Easbzd2Ri0cfhIXBWZweVa+DLr3B3XT/OhsAQKBgQDd9XcbYZWrM/HQ8k6V\n" +
    "PrbyxgF9pHjZPZF+OZjDknqDNRPNm1J/Ec+ij7nnazMPY9qOo4hwJNxd82dhSfbI\n" +
    "x+7gSCfecLDyGr44rH/zvLE/i5Yv52SDPv4x0gOpBzSfr+QV/dws450wccVpKstK\n" +
    "K3aw29ukOj7pnEXJn7dy10bVWwKBgQC28U1AfReCRdkh3GBIa5FdCT7GGN1ATQww\n" +
    "wtFkQ5RdWPbRbCQrxtafYQGTzjl+jzNRN/8tjU+VfdpK+mToKmXWBIkY3SlcTsPW\n" +
    "RHjf7pDKysK+q286e4PiLpV4KJus5H3SgVSroIpkjf5J4/W6xjR6MTHXvoOMxWns\n" +
    "wE6+EPNhAQKBgC3vTe4JvQrIXkQq0V6Lsxr9JXPWJPh4iHLCAr5+wwICaw3DFkib\n" +
    "7AetjQC6q7+En8ejSmpDBqQe6oc04nDdB6+83xtm4QfJxxI9iOFtbJVFExjo32FW\n" +
    "GQ9Acmd5yUc/BIoUlotns7FB6mQAaj/4TMD/Ty5mq3x3Te4TMsj+inc/AoGAONNJ\n" +
    "YL+6fq+9m4P9sGEhXRnTEuuERkXohHjvW8qWGkzZFgIWVjbEUetq9wN23nYSxaa0\n" +
    "L+0WDGR0WxfeIjORQGJWR4/jGhYpRLQuK7jJ5wQGa/2KZksZkzdPHGzYtmKfJrUf\n" +
    "nNQYSNXGaCNUH/kTMeV4CwDVkfN8TJsLmoRfZQECgYA3IGz12uGV1BvQaKaUy40r\n" +
    "xXAvIZbLM9L9otpERfr5I/mZL18xLqgp/mzoHG/FIvm3YvQBDQFaKZB0+pjaYdm/\n" +
    "vH6JfvJL7iqTKtgs/c+1EiizmkD/Z0aAZNQ6M1U69MjXcJlAa7USbBKkna1smyBA\n" +
    "Tjm6Um0WJONczsIiZq9M6Q==\n" +
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

function sleep(ms: number) {
    return new Promise<void>(resolve => setTimeout(resolve, ms));
}

export default function SocketGetLocalSocketTest() {
  describe('SocketGetLocalSocketTest', () => {

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket GetLocalAddress_0100
     * @tc.name  :  testNetworkMgrSocketGetLocalAddressTest0100
     * @tc.desc  :  test UDP GetLocalAddress function.
     * @tc.size  :  SmallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketGetLocalAdrressTest0100', 0, async (done: Function) => {
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

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket GetLocalAddress_0200
     * @tc.name  :  testNetworkMgrSocketGetLocalAddressTest0200
     * @tc.desc  :  test Multicast GetLocalAddress function.
     * @tc.size  :  SmallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketGetLocalAddressTest0200', 0, async (done: Function) => {
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

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket GetLocalAddress_0300
     * @tc.name  :  testNetworkMgrSocketGetLocalAddressTest0300
     * @tc.desc  :  test TlsSocket GetLocalAddress function.
     * @tc.size  :  SmallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketGetLocalAddressTest0300', 0, async (done: Function) => {
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

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket GetLocalAddress_0400
     * @tc.name  :  testNetworkMgrSocketGetLocalAddressTest0400
     * @tc.desc  :  test TlsSocket GetLocalAddress function.
     * @tc.size  :  SmallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketGetLocalAddressTest0400', 0, async (done: Function) => {
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

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket GetLocalAddress_0500
     * @tc.name  :  testNetworkMgrSocketGetLocalAddressTest0500
     * @tc.desc  :  test TlsServer GetLocalAddress function.
     * @tc.size  :  SmallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketGetLocalAddressTest0500', 0, async (done: Function) => {
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

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket GetLocalAddress_0600
     * @tc.name  :  testNetworkMgrSocketGetLocalAddressTest0600
     * @tc.desc  :  test TcpSocket GetLocalAddress function.
     * @tc.size  :  SmallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketGetLocalAddressTest0600', 0, async (done: Function) => {
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

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket GetLocalAddress_0700
     * @tc.name  :  testNetworkMgrSocketGetLocalAddressTest0700
     * @tc.desc  :  test TcpServer GetLocalAddress function.
     * @tc.size  :  SmallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketGetLocalAddressTest0700', 0, async (done: Function) => {
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

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket GetLocalAddress_0800
     * @tc.name  :  testNetworkMgrSocketGetLocalAddressTest0800
     * @tc.desc  :  test LocalSocket GetLocalAddress function.
     * @tc.size  :  SmallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketGetLocalAddressTest0800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketGetLocalAddressTest0800';
      console.info(`${caseName} test start`);
      try {
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let sandboxPath: string = getContext().filesDir + '/testSocket'
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

    /* *
     * @tc.number:  SUB_NetworkMgr_Socket GetLocalAddress_0900
     * @tc.name  :  testNetworkMgrSocketGetLocalAddressTest0900
     * @tc.desc  :  test LocalServer GetLocalAddress function.
     * @tc.size  :  SmallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketGetLocalAddressTest0900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketGetLocalAddressTest0900';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        let sandboxPath: string = getContext().filesDir + '/testSocket'
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

     /* *
     * @tc.number:  SUB_NetworkMgr_Socket GetLocalAddress_1000
     * @tc.name  :  testNetworkMgrSocketGetLocalAddressTest1000
     * @tc.desc  :  test LocalConnection GetLocalAddress function.
     * @tc.size  :  SmallTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it('testNetworkMgrSocketGetLocalAddressTest1000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketGetLocalAddressTest1000';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        let sandboxPath: string = getContext().filesDir + '/testSocket'
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
