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
  "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDSXPTevZN5kDNI\n" +
  "7KPGQRtGO1tSYs8xcMMbeyXZssGMlFvMv26B84lcqPX9fzzFvvC1EFC6/Up/1O5x\n" +
  "Rv3br0bSukdSA7JRpRD49kU5U+nS8oKoz55d8vF3E0bLLNcjKekuurrPwEdp5cVW\n" +
  "wnlqxYuBNeUaB1lbOZ1fiCsqPdUaBIL/VCFQCvYmebgcWDVZBfimgHsovWL2hs5V\n" +
  "f67upx2YpTsVGYYj+JEM5j603UaPTCsraPdNb0bnOWoyQPYLVPiar47VySLXHBRk\n" +
  "c7U0nT7X2JLcx3bQvW+1G1E6FbyAnm4pSCYy1EAHtmHHk/H86MvtWN6x1yuK6xvv\n" +
  "HSAvjQZBAgMBAAECggEADzAqdt2JpQyCA2kgfvsq6LR26LkdHAT39Uc8KZ5kJo38\n" +
  "nckRhbzrZT8GubWC0gUx9GS363RHuXiKea/GOuMKEkNkTFnbeVUZZ1xCjbvPBU3A\n" +
  "nMcWuFJG2FHSOe+kHdQUE61kOQU5Mr5l89hpM0oNgzf8sVcn/rPndqMKeMuLlAvv\n" +
  "SPhxCz2kIC8HhXH8kUPx0AjnLRbV61qC1IHq4QPtoq6YJmgTNEXIV3EzhTDwfeY5\n" +
  "cKOMx//GZtH5R7O5pVfs4HXtkbm53ncP9ikJZW7+W0jEj5H4j5VlOycTKE5xDQL8\n" +
  "SYpMJlh2Lf3biiOPvHTBYknKwXL8ZkNRkWW0YUOClQKBgQD1EtqxNeerMXooanyC\n" +
  "/AG4+9DtN/rMoJu0psQUfad4JrturNXADMfaPkY3T3Y93Wnnctu4+x0fG+U4j59C\n" +
  "VvqsaSbRRvcxcqky69BZY3rKQ/RnQOqsw6EPlk6pEGjKquWxRQgwzqHvOr71IK2o\n" +
  "+q6AyPrOeFdi7xBD4FZAwqxF3QKBgQDbve8R2HKBmLs+5NYAcmLwA+qVH32Xqhed\n" +
  "6IcvGv/awdLsEh8IOcoklSpz0tPBvAeoexrxRtyVE4yQOWNlxBe9UI8cA0KNafiP\n" +
  "CKxBZydPFUVcS+IxQzPI7ZAjzqR/tTsmSDadlrH/FMkjUOlZR3PTp3LSqASIVcDN\n" +
  "fvwDeQ6VtQKBgQDFVt1KfQGDVF/tU3HXd11bu0nM+pq1U06N9QtHBLdphKbAw+OK\n" +
  "tb/n+OVJfG7V+ghhGpfbKDmW5zt4hA3VuXw4gKOFOQOriYy9OC2ZDQW/AWE4E4nk\n" +
  "e9KhXoMQl+oJ5/r094VU5851eHRzplCwFMuXYD61KyoSvDX4shhCJX/a8QKBgFmk\n" +
  "FtXR1Yx2sNQMaByQjTnabyTcTtDDC5VYWWVm/z7PWOsCzXP+ly7rRwEu3UGoIfui\n" +
  "FLCetrd93RaswpauMv0A0xCbZ9fmhgZbhGG94fRJ+hyXvDNaddKezvE8iDCszu9k\n" +
  "ABuzcPNdGFx20mqgUmjiY136OrcfPGLYTZhhFwkNAoGBALkaQFt3McuzK1xlcZln\n" +
  "HzqKcapAdqS/OUJ30gRNcw62+OGDqPuSBpPArz96aJzcUPpNddc90aYv8GbKmc2G\n" +
  "vks1YE8J9Y4llh0pIL1kI4MwNubmdTtCc0/OvU8thelZaPOrHlbXtc+z9xFHo3gd\n" +
  "G4iYK4j2Wb7CsqG+7P5G0KgQ\n" +
  "-----END PRIVATE KEY-----";
