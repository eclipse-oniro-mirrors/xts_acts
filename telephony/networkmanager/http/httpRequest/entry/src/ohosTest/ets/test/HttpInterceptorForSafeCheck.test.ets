/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, expect, it, Size, Level, TestType, beforeAll, afterAll } from '@ohos/hypium';
import { http } from '@kit.NetworkKit';
import testNetManager from 'libentry.so';
import { socket } from '@kit.NetworkKit';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
};

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
  }
};


const HTTP_URL_BAIDU: string = "http://www.baidu.com";
const HTTP_URL: string = "http://localhost:9999";
const HTTP_URL_ERROR: string = "https://aaaa.com";

// 通用request的head
const HEADER = { "aaaaa": "" } as Record<string, string>;
// 修改的body
const BODY_MODIFY = { "context": "REQUEST_BODY_MODIFY" } as Record<string, string>;
// 修改url的标识body
const BODY_URL_MODIFY = { "context": "BODY_URL_MODIFY" } as Record<string, string>;

const REQUEST_GROUP0_MODIFY_URL: string = 'g_request_group0_modify_url_interceptor';
const REQUEST_GROUP1_MODIFY_METHOD: string = 'g_request_group1_modify_method_interceptor';
const REQUEST_GROUP2_MODIFY_BODY: string = 'g_request_group2_modify_body_interceptor';
const REQUEST_GROUP3_MODIFY_HEADERS: string = 'g_request_group3_modify_headers_interceptor';
const REQUEST_GROUP4_MODIFY_ABORT: string = 'g_request_group4_modify_abort_interceptor';
const REQUEST_GROUP10_READONLY_URL: string = 'g_request_group10_readonly_url_interceptor';
const REQUEST_GROUP11_READONLY_METHOD: string = 'g_request_group11_readonly_method_interceptor';
const REQUEST_GROUP12_READONLY_HEADERS: string = 'g_request_group12_readonly_headers_interceptor';
const REQUEST_GROUP13_READONLY_BODY: string = 'g_request_group13_readonly_body_interceptor';
const REQUEST_GROUP14_READONLY_ABORT: string = 'g_request_group14_readonly_abort_interceptor';


const RESPONSE_GROUP0_MODIFY_BODY: string = 'g_response_group0_modify_body_interceptor';
const RESPONSE_GROUP1_MODIFY_RESPONSE_CODE: string = 'g_response_group1_modify_responseCode_interceptor';
const RESPONSE_GROUP2_MODIFY_HEADERS: string = 'g_response_group2_modify_headers_interceptor';
const RESPONSE_GROUP3_MODIFY_ABORT: string = 'g_response_group3_modify_abort_interceptor';
const RESPONSE_GROUP10_READONLY_BODY: string = 'g_response_group10_readonly_body_interceptor';
const RESPONSE_GROUP11_READONLY_RESPONSE_CODE: string = 'g_response_group11_readonly_responseCode_interceptor';
const RESPONSE_GROUP12_READONLY_HEADERS: string = 'g_response_group12_readonly_headers_interceptor';
const RESPONSE_GROUP13_READONLY_ABORT: string = 'g_response_group13_readonly_abort_interceptor';

// 常量定义
const DOMAIN: number = 0x0000; // 日志域值
const TAG: string = 'netstack'; // 日志标签

const createServer = async (caseName: string, done: Function) => {
  console.info(`${TAG} ${caseName}---Start`);
  let tcpSocketServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
  let listenAddr: socket.NetAddress = {
    address: "0.0.0.0",
    port: 9999,
    family: 1
  }
  await tcpSocketServer.listen(listenAddr).then(async ()=> {
    let listenAddr: socket.NetAddress =  await tcpSocketServer.getLocalAddress();
    console.info(`${TAG} ${caseName} tcpSocketServer listen address: `+JSON.stringify(listenAddr.address) +' port: '+JSON.stringify(listenAddr.port));
  }).catch((err: BusinessError) => {
    console.error(`${caseName} get err is `+JSON.stringify(err));
    ExpectFail();
    done();
  })
  tcpSocketServer.off('connect');
  tcpSocketServer.on('connect', async (clientSocket: socket.TCPSocketConnection)=>{
    console.info(`${TAG} ${caseName}-----tcpSocketServer on connect`);
    let clientAddr: socket.NetAddress = await clientSocket.getRemoteAddress();;
    console.info(`${TAG} ${caseName}----------`+JSON.stringify(clientAddr));
    clientSocket.on('message', async (msgInfo: socket.SocketMessageInfo) => {
      let tcpSendOption: socket.TCPSendOptions = {
        data: "HTTP/1.1 200 OK\r\n" +
          "Server: Tengine\r\n" +
          "Date: Sun, 06 May 2018 08:22:10 GMT\r\n" +
          //"Content-Type: text/event-stream\n" +
          "Content-Length: 9\r\n" +
          "X-Powered-By: ring/1.0.0\r\n" +
          //"vary: Accept-Encoding\n" +
          "gsid: 010185222147152559493030300162313551811\r\n" +
          "sc: 0.013\r\n" +
          "Access-Control-Allow-Origin: *\r\n" +
          "Access-Control-Allow-Methods: *\r\n" +
          "cache-control: no-cache\r\n" +
          "zzzzzzz\r\n" +
          "Access-Control-Allow-Headers: DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,key,x-biz,x-info,platinfo,encr,enginever,gzipped,poiid\r\n" +
          "\r\n"+
          "data:body"
      }
      clientSocket.send(tcpSendOption);
    });
  });
}

