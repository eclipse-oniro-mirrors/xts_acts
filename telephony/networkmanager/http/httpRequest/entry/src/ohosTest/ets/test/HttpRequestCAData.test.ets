import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { http, socket } from '@kit.NetworkKit';

let ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
}

let ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
  }
}

let key = "-----BEGIN PRIVATE KEY-----\n" +
  "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCsdp9zb89pZXWA\n" +
  "xchWAR5mjyaC5aqJS+/guBsIgCxpDCfIJG0vKUwqoYHjb9ajaZ+9mbv0Feu1p4B7\n" +
  "JUZ769hsLeCLcmFYT6PTf9qrdkEz/lwq+/AeY22TPHyTxgxEbHll3uoA/pK+931O\n" +
  "x+gkiHzYsu7xqNPciRx+laaYG/XGvVPB/k8LnIkddOzUTyLmorc44XoathlNcUo+\n" +
  "frj2VeS6obkpSIRlgNO/InnSCK+ChinBzVfHqksOV4UVjAfcU5Ru+zoMh66VSvTP\n" +
  "dOr1TTnbCu1fJ3PHaXKlV7AHzIN1e1iu6PxhJazWZ47dG8RU03kTS/c/b599AxZU\n" +
  "rwYsMmQrAgMBAAECggEACIyLdDzIpUrYO5087wvN0VEAnGB8xvgyreBdHAYZLXk4\n" +
  "HPML+S3XjrgZfjK0YGlYonIVH7uucX9vc6tHW9aMZeBoTxaeaLLvRglXx5lsZgK9\n" +
  "LYxLkitk6nWHH17Oi4htBCBmrSHxbZygY4quoTulegB0rm9WATVIFPufbyQuV2ma\n" +
  "Va+hDwJa8moLZp6YH2Ouf4PXMVKODPxDw/+6qah7MdvfIb6gMuCDBQaYYMBbDMEQ\n" +
  "DhfGreiNozpO3BQU/qQW++jb9eymAoBbSYYAew4+nhESf73DSSyR6M3W6t7DDuCn\n" +
  "XqnOn5lXTco075egLPM3E26nFJI5ka3rxx+ZnuXCoQKBgQDVkBsdDGOAPN0llv3q\n" +
  "3dv2yN6eb2U6Z0471fBb49y9mjtlY0JE0pY8im4wYAAjDIarUSaRCPd0ydvmGVIj\n" +
  "7MEZ912QlP6J8iVrP0Af6uYlqZ7Z5PkzpaCDMkf1SJB66yPZ78WERaF5GFfx/Dly\n" +
  "bO5yffUmKGkS7bWC+0TwfBSFgwKBgQDOu8sF+bNJHmZ2jAOeopzJHdIaWysYaGW3\n" +
  "O63VAP6F3yxNwyd0W4qryIOHij8YUzYeUO8bnN/XmR67vl8a71RBNG/PSE/VUykS\n" +
  "5cnHwLE7C0EO8p8Q4dynyhQBt7HfpP/ZKNmcCQbxCitYpvJp69SHIvDOoSQCgcoS\n" +
  "gVZF7YaOOQKBgHdFMO9LMPK4iyVoK00VNLihvDqtqdIxSa7/L2qSWoCFd3CLO8Jl\n" +
  "/cO36AwaQVlRsJBTFP/hCxptdeMO9yHbIokW7mlF3NY7pww7Wdu5e2lDTtUQHODs\n" +
  "OjWrSibBrPcJBY+8agoSPTj9EHizzX2LOqw0jkoOPYh1u254WCsakPdzAoGAKPUb\n" +
  "q/tkgb/8HNBwhyVAWrgFwCL/zr4gKMUyE1k3E967MEzRrEPWnWIEbP3+shsKRcdT\n" +
  "F+1ki5pSdG+q9/MihiiVXkO9TU5EfPH5oBGVC1WXdharXPTienuWqyBxpRVTevqU\n" +
  "4k0HiwmwvMeWj1WhrYRGoSlbsQN1vWTSatg8KEECgYBxjybidxhtfetzOxwA/gHT\n" +
  "Yy28pKu36RU/hkIbCzTIEZvgkr5UBhFIwoLP5GnV36qkfnmsVQCxJPJf1mM+tUsO\n" +
  "O60gv9WasjrV3/I7hkfgYloIL95jtvDMC44QTi7AzltA0YsYW0T/rYY/pz1Occm/\n" +
  "4O3kZdWUbIIpjs2PV6rnMQ==\n" +
  "-----END PRIVATE KEY-----\n"

