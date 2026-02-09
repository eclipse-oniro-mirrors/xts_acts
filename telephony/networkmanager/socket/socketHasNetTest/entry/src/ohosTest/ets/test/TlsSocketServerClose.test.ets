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

function sleep (time:number):Promise<string>{
  return new Promise<string>((resolve)=>{
    setTimeout(()=>{
      resolve('ok')},time)
  });
}
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

let password = "huaw"+"ei_123";
let key = "-----BEGIN PRIVATE KEY-----\n" +
  "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCzzNudbYUqQHGy\n" +
  "ryOABhTVexWUE4j/zAc405N1SA6pKg4L0KXihTLocf0Su4UZcpctH7XRZUwjvW32\n" +
  "AsezSwdp9HRScv3oLLsJ4b9kBRb/4izPIznU2g9PMU/41nvx7gFOSTii5auJzzHh\n" +
  "TNMTDt0A13WQzCnKd4HcUlSx9KUGVpiIWNz8L+tIDFUNW7MThLznCaK1hZLmn5rt\n" +
  "5zL6wTpxLZ/USlEVNOFdqf8q1Od467W+A2vjL6ovYy/jweXWrH251QhNazECz3Od\n" +
  "hBcdRd9S2gn9CjK/RyQX7e6tiJXtyJgK+kSCozNn5k28eKUi8dXzr8IW2QiVGoAG\n" +
  "Wgo2aeVvAgMBAAECggEAAKpLcOzVNzfg8OalzKCvb3EBPlt55yVYHTFrzoBC0tZH\n" +
  "V/boVnPFX5UuMwwiSfIpiu7ZBob8IN967GlXtN0YZZQIqwyirtoN0VdvjOpKBt+i\n" +
  "sitAXKEqFkZzS2amK93GVRFv8ykBIPe3FFTnYxNI9PogyqII6+kxXviQR/0Ojy9s\n" +
  "L0wkzPqRUl8Xkn61CJVVxY2cdyTuAtpdYH6kZQI23oq1eyYDjMXD1CHYmG5dG9ei\n" +
  "M3ROgZeKH6OHf0xM5DJdJKS37B9G+3E6GMTg6XSI8gxQx3VhGeUGi7V4YRrZh924\n" +
  "KFz6ATBFJkIyEQ9WGERb6RNOzm6croqnz1gM6sECUQKBgQDdvZ08KCsvMs/W4rWL\n" +
  "36r982GUvj2efmayucZBviSgjWC/ynbO+fQ1BjWYzDbIABPN6tcyryh6fodcRcAh\n" +
  "FisS9BdyQ0yTtgacZnc9hJsVWzfvlQhNtIDTft4mSoih8QIJKVQhPjbe6VErk1vA\n" +
  "JMOmamRbEm0CVXd2q1l+mNJz/wKBgQDPlGVtw645vVwZLn9MYHYDgUYJjZJWL60K\n" +
  "36Db+jy3SzfjDWo25/hCjM/rF43cIZBWVdga2hvNhVyF2JwRTPpIlEOWZlbo4L5z\n" +
  "C8nSzBLXnv18BME0LY/0vE1bq/nsSfgTZLbyONrtqt2sIw52O4eY9jYr1L22fDqz\n" +
  "a4/8piHOkQKBgQCUK81y0mCxBGIv9IRd+FMZqVWugEVKsKpNiag6bCWrh218G32y\n" +
  "pwIRoJmWBfghQzP4qJGuk68X047+ELnnIhocazFzsBbuqXbXcf0CBadf6PmCxfKr\n" +
  "gg+HxEIMEkgk9phmqNBH+nvODtinpqtrxOVcQcHXvYNMSPIwQSXnW5Vd3wKBgD+w\n" +
  "fF5tR6uXmgZv6cb5Ybw5kc+kjF29Sw6nBqf342Epxv/3QbuO+PESW0j6dSAxfCPB\n" +
  "OwkiGp24aWb3ywrT34cdVo9y3v+c1VJfL5Fp4+4cbhH7M3xa7mxcyi9yWMBTAbaR\n" +
  "lEBFiYaagmEqcGl+YmBgSsawA3VWMHyUaB1Qq9bBAoGAM0SdW7wtqjT3HwfFnjzt\n" +
  "T2ClsFzSe1q176llsnzkWpreGszMbCyYgYB20DSO4e7SWAcC1pA9flJp7zib7xFz\n" +
  "A1py3kqt6v0W1E1WXLA3QjOP7t8g3XZsQNud3MVe5NQoFYrWE/8KcSvBJXugpbcG\n" +
  "BRsRc8V9Y5Tii1RgvT31QXQ=\n" +
  "-----END PRIVATE KEY-----";
