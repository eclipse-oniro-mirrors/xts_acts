/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { socket } from "@kit.NetworkKit";
import { util } from "@kit.ArkTS";
import { OnlineCertData, OnlineCrlData, OnlineOcspData } from "../network/network";


export function ArrayBuffer2String(buf: ArrayBuffer) {
  let msgArray = new Uint8Array(buf);
  let textDecoder = util.TextDecoder.create("utf-8");
  return textDecoder.decodeWithStream(msgArray);
}

export function String2Uint8Array(str: string) {
  const encoder = new util.TextEncoder();
  return encoder.encodeInto(str);
}

function PacketHttpResponseHeader(cert: Uint8Array, type: string) {
  let result: string = "";
  result += "HTTP/1.1 200 OK\r\n";
  result += "Response Version: HTTP/1.1\r\n";
  result += "Status Code: 200\r\n";
  result += "Response Phrase: OK\r\n";
  result += `Content-Type: ${type}\r\n`;
  result += `Content-Length: ${cert.length}\r\n`;
  result += 'Content-Disposition: attachment\r\n';
  result += "Connection: close\r\n";
  result += 'Accept-Ranges: bytes\r\n';
  result += "\r\n";

  return result;
}

export function HttpServer() {
  let listenAddr: socket.NetAddress = {
    address: '0.0.0.0',
    port: 5566
  };
  let tcpOption: socket.TCPExtraOptions = {
    keepAlive: false
  };
  let contentType: string  = "application/x-x509-ca-cert";
  /* data db */
  let OnlineCertMap = new OnlineCertData();
  let OnlineCrlMap = new OnlineCrlData();
  let OnlineOcspMap = new OnlineOcspData();
  let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
  tcpServer.listen(listenAddr, (err: BusinessError) => {
    if (err) {
      console.error("[XTS] listen fail.");
      return;
    }
    console.info("[XTS] listen success.");
  });

  tcpServer.setExtraOptions(tcpOption, (err: BusinessError) => {
    if (err) {
      console.error("[XTS] set tcp option fail");
    } else {
      console.info("[XTS] set tcp option success");
    }
  });
  tcpServer.on('connect', (clientSocket: socket.TCPSocketConnection) => {
    clientSocket.on('message', (requestInfo: socket.SocketMessageInfo) => {
      let downloadFile = "";
      let dataDer: Uint8Array = new Uint8Array();
      try {
        // 解析待响应的证书名
        let requestMsg = ArrayBuffer2String(requestInfo.message);
        let RegExpMatchArrayCert = requestMsg.match("GET /(.*).crt HTTP/1.0");
        if (RegExpMatchArrayCert && RegExpMatchArrayCert?.[1]) {
          downloadFile = RegExpMatchArrayCert?.[1];
          dataDer = OnlineCertMap.map.get(downloadFile);
        }
        let RegExpMatchArrayCrl = requestMsg.match("GET /(.*).crl HTTP/1.0");
        if (RegExpMatchArrayCrl && RegExpMatchArrayCrl?.[1]) {
          downloadFile = RegExpMatchArrayCrl?.[1];
          contentType = "application/pkix-crl";
          dataDer = OnlineCrlMap.map.get(downloadFile);
        }
        let RegExpMatchArrayOcsp = requestMsg.match("POST /ocsp/(.*).crl HTTP/1.0");
        if (RegExpMatchArrayOcsp && RegExpMatchArrayOcsp?.[1]) {
          downloadFile = RegExpMatchArrayOcsp?.[1];
          contentType = "application/ocsp-response";
          dataDer = OnlineOcspMap.map.get(downloadFile);
        }
        // 组装响应消息
        let responseHeaderString = PacketHttpResponseHeader(dataDer, contentType);
        let responseHeaderUint8Array = String2Uint8Array(responseHeaderString);
        let responseUint8Array = new Uint8Array(dataDer.length + responseHeaderUint8Array.length);
        responseUint8Array.set(responseHeaderUint8Array);
        responseUint8Array.set(dataDer, responseHeaderUint8Array.length);
        // 发送请求响应
        clientSocket.send({ data: responseUint8Array.buffer });
        // 查询服务端连接状态
        tcpServer.getState((err: BusinessError, state: socket.SocketStateBase) => {
          if (err) {
            console.info("[XTS] get state fail");
          } else {
            console.info("[XTS] get state: " + JSON.stringify(state));
          }
        });
        // 断开连接
        clientSocket.off('message');
      } catch (err) {
        console.error("[XTS] connect err:" + JSON.stringify(err));
      }
    });
  });
}