let certRight = "-----BEGIN CERTIFICATE-----\n" +
  "MIIDCTCCAfGgAwIBAgIUYDfxhcA83RQQNN/B9uldTXer+UQwDQYJKoZIhvcNAQEL\n" +
  "BQAwFDESMBAGA1UEAwwJbG9jYWxob3N0MB4XDTI1MDcyNzA5MTYzMVoXDTMzMTAx\n" +
  "MzA5MTYzMVowFDESMBAGA1UEAwwJbG9jYWxob3N0MIIBIjANBgkqhkiG9w0BAQEF\n" +
  "AAOCAQ8AMIIBCgKCAQEArHafc2/PaWV1gMXIVgEeZo8mguWqiUvv4LgbCIAsaQwn\n" +
  "yCRtLylMKqGB42/Wo2mfvZm79BXrtaeAeyVGe+vYbC3gi3JhWE+j03/aq3ZBM/5c\n" +
  "KvvwHmNtkzx8k8YMRGx5Zd7qAP6Svvd9TsfoJIh82LLu8ajT3IkcfpWmmBv1xr1T\n" +
  "wf5PC5yJHXTs1E8i5qK3OOF6GrYZTXFKPn649lXkuqG5KUiEZYDTvyJ50givgoYp\n" +
  "wc1Xx6pLDleFFYwH3FOUbvs6DIeulUr0z3Tq9U052wrtXydzx2lypVewB8yDdXtY\n" +
  "ruj8YSWs1meO3RvEVNN5E0v3P2+ffQMWVK8GLDJkKwIDAQABo1MwUTAdBgNVHQ4E\n" +
  "FgQUQVIvbnYEMsWDmLP0+xx8Y4/cYHEwHwYDVR0jBBgwFoAUQVIvbnYEMsWDmLP0\n" +
  "+xx8Y4/cYHEwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAjI2m\n" +
  "9gUdeGtEZxiXb1WmPdJ9N4b9by2OvVziMDKh1gxy27ytlQCVjGYaw3AN/fdhTeRI\n" +
  "LHXAQHUm+PmazPo8mGdN+9SRrop/j0WXx5jGI0POoeK24Jswi2whg/JI5hmE3IYc\n" +
  "PtXGfSJaP2bHm++MNczt7ZS6p+ZYGVLaTWzIxhSDhpTLyZkj3Yi9fSsZcdlqCpvL\n" +
  "Yrdzx0v/QzkWnZkjtQWXf80/jfdFvMCmTmsArgea/up1cbEauBp+me7yQTCHkVzf\n" +
  "EtC7b10L5egH8JCm7du+5s+QifHYTV0ELxHVzBkIynCA65EGV5eNojPmg8XRPWBf\n" +
  "YB/6QUsI42+FMzTnPQ==\n" +
  "-----END CERTIFICATE-----\n";