let ca_c = "-----BEGIN CERTIFICATE-----\n" +
  "MIIDhzCCAm+gAwIBAgIUEefGTn+Xtyu7ek/gtGwKAnglx7IwDQYJKoZIhvcNAQEL\n" +
  "BQAwUjELMAkGA1UEBhMCQ04xEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoM\n" +
  "GEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDELMAkGA1UEAwwCSFcwIBcNMjUxMjIy\n" +
  "MDkxODQ0WhgPMjA1NTEyMTUwOTE4NDRaMFIxCzAJBgNVBAYTAkNOMRMwEQYDVQQI\n" +
  "DApTb21lLVN0YXRlMSEwHwYDVQQKDBhJbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQx\n" +
  "CzAJBgNVBAMMAkhXMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA133v\n" +
  "W8HO6rmuTCh+6jttIaUDgJRXj0A6Jn2SEFVow4AtoMAYzZlCVZXWFabO3pAkHP8a\n" +
  "9Mee/oKnt1/G2SnPyuPYDO6AJGvJEi8LmcO7g7wgpS9CeeGHBMh3/H0xYviRAFdX\n" +
  "PN9KNReG2Qyy5m8vBZi7d6QxtqeVpRn0VmjyCXOgf6HzlG4EHQ7oeQ1F/GCgaXj0\n" +
  "99Z+9uJsf17eTe0eVzlQPV8+voof0mTN7QOREaN3cm/Q/PhqEArbgwi3G7Hh8Rwq\n" +
  "gKDSoHbfVsrYMv6grd6QAutHVHMxg6PQnugjmoUZ0fmqCaFPRE42YhQcCy4ms6K8\n" +
  "v8D/Fgu68v3hvNlpCQIDAQABo1MwUTAdBgNVHQ4EFgQUbGhloOYtlZgiJa6rWBq3\n" +
  "eFI5INswHwYDVR0jBBgwFoAUbGhloOYtlZgiJa6rWBq3eFI5INswDwYDVR0TAQH/\n" +
  "BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAhQDL9CcVvAK4gsr4yd05rX180STV\n" +
  "fkJvbYOGzqpiE+LustbaQM/LBK0qkJacoP2AvimekLi4yGDrNu8KluI0WAlC98+z\n" +
  "S1JB4cndpk+iL6Jr2y+ugb8W52m5SgCKW9I5gpL0GKKCdalsze0nLnJVF1+G8akL\n" +
  "B8+srBn3M2LaJdFYD485poPH59Mx0b3y8L4tfiJQbdGivrprCoR+7nLfXSueHeHb\n" +
  "WOv/iqF+83eQb6as0GrfLRHCquhBdafCVY/T6B3Gn6kMwzU/b6stGUokpuPZX7Tg\n" +
  "vHxFiuE3IxSGI4xaEBxC85oXHsOfNLGOShsNdM4R8BiY+peVU7XLc02Srw==\n" +
  "-----END CERTIFICATE-----";

let cert_c = "-----BEGIN CERTIFICATE-----\n" +
  "MIIDeDCCAmCgAwIBAgIUN0hCaro9vqOoeqNx+l6bWGZKY4AwDQYJKoZIhvcNAQEL\n" +
  "BQAwUjELMAkGA1UEBhMCQ04xEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoM\n" +
  "GEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDELMAkGA1UEAwwCSFcwHhcNMjUxMjIy\n" +
  "MDkyMjQ2WhcNMzUxMjIwMDkyMjQ2WjBWMQswCQYDVQQGEwJDTjETMBEGA1UECAwK\n" +
  "U29tZS1TdGF0ZTEhMB8GA1UECgwYSW50ZXJuZXQgV2lkZ2l0cyBQdHkgTHRkMQ8w\n" +
  "DQYDVQQDDAZIV19QVEwwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCz\n" +
  "zNudbYUqQHGyryOABhTVexWUE4j/zAc405N1SA6pKg4L0KXihTLocf0Su4UZcpct\n" +
  "H7XRZUwjvW32AsezSwdp9HRScv3oLLsJ4b9kBRb/4izPIznU2g9PMU/41nvx7gFO\n" +
  "STii5auJzzHhTNMTDt0A13WQzCnKd4HcUlSx9KUGVpiIWNz8L+tIDFUNW7MThLzn\n" +
  "CaK1hZLmn5rt5zL6wTpxLZ/USlEVNOFdqf8q1Od467W+A2vjL6ovYy/jweXWrH25\n" +
  "1QhNazECz3OdhBcdRd9S2gn9CjK/RyQX7e6tiJXtyJgK+kSCozNn5k28eKUi8dXz\n" +
  "r8IW2QiVGoAGWgo2aeVvAgMBAAGjQjBAMB0GA1UdDgQWBBS6XjNDkmfeM8WufAlv\n" +
  "AKJ/YopbZTAfBgNVHSMEGDAWgBRsaGWg5i2VmCIlrqtYGrd4Ujkg2zANBgkqhkiG\n" +
  "9w0BAQsFAAOCAQEAyAS03vc+5k6Hn/HYU1Y1hvBjbbnYJnJfnad2+epE3r9wm/Pb\n" +
  "X2/9kKF0jJ6Nl5u7a1ZZV+OoHSa8caOUXeH1RRO5I1iPmAqRUNmvLuouXW9PXu/f\n" +
  "u8ovkDHUoYVO4EhY2gjWe1HEO3cWnfgTwd2hy0UsK3k7j6FR5r0X78QLtNe7prLr\n" +
  "RbrwZhoPSKhF9iQWlADOthnbH0zVcTCKGz6ZFuJkdNs+tmYA4aiVK1gGJhD77lKy\n" +
  "IEDJ5Ekf6HEf+1dAZYmNsaHe9mtNGSJlFocIHi62Fzr6jE/yBA0gYu5fZ9s82M2x\n" +
  "KQ4kYU8nxku0c2ZvhIvOY2u/g6ywZlCLitLnyA==\n" +
  "-----END CERTIFICATE-----";