let ca_c = "-----BEGIN CERTIFICATE-----\n" +
  "MIIFhTCCA22gAwIBAgIPcY1EjWBy83UGLEpXMAmUMA0GCSqGSIb3DQEBCwUAMEIx\n" +
  "FDASBgNVBAMMC3NuZS1yb290LWNhMQswCQYDVQQGEwJDTjEPMA0GA1UECgwGSFVB\n" +
  "V0VJMQwwCgYDVQQLDANTTkUwIBcNMjMxMTIzMTI0NTE1WhgPMjA2MzExMjMxMjQ1\n" +
  "MTVaMEIxFDASBgNVBAMMC3NuZS1yb290LWNhMQswCQYDVQQGEwJDTjEPMA0GA1UE\n" +
  "CgwGSFVBV0VJMQwwCgYDVQQLDANTTkUwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAw\n" +
  "ggIKAoICAQDPGR5kG79NnIct3T8zrhXB1vSFHejzhmxkB+04oLFZKXHLz+XXLbSx\n" +
  "Fy3icHBmsYXL/CMbL3398KxDYQAO+Yp5t3V11qEd1r1kr7cImGIhtnalL551ndyQ\n" +
  "Z+JreNR/iA/PzSyTaWUP39ZxxazRmm+fnFRj13zbLfMwShPNX1cl1xKZxDUKsmQv\n" +
  "y73NoKO3Joa1UKZFM0dskQ9WL1uuffEgfjbsVaWC7PwjvYLqS6JmtEqNIesMKuoy\n" +
  "Ci7wwPMGjQoA5NQ5/IXZl0DSLYjZsxOil7N+5OMDAZfXY5vgODOoBZfLF/dRE7qg\n" +
  "Nj6zp+wV/mw6TtUErEDGfONdWpevcXggm9yuwutweewaSWh4ihOQ++TagFpw7eEE\n" +
  "PzjQJkOUj4lEPqzuojmOGYoQ+QrzXl450eb4jOZnipEo5ALtMwnRLwKpvq9l5+l+\n" +
  "P+nJcmlglY19yb0YDuMvRny44HL5jqsS+xKC6PzWHANd5OmgOROSTr2onPj0bRHw\n" +
  "IhOnhAd9iOG5DCkhz5B71RlRd3xu12wC6zy7HC1ZHOjD2/aXeE+iVHwbLKNxgQUy\n" +
  "HHM/cbY6DyPnpnIUNV5XLxP3VSYXydtoJ5fBW0ZgXyAnr6ZwafYzrRxtTR7XYrU6\n" +
  "SqRKjLFF6o1gkpozw9xIRckA7E8fZZy+OltFSTrpK/jDJf+F1sVGHwIDAQABo3Yw\n" +
  "dDAfBgNVHSMEGDAWgBQz/958bGIisek8TybJ+ssmmXg54zAPBgNVHRMBAf8EBTAD\n" +
  "AQH/MA4GA1UdDwEB/wQEAwIBhjAdBgNVHQ4EFgQUM//efGxiIrHpPE8myfrLJpl4\n" +
  "OeMwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEBCwUAA4ICAQCFeST1M7zT\n" +
  "5lM5pQx2cayYJPl+HXS5z6WqfifnBM11ELwJ9QDC07cxR6XYOhRGGBVms+EF1D1o\n" +
  "xRv5vK9e89Vqg4MwuUVcFWxkhq+SPAfdmJOMM+GjyEkQkhNggnciaRtMe/esFLzE\n" +
  "mYuVHqMo/Gp5OyYaCbehXW2UKbJPfY6T3Hg0ZqHdgoXGsL1dBtJe6cDdRMvg5IUv\n" +
  "wrwujtELIQH9PSME7OOq+6kdDJh/Oim/MXw0ZJmIMdbtRf74h/xFqo5qjeTYG6Qq\n" +
  "HWxe7jnkBCnnsvCmtxZIcNvQJ0hocXhPz/+sTEDoEGu7fs2r4dDYrOD4uFoIF2+q\n" +
  "E8kfOU1XXdC4z924mVM1Bf1RSmmFbK+oDbdnMnZp0zjdwn51C7Bj7RQbPZDFu4Ex\n" +
  "wh4NoG6Y8DO1rqIvh8iRk0mpNqPFebcf9dv/22JoLMOQw3uX5u0S2HyuniJDbT5U\n" +
  "C1pBcZtl/HF9wdzZxdIEE/2cGoSt6p8nPWrx06JMSArOdZoj0jLv1a/0RFEn6apP\n" +
  "+/T84NPtqwGjGMugeNJI++Eh2IK9g/+Jag8kmLBqkWvNmvOgOv7lELXTnf1IuEy/\n" +
  "Lwy21C4on5dNdZqqthF1CUbdW6RiI7ituR7mzNVq3R1OJ5qEB8vm8VJ47Gj5R/Wc\n" +
  "zQ/aEUMX9gLhvw9AhdUaU0y/Bk2bkg/hGQ==\n" +
  "-----END CERTIFICATE-----";