let  certExpired = "-----BEGIN CERTIFICATE-----\n" +
  "MIIDCTCCAfGgAwIBAgIUOe7cN92vgoAS7z+6ySEQ1xq8k4owDQYJKoZIhvcNAQEL\n" +
  "BQAwFDESMBAGA1UEAwwJbG9jYWxob3N0MB4XDTI1MDcyNzA5Mzk0OFoXDTI1MDcy\n" +
  "ODA5Mzk0OFowFDESMBAGA1UEAwwJbG9jYWxob3N0MIIBIjANBgkqhkiG9w0BAQEF\n" +
  "AAOCAQ8AMIIBCgKCAQEArHafc2/PaWV1gMXIVgEeZo8mguWqiUvv4LgbCIAsaQwn\n" +
  "yCRtLylMKqGB42/Wo2mfvZm79BXrtaeAeyVGe+vYbC3gi3JhWE+j03/aq3ZBM/5c\n" +
  "KvvwHmNtkzx8k8YMRGx5Zd7qAP6Svvd9TsfoJIh82LLu8ajT3IkcfpWmmBv1xr1T\n" +
  "wf5PC5yJHXTs1E8i5qK3OOF6GrYZTXFKPn649lXkuqG5KUiEZYDTvyJ50givgoYp\n" +
  "wc1Xx6pLDleFFYwH3FOUbvs6DIeulUr0z3Tq9U052wrtXydzx2lypVewB8yDdXtY\n" +
  "ruj8YSWs1meO3RvEVNN5E0v3P2+ffQMWVK8GLDJkKwIDAQABo1MwUTAdBgNVHQ4E\n" +
  "FgQUQVIvbnYEMsWDmLP0+xx8Y4/cYHEwHwYDVR0jBBgwFoAUQVIvbnYEMsWDmLP0\n" +
  "+xx8Y4/cYHEwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAM3MA\n" +
  "rE9RvhdwwGvNs0C7NZBTxoMKumSLuSFFqj9TEDzkz07wPW3qMUlqfN/tpYCpEYaB\n" +
  "yNir63R8PFrX2avIaWDcXhvuIBs1/B9Jjwbuxx/klZyVH0iiopuyP/pBDIx8X8oS\n" +
  "a2qPqGKhOGHYt/ukbU3p2JoPcs4HOcV/jRPTZSwjkkdIvZI7knQDo7Foc9D4JfPm\n" +
  "iEluPOnF6/xkjI2F6GhEicLtMdbg3PDfCHdY9jj4B0WBldZbrqn7Jv6qW1KLDsej\n" +
  "d9vqB08JPKP5WtpNPXEiJyvddPtCaCtVkxIgGCjwT1Tb776QPsSPc+sAtAClCvNy\n" +
  "aEiPwjDyB+JP9Vri5A==\n" +
  "-----END CERTIFICATE-----\n"
let  certWrong = "-----BEGIN CERTIFICATE-----\n" +
  "MIIDETCCAfkCFGxhItkuvjXqIEmKT+IpVAyWakFAMA0GCSqGSIb3DQEBCwUAMEUx\n" +
  "CzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEwHwYDVQQKDBhJbnRl\n" +
  "cm5ldCBXaWRnaXRzIFB0eSBMdGQwHhcNMjUwNzI3MDgzODU4WhcNMjYwNzI3MDgz\n" +
  "ODU4WjBFMQswCQYDVQQGEwJBVTETMBEGA1UECAwKU29tZS1TdGF0ZTEhMB8GA1UE\n" +
  "CgwYSW50ZXJuZXQgV2lkZ2l0cyBQdHkgTHRkMIIBIjANBgkqhkiG9w0BAQEFAAOC\n" +
  "AQ8AMIIBCgKCAQEAzsWzO3xQOhTCDeATvDhlCVsLmB4OlR/y/cgd7Xko/Wbk/FhG\n" +
  "8/qzGSAWmkjUthbtlkgdSWCwrUsfu6Xc/X0i9ZWs+Mz4w3MWQmHnNCb4SIWtSxmM\n" +
  "LO3vHIMO/+xx4sMZiRtenp63nFoc1Dvyo/ocgo7w3Z+eqbJ0l07aMdAri3F2ufBa\n" +
  "3JtfOVyvt9f89PHJv1YVw9j8B8HUUF1VZFVaKcW+kBistOyDpAb5qkjjHtb7TAfc\n" +
  "gIhLKMCCfjQDsLHvP6uB9ck0NAbk+iXdhUbwk4er9IRdw8Y3PpR8nx1yDB4GF7Y7\n" +
  "SL/GwoP+4z7j2yw+pkisGkn0/C0AO7pjl2bxwQIDAQABMA0GCSqGSIb3DQEBCwUA\n" +
  "A4IBAQBn/9AubkXHufcj8ftWiGmXPXj5L5xIA8oHK60pO1QywMObDSeTHsC30BNU\n" +
  "6mwNqLxpaswdDe1tZmXvkfmO3yW6sWYDS+Zu4GXxsOPxZoEXNpvhPQlORkp2DaJ7\n" +
  "iD8+1BySTj2odeAuBCa2y+2koe8ySU8bhjv+MU2rXTq4nzRooVRqeP7y0WJBldnX\n" +
  "9utQlbSarPOVnw+Hm7ebb8sDAzbvxMlJdmm8vPKExd1uE0o9uHAf7DBZpAhT8xu+\n" +
  "9YOvtpzPrAjyw2xEgEgrh38YB6OlHQ1sT7xPGuie/FTE3exkOfp436MivPnf6+JD\n" +
  "8L9MqgXDt3zZhWj3XbXvXZMfyxB3\n" +
  "-----END CERTIFICATE-----\n"