let tlsSecureOptions: socket.TLSSecureOptions = {
  key: key,
  cert: cert_c,
  protocols: socket.Protocol.TLSv13,
  useRemoteCipherPrefer: true,
}
let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
let tlsClient: socket.TLSSocket = socket.constructTLSSocketInstance();
export default function TlsSocketServerCloseTest() {
  describe("TlsSocketServerCloseTest", () => {
    afterEach(async ()=>{
      tlsServer = socket.constructTLSSocketServerInstance();
      tlsClient = socket.constructTLSSocketInstance();
      await sleep(50);
    })

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_0100
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTLSSocketServerClose0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose0100';
      console.info(`${caseName} test start`);
      try {
        let port: number = Math.round(1024+ Math.random()*5000+Math.random()*4000);
        let netAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: port
        }
        let tlsConnectOptions: socket.TLSConnectOptions = {
          address: netAddress,
          secureOptions: tlsSecureOptions,
          ALPNProtocols: ["http/1.1"]
        }
        await tlsServer.listen(tlsConnectOptions).then(async () => {
          console.log(`${caseName} tlsServer listen  success`)
          tlsServer.on('connect', async (client: socket.TLSSocketConnection) => {
            console.log(`${caseName} ======= tlsServer on  connect  success client is :`+ JSON.stringify(client));
            await sleep(500);
            tlsServer.close().then(()=>{
              console.log(`${caseName} tlsServer close success`);
              ExpectTrue(true);
              tlsServer.off('connect');
              done();
              console.info(`${caseName}---End`);
            }).catch((err: BusinessError)=>{
              console.log(`${caseName} tlsServer close failed err is :`+JSON.stringify(err));
              ExpectFail();
              done();
            })
          })
        })
        await tlsClient.bind(netAddress,async  (err: BusinessError) => {
          if(err){
            console.info(`${caseName} tlsClient bind failed err is: `+JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }else{
            console.info(`${caseName} tlsClient bind success `);
            let tlsTwoWaySecureOption: socket.TLSSecureOptions = {
              ca:ca_c,
              cert: cert_c,
              password: password,
              key:key,
              protocols: [socket.Protocol.TLSv13],
              signatureAlgorithms: "rsa_pss_rsae_sha256:rsa_pss_rsae_sha384:ecdsa_secp256r1_sha256:ecdsa_secp384r1_sha384:ed25519"
            } ;
            let tlsTwoWayConnectOptions: socket.TLSConnectOptions = {
              address: netAddress,
              secureOptions: tlsTwoWaySecureOption
            };
            console.log("--- connection start--")
            tlsClient.connect(tlsTwoWayConnectOptions).then(async () => {
              console.log(`${caseName} tlsClient connect success`);
              await tlsClient.close().then(()=>{
                console.log(`${caseName} tlsClient close success`);
              }).catch((err: BusinessError)=>{
                console.log(`${caseName} tlsClient close failed`+ JSON.stringify(err));
                ExpectFail();
                done();
                console.info(`${caseName}---End`);
              })
            }).catch((err: BusinessError) => {
              console.info(`${caseName}tlsClient connect failed catch  err is `+JSON.stringify(err));
              ExpectFail();
              done();
              console.info(`${caseName}---End`);
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose0200
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_0200
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTLSSocketServerClose0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose0200';
      console.info(`${caseName} test start`);
      try {
        let port: number = Math.round(1024+ Math.random()*5000+Math.random()*4000);
        let netAddress: socket.NetAddress = {
          address: '::1',
          port: port,
          family: 2
        }
        let tlsConnectOptions: socket.TLSConnectOptions = {
          address: netAddress,
          secureOptions: tlsSecureOptions,
          ALPNProtocols: ["http/1.1"]
        }
        await tlsServer.listen(tlsConnectOptions).then(async () => {
          console.log(`${caseName} tlsServer listen  success`)
          tlsServer.on('connect', async (client: socket.TLSSocketConnection) => {
            console.log(`${caseName} ======= tlsServer on  connect  success client is :`+ JSON.stringify(client));
            await sleep(500);
            tlsServer.close().then(()=>{
              console.log(`${caseName} tlsServer close success`);
              ExpectTrue(true);
              tlsServer.off('connect');
              done();
              console.info(`${caseName}---End`);
            }).catch((err: BusinessError)=>{
              console.log(`${caseName} tlsServer close failed err is :`+JSON.stringify(err));
              ExpectFail();
              done();
            })
          })
        })
        await tlsClient.bind(netAddress,async  (err: BusinessError) => {
          if(err){
            console.info(`${caseName} tlsClient bind failed err is: `+JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }else{
            console.info(`${caseName} tlsClient bind success `);
            let tlsTwoWaySecureOption: socket.TLSSecureOptions = {
              ca:ca_c,
              cert: cert_c,
              password: password,
              key:key,
              protocols: [socket.Protocol.TLSv13],
              signatureAlgorithms: "rsa_pss_rsae_sha256:rsa_pss_rsae_sha384:ecdsa_secp256r1_sha256:ecdsa_secp384r1_sha384:ed25519"
            } ;
            //tlsTwoWaySecureOption.cipherSuite = "AES256-SHA384";
            let tlsTwoWayConnectOptions: socket.TLSConnectOptions = {
              address: netAddress,
              secureOptions: tlsTwoWaySecureOption
            };
            console.log("--- connection start---")
            tlsClient.connect(tlsTwoWayConnectOptions).then(async () => {
              console.log(`${caseName} tlsClient connect success`);
              await tlsClient.close().then(()=>{
                console.log(`${caseName} tlsClient close success`);
              }).catch((err: BusinessError)=>{
                console.log(`${caseName} tlsClient close failed`+ JSON.stringify(err));
                ExpectFail();
                done();
                console.info(`${caseName}---End`);
              })
            }).catch((err: BusinessError) => {
              console.info(`${caseName}tlsClient connect failed catch  err is `+JSON.stringify(err));
              ExpectFail();
              done();
              console.info(`${caseName}---End`);
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose0300
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_0300
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTLSSocketServerClose0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose0300';
      console.info(`${caseName} test start`);
      try {
        let port: number = Math.round(1024+ Math.random()*5000+Math.random()*4000);
        let netAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: port
        }
        let tlsConnectOptions: socket.TLSConnectOptions = {
          address: netAddress,
          secureOptions: tlsSecureOptions,
          ALPNProtocols: ["http/1.1"]
        }
        await tlsServer.listen(tlsConnectOptions).then(async () => {
          console.log(`${caseName} tlsServer listen  success`)
          tlsServer.on('connect', async (tlsSocketConnection: socket.TLSSocketConnection) => {
            console.log(`${caseName} ======= tlsServer on  connect  success client is :`+ JSON.stringify(tlsSocketConnection));
            await sleep(500);
            tlsServer.close().then(()=>{
              console.log(`${caseName} tlsServer close success`);
              tlsSocketConnection.send("tlsServer close send").then(()=>{
                console.log(`${caseName} client send success`);
                ExpectTrue(true);
                tlsServer.off('connect');
                console.info(`${caseName}---End`);
                done();
              }).catch((err: BusinessError)=>{
                console.log(`${caseName} client send failed err is: `+JSON.stringify(err));
                ExpectFail();
                console.info(`${caseName}---End`);
                done();
              })
            }).catch((err: BusinessError)=>{
              console.log(`${caseName} tlsServer close failed err is :`+JSON.stringify(err));
              ExpectFail();
              done();
            })
          })
        })
        await tlsClient.bind(netAddress,async  (err: BusinessError) => {
          if(err){
            console.info(`${caseName} tlsClient bind failed err is: `+JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }else{
            console.info(`${caseName} tlsClient bind success `);
            let tlsTwoWaySecureOption: socket.TLSSecureOptions = {
              ca:ca_c,
              cert: cert_c,
              password: password,
              key:key,
              protocols: [socket.Protocol.TLSv13],
              signatureAlgorithms: "rsa_pss_rsae_sha256:rsa_pss_rsae_sha384:ecdsa_secp256r1_sha256:ecdsa_secp384r1_sha384:ed25519"
            } ;
            let tlsTwoWayConnectOptions: socket.TLSConnectOptions = {
              address: netAddress,
              secureOptions: tlsTwoWaySecureOption
            };
            console.log("--- connection start")
            tlsClient.connect(tlsTwoWayConnectOptions).then(async () => {
              console.log(`${caseName} tlsClient connect success`);
              await tlsClient.close().then(()=>{
                console.log(`${caseName} tlsClient close success`);
              }).catch((err: BusinessError)=>{
                console.log(`${caseName} tlsClient close failed`+ JSON.stringify(err));
                ExpectFail();
                done();
                console.info(`${caseName}---End`);
              })
            }).catch((err: BusinessError) => {
              console.info(`${caseName}tlsClient connect failed catch  err is `+JSON.stringify(err));
              ExpectFail();
              done();
              console.info(`${caseName}---End`);
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose0400
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_0400
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTLSSocketServerClose0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose0400';
      console.info(`${caseName} test start`);
      try {
        let port: number = Math.round(1024+ Math.random()*5000+Math.random()*4000);
        let netAddress: socket.NetAddress = {
          address: '::1',
          port: port,
          family: 2
        }
        let tlsConnectOptions: socket.TLSConnectOptions = {
          address: netAddress,
          secureOptions: tlsSecureOptions,
          ALPNProtocols: ["http/1.1"]
        }
        await tlsServer.listen(tlsConnectOptions).then(async () => {
          console.log(`${caseName} tlsServer listen  success`)
          tlsServer.on('connect', async (tlsSocketConnection: socket.TLSSocketConnection) => {
            console.log(`${caseName} ======= tlsServer on  connect  success client is :`+ JSON.stringify(tlsSocketConnection));
            await sleep(500);
            tlsServer.close().then(()=>{
              console.log(`${caseName} tlsServer close success`);
              tlsSocketConnection.send("tlsServer close send").then(()=>{
                console.log(`${caseName} client send success`);
                ExpectTrue(true);
                tlsServer.off('connect');
                console.info(`${caseName}---End`);
                done();
              }).catch((err: BusinessError)=>{
                console.log(`${caseName} client send failed err is: `+JSON.stringify(err));
                ExpectFail();
                console.info(`${caseName}---End`);
                done();
              })
            }).catch((err: BusinessError)=>{
              console.log(`${caseName} tlsServer close failed err is :`+JSON.stringify(err));
              ExpectFail();
              done();
            })
          })
        })
        await tlsClient.bind(netAddress,async  (err: BusinessError) => {
          if(err){
            console.info(`${caseName} tlsClient bind failed err is: `+JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }else{
            console.info(`${caseName} tlsClient bind success `);
            let tlsTwoWaySecureOption: socket.TLSSecureOptions = {
              ca:ca_c,
              cert: cert_c,
              password: password,
              key:key,
              protocols: [socket.Protocol.TLSv13],
              signatureAlgorithms: "rsa_pss_rsae_sha256:rsa_pss_rsae_sha384:ecdsa_secp256r1_sha256:ecdsa_secp384r1_sha384:ed25519"
            } ;
            let tlsTwoWayConnectOptions: socket.TLSConnectOptions = {
              address: netAddress,
              secureOptions: tlsTwoWaySecureOption
            };
            console.log("--- connection start")
            tlsClient.connect(tlsTwoWayConnectOptions).then(async () => {
              console.log(`${caseName} tlsClient connect success`);
              await tlsClient.close().then(()=>{
                console.log(`${caseName} tlsClient close success`);
              }).catch((err: BusinessError)=>{
                console.log(`${caseName} tlsClient close failed`+ JSON.stringify(err));
                ExpectFail();
                done();
                console.info(`${caseName}---End`);
              })
            }).catch((err: BusinessError) => {
              console.info(`${caseName}tlsClient connect failed catch  err is `+JSON.stringify(err));
              ExpectFail();
              done();
              console.info(`${caseName}---End`);
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose0500
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_0500
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketServerClose0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose0500';
      console.info(`${caseName} test start`);
      try {
        let port: number = Math.round(1024+ Math.random()*5000+Math.random()*4000);
        let netAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: port
        }
        let tlsConnectOptions: socket.TLSConnectOptions = {
          address: netAddress,
          secureOptions: tlsSecureOptions,
          ALPNProtocols: ["http/1.1"]
        }
        await tlsServer.listen(tlsConnectOptions).then(async () => {
          console.log(`${caseName} tlsServer listen  success`)
          tlsServer.on('connect', async (client: socket.TLSSocketConnection) => {
            console.log(`${caseName} ======= tlsServer on  connect  success client is :`+ JSON.stringify(client));
            await sleep(500);
            tlsServer.close().then(()=>{
              console.log(`${caseName} tlsServer close success`);
              tlsClient.send("send again").then(async ()=>{
                console.log(`${caseName} tlsClient send success`);
                ExpectTrue(true);
                tlsServer.off('connect');
                done();
                console.info(`${caseName}---End`);
              }).catch((err: BusinessError)=>{
                console.log(`${caseName} tlsClient send failed err is`+JSON.stringify(err));
                ExpectFail();
                done();
                console.info(`${caseName}---End`);
              })
            }).catch((err: BusinessError)=>{
              console.log(`${caseName} tlsServer close failed err is :`+JSON.stringify(err));
              ExpectFail();
              done();
            })
          })
        })
        await tlsClient.bind(netAddress, async (err: BusinessError) => {
          if(err){
            console.info(`${caseName} tlsClient bind failed err is: `+JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }else{
            console.info(`${caseName} tlsClient bind success `);
            let tlsTwoWaySecureOption: socket.TLSSecureOptions = {
              ca:ca_c,
              cert: cert_c,
              password: password,
              key:key,
              protocols: [socket.Protocol.TLSv13],
              signatureAlgorithms: "rsa_pss_rsae_sha256:rsa_pss_rsae_sha384:ecdsa_secp256r1_sha256:ecdsa_secp384r1_sha384:ed25519"
            } ;
            let tlsTwoWayConnectOptions: socket.TLSConnectOptions = {
              address: netAddress,
              secureOptions: tlsTwoWaySecureOption
            };
            console.log("--- connection start----")
            tlsClient.connect(tlsTwoWayConnectOptions).then(async () => {
              console.log(`${caseName} tlsClient connect success`);
            }).catch((err: BusinessError) => {
              console.info(`${caseName} tlsClient connect failed catch  err is `+JSON.stringify(err));
              ExpectFail();
              done();
              console.info(`${caseName}---End`);
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose0600
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_0600
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketServerClose0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose0600';
      console.info(`${caseName} test start`);
      try {
        let port: number = Math.round(1024+ Math.random()*5000+Math.random()*4000);
        let netAddress: socket.NetAddress = {
          address: '::1',
          port: port,
          family: 2
        }
        let tlsConnectOptions: socket.TLSConnectOptions = {
          address: netAddress,
          secureOptions: tlsSecureOptions,
          ALPNProtocols: ["http/1.1"]
        }
        await tlsServer.listen(tlsConnectOptions).then(async () => {
          console.log(`${caseName} tlsServer listen  success`)
          tlsServer.on('connect', async (client: socket.TLSSocketConnection) => {
            console.log(`${caseName} ======= tlsServer on  connect  success client is :`+ JSON.stringify(client));
            await sleep(500);
            tlsServer.close().then(()=>{
              console.log(`${caseName} tlsServer close success`);
              tlsClient.send("send again").then(async ()=>{
                console.log(`${caseName} tlsClient send success`);
                ExpectTrue(true);
                tlsServer.off('connect');
                done();
                console.info(`${caseName}---End`);
              }).catch((err: BusinessError)=>{
                console.log(`${caseName} tlsClient send failed err is`+JSON.stringify(err));
                ExpectFail();
                done();
                console.info(`${caseName}---End`);
              })
            }).catch((err: BusinessError)=>{
              console.log(`${caseName} tlsServer close failed err is :`+JSON.stringify(err));
              ExpectFail();
              done();
            })
          })
        })
        await tlsClient.bind(netAddress, async (err: BusinessError) => {
          if(err){
            console.info(`${caseName} tlsClient bind failed err is: `+JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }else{
            console.info(`${caseName} tlsClient bind success `);
            let tlsTwoWaySecureOption: socket.TLSSecureOptions = {
              ca:ca_c,
              cert: cert_c,
              password: password,
              key:key,
              protocols: [socket.Protocol.TLSv13],
              signatureAlgorithms: "rsa_pss_rsae_sha256:rsa_pss_rsae_sha384:ecdsa_secp256r1_sha256:ecdsa_secp384r1_sha384:ed25519"
            } ;
            let tlsTwoWayConnectOptions: socket.TLSConnectOptions = {
              address: netAddress,
              secureOptions: tlsTwoWaySecureOption
            };
            console.log("--- connection start----")
            tlsClient.connect(tlsTwoWayConnectOptions).then(async () => {
              console.log(`${caseName} tlsClient connect success`);
            }).catch((err: BusinessError) => {
              console.info(`${caseName} tlsClient connect failed catch  err is `+JSON.stringify(err));
              ExpectFail();
              done();
              console.info(`${caseName}---End`);
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose0700
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_0700
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketServerClose0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose0700';
      console.info(`${caseName} test start`);
      try {
        let port: number = Math.round(1024+ Math.random()*5000+Math.random()*4000);
        let netAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: port,
          family: 1
        }
        let tlsConnectOptions: socket.TLSConnectOptions = {
          address: netAddress,
          secureOptions: tlsSecureOptions,
          ALPNProtocols: ["http/1.1"]
        }
        await tlsServer.listen(tlsConnectOptions).then(async () => {
          console.log(`${caseName} tlsServer listen  success`)
          tlsServer.on('connect', async (client: socket.TLSSocketConnection) => {
            console.log(`${caseName} ======= tlsServer on  connect  success client is :`+ JSON.stringify(client));
            await sleep(500);
            tlsServer.close().then(()=>{
              console.log(`${caseName} tlsServer close success`);
              tlsServer.listen(tlsConnectOptions).then(()=>{
                console.log(`${caseName} tlsServer listen again success`);
                ExpectTrue(true);
                tlsServer.off('connect');
                console.info(`${caseName}---End`);
                done();
              }).catch((err: BusinessError)=>{
                console.log(`${caseName} tlsServer close failed err is :`+JSON.stringify(err));
                ExpectFail();
                console.info(`${caseName}---End`);
                done();
              })
            }).catch((err: BusinessError)=>{
              console.log(`${caseName} tlsServer close failed err is :`+JSON.stringify(err));
              ExpectFail();
              done();
            })
          })
        })
        await tlsClient.bind(netAddress, async (err: BusinessError) => {
          if(err){
            console.info(`${caseName} tlsClient bind failed err is: `+JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }else{
            console.info(`${caseName} tlsClient bind success `);
            let tlsTwoWaySecureOption: socket.TLSSecureOptions = {
              ca:ca_c,
              cert: cert_c,
              password: password,
              key:key,
              protocols: [socket.Protocol.TLSv13],
              signatureAlgorithms: "rsa_pss_rsae_sha256:rsa_pss_rsae_sha384:ecdsa_secp256r1_sha256:ecdsa_secp384r1_sha384:ed25519"
            } ;
            let tlsTwoWayConnectOptions: socket.TLSConnectOptions = {
              address: netAddress,
              secureOptions: tlsTwoWaySecureOption
            };
            console.log("--- connection start---")
            tlsClient.connect(tlsTwoWayConnectOptions).then(async () => {
              console.log(`${caseName} tlsClient connect success`);
              await tlsClient.close().then(()=>{
                console.log(`${caseName} tlsClient close success`);
              }).catch((err: BusinessError)=>{
                console.log(`${caseName} tlsClient close failed`+ JSON.stringify(err));
                ExpectFail();
                done();
                console.info(`${caseName}---End`);
              })
            }).catch((err: BusinessError) => {
              console.info(`${caseName} tlsClient connect failed catch  err is `+JSON.stringify(err));
              ExpectFail();
              done();
              console.info(`${caseName}---End`);
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose0800
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_0800
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketServerClose0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose0800';
      console.info(`${caseName} test start`);
      try {
        let port: number = Math.round(1024+ Math.random()*5000+Math.random()*4000);
        let netAddress: socket.NetAddress = {
          address: '::1',
          port: port,
          family: 2
        }
        let tlsConnectOptions: socket.TLSConnectOptions = {
          address: netAddress,
          secureOptions: tlsSecureOptions,
          ALPNProtocols: ["http/1.1"]
        }
        await tlsServer.listen(tlsConnectOptions).then(async () => {
          console.log(`${caseName} tlsServer listen  success`)
          tlsServer.on('connect', async (client: socket.TLSSocketConnection) => {
            console.log(`${caseName} ======= tlsServer on  connect  success client is :`+ JSON.stringify(client));
            await sleep(500);
            tlsServer.close().then(()=>{
              console.log(`${caseName} tlsServer close success`);
              tlsServer.listen(tlsConnectOptions).then(()=>{
                console.log(`${caseName} tlsServer listen again success`);
                ExpectTrue(true);
                tlsServer.off('connect');
                console.info(`${caseName}---End`);
                done();
              }).catch((err: BusinessError)=>{
                console.log(`${caseName} tlsServer close failed err is :`+JSON.stringify(err));
                ExpectFail();
                console.info(`${caseName}---End`);
                done();
              })
            }).catch((err: BusinessError)=>{
              console.log(`${caseName} tlsServer close failed err is :`+JSON.stringify(err));
              ExpectFail();
              done();
            })
          })
        })
        await tlsClient.bind(netAddress, async (err: BusinessError) => {
          if(err){
            console.info(`${caseName} tlsClient bind failed err is: `+JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }else{
            console.info(`${caseName} tlsClient bind success `);
            let tlsTwoWaySecureOption: socket.TLSSecureOptions = {
              ca:ca_c,
              cert: cert_c,
              password: password,
              key:key,
              protocols: [socket.Protocol.TLSv13],
              signatureAlgorithms: "rsa_pss_rsae_sha256:rsa_pss_rsae_sha384:ecdsa_secp256r1_sha256:ecdsa_secp384r1_sha384:ed25519"
            } ;
            let tlsTwoWayConnectOptions: socket.TLSConnectOptions = {
              address: netAddress,
              secureOptions: tlsTwoWaySecureOption
            };
            console.log("--- connection start---")
            tlsClient.connect(tlsTwoWayConnectOptions).then(async () => {
              console.log(`${caseName} tlsClient connect success`);
              await tlsClient.close().then(()=>{
                console.log(`${caseName} tlsClient close success`);
              }).catch((err: BusinessError)=>{
                console.log(`${caseName} tlsClient close failed`+ JSON.stringify(err));
                ExpectFail();
                done();
                console.info(`${caseName}---End`);
              })
            }).catch((err: BusinessError) => {
              console.info(`${caseName} tlsClient connect failed catch  err is `+JSON.stringify(err));
              ExpectFail();
              done();
              console.info(`${caseName}---End`);
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose0900
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_0900
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketServerClose0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose0900';
      console.info(`${caseName} test start`);
      try {
        let port: number = Math.round(1024+ Math.random()*5000+Math.random()*4000);
        let netAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: port
        }
        let tlsConnectOptions: socket.TLSConnectOptions = {
          address: netAddress,
          secureOptions: tlsSecureOptions,
          ALPNProtocols: ["http/1.1"]
        }
        await tlsServer.listen(tlsConnectOptions).then(async () => {
          console.log(`${caseName} tlsServer listen  success`)
          tlsServer.on('connect', async (client: socket.TLSSocketConnection) => {
            console.log(`${caseName} ======= tlsServer on  connect  success client is :`+ JSON.stringify(client));
            await sleep(500);
            await tlsServer.close().then(()=>{
              console.log(`${caseName} tlsServer close success`);
              ExpectTrue(true);
              tlsServer.off('connect');
              console.info(`${caseName}---End`);
              done();
            }).catch((err: BusinessError)=>{
              console.log(`${caseName} tlsServer close failed err is :`+JSON.stringify(err));
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            })
          })
        })
        await tlsClient.bind(netAddress, async (err: BusinessError) => {
          if(err){
            console.info(`${caseName} tlsClient bind failed err is: `+JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }else{
            console.info(`${caseName} tlsClient bind success `);
            let tlsTwoWaySecureOption: socket.TLSSecureOptions = {
              ca:ca_c,
              cert: cert_c,
              password: password,
              key:key,
              protocols: [socket.Protocol.TLSv13],
              signatureAlgorithms: "rsa_pss_rsae_sha256:rsa_pss_rsae_sha384:ecdsa_secp256r1_sha256:ecdsa_secp384r1_sha384:ed25519"
            } ;
            let tlsTwoWayConnectOptions: socket.TLSConnectOptions = {
              address: netAddress,
              secureOptions: tlsTwoWaySecureOption
            };
            console.log("--- connection--start---")
            tlsClient.connect(tlsTwoWayConnectOptions).then(async () => {
              console.log(`${caseName} tlsClient connect success`);
              await tlsClient.close().then(()=>{
                console.log(`${caseName} tlsClient close success`);
              }).catch((err: BusinessError)=>{
                console.log(`${caseName} tlsClient close failed`+ JSON.stringify(err));
                ExpectFail();
                done();
                console.info(`${caseName}---End`);
              })
            }).catch((err: BusinessError) => {
              console.info(`${caseName} tlsClient connect  get err is `+JSON.stringify(err));
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose1000
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_1000
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketServerClose1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose1000';
      console.info(`${caseName} test start`);
      try {
        let port: number = Math.round(1024+ Math.random()*5000+Math.random()*4000);
        let netAddress: socket.NetAddress = {
          address: '::1',
          port: port,
          family: 2
        }
        let tlsConnectOptions: socket.TLSConnectOptions = {
          address: netAddress,
          secureOptions: tlsSecureOptions,
          ALPNProtocols: ["http/1.1"]
        }
        await tlsServer.listen(tlsConnectOptions).then(async () => {
          console.log(`${caseName} tlsServer listen  success`)
          tlsServer.on('connect', async (client: socket.TLSSocketConnection) => {
            console.log(`${caseName} ======= tlsServer on  connect  success client is :`+ JSON.stringify(client));
            await sleep(500);
            await tlsServer.close().then(()=>{
              console.log(`${caseName} tlsServer close success`);
              ExpectTrue(true);
              tlsServer.off('connect');
              console.info(`${caseName}---End`);
              done();
            }).catch((err: BusinessError)=>{
              console.log(`${caseName} tlsServer close failed err is :`+JSON.stringify(err));
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            })
          })
        })
        await tlsClient.bind(netAddress, async (err: BusinessError) => {
          if(err){
            console.info(`${caseName} tlsClient bind failed err is: `+JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }else{
            console.info(`${caseName} tlsClient bind success `);
            let tlsTwoWaySecureOption: socket.TLSSecureOptions = {
              ca:ca_c,
              cert: cert_c,
              password: password,
              key:key,
              protocols: [socket.Protocol.TLSv13],
              signatureAlgorithms: "rsa_pss_rsae_sha256:rsa_pss_rsae_sha384:ecdsa_secp256r1_sha256:ecdsa_secp384r1_sha384:ed25519"
            } ;
            let tlsTwoWayConnectOptions: socket.TLSConnectOptions = {
              address: netAddress,
              secureOptions: tlsTwoWaySecureOption
            };
            console.log("--- connection--start---")
            tlsClient.connect(tlsTwoWayConnectOptions).then(async () => {
              console.log(`${caseName} tlsClient connect success`);
              await tlsClient.close().then(()=>{
                console.log(`${caseName} tlsClient close success`);
              }).catch((err: BusinessError)=>{
                console.log(`${caseName} tlsClient close failed`+ JSON.stringify(err));
                ExpectFail();
                done();
                console.info(`${caseName}---End`);
              })
            }).catch((err: BusinessError) => {
              console.info(`${caseName} tlsClient connect  get err is `+JSON.stringify(err));
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose1100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_1100
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketServerClose1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose1100';
      console.info(`${caseName} test start`);
      try {
        let port: number = Math.round(1024+ Math.random()*5000+Math.random()*4000);
        let netAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: port
        }
        let tlsConnectOptions: socket.TLSConnectOptions = {
          address: netAddress,
          secureOptions: tlsSecureOptions,
          ALPNProtocols: ["http/1.1"]
        }
        await tlsServer.listen(tlsConnectOptions).then(async () => {
          console.log(`${caseName} tlsServer listen  success`)
          tlsServer.on('connect', async (tlsSocketConnection: socket.TLSSocketConnection) => {
            console.log(`${caseName} ======= tlsServer on  connect  success client is :`+ JSON.stringify(tlsSocketConnection));
            await tlsSocketConnection.close().then(()=>{
              console.log(`${caseName} tlsSocketConnection close success`);
            }).catch((err: BusinessError)=>{
              console.log(`${caseName} tlsSocketConnection close failed`+ JSON.stringify(err));
              ExpectFail();
              done();
              console.info(`${caseName}---End`);
            })
            await sleep(500);
            await tlsServer.close().then(()=>{
              console.log(`${caseName} tlsServer close success`);
              ExpectTrue(true);
              tlsServer.off('connect');
              console.info(`${caseName}---End`);
              done();
            }).catch((err: BusinessError)=>{
              console.log(`${caseName} tlsServer close failed err is :`+JSON.stringify(err));
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            })
          })
        })
        await tlsClient.bind(netAddress, async (err: BusinessError) => {
          if(err){
            console.info(`${caseName} tlsClient bind failed err is: `+JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }else{
            console.info(`${caseName} tlsClient bind success `);
            let tlsTwoWaySecureOption: socket.TLSSecureOptions = {
              ca:ca_c,
              cert: cert_c,
              password: password,
              key:key,
              protocols: [socket.Protocol.TLSv13],
              signatureAlgorithms: "rsa_pss_rsae_sha256:rsa_pss_rsae_sha384:ecdsa_secp256r1_sha256:ecdsa_secp384r1_sha384:ed25519"
            } ;
            let tlsTwoWayConnectOptions: socket.TLSConnectOptions = {
              address: netAddress,
              secureOptions: tlsTwoWaySecureOption
            };
            console.log("--- connection--start---")
            tlsClient.connect(tlsTwoWayConnectOptions).then(async () => {
              console.log(`${caseName} tlsClient connect success`);
            }).catch((err: BusinessError) => {
              console.info(`${caseName} tlsClient connect  get err is `+JSON.stringify(err));
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose1200
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_1200
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketServerClose1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose1200';
      console.info(`${caseName} test start`);
      try {
        let port: number = Math.round(1024+ Math.random()*5000+Math.random()*4000);
        let netAddress: socket.NetAddress = {
          address: '::1',
          port: port,
          family: 2
        }
        let tlsConnectOptions: socket.TLSConnectOptions = {
          address: netAddress,
          secureOptions: tlsSecureOptions,
          ALPNProtocols: ["http/1.1"]
        }
        await tlsServer.listen(tlsConnectOptions).then(async () => {
          console.log(`${caseName} tlsServer listen  success`)
          tlsServer.on('connect', async (tlsSocketConnection: socket.TLSSocketConnection) => {
            console.log(`${caseName} ======= tlsServer on  connect  success client is :`+ JSON.stringify(tlsSocketConnection));
            await tlsSocketConnection.close().then(()=>{
              console.log(`${caseName} tlsSocketConnection close success`);
            }).catch((err: BusinessError)=>{
              console.log(`${caseName} tlsSocketConnection close failed`+ JSON.stringify(err));
              ExpectFail();
              done();
              console.info(`${caseName}---End`);
            })
            await sleep(500);
            await tlsServer.close().then(()=>{
              console.log(`${caseName} tlsServer close success`);
              ExpectTrue(true);
              tlsServer.off('connect');
              console.info(`${caseName}---End`);
              done();
            }).catch((err: BusinessError)=>{
              console.log(`${caseName} tlsServer close failed err is :`+JSON.stringify(err));
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            })
          })
        })
        await tlsClient.bind(netAddress, async (err: BusinessError) => {
          if(err){
            console.info(`${caseName} tlsClient bind failed err is: `+JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }else{
            console.info(`${caseName} tlsClient bind success `);
            let tlsTwoWaySecureOption: socket.TLSSecureOptions = {
              ca:ca_c,
              cert: cert_c,
              password: password,
              key:key,
              protocols: [socket.Protocol.TLSv13],
              signatureAlgorithms: "rsa_pss_rsae_sha256:rsa_pss_rsae_sha384:ecdsa_secp256r1_sha256:ecdsa_secp384r1_sha384:ed25519"
            } ;
            let tlsTwoWayConnectOptions: socket.TLSConnectOptions = {
              address: netAddress,
              secureOptions: tlsTwoWaySecureOption
            };
            console.log("--- connection--start---")
            tlsClient.connect(tlsTwoWayConnectOptions).then(async () => {
              console.log(`${caseName} tlsClient connect success`);
            }).catch((err: BusinessError) => {
              console.info(`${caseName} tlsClient connect  get err is `+JSON.stringify(err));
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose1300
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_1300
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketServerClose1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose1300';
      console.info(`${caseName} test start`);
      try {
        let port: number = Math.round(1024+ Math.random()*5000+Math.random()*4000);
        let netAddress: socket.NetAddress = {
          address: '::1',
          port: port,
          family: 2
        }
        let tlsConnectOptions: socket.TLSConnectOptions = {
          address: netAddress,
          secureOptions: tlsSecureOptions,
          ALPNProtocols: ["http/1.1"]
        }
        await tlsServer.listen(tlsConnectOptions).then(async () => {
          console.log(`${caseName} tlsServer listen  success`)
          tlsServer.close().then(()=>{
            console.log(`${caseName} tlsServer close success`);
            ExpectTrue(true);
            tlsServer.off('connect');
            console.info(`${caseName}---End`);
            done();
          }).catch((err: BusinessError)=>{
            console.log(`${caseName} tlsServer close failed err is :`+JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          })
        })
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose1400
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_1400
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketServerClose1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose1400';
      console.info(`${caseName} test start`);
      try {
        let netAddress01: socket.NetAddress = {
          address: '::1',
          port: Math.round(1024+ Math.random()*5000+Math.random()*4000),
          family: 2
        }
        let netAddress02: socket.NetAddress = {
          address: '::1',
          port: Math.round(1024+ Math.random()*5000+Math.random()*4000),
          family: 2
        }
        let tlsConnectOptions01: socket.TLSConnectOptions = {
          address: netAddress01,
          secureOptions: tlsSecureOptions,
          ALPNProtocols: ["http/1.1"]
        }
        let tlsConnectOptions02: socket.TLSConnectOptions = {
          address: netAddress02,
          secureOptions: tlsSecureOptions,
          ALPNProtocols: ["http/1.1"]
        }
        await tlsServer.listen(tlsConnectOptions01).then(async () => {
          console.log(`${caseName} tlsServer listen tlsConnectOptions01 success`);
          tlsServer.listen(tlsConnectOptions02).then(async ()=>{
            console.log(`${caseName} tlsServer listen tlsConnectOptions02 again success`);
            tlsServer.close().then(()=>{
              console.log(`${caseName} tlsServer close success`);
              ExpectTrue(true);
              tlsServer.off('connect');
              console.info(`${caseName}---End`);
              done();
            }).catch((err: BusinessError)=>{
              console.log(`${caseName} tlsServer close failed err is :`+JSON.stringify(err));
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            })
          }).catch((err:BusinessError)=>{
            console.info(`${caseName} listen again err: ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          })
        }).catch((err:BusinessError)=>{
          console.info(`${caseName} listen first err: ${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        })
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose1500
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_1500
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketServerClose1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose1500';
      console.info(`${caseName} test start`);
      try {
        let netAddress: socket.NetAddress = {
          address: '::1',
          port: Math.round(1024+ Math.random()*5000+Math.random()*4000),
          family: 2
        }
        let tlsConnectOptions: socket.TLSConnectOptions = {
          address: netAddress,
          secureOptions: tlsSecureOptions,
          ALPNProtocols: ["http/1.1"]
        }
        await tlsServer.listen(tlsConnectOptions).then(async () => {
          console.log(`${caseName} tlsServer listen  success`);
          tlsServer.close().then(()=>{
            console.log(`${caseName} tlsServer close first  success`);
            tlsServer.close().then(()=>{
              console.log(`${caseName} tlsServer close again  success`);
              tlsServer.off('connect');
              ExpectTrue(true);
              console.info(`${caseName}---End`);
              done();
            }).catch((err:BusinessError)=>{
              console.info(`${caseName} tlsServer close err: ${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end`);
              done();
            })
          }).catch((err:BusinessError)=>{
            console.info(`${caseName} tlsServer close err: ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          })
        }).catch((err:BusinessError)=>{
          console.info(`${caseName} listen first err: ${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        })
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose1600
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_1600
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketServerClose1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose1600';
      console.info(`${caseName} test start`);
      try {
        tlsServer.close().then(()=>{
          console.log(`${caseName} tlsServer close success`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError)=>{
          console.log(`${caseName} tlsServer close failed err is :`+JSON.stringify(err));
          ExpectTrue(err.code == 2300002);
          console.info(`${caseName}---End`);
          done();
        })
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
  });
}

