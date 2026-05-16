/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { socket } from '@kit.NetworkKit';
import http from '@ohos.net.http';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

export default function HttpRequestCustomResponseHeaderTest() {
  describe('HttpRequestCustomResponseHeaderTest', () => {

    /**
     * @tc.name   testHttpRequestCustomResponseHeaderTest0100
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomResponseHeaderTest_0100
     * @tc.desc   Test HttpRequestCustomResponseHeader property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomResponseHeaderTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testHttpRequestCustomResponseHeaderTest0100';
        let serverPort = 9000+Math.round(Math.random()*5000);
        console.info(`${caseName}---Start`);
        let tcpSocketServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        try {
          let listenAddr: socket.NetAddress = {
            address: "0.0.0.0",
            port: serverPort,
            family: 1
          }
          await tcpSocketServer.listen(listenAddr).then(async ()=> {
            let listenAddr: socket.NetAddress =  await tcpSocketServer.getLocalAddress();
            console.info(`${caseName} tcpSocketServer listen address: `+JSON.stringify(listenAddr.address) +' port: '+JSON.stringify(listenAddr.port));
          }).catch((err: BusinessError) => {
            console.error(`${caseName} get err is `+JSON.stringify(err));
            ExpectFail();
            done();
          })
          tcpSocketServer.off('connect');
          tcpSocketServer.on('connect', async (clientSocket: socket.TCPSocketConnection)=>{
            console.info(`${caseName}-----tcpSocketServer on connect`);
            let clientAddr: socket.NetAddress = await clientSocket.getRemoteAddress();
            console.info(`${caseName}----------`+JSON.stringify(clientAddr));
            clientSocket.on('message', async (msgInfo: socket.SocketMessageInfo) => {
              let tcpSendOption: socket.TCPSendOptions = {
                data: "HTTP/1.1 200 OK\r\n" +
                  "Content-Type: text/plain\r\n" +
                  "Cache-Control: no-cache\r\n" +
                  "Connection: keep-alive\r\n" +
                  "Date: Thu Sep 25 18:02:30 2025\r\n" +
                  "Pragma: no-cache\r\n" +
                  "Transfer-Encoding: chunked\r\n" +
                  "X-Frame-Options: SAMEORIGIN\r\n" +
                  "old cgi ld_library_path = (null):\r\n" +   // With key and colon, Without value.
                  ":old cgi ld_library_path = (null)\r\n" +   // Without key, with colon and value.
                  ":\r\n" +                                   // Only one colon.
                  "::\r\n" +                                  // Only two colons.
                  "new cgi ld_library_path = (null): /customer/UI/lib\r\n" +
                  "\r\n" +
                  "2\r\n" +
                  "OK\r\n" +
                  "29\r\n" +
                  "sage ./CGI_PROCESS.sh (no this parameter)\r\n" +
                  "2\r\n" +
                  "OK\r\n" +
                  "1a\r\n" +
                  "Camera.Preview.RTSP.av=4/5\r\n" +
                  "0\r\n" +
                  "\r\n"
              }
              clientSocket.send(tcpSendOption);
            });
          });
          let httpRequest = http.createHttp();
          httpRequest.request("http://localhost:"+ serverPort, (err: Error, data: http.HttpResponse) => {
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
        } catch (err) {
          console.error(`${caseName} catch err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testHttpRequestCustomResponseHeaderTest0200
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomResponseHeaderTest_0200
     * @tc.desc   Test HttpRequestCustomResponseHeader property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomResponseHeaderTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testHttpRequestCustomResponseHeaderTest0200';
        let serverPort = 9000+Math.round(Math.random()*5000);
        console.info(`${caseName}---port: ` + serverPort);
        console.info(`${caseName}---Start`);
        let tcpSocketServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        try {
          let listenAddr: socket.NetAddress = {
            address: "0.0.0.0",
            port: serverPort,
            family: 1
          }
          await tcpSocketServer.listen(listenAddr).then(async ()=> {
            let listenAddr: socket.NetAddress =  await tcpSocketServer.getLocalAddress();
            console.info(`${caseName} tcpSocketServer listen address: `+JSON.stringify(listenAddr.address) +' port: '+JSON.stringify(listenAddr.port));
          }).catch((err: BusinessError) => {
            console.error(`${caseName} get err is `+JSON.stringify(err));
            ExpectFail();
            done();
          })
          tcpSocketServer.off('connect');
          tcpSocketServer.on('connect', async (clientSocket: socket.TCPSocketConnection)=>{
            console.info(`${caseName}-----tcpSocketServer on connect`);
            let clientAddr: socket.NetAddress = await clientSocket.getRemoteAddress();
            console.info(`${caseName}----------`+JSON.stringify(clientAddr));
            clientSocket.on('message', async (msgInfo: socket.SocketMessageInfo) => {
              let tcpSendOption: socket.TCPSendOptions = {
                data: "HTTP/1.1 200 OK\r\n" +
                  "Content-Type: text/plain\r\n" +
                  "Cache-Control: no-cache\r\n" +
                  "Connection: keep-alive\r\n" +
                  "Date: Thu Sep 25 18:02:30 2025\r\n" +
                  "Pragma: no-cache\r\n" +
                  "Transfer-Encoding: chunked\r\n" +
                  "X-Frame-Options: SAMEORIGIN\r\n" +
                  "old cgi ld_library_path = (null):\r\n" +   // With key and colon, Without value.
                  ":old cgi ld_library_path = (null)\r\n" +   // Without key, with colon and value.
                  ":\r\n" +                                   // Only one colon.
                  "::\r\n" +                                  // Only two colons.
                  "new cgi ld_library_path = (null): /customer/UI/lib\r\n" +
                  "\r\n" +
                  "2\r\n" +
                  "OK\r\n" +
                  "29\r\n" +
                  "sage ./CGI_PROCESS.sh (no this parameter)\r\n" +
                  "2\r\n" +
                  "OK\r\n" +
                  "1a\r\n" +
                  "Camera.Preview.RTSP.av=4/5\r\n" +
                  "0\r\n" +
                  "\r\n"
              }
              clientSocket.send(tcpSendOption);
            });
          });
          let httpRequest = http.createHttp();
          httpRequest.request("http://localhost:"+ serverPort).then((data: http.HttpResponse) => {
            console.info(`${caseName} request success data is `+JSON.stringify(data));
            ExpectTrue(data.responseCode == 200);
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} request err is `+JSON.stringify(err));
            ExpectFail();
            done();
          });
        } catch (err) {
          console.error(`${caseName} catch err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testHttpRequestCustomResponseHeaderTest0300
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomResponseHeaderTest_0300
     * @tc.desc   Test HttpRequestCustomResponseHeader property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomResponseHeaderTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testHttpRequestCustomResponseHeaderTest0300';
        let serverPort = 9000+Math.round(Math.random()*5000);
        console.info(`${caseName}---Start`);
        let tcpSocketServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        try {
          let listenAddr: socket.NetAddress = {
            address: "0.0.0.0",
            port: serverPort,
            family: 1
          }
          await tcpSocketServer.listen(listenAddr).then(async ()=> {
            let listenAddr: socket.NetAddress =  await tcpSocketServer.getLocalAddress();
            console.info(`${caseName} tcpSocketServer listen address: `+JSON.stringify(listenAddr.address) +' port: '+JSON.stringify(listenAddr.port));
          }).catch((err: BusinessError) => {
            console.error(`${caseName} get err is `+JSON.stringify(err));
            ExpectFail();
            done();
          })
          tcpSocketServer.off('connect');
          tcpSocketServer.on('connect', async (clientSocket: socket.TCPSocketConnection)=>{
            console.info(`${caseName}-----tcpSocketServer on connect`);
            let clientAddr: socket.NetAddress = await clientSocket.getRemoteAddress();
            console.info(`${caseName}----------`+JSON.stringify(clientAddr));
            clientSocket.on('message', async (msgInfo: socket.SocketMessageInfo) => {
              let tcpSendOption: socket.TCPSendOptions = {
                data: "HTTP/1.1 200 OK\r\n" +
                  "Content-Type: text/plain\r\n" +
                  "Cache-Control: no-cache\r\n" +
                  "Connection: keep-alive\r\n" +
                  "Date: Thu Sep 25 18:02:30 2025\r\n" +
                  "Pragma: no-cache\r\n" +
                  "Transfer-Encoding: chunked\r\n" +
                  "X-Frame-Options: SAMEORIGIN\r\n" +
                  "old cgi ld_library_path = (null)\r\n" +    // Only key, no colon, no value.
                  "new cgi ld_library_path = (null): /customer/UI/lib\r\n" +
                  "\r\n" +
                  "2\r\n" +
                  "OK\r\n" +
                  "29\r\n" +
                  "sage ./CGI_PROCESS.sh (no this parameter)\r\n" +
                  "2\r\n" +
                  "OK\r\n" +
                  "1a\r\n" +
                  "Camera.Preview.RTSP.av=4/5\r\n" +
                  "0\r\n" +
                  "\r\n"
              }
              clientSocket.send(tcpSendOption);
            });
          });
          let httpRequest = http.createHttp();
          httpRequest.request("http://localhost:"+ serverPort, (err: Error, data: http.HttpResponse) => {
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
        } catch (err) {
          console.error(`${caseName} catch err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testHttpRequestCustomResponseHeaderTest0400
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomResponseHeaderTest_0400
     * @tc.desc   Test HttpRequestCustomResponseHeader property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomResponseHeaderTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testHttpRequestCustomResponseHeaderTest0400';
        let serverPort = 9000+Math.round(Math.random()*5000);
        console.info(`${caseName}---Start`);
        let tcpSocketServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        try {
          let listenAddr: socket.NetAddress = {
            address: "0.0.0.0",
            port: serverPort,
            family: 1
          }
          await tcpSocketServer.listen(listenAddr).then(async ()=> {
            let listenAddr: socket.NetAddress =  await tcpSocketServer.getLocalAddress();
            console.info(`${caseName} tcpSocketServer listen address: `+JSON.stringify(listenAddr.address) +' port: '+JSON.stringify(listenAddr.port));
          }).catch((err: BusinessError) => {
            console.error(`${caseName} get err is `+JSON.stringify(err));
            ExpectFail();
            done();
          })
          tcpSocketServer.off('connect');
          tcpSocketServer.on('connect', async (clientSocket: socket.TCPSocketConnection)=>{
            console.info(`${caseName}-----tcpSocketServer on connect`);
            let clientAddr: socket.NetAddress = await clientSocket.getRemoteAddress();
            console.info(`${caseName}----------`+JSON.stringify(clientAddr));
            clientSocket.on('message', async (msgInfo: socket.SocketMessageInfo) => {
              let tcpSendOption: socket.TCPSendOptions = {
                data: "HTTP/1.1 200 OK\r\n" +
                  "Content-Type: text/plain\r\n" +
                  "Cache-Control: no-cache\r\n" +
                  "Connection: keep-alive\r\n" +
                  "Date: Thu Sep 25 18:02:30 2025\r\n" +
                  "Pragma: no-cache\r\n" +
                  "Transfer-Encoding: chunked\r\n" +
                  "X-Frame-Options: SAMEORIGIN\r\n" +
                  "old cgi ld_library_path = (null)\r\n" +    // Only key, no colon, no value.
                  "new cgi ld_library_path = (null): /customer/UI/lib\r\n" +
                  "\r\n" +
                  "2\r\n" +
                  "OK\r\n" +
                  "29\r\n" +
                  "sage ./CGI_PROCESS.sh (no this parameter)\r\n" +
                  "2\r\n" +
                  "OK\r\n" +
                  "1a\r\n" +
                  "Camera.Preview.RTSP.av=4/7\r\n" +
                  "0\r\n" +
                  "\r\n"
              }
              clientSocket.send(tcpSendOption);
            });
          });
          let httpRequest = http.createHttp();
          httpRequest.request("http://localhost:"+ serverPort).then((data: http.HttpResponse) => {
            console.info(`${caseName} request success data is `+JSON.stringify(data));
            ExpectTrue(data.responseCode == 200);
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} request err is `+JSON.stringify(err));
            ExpectFail();
            done();
          });
        } catch (err) {
          console.error(`${caseName} catch err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }
      });
  });
}
