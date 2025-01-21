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
import { describe, expect, it } from '@ohos/hypium';

let client_key = `-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC18uHdYs6dTxvr
jWKUaDDlw0E7Q4GyA5xy2dFZGCjT/gJWPkYkx1tfpoRMlJm0eq4GqNnWnCjlIlkB
86RbBbYrvTbnc3hPG7Cb4eRYKa0JYQd1o/rdUSlcwjgzexI2MfwCPvVn8mr+LGTO
9DI4xdoydk6DuwGhz/+bV5YQKaUApiK9UplkCqJuQoKp02FHRTLi5r5hse8cFHo/
9vI6JjpG8P4pHeI4nFsIR6Gs6X8a3lF1VvSSMCGmJEkSB8Yj44XSdI87bMQR3JFb
JDtqHk9uCCE0pZI6/gUTBcj8vYhqufQHWpJbSkFQHONomNz8ETUGe1JFhojBAzKd
Q53vn5OnAgMBAAECggEAJTi1yhNvjzDi1lJLK28RKb/C9Xu+6Yrhk4FJ2X8ewxeA
pOICeX2rDKtE/2Ga/BfoyAX84nF50D4xlTuhkNlfRh1kQP8XSp+whoM0snB8LKID
46YTKPl0i7xTwPxZYmrhUhhNHeGyz6KHUOsV5xVaqN4Y+8vi7pZdhQrq8Q2D6ti5
Z5WhKlXEQHIwkZ8aaW0+PoO4L2TntPZnf8X3HD5HsV7LhC+2l5l6MVjC8VW85BGh
RT1JnteVCGl2rQ/X+eO9c9h7jktjoCJF68Is1GRgAYyADbeTw6IIRa7zEjWcMUs6
l4w+YnIgDTCfxuxDzabpnCnQKXKV+Fp6+OFNUQlY+QKBgQDk83QVqXuv+Myqqwk6
mEvcvvuJHvSG6uZVq936HyMQcZbuyv02ZAmdIa/oyxnubgZH2pcWc03sVSXI85zA
/fJZbKpft++aCxCbnCzW5aes2SwhWLOk/KcQTmZV9Y/BeOY3hxwHRE7sWKAZtItx
DPNbobnuP1ROANf3TqZDJxgcqwKBgQDLcdyqy/lPtlqnItPGK3UmymKmX9aSVhGW
eUyQkjY+D6g3S24CF+YrbiBWfHt829g40+OALFdkxC6KYbJ4lF76uLzP0PTUuK7b
30+FikOlKSM6wvUWVLQGSHw5gype4aVghulTaoeST7XS5Xy/b5b/shlkHVzXJ6cI
wc57JFxs9QKBgQCQx48Z/7ISpm+uYTgV0KbwcekYXfXdt39un59ggv4mcN40JTMY
iQw3TE00FfNQ/kyEdatjbAjTsUiSmdL/i9cMS5Y1r1gZ/nNDI/CK+HEe8bphX/lC
FO8Edb9rDj0Y6H4UkSDdS4npFWYwuyYOmFTwFgZArdV++jOX1Sl4f6lUvwKBgAa2
7FSKxOC3oQhRIvIwbv5nwZfCI//SbWQs/rTqznV/6MpiZ/ATv9oBGXohQ6YcT2eY
vrJ1RDEkNHEGxnAqXXQi8sBdIid/LO4+0Y4TwSXLVMlUs+gXxZVLgSYYySY2hlHI
Qh0pr+3JSbP7NQHQeghYZXQjb/P98Ape8ySnT5GdAoGAU9BaC1hYA7CimvJDNGCK
XqC9gnSLSnX6gJP+l0S1STQtZiHePCUpe3JNtH9BtALqH+ErnQgTWmpFKQL82F03
IvHGZg2ODuFbqBhYGorDF4s8QhBi/qwPdL2t6b9FBIQf1xOoptW8lyD5bb8L/Jg0
XsEJk5PDRBPhdhCceGrQM7I=
-----END PRIVATE KEY-----
`

