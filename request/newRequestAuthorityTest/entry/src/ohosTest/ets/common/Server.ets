/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
 
import socket from '@ohos.net.socket';

const TAG = 'SOCKET_SERVER'

class SocketInfo {
  message: ArrayBuffer = new ArrayBuffer(1);
  remoteInfo: socket.SocketRemoteInfo = {} as socket.SocketRemoteInfo;
}

let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
let listenAddr: socket.NetAddress = {
  address: '127.0.0.1',
  port: 8080,
  family: 1
}

let clientInfo: socket.TCPSocketConnection;
let messageView: string = ''
let contentLength: number = 0;
let contentInfo: string = '';
let validationCode: string = '';
let lastValidationCode: string = '';
let validationCodeFlag: boolean = false;
let startContentLengthFlag: string = '';
let endContentLengthFlag: string = '';

let on_connect_callback = (client: socket.TCPSocketConnection) => {
  clientInfo = client;
  client.on('message', on_message_callback);
  console.info(TAG + '====>on_message success!')
}

let on_message_callback = (value: SocketInfo) => {
  try {
    const dataView = new DataView(value.message);
    let subInfo: string = '';
    for (let i=0; i<dataView.byteLength; i++){
      let info = String.fromCharCode(dataView.getUint8(i));
      subInfo += info;
    }
    console.info(`${TAG} ====> subInfo.length: ${subInfo.length}`)
    if(subInfo.indexOf('content-length')>0){
      let parseInfo = subInfo;
      parseInfo = parseInfo.replace(/[\n\f\b\f\n\r\t]/g, ' ');
      parseInfo = parseInfo.replace(/[\']/g, "'");
      parseInfo = parseInfo.replace(/[\"]/g, "'");
      parseInfo = parseInfo.replace(/[\\]/g, '\\');
      let nextSpaceIndex = parseInfo.substring(parseInfo.indexOf('content-length'), parseInfo.length-1).indexOf(' ');
      contentLength = parseInt(parseInfo.slice(parseInfo.indexOf('content-length') + 'content-length:'.length, parseInfo.indexOf('content-length') + nextSpaceIndex))
      console.info(TAG + '====>contentLength:' + contentLength)
    }
    if(subInfo.indexOf('boundary=') >0 ){
      validationCode = subInfo.substr(subInfo.indexOf('boundary=') + 9, 67);
      if(validationCode != lastValidationCode){
        contentInfo = '';
        validationCodeFlag = false;
        console.info(`${TAG} ====> clear contentInfo`);
      }
      lastValidationCode = validationCode;
      console.info(TAG + '====>validationCode:' + validationCode);
      startContentLengthFlag = `--${validationCode}`;
      endContentLengthFlag = `--${validationCode}--`;
      console.info(`${TAG} ====> startContentLengthFlag.length: ${startContentLengthFlag.length}`);
      console.info(`${TAG} ====> endContentLengthFlag.length: ${endContentLengthFlag.length}`)
    }
    if(subInfo.indexOf(startContentLengthFlag) != subInfo.indexOf(endContentLengthFlag)){
      if(subInfo.indexOf(startContentLengthFlag) != -1 && validationCodeFlag === false){
        contentInfo += subInfo.substring(subInfo.indexOf(`--${validationCode}`), subInfo.length);
        console.info(TAG + '====>validationCode: ' + validationCode);
        console.info(TAG + `====>contentInfo one: ${contentInfo.length}`);
        validationCodeFlag = true;
      }else{
        contentInfo += subInfo;
        console.info(TAG + `====>contentInfo_Length two: ${contentInfo.length}`);
      }
    }else{
      if(subInfo.indexOf('content-length') === -1){
        contentInfo += subInfo;
        console.info(TAG + `====>contentInfo_Length three: ${contentInfo.length}`);
      }
    }
    let contentInfoFinally:string = contentInfo.substr(contentLength-(endContentLengthFlag.length+2),
      endContentLengthFlag.length+2);
    contentInfoFinally = contentInfoFinally.replace(/[\n\f\b\f\n\r\t]/g, '');
    if(contentInfoFinally === endContentLengthFlag){
      console.info(TAG + `====>contentLength: ${contentLength}`);
      console.info(TAG + `====>contentInfo_Length: ${contentInfo.length}`);
      console.info(TAG + `====>contentInfo: ${contentInfo}`);
      if(contentLength === contentInfo.length){
        if(contentInfo.includes('Content-Type: SUB_REQUEST_Agent_contentType_0100')){
          console.info(TAG + `====>contentInfo:SUB_REQUEST_Agent_contentType_0100`)
          messageView = 'HTTP/1.1 200 OK\r\ncontent-length:18\r\nsuccess:contentTypeTest0100\r\n\r\nupload successful!'
        } else if (contentInfo.includes('SUB_REQUEST_Agent_contentType_0200') && contentInfo.includes('Content-Type: txt')) {
          console.info(TAG + `====>contentInfo: SUB_REQUEST_Agent_contentType_0200`)
          messageView = 'HTTP/1.1 200 OK\r\ncontent-length:18\r\nsuccess:contentTypeTest0200\r\n\r\nupload successful!'
        } else {
          console.info(TAG + `====>contentInfo: all`);
          messageView = 'HTTP/1.1 200 OK\r\ncontent-length:18\r\n\r\nupload successful!'
        }
      }else{
        console.info(TAG + `====>contentInfo: 400 err`);
        messageView = 'HTTP/1.1 400 Bad Request\r\ncontent-length:14\r\n\r\nupload failed!'
      }
      contentInfo = '';
      let tcpSendOption: socket.TCPSendOptions ={
        data: messageView
      }
      clientInfo.send(tcpSendOption, ()=>{
        console.info(TAG + '====>send success!');
      })
    }else{
      console.info(TAG + '====>subInfo.indexOf:' + subInfo.indexOf(`--${validationCode}--`));
    }
  }catch (err) {
    console.info(TAG + '====>catch err: ' + JSON.stringify(err));
  }
}


let tcpExtraOptions: socket.TCPExtraOptions = {
  keepAlive: true,
  OOBInline: true,
  TCPNoDelay: true,
  socketLinger: { on: true, linger: 10 },
  receiveBufferSize: 1 * 1024,
  sendBufferSize: 1 * 1024 * 1024,
  reuseAddress: false,
  socketTimeout: 3000
}

export default class Server {
  async startServer(){
    await tcpServer.listen(listenAddr)
    let socketStateBase: socket.SocketStateBase = await tcpServer.getState();
    console.info(TAG + '====>socketStateBase:' + JSON.stringify(socketStateBase));
    tcpServer.on('connect', on_connect_callback);
    console.info(TAG + '====>on_connect success!');
    await tcpServer.setExtraOptions(tcpExtraOptions);
    console.info(TAG + '====>setExtraOptions success!');
  }
}