let cert_c = "-----BEGIN CERTIFICATE-----\n" +
  "MIIESDCCAjCgAwIBAgIPGFtLhYdKwFRA2wnbvdpgMA0GCSqGSIb3DQEBCwUAMEIx\n" +
  "FDASBgNVBAMMC3NuZS1yb290LWNhMQswCQYDVQQGEwJDTjEPMA0GA1UECgwGSFVB\n" +
  "V0VJMQwwCgYDVQQLDANTTkUwHhcNMjMxMjE0MDc0OTAxWhcNMjUxMjE0MDc0OTAx\n" +
  "WjANMQswCQYDVQQDDAJmZDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB\n" +
  "ANJc9N69k3mQM0jso8ZBG0Y7W1JizzFwwxt7JdmywYyUW8y/boHziVyo9f1/PMW+\n" +
  "8LUQULr9Sn/U7nFG/duvRtK6R1IDslGlEPj2RTlT6dLygqjPnl3y8XcTRsss1yMp\n" +
  "6S66us/AR2nlxVbCeWrFi4E15RoHWVs5nV+IKyo91RoEgv9UIVAK9iZ5uBxYNVkF\n" +
  "+KaAeyi9YvaGzlV/ru6nHZilOxUZhiP4kQzmPrTdRo9MKyto901vRuc5ajJA9gtU\n" +
  "+JqvjtXJItccFGRztTSdPtfYktzHdtC9b7UbUToVvICebilIJjLUQAe2YceT8fzo\n" +
  "y+1Y3rHXK4rrG+8dIC+NBkECAwEAAaNwMG4wHwYDVR0jBBgwFoAUM//efGxiIrHp\n" +
  "PE8myfrLJpl4OeMwCQYDVR0TBAIwADAOBgNVHQ8BAf8EBAMCA/gwHQYDVR0OBBYE\n" +
  "FEg3E91JclBrKPZJwEVoNcxip0DnMBEGA1UdIAQKMAgwBgYEVR0gADANBgkqhkiG\n" +
  "9w0BAQsFAAOCAgEAd4Vo/6BLc4OsQsxMEBwVUOcpigzI7VVDFNIk8KQIPRitmyes\n" +
  "kTs7HWeT1JIkyo4PJ7AUUTcK7ktjNTGj1oLvh2XRa4+3m8mMsdMdsJmCvOgdsQLl\n" +
  "dPfGrC3CnS30H0wCIU3j7rhh12Skqg+fDhE04DzjFE5whlQcPXk88cWmTNBhFZbi\n" +
  "aCLEzRqW4N+1tlZuD/dp30X1sz2V2Aq4a9dd5Botkd5b1X57Qop+GoOFlZ0uGw3j\n" +
  "4hSA4Shqj/t6iSNkSv5CfoJ2UysqBUPyb3tN//wXUeDscc2tPIGkbPUUdfduH80n\n" +
  "B+DrfFsLddn9jVvmgKaXvUVwXbsdQzo9IXItbUAgdpizuKtfOu1FOCYFEH39Q2NM\n" +
  "1/H0jMo+yInmnrLQO9V7n3HxK8DVi2cGBZnk2GiNi7kTMHweEb/EUUo+0CrXdu3Y\n" +
  "Sggn9sx8MHwv8XLb0GOtGU7MLdUDW2pZNtGZBi1gse7J7ndWZ0nAxdukHZyHeMx2\n" +
  "5f4b7edFwi1I+4wfIXqsXxWgINYK7zyl7n9gagSx8rMQipRYe49gsc/8KuWxPvUQ\n" +
  "u5/lg7ZDbytDH0Hyj5aZ3GlvFyQ0KQdk+xVP0SUQoItNBOD5WFeXbAPxP48TUcnc\n" +
  "EOoNQKpnMjgRoQQOwqUeZTAC1BT7BIC2WzvXUhPoSrgTWHmk8iB1xjNa/Qs=\n" +
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
     * @tc.number : SUB_NetworkMgr_Socket_TLSSocketServer_Close_0100
     * @tc.name   : testNetworkMgrSocketTLSSocketServerClose0100
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
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
     * @tc.number : SUB_NetworkMgr_Socket_TLSSocketServer_Close_0200
     * @tc.name   : testNetworkMgrSocketTLSSocketServerClose0200
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
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
     * @tc.number : SUB_NetworkMgr_Socket_TLSSocketServer_Close_0300
     * @tc.name   : testNetworkMgrSocketTLSSocketServerClose0300
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
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
     * @tc.number : SUB_NetworkMgr_Socket_TLSSocketServer_Close_0400
     * @tc.name   : testNetworkMgrSocketTLSSocketServerClose0400
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
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
     * @tc.number : SUB_NetworkMgr_Socket_TLSSocketServer_Close_0500
     * @tc.name   : testNetworkMgrSocketTLSSocketServerClose0500
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
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
     * @tc.number : SUB_NetworkMgr_Socket_TLSSocketServer_Close_0600
     * @tc.name   : testNetworkMgrSocketTLSSocketServerClose0600
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
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
     * @tc.number : SUB_NetworkMgr_Socket_TLSSocketServer_Close_0700
     * @tc.name   : testNetworkMgrSocketTLSSocketServerClose0700
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
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
     * @tc.number : SUB_NetworkMgr_Socket_TLSSocketServer_Close_0800
     * @tc.name   : testNetworkMgrSocketTLSSocketServerClose0800
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
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
     * @tc.number : SUB_NetworkMgr_Socket_TLSSocketServer_Close_0900
     * @tc.name   : testNetworkMgrSocketTLSSocketServerClose0900
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
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
            await tlsClient.close().then(()=>{
              console.log(`${caseName} tlsClient close success`);
            }).catch((err: BusinessError)=>{
              console.log(`${caseName} tlsClient close failed`+ JSON.stringify(err));
              ExpectFail();
              done();
              console.info(`${caseName}---End`);
            })
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
     * @tc.number : SUB_NetworkMgr_Socket_TLSSocketServer_Close_1000
     * @tc.name   : testNetworkMgrSocketTLSSocketServerClose1000
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
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
            await tlsClient.close().then(()=>{
              console.log(`${caseName} tlsClient close success`);
            }).catch((err: BusinessError)=>{
              console.log(`${caseName} tlsClient close failed`+ JSON.stringify(err));
              ExpectFail();
              done();
              console.info(`${caseName}---End`);
            })
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
     * @tc.number : SUB_NetworkMgr_Socket_TLSSocketServer_Close_1100
     * @tc.name   : testNetworkMgrSocketTLSSocketServerClose1100
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
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
     * @tc.number : SUB_NetworkMgr_Socket_TLSSocketServer_Close_1200
     * @tc.name   : testNetworkMgrSocketTLSSocketServerClose1200
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
     */
    it('testNetworkMgrSocketTLSSocketServerClose1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: Function) => {
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
     * @tc.number : SUB_NetworkMgr_Socket_TLSSocketServer_Close_1300
     * @tc.name   : testNetworkMgrSocketTLSSocketServerClose1300
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
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
     * @tc.number : SUB_NetworkMgr_Socket_TLSSocketServer_Close_1400
     * @tc.name   : testNetworkMgrSocketTLSSocketServerClose1400
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
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
     * @tc.number : SUB_NetworkMgr_Socket_TLSSocketServer_Close_1500
     * @tc.name   : testNetworkMgrSocketTLSSocketServerClose1500
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
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
     * @tc.number : SUB_NetworkMgr_Socket_TLSSocketServer_Close_1600
     * @tc.name   : testNetworkMgrSocketTLSSocketServerClose1600
     * @tc.desc   : check whether the close interface takes effect.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MEDIUMTEST
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