export default function HttpInterceptorForSafeCheckTest() {
  describe('HttpInterceptorForSafeCheckTest', () => {
    beforeAll(async (done: Function) => {
      await createServer(TAG, done);
      console.info(`test1 ${TAG} test Start`);
      done()
    })

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddInterceptor0100
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddInterceptor_0100
     * @tc.desc   test Add request interceptor, not started
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddInterceptor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddInterceptor0100";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.AddWritableRequestInterceptor(2, 0);
          ExpectTrue(result === 0);
          console.info(`${TAG} ${caseName}AddWritableRequestInterceptor success result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
          };
          httpRequest.request(HTTP_URL, options, async (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.RemoveAllInterceptor(2);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 200);
              await testNetManager.RemoveAllInterceptor(2);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveAllInterceptor(2);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddInterceptor0200
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddInterceptor_0200
     * @tc.desc   test Add request interceptor, started
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddInterceptor0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddInterceptor0200";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.AddWritableRequestInterceptor(2, 1);
          ExpectTrue(result === 0);
          console.info(`${TAG} ${caseName}AddWritableRequestInterceptor success result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.RemoveAllInterceptor(2);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 200);
              testNetManager.RemoveAllInterceptor(2);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveAllInterceptor(2);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddInterceptor0300
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddInterceptor_0300
     * @tc.desc   test Add request interceptor, started, interceptor modifies URL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddInterceptor0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddInterceptor0300";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          testNetManager.RegisterInterceptorCallback(REQUEST_GROUP0_MODIFY_URL, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes(HTTP_URL_BAIDU));
            testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
          });
          let result: number = testNetManager.AddWritableRequestInterceptor(0, 1);
          ExpectTrue(result == 0);
          console.info(`${TAG} AddWritableRequestInterceptor success, result->${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
          };
          httpRequest.request(HTTP_URL_ERROR, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
              testNetManager.RemoveAllInterceptor(0);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              testNetManager.RemoveAllInterceptor(0);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
          testNetManager.RemoveAllInterceptor(0);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddInterceptor0400
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddInterceptor_0400
     * @tc.desc   test Add request interceptor, started, request abort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddInterceptor0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddInterceptor0400";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.AddWritableRequestInterceptor(4,1);
          ExpectTrue(result === 0);
          console.info(`${TAG} ${caseName}AddWritableRequestInterceptor success, result->${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.RemoveAllInterceptor(4);
              httpRequest.destroy();
              ExpectTrue(err.code == 2300999);
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectFail();
              testNetManager.RemoveAllInterceptor(4);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveAllInterceptor(4);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddInterceptor0500
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddInterceptor_0500
     * @tc.desc   test Add response interceptor, not started
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddInterceptor0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddInterceptor0500";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.AddWritableResponseInterceptor(0, 0);
          ExpectTrue(result === 0);
          console.info(`${TAG} ${caseName}AddWritableResponseInterceptor success result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.RemoveResponseInterceptor(0);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 200);
              testNetManager.RemoveResponseInterceptor(0);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveResponseInterceptor(0);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddInterceptor0600
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddInterceptor_0600
     * @tc.desc   test Add response interceptor, started
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddInterceptor0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddInterceptor0600";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.AddWritableResponseInterceptor(0, 1);
          ExpectTrue(result === 0);
          console.info(`${TAG} ${caseName}AddWritableResponseInterceptor success result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.RemoveResponseInterceptor(0);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 200);
              testNetManager.RemoveResponseInterceptor(0);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveResponseInterceptor(0);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddInterceptor0700
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddInterceptor_0700
     * @tc.desc   test Add response interceptor, started, interceptor modifies code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddInterceptor0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddInterceptor0700";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.AddWritableResponseInterceptor(1, 1);
          ExpectTrue(result === 0);
          console.info(`${TAG} ${caseName}AddWritableResponseInterceptor success result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.RemoveAllInterceptor(1);
              httpRequest.destroy();
              ExpectFail()
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 403);
              testNetManager.RemoveAllInterceptor(1);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveAllInterceptor(1);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddInterceptor0800
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddInterceptor_0800
     * @tc.desc   test Add response interceptor, started, interceptor modifies header
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddInterceptor0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddInterceptor0800";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.AddWritableResponseInterceptor(2, 1);
          ExpectTrue(result === 0);
          console.info(`${TAG} ${caseName}AddWritableResponseInterceptor success, result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
          };
          httpRequest.request("http://localhost:9999", options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.RemoveAllInterceptor(2);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res.header)}`);
              ExpectTrue(res.header["ddddddd"] == "6666666");
              testNetManager.RemoveAllInterceptor(2);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveAllInterceptor(2);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddInterceptor0900
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddInterceptor_0900
     * @tc.desc   test Add response interceptor, started, interceptor modifies body
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddInterceptor0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddInterceptor0900";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.AddWritableResponseInterceptor(0, 1);
          ExpectTrue(result === 0);
          console.info(`${TAG} ${caseName}AddWritableResponseInterceptor success, result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.RemoveAllInterceptor(0);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res.result)}`);
              ExpectTrue(res.result == 'response_body_modify');
              testNetManager.RemoveAllInterceptor(0);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveAllInterceptor(0);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddInterceptor1000
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddInterceptor_1000
     * @tc.desc   test Add response interceptor, started, response abort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddInterceptor1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddInterceptor1000";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let addHeasderResult: number = testNetManager.AddWritableResponseInterceptor(1, 1);
          ExpectTrue(addHeasderResult === 0);
          console.info(`${TAG} ${caseName}AddWritableResponseInterceptor success, addHeasderResult:${addHeasderResult}`);
          let result: number = testNetManager.AddWritableResponseInterceptor(3, 1);
          ExpectTrue(result === 0);
          console.info(`${TAG} ${caseName}AddWritableResponseInterceptor success, result:${result}`);
          let addBodyResult: number = testNetManager.AddWritableResponseInterceptor(0, 1);
          ExpectTrue(addBodyResult === 0);
          console.info(`${TAG} ${caseName}AddWritableResponseInterceptor success, addBodyResult:${addBodyResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.RemoveResponseInterceptor(0);
              testNetManager.RemoveResponseInterceptor(1);
              testNetManager.RemoveResponseInterceptor(3);
              ExpectFail();
              httpRequest.destroy();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 403);
              ExpectTrue(res.result == 'data:body');
              httpRequest.destroy();
              testNetManager.RemoveResponseInterceptor(0);
              testNetManager.RemoveResponseInterceptor(1);
              testNetManager.RemoveResponseInterceptor(3);
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveResponseInterceptor(0);
          testNetManager.RemoveResponseInterceptor(1);
          testNetManager.RemoveResponseInterceptor(3);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddInterceptor1100
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddInterceptor_1100
     * @tc.desc   test Add interceptor, pass null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddInterceptor1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddInterceptor1100";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.AddNullPtrReadOnlyRequestInterceptor();
          ExpectTrue(result == 401);
          console.info(`${TAG} ${caseName}AddNullPtrReadOnlyRequestInterceptor failed, result:${result}`);
          done();
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddInterceptor1200
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddInterceptor_1200
     * @tc.desc   test Add interceptor, pass null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddInterceptor1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddInterceptor1200";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.AddNullPtrWritableResponseInterceptor();
          ExpectTrue(result == 401);
          console.info(`${TAG} ${caseName} AddNullPtrWritableResponseInterceptor failed, result:${result}`);
          done();
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddInterceptor1300
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddInterceptor_1300
     * @tc.desc   test Add interceptor, abnormal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddInterceptor1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddInterceptor1300";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result1: number = testNetManager.AddReadOnlyResponseInterceptor(99, 1);
          ExpectTrue(result1 == 401);
          console.info(`${TAG} ${caseName} AddReadOnlyResponseInterceptor failed, result1:${result1}`);
          let result3: number = testNetManager.AddWritableRequestInterceptor(99, 1);
          ExpectTrue(result3 == 401);
          console.info(`${TAG} ${caseName} AddWritableRequestInterceptor failed, result3:${result3}`);
          let result4: number = testNetManager.AddWritableResponseInterceptor(99, 1);
          ExpectTrue(result4 == 401);
          console.info(`${TAG} ${caseName} AddWritableResponseInterceptor failed, result4:${result4}`);
          done();
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });


    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0100
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddReadOnlyInterceptor_0100
     * @tc.desc   test URL modification in read-only interceptor request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0100";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          testNetManager.RegisterInterceptorCallback(REQUEST_GROUP0_MODIFY_URL, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes(HTTP_URL_BAIDU));
            testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
          });
          let result: number = testNetManager.AddWritableRequestInterceptor(0, 1);
          ExpectTrue(result == 0);
          console.info(`${TAG} ${caseName}AddWritableRequestInterceptor success, result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL_ERROR, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
              testNetManager.RemoveRequestInterceptor(0);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              testNetManager.RemoveRequestInterceptor(0);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
          testNetManager.RemoveRequestInterceptor(0);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0200
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddReadOnlyInterceptor_0200
     * @tc.desc   test header modification in read-only interceptor request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0200";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          testNetManager.RegisterInterceptorCallback(REQUEST_GROUP3_MODIFY_HEADERS, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes('CCCCC'));
            testNetManager.UnregisterCallback(REQUEST_GROUP3_MODIFY_HEADERS);
          });
          let result: number = testNetManager.AddWritableRequestInterceptor(3, 1);
          ExpectTrue(result == 0);
          console.info(`${TAG} ${caseName}AddWritableRequestInterceptor success, result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
            header: HEADER
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.UnregisterCallback(REQUEST_GROUP3_MODIFY_HEADERS);
              testNetManager.RemoveRequestInterceptor(3);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              testNetManager.RemoveRequestInterceptor(3);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.UnregisterCallback(REQUEST_GROUP3_MODIFY_HEADERS);
          testNetManager.RemoveRequestInterceptor(3);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0300
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddReadOnlyInterceptor_0300
     * @tc.desc   test body modification in read-only interceptor request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0300";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          testNetManager.RegisterInterceptorCallback(REQUEST_GROUP2_MODIFY_BODY, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes('g_request_group2_modify_body_interceptor_handler'));
            testNetManager.UnregisterCallback(REQUEST_GROUP2_MODIFY_BODY);
          });
          let result: number = testNetManager.AddWritableRequestInterceptor(2, 1);
          ExpectTrue(result == 0);
          console.info(`${TAG} ${caseName}AddWritableRequestInterceptor success, result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
            extraData: BODY_MODIFY,
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.UnregisterCallback(REQUEST_GROUP2_MODIFY_BODY);
              testNetManager.RemoveRequestInterceptor(2);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              testNetManager.RemoveRequestInterceptor(2);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.UnregisterCallback(REQUEST_GROUP2_MODIFY_BODY);
          testNetManager.RemoveRequestInterceptor(2);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0400
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddReadOnlyInterceptor_0400
     * @tc.desc   test method modification in read-only interceptor request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0400";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          testNetManager.RegisterInterceptorCallback(REQUEST_GROUP1_MODIFY_METHOD, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes('POST'));
            testNetManager.UnregisterCallback(REQUEST_GROUP1_MODIFY_METHOD);
          });
          let result: number = testNetManager.AddWritableRequestInterceptor(1, 1);
          ExpectTrue(result == 0);
          console.info(`${TAG} ${caseName}AddWritableRequestInterceptor success, result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.UnregisterCallback(REQUEST_GROUP1_MODIFY_METHOD);
              testNetManager.RemoveRequestInterceptor(1);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              httpRequest.destroy();
              testNetManager.RemoveRequestInterceptor(1);
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.UnregisterCallback(REQUEST_GROUP1_MODIFY_METHOD);
          testNetManager.RemoveRequestInterceptor(1);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0500
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddReadOnlyInterceptor_0500
     * @tc.desc   test Request abort in read-only interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0500";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.AddWritableRequestInterceptor(4, 1);
          ExpectTrue(result == 0);
          console.info(`${TAG} ${caseName}AddWritableRequestInterceptor success, result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.RemoveRequestInterceptor(4);
              httpRequest.destroy();
              ExpectTrue(err.code == 2300999);
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectFail();
              testNetManager.RemoveRequestInterceptor(4);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveRequestInterceptor(4);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0600
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddReadOnlyInterceptor_0600
     * @tc.desc   test Response to code modification in read-only interceptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0600";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          testNetManager.RegisterInterceptorCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes('403'));
            testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
          });
          testNetManager.RegisterInterceptorCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes('404'));
            testNetManager.UnregisterCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE);
          });
          let addReadOnlyResult: number = testNetManager.AddReadOnlyResponseInterceptor(11, 1);
          ExpectTrue(addReadOnlyResult == 0);
          console.info(`${TAG} ${caseName}AddReadOnlyResponseInterceptor success, addReadOnlyResult:${addReadOnlyResult}`);
          let result: number = testNetManager.AddWritableResponseInterceptor(1, 1);
          ExpectTrue(result == 0);
          console.info(`${TAG} ${caseName}AddWritableResponseInterceptor success, result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
              testNetManager.UnregisterCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE);
              testNetManager.RemoveResponseInterceptor(1);
              testNetManager.RemoveResponseInterceptor(11);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 403);
              testNetManager.RemoveResponseInterceptor(1);
              testNetManager.RemoveResponseInterceptor(11);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
          testNetManager.UnregisterCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE);
          testNetManager.RemoveResponseInterceptor(1);
          testNetManager.RemoveResponseInterceptor(11);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0700
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddReadOnlyInterceptor_0700
     * @tc.desc   test Response to header modification in read-only interceptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0700";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          testNetManager.RegisterInterceptorCallback(RESPONSE_GROUP2_MODIFY_HEADERS, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes('DDDDDDD'));
            testNetManager.UnregisterCallback(RESPONSE_GROUP2_MODIFY_HEADERS);
          });
          testNetManager.RegisterInterceptorCallback(RESPONSE_GROUP12_READONLY_HEADERS, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes('GGGGGGGGG'));
            testNetManager.UnregisterCallback(RESPONSE_GROUP12_READONLY_HEADERS);
          });
          let addReadOnlyResult: number = testNetManager.AddReadOnlyResponseInterceptor(12, 1);
          ExpectTrue(addReadOnlyResult == 0);
          console.info(`${TAG} ${caseName}AddReadOnlyResponseInterceptor success, addReadOnlyResult:${addReadOnlyResult}`);
          let result: number = testNetManager.AddWritableResponseInterceptor(2, 1);
          ExpectTrue(result == 0);
          console.info(`${TAG} ${caseName}AddWritableResponseInterceptor success, result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.UnregisterCallback(RESPONSE_GROUP2_MODIFY_HEADERS);
              testNetManager.UnregisterCallback(RESPONSE_GROUP12_READONLY_HEADERS);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.header['ddddddd'] == '6666666');
            }
            testNetManager.RemoveAllInterceptor(2);
            testNetManager.RemoveAllInterceptor(12);
            httpRequest.destroy();
            done();
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.UnregisterCallback(RESPONSE_GROUP2_MODIFY_HEADERS);
          testNetManager.UnregisterCallback(RESPONSE_GROUP12_READONLY_HEADERS);
          testNetManager.RemoveAllInterceptor(2);
          testNetManager.RemoveAllInterceptor(12);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0800
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddReadOnlyInterceptor_0800
     * @tc.desc   test Response to body modification in read-only interceptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0800";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          testNetManager.RegisterInterceptorCallback(RESPONSE_GROUP0_MODIFY_BODY, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes('response_body_modify'));
            testNetManager.UnregisterCallback(RESPONSE_GROUP0_MODIFY_BODY);
          });
          testNetManager.RegisterInterceptorCallback(RESPONSE_GROUP10_READONLY_BODY, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes('g_response_group10_readonly_body_interceptor_handler'));
            testNetManager.UnregisterCallback(RESPONSE_GROUP10_READONLY_BODY);
          });
          let addReadOnlyResult: number = testNetManager.AddReadOnlyResponseInterceptor(10, 1);
          ExpectTrue(addReadOnlyResult == 0);
          console.info(`${TAG} ${caseName}AddReadOnlyResponseInterceptor success, addReadOnlyResult:${addReadOnlyResult}`);
          let result: number = testNetManager.AddWritableResponseInterceptor(0, 1);
          ExpectTrue(result == 0);
          console.info(`${TAG} ${caseName}AddWritableResponseInterceptor success, result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.UnregisterCallback(RESPONSE_GROUP0_MODIFY_BODY);
              testNetManager.UnregisterCallback(RESPONSE_GROUP10_READONLY_BODY);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.result == 'response_body_modify');
            }
            testNetManager.RemoveAllInterceptor(0);
            testNetManager.RemoveAllInterceptor(10);
            httpRequest.destroy();
            done();
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.UnregisterCallback(RESPONSE_GROUP0_MODIFY_BODY);
          testNetManager.UnregisterCallback(RESPONSE_GROUP10_READONLY_BODY);
          testNetManager.RemoveAllInterceptor(0);
          testNetManager.RemoveAllInterceptor(10);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveInterceptor0100
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveInterceptor_0100
     * @tc.desc   test Delete request interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveInterceptor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveInterceptor0100";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.RemoveResponseInterceptor(2);
          ExpectTrue(result === 0);
          console.info(`${TAG} ${caseName}RemoveRequestInterceptor success, result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.RemoveResponseInterceptor(2);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 200);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveResponseInterceptor(2);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveInterceptor0200
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveInterceptor_0200
     * @tc.desc   test Delete request interceptor, interceptor modifies URL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveInterceptor0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveInterceptor0200";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          testNetManager.RegisterInterceptorCallback(REQUEST_GROUP0_MODIFY_URL, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes(HTTP_URL_BAIDU));
            testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
          });
          let addRes: number = testNetManager.AddWritableRequestInterceptor(0,1);
          ExpectTrue(addRes === 0);
          console.info(`${TAG} ${caseName}AddWritableRequestInterceptor success, addRes:${addRes}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL_ERROR, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
              testNetManager.RemoveRequestInterceptor(0);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
              let reqResult: number = testNetManager.RemoveRequestInterceptor(0);
              ExpectTrue(reqResult === 0);
              console.info(`${TAG} ${caseName}RemoveRequestInterceptor success, reqResult:${reqResult}`);
              httpRequest.request(HTTP_URL_ERROR, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  ExpectTrue(err.code == 2300999);
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
                  ExpectFail();
                }
                testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
                testNetManager.RemoveRequestInterceptor(0);
                httpRequest.destroy();
                done();
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
          testNetManager.RemoveRequestInterceptor(0);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });


    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveInterceptor0300
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveInterceptor_0300
     * @tc.desc   test Remove response interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveInterceptor0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveInterceptor0300";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.RemoveResponseInterceptor(0);
          ExpectTrue(result === 0);
          console.info(`${TAG} ${caseName}RemoveResponseInterceptor result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.RemoveResponseInterceptor(0);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 200);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveResponseInterceptor(0);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveInterceptor0400
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveInterceptor_0400
     * @tc.desc   test Delete response interceptor, modify code for interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveInterceptor0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveInterceptor0400";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let addResult: number = testNetManager.AddWritableResponseInterceptor(1, 1);
          ExpectTrue(addResult === 0);
          console.info(`${TAG} ${caseName}AddWritableResponseInterceptor success, addResult:${addResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 403);
              let delResult: number = testNetManager.RemoveResponseInterceptor(1);
              ExpectTrue(delResult === 0);
              console.info(`${TAG} ${caseName}RemoveResponseInterceptor success, delResult:${delResult}`);
              httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
                  ExpectTrue(res.responseCode == 200);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveInterceptor0500
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveInterceptor_0500
     * @tc.desc   test Delete response interceptor, modify header for interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveInterceptor0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveInterceptor0500";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let addResult: number = testNetManager.AddWritableResponseInterceptor(2, 1);
          ExpectTrue(addResult === 0);
          console.info(`${TAG} ${caseName}AddWritableResponseInterceptor addResult:${addResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              createServer(caseName, done);
              console.info(`${TAG} ${caseName} first_res_header:${JSON.stringify(res.header)}`);
              ExpectTrue(res.header["ddddddd"] == "6666666");
              let delResult: number = testNetManager.RemoveResponseInterceptor(2);
              ExpectTrue(delResult === 0);
              console.info(`${TAG} ${caseName}RemoveResponseInterceptor success, delResult:${delResult}`);
              httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} second_res_header:${JSON.stringify(res.header)}`);
                  const targetHeader = 'ddddddd';
                  const headerKeys = Object.keys(res.header).map(key => key.toLowerCase());
                  const headerExists = headerKeys.includes(targetHeader.toLowerCase());
                  console.info(`${TAG} ${caseName} headerExists:${headerExists}`);
                  ExpectTrue(!headerExists);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveInterceptor0600
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveInterceptor_0600
     * @tc.desc   test Delete response interceptor, modify body for interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveInterceptor0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveInterceptor0600";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let addResult: number = testNetManager.AddWritableResponseInterceptor(0, 1);
          ExpectTrue(addResult === 0);
          console.info(`${TAG} ${caseName}AddWritableResponseInterceptor addResult:${addResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.result == 'response_body_modify');
              let delResult: number = testNetManager.RemoveResponseInterceptor(0);
              ExpectTrue(delResult === 0);
              console.info(`${TAG} ${caseName}RemoveResponseInterceptor success, delResult:${delResult}`);
              httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  testNetManager.RemoveResponseInterceptor(0);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
                  ExpectTrue(res.result !== 'response_body_modify');
                  httpRequest.destroy();
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveResponseInterceptor(0);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });


    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveInterceptor0700
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveInterceptor_0700
     * @tc.desc   test Delete interceptor, pass null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveInterceptor0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveInterceptor0700";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.RemoveNullptrInterceptor();
          ExpectTrue(result == 401);
          console.info(`${TAG} ${caseName}RemoveNullptrInterceptor failed, result:${result}`);
          done();
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveInterceptor0900
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveInterceptor_0900
     * @tc.desc   test Delete request interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveInterceptor0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveInterceptor0900";
        console.info(`${TAG} ${caseName} test Start`);
        let reqArr: Array<number> = [0, 1, 2, 3, 4];
        try {
          reqArr.forEach((item: number) => {
            let result: number = testNetManager.AddWritableRequestInterceptor(item, 1);
            ExpectTrue(result === 0);
            console.info(`${TAG} ${caseName} AddWritableRequestInterceptor success, result:${result}`);
          })
          reqArr.forEach((item: number) => {
            let result: number = testNetManager.RemoveRequestInterceptor(item);
            ExpectTrue(result === 0);
            console.info(`${TAG} ${caseName} RemoveRequestInterceptor success, result:${result}`);
          })
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 200);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          reqArr.forEach((item: number) => {
            let result: number = testNetManager.RemoveRequestInterceptor(item);
            ExpectTrue(result === 0);
            console.info(`${TAG} ${caseName} RemoveRequestInterceptor success, result:${result}`);
          })
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveInterceptor0800
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveInterceptor_0800
     * @tc.desc   test Will deleting multiple different interceptors affect each other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveInterceptor0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveInterceptor0800";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          testNetManager.RegisterInterceptorCallback(REQUEST_GROUP0_MODIFY_URL, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes(HTTP_URL_BAIDU));
            testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
          });
          testNetManager.RegisterInterceptorCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes('403'));
            testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
          });
          testNetManager.RegisterInterceptorCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes('404'));
            testNetManager.UnregisterCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE);
          });
          let result: number = testNetManager.AddWritableRequestInterceptor(0, 1);
          ExpectTrue(result == 0);
          console.info(`${TAG} ${caseName} AddWritableRequestInterceptor success, result:${result}`);
          let readOnlyResResult: number = testNetManager.AddReadOnlyResponseInterceptor(11, 1);
          ExpectTrue(readOnlyResResult == 0);
          console.info(`${TAG} ${caseName} AddReadOnlyResponseInterceptor success, readOnlyResResult:${readOnlyResResult}`);
          let result1: number = testNetManager.AddWritableResponseInterceptor(1, 1);
          ExpectTrue(result1 == 0);
          console.info(`${TAG} ${caseName} AddWritableResponseInterceptor success, result1:${result1}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL_ERROR, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
              testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
              testNetManager.UnregisterCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE);
              testNetManager.RemoveRequestInterceptor(0);
              testNetManager.RemoveResponseInterceptor(1);
              testNetManager.RemoveRequestInterceptor(11);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 403);
              testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
              let delReadOnlyResult1: number = testNetManager.RemoveResponseInterceptor(1);
              ExpectTrue(delReadOnlyResult1 === 0);
              console.info(`${TAG} ${caseName} RemoveResponseInterceptor success, delReadOnlyResult1:${delReadOnlyResult1}`);
              httpRequest.request(HTTP_URL_ERROR, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
                  ExpectTrue(res.responseCode == 200);
                }
                testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
                testNetManager.UnregisterCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE);
                testNetManager.RemoveRequestInterceptor(0);
                testNetManager.RemoveRequestInterceptor(11);
                httpRequest.destroy();
                done();
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
          testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
          testNetManager.UnregisterCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE);
          testNetManager.RemoveRequestInterceptor(0);
          testNetManager.RemoveResponseInterceptor(1);
          testNetManager.RemoveRequestInterceptor(11);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveInterceptor1000
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveInterceptor_1000
     * @tc.desc   test Delete request interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveInterceptor1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveInterceptor1000";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let resArr: Array<number> = [0, 1, 2, 3, 10, 11, 12, 13];
          resArr.forEach((item: number) => {
            if (item < 4) {
              let result: number = testNetManager.AddWritableResponseInterceptor(item, 1);
              ExpectTrue(result === 0);
              console.info(`${TAG} ${caseName} AddWritableResponseInterceptor success, result:${result}`);
            } else {
              let result1: number = testNetManager.AddReadOnlyResponseInterceptor(item, 1);
              ExpectTrue(result1 === 0);
              console.info(`${TAG} ${caseName} AddReadOnlyResponseInterceptor success, result1:${result1}`);
            }
          })
          resArr.forEach((item: number) => {
            let result: number = testNetManager.RemoveResponseInterceptor(item);
            ExpectTrue(result === 0);
            console.info(`${TAG} ${caseName} RemoveResponseInterceptor success, result:${result}`);
          })
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 200);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveInterceptor1100
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveInterceptor_1100
     * @tc.desc   test Delete interceptor, abnormal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveInterceptor1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveInterceptor1100";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.RemoveRequestInterceptor(99);
          ExpectTrue(result == 401);
          console.info(`${TAG} ${caseName} RemoveRequestInterceptor failed, result:${result}`);
          let result1: number = testNetManager.RemoveResponseInterceptor(99);
          ExpectTrue(result1 == 401);
          console.info(`${TAG} ${caseName} RemoveResponseInterceptor failed, result1:${result1}`);
          done();
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0100
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveAllInterceptor_0100
     * @tc.desc   test Delete group interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0100";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result0: number = testNetManager.RemoveAllInterceptor(0);
          ExpectTrue(result0 === 0);
          console.info(`${TAG} ${caseName}RemoveAllInterceptor success, result0:${result0}`);
          let result1: number = testNetManager.RemoveAllInterceptor(1);
          ExpectTrue(result1 === 0);
          console.info(`${TAG} ${caseName}RemoveAllInterceptor success, result1:${result1}`);
          let result2: number = testNetManager.RemoveAllInterceptor(2);
          ExpectTrue(result2 === 0);
          console.info(`${TAG} ${caseName}RemoveAllInterceptor success, result2:${result2}`);
          let result3: number = testNetManager.RemoveAllInterceptor(3);
          ExpectTrue(result3 === 0);
          console.info(`${TAG} ${caseName}RemoveAllInterceptor success, result3:${result3}`);
          let result4: number = testNetManager.RemoveAllInterceptor(4);
          ExpectTrue(result4 === 0);
          console.info(`${TAG} ${caseName}RemoveAllInterceptor success, result4:${result4}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 200);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0200
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveAllInterceptor_0200
     * @tc.desc   test Remove the group interceptor and modify the URL of the interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0200";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          testNetManager.RegisterInterceptorCallback(REQUEST_GROUP0_MODIFY_URL, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes(HTTP_URL_BAIDU));
            testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
          });
          let addResult: number = testNetManager.AddWritableRequestInterceptor(0, 1);
          ExpectTrue(addResult === 0);
          console.info(`${TAG} ${caseName}AddWritableRequestInterceptor success, addResult:${addResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL_ERROR, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
              testNetManager.RemoveAllInterceptor(0);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
              let delResult: number = testNetManager.RemoveAllInterceptor(0);
              ExpectTrue(delResult === 0);
              console.info(`${TAG} ${caseName}RemoveAllInterceptor success, delResult:${delResult}`);
              httpRequest.request(HTTP_URL_ERROR, options, async (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
                  await testNetManager.RemoveAllInterceptor(0);
                  ExpectTrue(err.code == 2300999);
                  httpRequest.destroy();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
          testNetManager.RemoveAllInterceptor(0);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0300
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveAllInterceptor_0300
     * @tc.desc   test Remove the group interceptor and modify the code of the interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0300";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let addResult: number = testNetManager.AddWritableResponseInterceptor(1, 1);
          ExpectTrue(addResult === 0);
          console.info(`${TAG} ${caseName}AddWritableResponseInterceptor success, addResult:${addResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.RemoveAllInterceptor(1);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 403);
              let delResult: number = testNetManager.RemoveAllInterceptor(1);
              ExpectTrue(delResult === 0);
              console.info(`${TAG} ${caseName}RemoveAllInterceptor success, delResult:${delResult}`);
              httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  testNetManager.RemoveAllInterceptor(1);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
                  ExpectTrue(res.responseCode == 200);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveAllInterceptor(1);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0400
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveAllInterceptor_0400
     * @tc.desc   test Remove the group interceptor and modify the header of the interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0400";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let addResult: number = testNetManager.AddWritableResponseInterceptor(2, 1);
          ExpectTrue(addResult === 0);
          console.info(`${TAG} ${caseName}AddModifyResponseBodyInterceptor success addResult:${addResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.RemoveAllInterceptor(2);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.header["ddddddd"] == "6666666");
              let delResult: number = testNetManager.RemoveAllInterceptor(2);
              ExpectTrue(delResult === 0);
              console.info(`${TAG} ${caseName}RemoveAllInterceptor success delResult:${delResult}`);
              httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  testNetManager.RemoveAllInterceptor(2);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
                  ExpectTrue(res.header?.['ddddddd'] == undefined);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveAllInterceptor(2);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0500
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveAllInterceptor_0500
     * @tc.desc   test Remove the group interceptor and modify the body of the interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0500";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let addResult: number = testNetManager.AddWritableResponseInterceptor(0, 1);
          ExpectTrue(addResult === 0);
          console.info(`${TAG} ${caseName}AddModifyResponseBodyInterceptor success addResult:${addResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.RemoveAllInterceptor(0);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.result == 'response_body_modify');
              let delResult: number = testNetManager.RemoveAllInterceptor(0);
              ExpectTrue(delResult === 0);
              console.info(`${TAG} ${caseName}RemoveAllInterceptor success delResult:${delResult}`);
              httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  testNetManager.RemoveAllInterceptor(0);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
                  ExpectTrue(res.result !== 'response_body_modify');
                  httpRequest.destroy();
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveAllInterceptor(0);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0600
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveAllInterceptor_0600
     * @tc.desc   test activate the deleted interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0600";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.RemoveAllInterceptor(99);
          ExpectTrue(result == 0);
          console.info(`${TAG} ${caseName} RemoveAllInterceptor failed, result:${result}`);
          done();
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0800
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveAllInterceptor_0800
     * @tc.desc   test activate the deleted interceptor, same type interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0800";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          testNetManager.RegisterInterceptorCallback(REQUEST_GROUP0_MODIFY_URL, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes(HTTP_URL_BAIDU));
            testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
          });
          testNetManager.RegisterInterceptorCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes('403'));
            testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
          });
          let result: number = testNetManager.AddWritableRequestInterceptor(0, 1);
          ExpectTrue(result == 0);
          console.info(`${TAG} ${caseName} AddWritableRequestInterceptor success, result:${result}`);
          let result1: number = testNetManager.AddWritableRequestInterceptor(20, 1);
          ExpectTrue(result1 == 401);
          console.info(`${TAG} ${caseName} AddWritableRequestInterceptor success, result1:${result1}`);
          let result2: number = testNetManager.AddWritableResponseInterceptor(1, 1);
          ExpectTrue(result2 == 0);
          console.info(`${TAG} ${caseName} AddWritableResponseInterceptor success, result2:${result2}`);
          let result3: number = testNetManager.AddWritableResponseInterceptor(21, 1);
          ExpectTrue(result1 == 401);
          console.info(`${TAG} ${caseName} AddWritableResponseInterceptor success, result3:${result3}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL_ERROR, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
              testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
              testNetManager.RemoveRequestInterceptor(0);
              testNetManager.RemoveResponseInterceptor(1);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res-first:${res.responseCode}`);
              ExpectTrue(res.responseCode == 403);
              let delResult: number = testNetManager.RemoveAllInterceptor(0);
              ExpectTrue(delResult === 0);
              console.info(`${TAG} ${caseName} RemoveAllInterceptor success, delResult:${delResult}`);
              httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
                  testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res-second:${res.responseCode}`);
                  ExpectTrue(res.responseCode == 403);
                }
                testNetManager.RemoveRequestInterceptor(0);
                testNetManager.RemoveResponseInterceptor(1);
                httpRequest.destroy();
                done();
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
          testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
          testNetManager.RemoveRequestInterceptor(0);
          testNetManager.RemoveResponseInterceptor(1);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0700
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveAllInterceptor_0700
     * @tc.desc   test activate the deleted interceptor, abnormal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0700";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          testNetManager.RegisterInterceptorCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes('403'));
            testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
          });
          testNetManager.RegisterInterceptorCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes('404'));
            testNetManager.UnregisterCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE);
          });
          let result: number = testNetManager.AddWritableRequestInterceptor(0, 1);
          ExpectTrue(result == 0);
          console.info(`${TAG} ${caseName} AddWritableRequestInterceptor success, result:${result}`);
          let readOnlyResResult: number = testNetManager.AddReadOnlyResponseInterceptor(11, 1);
          ExpectTrue(readOnlyResResult == 0);
          console.info(`${TAG} ${caseName} AddReadOnlyResponseInterceptor success, readOnlyResResult:${readOnlyResResult}`);
          let result1: number = testNetManager.AddWritableResponseInterceptor(1, 1);
          ExpectTrue(result1 == 0);
          console.info(`${TAG} ${caseName} AddWritableResponseInterceptor success, result1:${result1}`);
          let delResult: number = testNetManager.RemoveAllInterceptor(0);
          ExpectTrue(delResult === 0);
          console.info(`${TAG} ${caseName} RemoveAllInterceptor success, delResult:${delResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
              testNetManager.UnregisterCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE);
              testNetManager.RemoveAllInterceptor(0);
              testNetManager.RemoveAllInterceptor(1);
              testNetManager.RemoveAllInterceptor(11);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res-first:${res.responseCode}`);
              ExpectTrue(res.responseCode == 403);
              testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
              testNetManager.UnregisterCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE);
              let delResult: number = testNetManager.RemoveAllInterceptor(1);
              ExpectTrue(delResult === 0);
              console.info(`${TAG} ${caseName} RemoveAllInterceptor success, delResult:${delResult}`);
              let delResult1: number = testNetManager.RemoveAllInterceptor(11);
              ExpectTrue(delResult1 === 0);
              console.info(`${TAG} ${caseName} RemoveAllInterceptor success, delResult1:${delResult1}`);
              httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
                  testNetManager.UnregisterCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE);
                  testNetManager.RemoveAllInterceptor(0);
                  testNetManager.RemoveAllInterceptor(1);
                  testNetManager.RemoveAllInterceptor(11);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res-second:${res.responseCode}`);
                  ExpectTrue(res.responseCode == 200);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
          testNetManager.UnregisterCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE);
          testNetManager.RemoveAllInterceptor(0);
          testNetManager.RemoveAllInterceptor(1);
          testNetManager.RemoveAllInterceptor(11);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorStartAllInterceptor0200
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_StartAllInterceptor_0200
     * @tc.desc   test Enable the group interceptor to modify the URL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorStartAllInterceptor0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorStartAllInterceptor0200";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          testNetManager.RegisterInterceptorCallback(REQUEST_GROUP0_MODIFY_URL, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes(HTTP_URL_BAIDU));
            testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
          });
          let addResult: number = testNetManager.AddWritableRequestInterceptor(0, 0);
          ExpectTrue(addResult === 0);
          console.info(`${TAG} ${caseName}AddWritableRequestInterceptor addResult:${addResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
              testNetManager.RemoveRequestInterceptor(0);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              let startResult: number = testNetManager.StartAllInterceptor(0);
              ExpectTrue(startResult === 0);
              console.info(`${TAG} ${caseName}StartAllInterceptor startResult:${startResult}`);
              httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
                }
                testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
                testNetManager.RemoveRequestInterceptor(0);
                httpRequest.destroy();
                done();
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
          testNetManager.RemoveRequestInterceptor(0);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorStartAllInterceptor0300
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_StartAllInterceptor_0300
     * @tc.desc   test Enable the group interceptor to modify the code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorStartAllInterceptor0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorStartAllInterceptor0300";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let addResult: number = testNetManager.AddWritableResponseInterceptor(1, 0);
          ExpectTrue(addResult === 0);
          console.info(`${TAG} ${caseName}AddWritableResponseInterceptor addResult:${addResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.RemoveResponseInterceptor(1);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 200);
              let startResult: number = testNetManager.StartAllInterceptor(1);
              ExpectTrue(startResult === 0);
              console.info(`${TAG} ${caseName}StartAllInterceptor startResult:${startResult}`);
              httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  testNetManager.RemoveResponseInterceptor(1);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
                  ExpectTrue(res.responseCode == 403);
                  testNetManager.RemoveResponseInterceptor(1);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveResponseInterceptor(1);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorStartAllInterceptor0400
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_StartAllInterceptor_0400
     * @tc.desc   test Enable the group interceptor to modify the header
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorStartAllInterceptor0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorStartAllInterceptor0400";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let addResult: number = testNetManager.AddWritableResponseInterceptor(2, 0);
          ExpectTrue(addResult === 0);
          console.info(`${TAG} ${caseName}AddWritableResponseInterceptor addResult:${addResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.RemoveResponseInterceptor(2);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.header?.["ddddddd"] == undefined);
              let startResult: number = testNetManager.StartAllInterceptor(2);
              ExpectTrue(startResult === 0);
              console.info(`${TAG} ${caseName}StartAllInterceptor startResult:${startResult}`);
              httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  testNetManager.RemoveResponseInterceptor(2);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
                  ExpectTrue(res.header["ddddddd"] == "6666666");
                  testNetManager.RemoveResponseInterceptor(2);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveResponseInterceptor(2);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorStartAllInterceptor0500
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_StartAllInterceptor_0500
     * @tc.desc   test Enable the group interceptor to modify the body
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorStartAllInterceptor0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorStartAllInterceptor0500";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let addResult: number = testNetManager.AddWritableResponseInterceptor(0, 0);
          ExpectTrue(addResult === 0);
          console.info(`${TAG} ${caseName}AddWritableResponseInterceptor addResult:${addResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.RemoveResponseInterceptor(0);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.result == 'data:body');
              let startResult: number = testNetManager.StartAllInterceptor(0);
              ExpectTrue(startResult === 0);
              console.info(`${TAG} ${caseName}StartAllInterceptor startResult:${startResult}`);
              httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  testNetManager.RemoveResponseInterceptor(0);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
                  ExpectTrue(res.result == 'response_body_modify');
                  httpRequest.destroy();
                  testNetManager.RemoveResponseInterceptor(0);
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveResponseInterceptor(0);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorStartAllInterceptor0800
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_StartAllInterceptor_0800
     * @tc.desc   test start group interceptor, same type interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorStartAllInterceptor0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorStartAllInterceptor0800";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          testNetManager.RegisterInterceptorCallback(REQUEST_GROUP0_MODIFY_URL, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes(HTTP_URL_BAIDU));
            testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
          });
          testNetManager.RegisterInterceptorCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes('403'));
            testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
          });
          let result: number = testNetManager.AddWritableRequestInterceptor(0, 0);
          ExpectTrue(result == 0);
          console.info(`${TAG} ${caseName} AddWritableRequestInterceptor success, result:${result}`);
          let result1: number = testNetManager.AddWritableRequestInterceptor(20, 0);
          ExpectTrue(result1 == 401);
          console.info(`${TAG} ${caseName} AddWritableRequestInterceptor success, result1:${result1}`);
          let result2: number = testNetManager.AddWritableResponseInterceptor(1, 0);
          ExpectTrue(result2 == 0);
          console.info(`${TAG} ${caseName} AddWritableResponseInterceptor success, result2:${result2}`);
          let result3: number = testNetManager.AddWritableResponseInterceptor(21, 0);
          ExpectTrue(result3 == 401);
          console.info(`${TAG} ${caseName} AddWritableResponseInterceptor success, result3:${result3}`);
          let startResult: number = testNetManager.StartAllInterceptor(0);
          ExpectTrue(startResult === 0);
          console.info(`${TAG} ${caseName} StartAllInterceptor success, startResult:${startResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL_ERROR, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
              testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
              testNetManager.RemoveRequestInterceptor(0);
              testNetManager.RemoveResponseInterceptor(1);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res-first:${res.responseCode}`);
              ExpectTrue(res.responseCode == 200);
              let startResult: number = testNetManager.StartAllInterceptor(1);
              ExpectTrue(startResult === 0);
              console.info(`${TAG} ${caseName} StartAllInterceptor success, startResult:${startResult}`);
              httpRequest.request(HTTP_URL_ERROR, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
                  testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
                  testNetManager.RemoveRequestInterceptor(0);
                  testNetManager.RemoveResponseInterceptor(1);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res-second:${res.responseCode}`);
                  ExpectTrue(res.responseCode == 403);
                  testNetManager.RemoveRequestInterceptor(0);
                  testNetManager.RemoveResponseInterceptor(1);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
          testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
          testNetManager.RemoveRequestInterceptor(0);
          testNetManager.RemoveResponseInterceptor(1);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorStartAllInterceptor0600
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_StartAllInterceptor_0600
     * @tc.desc   test Enable group interceptor, abnormal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorStartAllInterceptor0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorStartAllInterceptor0600";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.StartAllInterceptor(99);
          ExpectTrue(result == 0);
          console.info(`${TAG} ${caseName} StartAllInterceptor failed, result:${result}`);
          done();
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorStartAllInterceptor0700
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_StartAllInterceptor_0700
     * @tc.desc   test Will multiple group interceptors start one by one and affect each other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorStartAllInterceptor0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorStartAllInterceptor0700";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          testNetManager.RegisterInterceptorCallback(REQUEST_GROUP0_MODIFY_URL, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes(HTTP_URL_BAIDU));
            testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
          });
          testNetManager.RegisterInterceptorCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes('403'));
            testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
          });
          testNetManager.RegisterInterceptorCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes('404'));
            testNetManager.UnregisterCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE);
          });
          let result: number = testNetManager.AddWritableRequestInterceptor(0, 0);
          ExpectTrue(result == 0);
          console.info(`${TAG} ${caseName} AddWritableRequestInterceptor success, result:${result}`);
          let readOnlyResResult: number = testNetManager.AddReadOnlyResponseInterceptor(11, 0);
          ExpectTrue(readOnlyResResult == 0);
          console.info(`${TAG} ${caseName} AddReadOnlyResponseInterceptor success, readOnlyResResult:${readOnlyResResult}`);
          let result1: number = testNetManager.AddWritableResponseInterceptor(1, 0);
          ExpectTrue(result1 == 0);
          console.info(`${TAG} ${caseName} AddWritableResponseInterceptor success, result1:${result1}`);
          let startResult: number = testNetManager.StartAllInterceptor(0);
          ExpectTrue(startResult == 0);
          console.info(`${TAG} ${caseName} StartAllInterceptor success, startResult:${startResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL_ERROR, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
              testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
              testNetManager.UnregisterCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE);
              testNetManager.RemoveRequestInterceptor(0);
              testNetManager.RemoveResponseInterceptor(1);
              testNetManager.RemoveResponseInterceptor(11);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 200);
              let startResult: number = testNetManager.StartAllInterceptor(11);
              ExpectTrue(startResult == 0);
              console.info(`${TAG} ${caseName} StartAllInterceptor success, startResult:${startResult}`);
              let startResult1: number = testNetManager.StartAllInterceptor(1);
              ExpectTrue(startResult1 == 0);
              console.info(`${TAG} ${caseName} StartAllInterceptor success, startResult1:${startResult1}`);
              httpRequest.request(HTTP_URL_ERROR, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
                  testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
                  testNetManager.UnregisterCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
                  ExpectTrue(res.responseCode == 403);
                }
                testNetManager.RemoveRequestInterceptor(0);
                testNetManager.RemoveResponseInterceptor(1);
                testNetManager.RemoveResponseInterceptor(11);
                httpRequest.destroy();
                done();
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
          testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
          testNetManager.UnregisterCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE);
          testNetManager.RemoveRequestInterceptor(0);
          testNetManager.RemoveResponseInterceptor(1);
          testNetManager.RemoveResponseInterceptor(11);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorStartAllInterceptor0100
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_StartAllInterceptor_0100
     * @tc.desc   test Enable group interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorStartAllInterceptor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorStartAllInterceptor0100";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result0: number = testNetManager.StartAllInterceptor(0);
          ExpectTrue(result0 === 0);
          console.info(`${TAG} ${caseName}StartAllInterceptor success, result0:${result0}`);
          let result1: number = testNetManager.StartAllInterceptor(1);
          ExpectTrue(result1 === 0);
          console.info(`${TAG} ${caseName}StartAllInterceptor success, result1:${result1}`);
          let result2: number = testNetManager.StartAllInterceptor(2);
          ExpectTrue(result2 === 0);
          console.info(`${TAG} ${caseName}StartAllInterceptor success, result2:${result2}`);
          let result3: number = testNetManager.StartAllInterceptor(3);
          ExpectTrue(result3 === 0);
          console.info(`${TAG} ${caseName}StartAllInterceptor success, result3:${result3}`);
          let result4: number = testNetManager.StartAllInterceptor(4);
          ExpectTrue(result4 === 0);
          console.info(`${TAG} ${caseName}StartAllInterceptor success, result4:${result4}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 200);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorStopAllInterceptor0100
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_StopAllInterceptor_0100
     * @tc.desc   test Stop group interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorStopAllInterceptor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorStopAllInterceptor0100";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result0: number = testNetManager.StopAllInterceptor(0);
          ExpectTrue(result0 === 0);
          console.info(`${TAG} ${caseName}StopAllInterceptor success, result0:${result0}`);
          let result1: number = testNetManager.StopAllInterceptor(1);
          ExpectTrue(result1 === 0);
          console.info(`${TAG} ${caseName}StopAllInterceptor success, result1:${result1}`);
          let result2: number = testNetManager.StopAllInterceptor(2);
          ExpectTrue(result2 === 0);
          console.info(`${TAG} ${caseName}StopAllInterceptor success, result2:${result2}`);
          let result3: number = testNetManager.StopAllInterceptor(3);
          ExpectTrue(result3 === 0);
          console.info(`${TAG} ${caseName}StopAllInterceptor success, result3:${result3}`);
          let result4: number = testNetManager.StopAllInterceptor(4);
          ExpectTrue(result4 === 0);
          console.info(`${TAG} ${caseName}StopAllInterceptor success, result4:${result4}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} responseCode:${res.responseCode}`);
              ExpectTrue(res.responseCode == 200);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorStopAllInterceptor0200
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_StopAllInterceptor_0200
     * @tc.desc   test Stop the group interceptor to modify the URL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorStopAllInterceptor0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorStopAllInterceptor0200";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          testNetManager.RegisterInterceptorCallback(REQUEST_GROUP0_MODIFY_URL, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes(HTTP_URL_BAIDU));
            testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
          });
          let addResult: number = testNetManager.AddWritableRequestInterceptor(0, 1);
          ExpectTrue(addResult === 0);
          console.info(`${TAG} ${caseName}AddWritableRequestInterceptor addResult:${addResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
              testNetManager.RemoveRequestInterceptor(0);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              let stopResult: number = testNetManager.StopAllInterceptor(0);
              ExpectTrue(stopResult === 0);
              console.info(`${TAG} ${caseName}StopAllInterceptor stopResult:${stopResult}`);
              httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
                  testNetManager.RemoveRequestInterceptor(0);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
                  testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
                  testNetManager.RemoveRequestInterceptor(0);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
          testNetManager.RemoveRequestInterceptor(0);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorStopAllInterceptor0300
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_StopAllInterceptor_0300
     * @tc.desc   test Stop the group interceptor to modify the code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorStopAllInterceptor0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorStopAllInterceptor0300";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let addResult: number = testNetManager.AddWritableResponseInterceptor(1, 1);
          ExpectTrue(addResult === 0);
          console.info(`${TAG} ${caseName}AddWritableResponseInterceptor success, addResult:${addResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 403);
              let stopResult: number = testNetManager.StopAllInterceptor(1);
              ExpectTrue(stopResult === 0);
              console.info(`${TAG} ${caseName}StopAllInterceptor success, stopResult:${stopResult}`);
              httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
                  ExpectTrue(res.responseCode == 200);
                }
                testNetManager.RemoveResponseInterceptor(1);
                httpRequest.destroy();
                done();
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveResponseInterceptor(1);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorStopAllInterceptor0400
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_StopAllInterceptor_0400
     * @tc.desc   test Stop the group interceptor to modify the header
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorStopAllInterceptor0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorStopAllInterceptor0400";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let addResult: number = testNetManager.AddWritableResponseInterceptor(2, 1);
          ExpectTrue(addResult === 0);
          console.info(`${TAG} ${caseName}AddWritableResponseInterceptor success, addResult:${addResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.header["ddddddd"] == "6666666");
              let stopResult: number = testNetManager.StopAllInterceptor(2);
              ExpectTrue(stopResult === 0);
              console.info(`${TAG} ${caseName}StopAllInterceptor stopResult:${stopResult}`);
              httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  testNetManager.RemoveResponseInterceptor(2);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
                  ExpectTrue(res.header?.['ddddddd'] == undefined);
                  testNetManager.RemoveResponseInterceptor(2);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveResponseInterceptor(2);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorStopAllInterceptor0500
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_StopAllInterceptor_0500
     * @tc.desc   test Stop the group interceptor to modify the body
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorStopAllInterceptor0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorStopAllInterceptor0500";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let addResult: number = testNetManager.AddWritableResponseInterceptor(0, 1);
          ExpectTrue(addResult === 0);
          console.info(`${TAG} ${caseName}AddWritableResponseInterceptor success, addResult:${addResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              createServer(caseName, done);
              console.info(`${TAG} ${caseName} first_res:${res.result}`);
              ExpectTrue(res.result == 'response_body_modify');
              let stopResult: number = testNetManager.StopAllInterceptor(0);
              ExpectTrue(stopResult === 0);
              console.info(`${TAG} ${caseName}StopAllInterceptor success, stopResult:${stopResult}`);
              httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  testNetManager.RemoveResponseInterceptor(0);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} second_res:${res.result}`);
                  ExpectTrue(res.result !== 'response_body_modify');
                  testNetManager.RemoveResponseInterceptor(0);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveResponseInterceptor(0);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorStopAllInterceptor0600
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_StopAllInterceptor_0600
     * @tc.desc   test Stop group interceptor, abnormal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorStopAllInterceptor0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorStopAllInterceptor0600";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.StopAllInterceptor(99);
          ExpectTrue(result == 0);
          console.info(`${TAG} ${caseName} StopAllInterceptor failed, result:${result}`);
          done();
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorStopAllInterceptor0700
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_StopAllInterceptor_0700
     * @tc.desc   test Will multi group interceptors stop one by one and affect each other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorStopAllInterceptor0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorStopAllInterceptor0700";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          testNetManager.RegisterInterceptorCallback(REQUEST_GROUP0_MODIFY_URL, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes(HTTP_URL_BAIDU));
            testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
          });
          testNetManager.RegisterInterceptorCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes('403'));
            testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
          });
          testNetManager.RegisterInterceptorCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes('404'));
            testNetManager.UnregisterCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE);
          });
          let result: number = testNetManager.AddWritableRequestInterceptor(0, 1);
          ExpectTrue(result == 0);
          console.info(`${TAG} ${caseName} AddWritableRequestInterceptor success, result:${result}`);
          let readOnlyResResult: number = testNetManager.AddReadOnlyResponseInterceptor(11, 1);
          ExpectTrue(readOnlyResResult == 0);
          console.info(`${TAG} ${caseName} AddReadOnlyResponseInterceptor success, readOnlyResResult:${readOnlyResResult}`);
          let result1: number = testNetManager.AddWritableResponseInterceptor(1, 1);
          ExpectTrue(result1 == 0);
          console.info(`${TAG} ${caseName} AddWritableResponseInterceptor success, result1:${result1}`);
          let delResult: number = testNetManager.StopAllInterceptor(0);
          ExpectTrue(delResult === 0);
          console.info(`${TAG} ${caseName}StopAllInterceptor success, delResult:${delResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
              testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
              testNetManager.UnregisterCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE);
              testNetManager.RemoveRequestInterceptor(0);
              testNetManager.RemoveResponseInterceptor(1);
              testNetManager.RemoveResponseInterceptor(11);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 403);
              let delResult: number = testNetManager.StopAllInterceptor(11);
              ExpectTrue(delResult === 0);
              console.info(`${TAG} ${caseName} StopAllInterceptor success, delResult:${delResult}`);
              let delResult1: number = testNetManager.StopAllInterceptor(1);
              ExpectTrue(delResult1 === 0);
              console.info(`${TAG} ${caseName} StopAllInterceptor success, delResult1:${delResult1}`);
              httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
                  testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
                  testNetManager.UnregisterCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
                  ExpectTrue(res.responseCode == 200);
                }
                testNetManager.RemoveRequestInterceptor(0);
                testNetManager.RemoveResponseInterceptor(1);
                testNetManager.RemoveResponseInterceptor(11);
                httpRequest.destroy();
                done();
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
          testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
          testNetManager.UnregisterCallback(RESPONSE_GROUP11_READONLY_RESPONSE_CODE);
          testNetManager.RemoveRequestInterceptor(0);
          testNetManager.RemoveResponseInterceptor(1);
          testNetManager.RemoveResponseInterceptor(11);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorStopAllInterceptor0800
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_StopAllInterceptor_0800
     * @tc.desc   test stop group interceptor, same type interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorStopAllInterceptor0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorStopAllInterceptor0800";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          testNetManager.RegisterInterceptorCallback(REQUEST_GROUP0_MODIFY_URL, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectFail();
            testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
          });
          testNetManager.RegisterInterceptorCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE, (request: string, interceptorName: string) => {
            console.info(`${TAG} ${caseName} Interceptor callback called: ${interceptorName}`);
            console.info(`${TAG} ${caseName} Request URL: ${JSON.stringify(request)}`);
            ExpectTrue(request.includes('403'));
            testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
          });
          let result: number = testNetManager.AddWritableRequestInterceptor(0, 1);
          ExpectTrue(result == 0);
          console.info(`${TAG} ${caseName} AddWritableRequestInterceptor success, result:${result}`);
          let result1: number = testNetManager.AddWritableRequestInterceptor(20, 1);
          ExpectTrue(result1 == 401);
          console.info(`${TAG} ${caseName} AddWritableRequestInterceptor success, result1:${result1}`);
          let result2: number = testNetManager.AddWritableResponseInterceptor(1, 1);
          ExpectTrue(result2 == 0);
          console.info(`${TAG} ${caseName} AddWritableResponseInterceptor success, result2:${result2}`);
          let result3: number = testNetManager.AddWritableResponseInterceptor(21, 1);
          ExpectTrue(result3 == 401);
          console.info(`${TAG} ${caseName} AddWritableResponseInterceptor success, result3:${result3}`);
          let stopResult: number = testNetManager.StopAllInterceptor(0);
          ExpectTrue(stopResult === 0);
          console.info(`${TAG} ${caseName} StopAllInterceptor success, stopResult:${stopResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
              testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
              testNetManager.RemoveRequestInterceptor(0);
              testNetManager.RemoveResponseInterceptor(1);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res-first:${res.responseCode}`);
              ExpectTrue(res.responseCode == 403);
              let stopResult: number = testNetManager.StopAllInterceptor(1);
              ExpectTrue(stopResult === 0);
              console.info(`${TAG} ${caseName} StopAllInterceptor success, stopResult:${stopResult}`);
              httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
                  testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res-second:${res.responseCode}`);
                  ExpectTrue(res.responseCode == 200);
                }
                testNetManager.RemoveRequestInterceptor(0);
                testNetManager.RemoveResponseInterceptor(1);
                httpRequest.destroy();
                done();
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.UnregisterCallback(REQUEST_GROUP0_MODIFY_URL);
          testNetManager.UnregisterCallback(RESPONSE_GROUP1_MODIFY_RESPONSE_CODE);
          testNetManager.RemoveRequestInterceptor(0);
          testNetManager.RemoveResponseInterceptor(1);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });
  });
}