function getTlsConnOptions(port:number, type: number): socket.TLSConnectOptions {
  let listenAddress: socket.NetAddress = { address: '127.0.0.1', port: port }
  let tlsSecOptions: socket.TLSSecureOptions = {
    cert: type == 0? certRight: certExpired,
    key: key,
    protocols: socket.Protocol.TLSv12,
  }
  return { address: listenAddress, secureOptions: tlsSecOptions }
}

function getWrongTlsConnOptions(port:number): socket.TLSConnectOptions {
  let listenAddress: socket.NetAddress = { address: '127.0.0.1', port: port }
  let tlsSecOptions: socket.TLSSecureOptions = {
    cert: certWrong,
    key: key,
    protocols: socket.Protocol.TLSv12,
  }
  return { address: listenAddress, secureOptions: tlsSecOptions }
}

export default function HttpRequestDataCATest() {
  describe('HttpRequestDataCATest', () => {

    /**
     * @tc.name   testNetworkMgrHttpCAData0100
     * @tc.number SUB_NetworkMgr_Http_CAData_0100
     * @tc.desc   The test can be performed using self-signed certificate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testNetworkMgrHttpCAData0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = "testNetworkMgrHttpCAData0100";
      console.info(`${caseName}---Start`);
      let port = 9000+Math.round(Math.random()*5000);
      let tlsSocketServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
      try{
        let tlsConnOptions = getTlsConnOptions(port, 0);
        await tlsSocketServer.listen(tlsConnOptions).then( async ()=> {
          let listenAddr: socket.NetAddress =  await tlsSocketServer.getLocalAddress();
          console.info(`${caseName} tlsSocketServer listen address: `+JSON.stringify(listenAddr.address) +' port: '+JSON.stringify(listenAddr.port));
        }).catch((err: BusinessError) => {
          console.error(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
          done();
        })
        tlsSocketServer.off('connect');
        tlsSocketServer.on('connect', async (clientSocket: socket.TLSSocketConnection)=>{
          console.info(`${caseName}-----tlsSocketServer on connect`);
          let clientAddr: socket.NetAddress = await clientSocket.getRemoteAddress();;
          console.info(`${caseName}----------`+JSON.stringify(clientAddr));
          clientSocket.on('message',async  (msgInfo: socket.SocketMessageInfo) => {
            let data: string = "HTTP/1.1 200 OK\n" +
              "Server: Tengine\n" +
              "Date: Sun\n" +
              "Content-Type: application/json;charset=UTF-8\n" +
              "Content-Length: 0\n" +
              "X-Powered-By: ring/1.0.0\n" +
              "sc: 0.013\n" +
              "\n" +
              "{\"status\":\"1\",\"count\":\"2\",\"info\":\"OK\",\"infocode\":\"10000\",\"lives\":[]}"
            clientSocket.send(data);
          });
        });
        let httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.POST,
          expectDataType: http.HttpDataType.STRING,
          readTimeout: 200000,
          usingProtocol: http.HttpProtocol.HTTP2,
          priority: 1,
          caData: certRight
        };
        httpRequest.request("https://localhost:"+ port, options, (err: Error, data: http.HttpResponse) => {
          if (!err) {
            console.info(`${caseName} request success data is `+JSON.stringify(data));
            ExpectTrue(data.responseCode == 200);
            done();
          } else {
            console.error(`${caseName} request err is `+JSON.stringify(err));
            ExpectFail();
            done();
          }
        });
      }catch (err) {
        console.error(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHttpCAData0200
     * @tc.number SUB_NetworkMgr_Http_CAData_0200
     * @tc.desc   Expired self-signed certificate cannot be used
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testNetworkMgrHttpCAData0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = "testNetworkMgrHttpCAData0200";
      console.info(`${caseName}---Start`);
      let port = 9000+Math.round(Math.random()*5000);
      let tlsSocketServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
      try{
        let tlsConnOptions = getTlsConnOptions(port, 1);
        await tlsSocketServer.listen(tlsConnOptions).then( async ()=> {
          let listenAddr: socket.NetAddress =  await tlsSocketServer.getLocalAddress();
          console.info(`${caseName} tlsSocketServer listen address: `+JSON.stringify(listenAddr.address) +' port: '+JSON.stringify(listenAddr.port));
        }).catch((err: BusinessError) => {
          console.error(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
          done();
        })
        tlsSocketServer.off('connect');
        tlsSocketServer.on('connect', async (clientSocket: socket.TLSSocketConnection)=>{
          console.info(`${caseName}-----tlsSocketServer on connect`);
          let clientAddr: socket.NetAddress = await clientSocket.getRemoteAddress();;
          console.info(`${caseName}----------`+JSON.stringify(clientAddr));
          clientSocket.on('message',async  (msgInfo: socket.SocketMessageInfo) => {
            let data: string = "HTTP/1.1 200 OK\n" +
              "Server: Tengine\n" +
              "Date: Sun\n" +
              "Content-Type: application/json;charset=UTF-8\n" +
              "Content-Length: 0\n" +
              "X-Powered-By: ring/1.0.0\n" +
              "sc: 0.013\n" +
              "\n" +
              "{\"status\":\"1\",\"count\":\"2\",\"info\":\"OK\",\"infocode\":\"10000\",\"lives\":[]}"
            clientSocket.send(data);
          });
        });
        let httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.POST,
          expectDataType: http.HttpDataType.STRING,
          readTimeout: 200000,
          usingProtocol: http.HttpProtocol.HTTP2,
          priority: 1,
          caData: certExpired
        };
        httpRequest.request("https://localhost:"+ port, options, (err: BusinessError, data: http.HttpResponse) => {
          if (!err) {
            console.info(`${caseName} request success data is `+JSON.stringify(data));
            ExpectFail();
            done();
          } else {
            console.error(`${caseName} request err is `+JSON.stringify(err));
            ExpectTrue(err.code == 2300060);
            done();
          }
        });
      }catch (err) {
        console.error(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHttpCAData0300
     * @tc.number SUB_NetworkMgr_Http_CAData_0300
     * @tc.desc   Verification failed when the certificate is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testNetworkMgrHttpCAData0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = "testNetworkMgrHttpCAData0300";
      console.info(`${caseName}---Start`);
      let port = 9000+Math.round(Math.random()*5000);
      let tlsSocketServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
      try{
        let tlsConnOptions = getTlsConnOptions(port, 0);
        await tlsSocketServer.listen(tlsConnOptions).then( async ()=> {
          let listenAddr: socket.NetAddress =  await tlsSocketServer.getLocalAddress();
          console.info(`${caseName} tlsSocketServer listen address: `+JSON.stringify(listenAddr.address) +' port: '+JSON.stringify(listenAddr.port));
        }).catch((err: BusinessError) => {
          console.error(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
          done();
        })
        tlsSocketServer.on('connect', async (clientSocket: socket.TLSSocketConnection)=>{
          console.info(`${caseName}-----tlsSocketServer on connect `);
          let clientAddr: socket.NetAddress = await clientSocket.getRemoteAddress();
          console.info(`${caseName}----------`+JSON.stringify(clientAddr));
          clientSocket.on('message', (msgInfo: socket.SocketMessageInfo) => {
            let data: string = "HTTP/1.1 200 OK\n" +
              "Server: Tengine\n" +
              "Date: Sun\n" +
              "Content-Type: application/json;charset=UTF-8\n" +
              "Content-Length: 0\n" +
              "X-Powered-By: ring/1.0.0\n" +
              "sc: 0.013\n" +
              "\n" +
              "{\"status\":\"1\",\"count\":\"2\",\"info\":\"OK\",\"infocode\":\"10000\",\"lives\":[]}"
            clientSocket.send(data);
          })
        });
        let httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.POST,
          expectDataType: http.HttpDataType.STRING,
          readTimeout: 200000,
          usingProtocol: http.HttpProtocol.HTTP2,
          priority: 1,
          caData: ""
        };
        httpRequest.request("https://localhost:"+ port, options, (err: BusinessError, data: http.HttpResponse) => {
          if (!err) {
            console.info(`${caseName} request success data is `+JSON.stringify(data));
            ExpectFail();
            done();
          } else {
            console.error(`${caseName} request err is `+JSON.stringify(err));
            ExpectTrue(err.code == 2300060);
            done();
          }
        });
      }catch (err) {
        console.error(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHttpCAData0400
     * @tc.number SUB_NetworkMgr_Http_CAData_0400
     * @tc.desc   Verify the parameter priority.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testNetworkMgrHttpCAData0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = "testNetworkMgrHttpCAData0400";
      console.info(`${caseName}---Start`);
      let port = 9000+Math.round(Math.random()*5000);
      let tlsSocketServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
      try{
        let tlsConnOptions = getTlsConnOptions(port, 0);
        await tlsSocketServer.listen(tlsConnOptions).then( async ()=> {
          let listenAddr: socket.NetAddress =  await tlsSocketServer.getLocalAddress();
          console.info(`${caseName} tlsSocketServer listen address: `+JSON.stringify(listenAddr.address) +' port: '+JSON.stringify(listenAddr.port));
        }).catch((err: BusinessError) => {
          console.error(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
          done();
        })
        tlsSocketServer.on('connect', async (clientSocket: socket.TLSSocketConnection)=>{
          console.info(`${caseName}-----tlsSocketServer on connect `);
          let clientAddr: socket.NetAddress = await clientSocket.getRemoteAddress();
          console.info(`${caseName}----------`+JSON.stringify(clientAddr));
          clientSocket.on('message', (msgInfo: socket.SocketMessageInfo) => {
            let data: string = "HTTP/1.1 200 OK\n" +
              "Server: Tengine\n" +
              "Date: Sun\n" +
              "Content-Type: application/json;charset=UTF-8\n" +
              "Content-Length: 0\n" +
              "X-Powered-By: ring/1.0.0\n" +
              "sc: 0.013\n" +
              "\n" +
              "{\"status\":\"1\",\"count\":\"2\",\"info\":\"OK\",\"infocode\":\"10000\",\"lives\":[]}"
            clientSocket.send(data);
          })
        })
        let httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.POST,
          expectDataType: http.HttpDataType.STRING,
          readTimeout: 200000,
          usingProtocol: http.HttpProtocol.HTTP2,
          priority: 1,
          caPath: "/data/storage/",
          caData: certRight
        };
        httpRequest.request("https://localhost:"+ port, options, (err: BusinessError, data: http.HttpResponse) => {
          if (!err) {
            console.info(`${caseName} request success data is `+JSON.stringify(data));
            ExpectFail();
            done();
          } else {
            console.error(`${caseName} request err is `+JSON.stringify(err));
            ExpectTrue(err.code == 2300060);
            done();
          }
        });
      }catch (err) {
        console.error(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });


    /**
     * @tc.name   testNetworkMgrHttpCAData0500
     * @tc.number SUB_NetworkMgr_Http_CAData_0500
     * @tc.desc   The certificate and key do not match.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testNetworkMgrHttpCAData0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = "testNetworkMgrHttpCAData0500";
      console.info(`${caseName}---Start`);
      let port = 9000+Math.round(Math.random()*5000);
      let tlsSocketServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
      try{
        let tlsConnOptions = getWrongTlsConnOptions(port);
        await tlsSocketServer.listen(tlsConnOptions).then( async ()=> {
          let listenAddr: socket.NetAddress =  await tlsSocketServer.getLocalAddress();
          console.info(`${caseName} tlsSocketServer listen address: `+JSON.stringify(listenAddr.address) +' port: '+JSON.stringify(listenAddr.port));
        }).catch((err: BusinessError) => {
          console.error(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
          done();
        })
        tlsSocketServer.on('connect', async (clientSocket: socket.TLSSocketConnection)=>{
          console.info(`${caseName}-----tlsSocketServer on connect `);
          let clientAddr: socket.NetAddress = await clientSocket.getRemoteAddress();
          console.info(`${caseName}----------`+JSON.stringify(clientAddr));
          clientSocket.on('message', (msgInfo: socket.SocketMessageInfo) => {
            let data: string = "HTTP/1.1 200 OK\n" +
              "Server: Tengine\n" +
              "Date: Sun\n" +
              "Content-Type: application/json;charset=UTF-8\n" +
              "Content-Length: 0\n" +
              "X-Powered-By: ring/1.0.0\n" +
              "sc: 0.013\n" +
              "\n" +
              "{\"status\":\"1\",\"count\":\"2\",\"info\":\"OK\",\"infocode\":\"10000\",\"lives\":[]}"
            clientSocket.send(data);
          })
        })
        let httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.POST,
          expectDataType: http.HttpDataType.STRING,
          readTimeout: 3000,
          usingProtocol: http.HttpProtocol.HTTP2,
          priority: 1,
          caData: certRight
        };
        httpRequest.request("https://localhost:"+ port, options, (err: BusinessError, data: http.HttpResponse) => {
          if (!err) {
            console.info(`${caseName} request success data is `+JSON.stringify(data));
            ExpectFail();
            done();
          } else {
            console.error(`${caseName} request err is `+JSON.stringify(err));
            ExpectTrue(err.code == 2300028);
            done();
          }
        });
      }catch (err) {
        console.error(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHttpCAData0600
     * @tc.number SUB_NetworkMgr_Http_CAData_0600
     * @tc.desc   The certificate and key do not match.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testNetworkMgrHttpCAData0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = "testNetworkMgrHttpCAData0600";
      console.info(`${caseName}---Start`);
      let port = 9000+Math.round(Math.random()*5000);
      let tlsSocketServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
      try{
        let tlsConnOptions = getWrongTlsConnOptions(port);
        await tlsSocketServer.listen(tlsConnOptions).then( async ()=> {
          let listenAddr: socket.NetAddress =  await tlsSocketServer.getLocalAddress();
          console.info(`${caseName} tlsSocketServer listen address: `+JSON.stringify(listenAddr.address) +' port: '+JSON.stringify(listenAddr.port));
        }).catch((err: BusinessError) => {
          console.error(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
          done();
        })
        tlsSocketServer.on('connect', async (clientSocket: socket.TLSSocketConnection)=>{
          console.info(`${caseName}-----tlsSocketServer on connect `);
          let clientAddr: socket.NetAddress = await clientSocket.getRemoteAddress();
          console.info(`${caseName}----------`+JSON.stringify(clientAddr));
          clientSocket.on('message', (msgInfo: socket.SocketMessageInfo) => {
            let data: string = "HTTP/1.1 200 OK\n" +
              "Server: Tengine\n" +
              "Date: Sun\n" +
              "Content-Type: application/json;charset=UTF-8\n" +
              "Content-Length: 0\n" +
              "X-Powered-By: ring/1.0.0\n" +
              "sc: 0.013\n" +
              "\n" +
              "{\"status\":\"1\",\"count\":\"2\",\"info\":\"OK\",\"infocode\":\"10000\",\"lives\":[]}"
            clientSocket.send(data);
          })
        })
        let httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.POST,
          expectDataType: http.HttpDataType.STRING,
          readTimeout: 3000,
          usingProtocol: http.HttpProtocol.HTTP2,
          priority: 1,
          caData: certWrong
        };
        httpRequest.request("https://localhost:"+ port, options, (err: BusinessError, data: http.HttpResponse) => {
          if (!err) {
            console.info(`${caseName} request success data is `+JSON.stringify(data));
            ExpectFail();
            done();
          } else {
            console.error(`${caseName} request err is `+JSON.stringify(err));
            ExpectTrue(err.code == 2300028);
            done();
          }
        });
      }catch (err) {
        console.error(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

  });
}

