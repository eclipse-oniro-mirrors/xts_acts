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

let on_connect_callback = (client: socket.TCPSocketConnection) => {
  clientInfo = client;
  client.on('message', on_message_callback);
  console.info(TAG + '====>on_message success!')
}

let on_message_callback = (value: SocketInfo) => {
  const dataView = new DataView(value.message);
  let subInfo: string = '';
  for (let i=0; i<dataView.byteLength; i++){
    let info = String.fromCharCode(dataView.getUint8(i));
    subInfo += info;
  }
  subInfo = subInfo.replace(/[\n\f\b\f\n\r\t]/g, ' ');
  subInfo = subInfo.replace(/[\']/g, "'");
  subInfo = subInfo.replace(/[\"]/g, "'");
  subInfo = subInfo.replace(/[\\]/g, '\\');
  if(subInfo.indexOf('content-length')>0){
    let nextSpaceIndex = subInfo.substring(subInfo.indexOf('content-length'), subInfo.length-1).indexOf(' ');
    contentLength = parseInt(subInfo.slice(subInfo.indexOf('content-length') + 'content-length:'.length, subInfo.indexOf('content-length') + nextSpaceIndex))
    console.info(TAG + '====>contentLength:' + contentLength)
  }
  if(subInfo.indexOf('boundary=') >0 ){
    validationCode = subInfo.substr(subInfo.indexOf('boundary=') + 9, 67);
    console.info(TAG + '====>validationCode:' + validationCode);
  }
  if(subInfo.indexOf(`--${validationCode}`) != subInfo.indexOf(`--${validationCode}--`)){
    if(subInfo.indexOf(`--${validationCode}`) != -1){
      contentInfo += subInfo.substring(subInfo.indexOf(`--${validationCode}`), subInfo.length);
      console.info(TAG + '====>contentInfo one')
    }else{
      contentInfo += subInfo;
      console.info(TAG + '====>contentInfo two')
    }
  }else{
    if(subInfo.indexOf('content-length') === -1){
      contentInfo += subInfo;
      console.info(TAG + '====>contentInfo three')
    }
  }
  if(subInfo.indexOf(`--${validationCode}--`) != -1){
    console.info(TAG + `====>contentLength: ${contentLength}`)
    console.info(TAG + `====>contentInfo_Length: ${contentInfo.length}`)
    console.info(TAG + `====>contentInfo: ${contentInfo}`)
    if(contentLength === contentInfo.length){
      if(subInfo.includes('666')){
        let subInfo = ''.padEnd(1 * 1024 *  1024, '666');
        messageView = `HTTP/1.1 200 OK\r\ncontent-length:${subInfo.length}\r\n\r\n${subInfo}`
      } else if (subInfo.includes('888')) {
        let subInfo = ''.padEnd(10 * 1024 *  1024, '888');
        messageView = `HTTP/1.1 200 OK\r\ncontent-length:${subInfo.length}\r\n\r\n${subInfo}`
      } else {
        messageView = 'HTTP/1.1 200 OK\r\ncontent-length:18\r\n\r\nupload successful!'
      }
    }else{
      messageView = 'HTTP/1.1 200 OK\r\ncontent-length:14\r\n\r\nupload failed!'
    }
    contentInfo = '';
    let tcpSendOption: socket.TCPSendOptions ={
      data: messageView
    }
    clientInfo.send(tcpSendOption, ()=>{
      console.info(TAG + '====>send success!');
    })
  }else{
    console.info(TAG + '====>subInfo.indexOf:' + subInfo.indexOf(`--${validationCode}--`))
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
    console.info(TAG + '====>setExtraOptions success!')
  }
}