let caFile = `-----BEGIN CERTIFICATE-----
MIIDazCCAlOgAwIBAgIURbEi4CXEaH9XNkI5fYJaET0/TtQwDQYJKoZIhvcNAQEL
BQAwRTELMAkGA1UEBhMCQVUxEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoM
GEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDAeFw0yNDAyMDUwODQyMTdaFw0yNTAy
MDQwODQyMTdaMEUxCzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEw
HwYDVQQKDBhJbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQwggEiMA0GCSqGSIb3DQEB
AQUAA4IBDwAwggEKAoIBAQC18uHdYs6dTxvrjWKUaDDlw0E7Q4GyA5xy2dFZGCjT
/gJWPkYkx1tfpoRMlJm0eq4GqNnWnCjlIlkB86RbBbYrvTbnc3hPG7Cb4eRYKa0J
YQd1o/rdUSlcwjgzexI2MfwCPvVn8mr+LGTO9DI4xdoydk6DuwGhz/+bV5YQKaUA
piK9UplkCqJuQoKp02FHRTLi5r5hse8cFHo/9vI6JjpG8P4pHeI4nFsIR6Gs6X8a
3lF1VvSSMCGmJEkSB8Yj44XSdI87bMQR3JFbJDtqHk9uCCE0pZI6/gUTBcj8vYhq
ufQHWpJbSkFQHONomNz8ETUGe1JFhojBAzKdQ53vn5OnAgMBAAGjUzBRMB0GA1Ud
DgQWBBRCy+tupSv+6zxgjJzAczIA7JEJCTAfBgNVHSMEGDAWgBRCy+tupSv+6zxg
jJzAczIA7JEJCTAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IBAQBS
StAubW6cZxrbt2yUjsos3WvJ3W7U8HmcoJ/dXA1oEn79F7ERIZnFujNf78EcCv/r
1EC16bKdC+eZ4YnOk3uqG9cmyPUkkinLREGR4yb5t5xpytC0QE5E7L9Ey1JjfEXF
N0hY7C98JoovSocaT+R7Ohn/zTsagfi58yaO7lCTRp+9a2kDWkn+DskDJWF1MZ4Q
a0zyM9HmySrAH9UMsN/TjSfzb7iANe5vScIKYOt8cMi0fYJtxse7rGOe89p59Eu7
ooq6CHKKexboL492pSADmrYTc7yn67PQk8WzJLieUZ6pqWr2R9u/abAFCrCgn9BK
JF/0rKL3sMGKgJ3MYlos
-----END CERTIFICATE-----
`
let certFile = `-----BEGIN CERTIFICATE-----
MIIDazCCAlOgAwIBAgIUUkPBvZGXiOfpNTu6MGDlDw8OaLEwDQYJKoZIhvcNAQEL
BQAwRTELMAkGA1UEBhMCQVUxEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoM
GEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDAeFw0yNDAyMDUwODQyMDNaFw0yNTAy
MDQwODQyMDNaMEUxCzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEw
HwYDVQQKDBhJbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQwggEiMA0GCSqGSIb3DQEB
AQUAA4IBDwAwggEKAoIBAQCenbm9Vs2F+Mu951dRqoQy68pP2OmIWbl+mFLbgydi
lRgmsdBuWM/qGJtXGOR77Z89uXv18hIrVNBv1Tt0DlGJmnO9i8AlRYhKj1lYsdnN
RBHItkOZI7s4+NSGqOqYbM0Jmo4pp66c4mwzMVuLLoO1+i5ROxROGa+b78hoQoCp
UvtBX81pX1ds6To22bqig2zmdGjHHFkNk3mQyyG2JeIm4q7bt25S/D3HpX7Vpkmq
S1jewXu0tzAul+tydzqziQE4XeV0Oz+QUT/VpiPile0xKqmJX3l+YbkvHSIlfeFM
JsM0ZngUkmKmFponIy0uZTY8VRnuRf7bs+FtFCDjf1BbAgMBAAGjUzBRMB0GA1Ud
DgQWBBR2f3W2xNpqseiAN81AmkbhSzQDVjAfBgNVHSMEGDAWgBR2f3W2xNpqseiA
N81AmkbhSzQDVjAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IBAQCG
gybJtcyHNSOkvfa7FOVDGqKK2J+j51EGTINwPqf2oUF0sFJPNx0Rm+s7JBPb/EC1
70abbejtFOSBZMjoEMa5VFXDOAJ9bMILqk4owmnUWvkfVwLA5tRXxcVx34d02OLj
qIc9h0s7d2rbU1LOw3/8f4oVgDzcr8FMEWYG0y6h8g6NOUFky17wTODSgZIrWRxY
0fHpDe+jlQnxCoiAv7m3hGiNE0yquA4B4y4aduqyxNW1yQPxeHtrPeONJV6/8MIR
JxWsJPT2P9ao/DHCItMK1gEibmkATbHvpQfU/V75QoqVXY8GdYlLt0P247aiPyYr
As8jWsq731gdVsRCnGzE
-----END CERTIFICATE-----
`
let keyFile = `-----BEGIN PRIVATE KEY-----
MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCenbm9Vs2F+Mu9
51dRqoQy68pP2OmIWbl+mFLbgydilRgmsdBuWM/qGJtXGOR77Z89uXv18hIrVNBv
1Tt0DlGJmnO9i8AlRYhKj1lYsdnNRBHItkOZI7s4+NSGqOqYbM0Jmo4pp66c4mwz
MVuLLoO1+i5ROxROGa+b78hoQoCpUvtBX81pX1ds6To22bqig2zmdGjHHFkNk3mQ
yyG2JeIm4q7bt25S/D3HpX7VpkmqS1jewXu0tzAul+tydzqziQE4XeV0Oz+QUT/V
piPile0xKqmJX3l+YbkvHSIlfeFMJsM0ZngUkmKmFponIy0uZTY8VRnuRf7bs+Ft
FCDjf1BbAgMBAAECggEADQuP0SCoepJBv3adWdwaT03RL8v5OPuYI+9HMUKSJKt6
dwQ8zjaDsw8fB4TGleKvLBZrOYkVMXciRXBWGW9sCVMonbg2r1oOoYM0p/TIovcs
N0O2P4wOw9rDL+gIk0yveFC7zHU8CS8eEv/GNaY3sunGkWu4ecvnA34vD1QY3NQT
BPSv2+ZXSOV+nfSYg9noxJXHTgx+ALlSVe2731BFE1sBwkUpTpBvy/cnINwmsiVe
JIPH3JGzBydmvtYI+FjiqItqcsGaU8TKkqQmasZ9a92/8LMBWFS2cyLsKUiDaLHK
AwlL/Easbzd2Ri0cfhIXBWZweVa+DLr3B3XT/OhsAQKBgQDd9XcbYZWrM/HQ8k6V
PrbyxgF9pHjZPZF+OZjDknqDNRPNm1J/Ec+ij7nnazMPY9qOo4hwJNxd82dhSfbI
x+7gSCfecLDyGr44rH/zvLE/i5Yv52SDPv4x0gOpBzSfr+QV/dws450wccVpKstK
K3aw29ukOj7pnEXJn7dy10bVWwKBgQC28U1AfReCRdkh3GBIa5FdCT7GGN1ATQww
wtFkQ5RdWPbRbCQrxtafYQGTzjl+jzNRN/8tjU+VfdpK+mToKmXWBIkY3SlcTsPW
RHjf7pDKysK+q286e4PiLpV4KJus5H3SgVSroIpkjf5J4/W6xjR6MTHXvoOMxWns
wE6+EPNhAQKBgC3vTe4JvQrIXkQq0V6Lsxr9JXPWJPh4iHLCAr5+wwICaw3DFkib
7AetjQC6q7+En8ejSmpDBqQe6oc04nDdB6+83xtm4QfJxxI9iOFtbJVFExjo32FW
GQ9Acmd5yUc/BIoUlotns7FB6mQAaj/4TMD/Ty5mq3x3Te4TMsj+inc/AoGAONNJ
YL+6fq+9m4P9sGEhXRnTEuuERkXohHjvW8qWGkzZFgIWVjbEUetq9wN23nYSxaa0
L+0WDGR0WxfeIjORQGJWR4/jGhYpRLQuK7jJ5wQGa/2KZksZkzdPHGzYtmKfJrUf
nNQYSNXGaCNUH/kTMeV4CwDVkfN8TJsLmoRfZQECgYA3IGz12uGV1BvQaKaUy40r
xXAvIZbLM9L9otpERfr5I/mZL18xLqgp/mzoHG/FIvm3YvQBDQFaKZB0+pjaYdm/
vH6JfvJL7iqTKtgs/c+1EiizmkD/Z0aAZNQ6M1U69MjXcJlAa7USbBKkna1smyBA
Tjm6Um0WJONczsIiZq9M6Q==
-----END PRIVATE KEY-----
`

let smtpServer163: socket.NetAddress = {
  address: "smtp.163.com", port: 25
}

let httpsWebSite: socket.NetAddress = {
  address: "www.baidu.com", port: 443
}

let httpWebSite: socket.NetAddress = {
  address: "httpforever.com", port: 80
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

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketUpgrade_STARTTLS_0100
     * @tc.name  :  testSTARTTLSWith163Com
     * @tc.desc  :  Test STARTTLS feature by visiting smtp.163.com
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testSTARTTLSWith163Com', 0, async (done: Function) => {
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

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketUpgrade_OneWayTLS_0100
     * @tc.name  :  testOneWayTLSWithBaidu
     * @tc.desc  :  Test oneway TLS with upgraded TLSSocket by visiting baidu.com
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testOneWayTLSWithBaidu', 0, async (done: Function) => {
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

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketUpgrade_NotConnectedTCPSocket_0100
     * @tc.name  :  testUpgradeWithNotConnectedTCPSocket
     * @tc.desc  :  Test upgrading TLSSocket with not connected TCPSocket
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testUpgradeWithNotConnectedTCPSocket', 0, async (done: Function) => {
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

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketUpgrade_ClosedTCPSocket_0100
     * @tc.name  :  testUpgradeWithClosedTCPSocket
     * @tc.desc  :  Test upgrading TLSSocket with closed TCPSocket
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testUpgradeWithClosedTCPSocket', 0, async (done: Function) => {
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

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketUpgrade_UDPSocket_0100
     * @tc.name  :  testUpgradeWithUDPSocket
     * @tc.desc  :  Test upgrading TLSSocket with UDPSocket
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testUpgradeWithUDPSocket', 0, async (done: Function) => {
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

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketUpgrade_ParaNumber_0100
     * @tc.name  :  testUpgradeWithNumber
     * @tc.desc  :  Test upgrading TLSSocket with parameter number
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testUpgradeWithNumber', 0, async (done: Function) => {
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

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketUpgrade_ParaString_0100
     * @tc.name  :  testUpgradeWithString
     * @tc.desc  :  Test upgrading TLSSocket with parameter string
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testUpgradeWithString', 0, async (done: Function) => {
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

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketUpgrade_ParaObject_0100
     * @tc.name  :  testUpgradeWithInvalidObject
     * @tc.desc  :  Test upgrading TLSSocket with invalid object
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testUpgradeWithInvalidObject', 0, async (done: Function) => {
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

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketUpgrade_NoSSLServer_0100
     * @tc.name  :  testConnectToNoSSLServer
     * @tc.desc  :  Test connecting to HTTP server with upgraded TLSSocket
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testConnectToNoSSLServer', 0, async (done: Function) => {
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

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketUpgrade_ConcurrentUpgradeClosed_0100
     * @tc.name  :  testConcurrentUpgradeAndCloseTCPSocket
     * @tc.desc  :  Test upgrade and close Socket concurrently
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testConcurrentUpgradeAndCloseTCPSocket', 0, async (done: Function) => {
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

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketUpgrade_ConcurrentUpgradeSend_0100
     * @tc.name  :  testConcurrentUpgradeAndSendTCPSocket
     * @tc.desc  :  Test upgrade and send Socket concurrently
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testConcurrentUpgradeAndSendTCPSocket', 0, async (done: Function) => {
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

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketUpgrade_Concurrent10Upgrade_0100
     * @tc.name  :  testConcurrentUpgrade10TCPSocket
     * @tc.desc  :  Test upgrade 10 Sockets concurrently
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testConcurrentUpgrade10TCPSocket', 0, async (done: Function) => {
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

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketUpgrade_SendAfterUpgrade_0100
     * @tc.name  :  testTCPSocketSendAfterUpgrade
     * @tc.desc  :  Test TCPSocket send after upgraded
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testTCPSocketSendAfterUpgrade', 0, async (done: Function) => {
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

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocketUpgrade_SendAfterUpgrade_0100
     * @tc.name  :  testTLSSocketSendAfterUpgradeNotConnect
     * @tc.desc  :  Test upgraded TLSSocket send before connect
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testTLSSocketSendAfterUpgradeNotConnect', 0, async (done: Function) => {
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
