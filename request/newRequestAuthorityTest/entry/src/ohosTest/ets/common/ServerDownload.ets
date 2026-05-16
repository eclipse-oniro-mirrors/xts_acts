/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  public message: ArrayBuffer = new ArrayBuffer(1);
  public remoteInfo: socket.SocketRemoteInfo = {} as socket.SocketRemoteInfo;
}

let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
let listenAddr: socket.NetAddress = {
  address: '127.0.0.1',
  port: 3374,
  family: 1
}

let clientInfo: socket.TCPSocketConnection;
let messageView: string = ''

let onConnectCallback = (client: socket.TCPSocketConnection) => {
  clientInfo = client;
  client.on('message', messageCallback);
  console.info(TAG + '====>on_message success!')
}

let messageCallback = (value: SocketInfo) => {
  try {
    const dataView = new DataView(value.message);
    let subInfo: string = '';
    for (let i=0; i<dataView.byteLength; i++){
      let info = String.fromCharCode(dataView.getUint8(i));
      subInfo += info;
    }
    console.info(`${TAG} ====> subInfo.length: ${subInfo.length}`)
    console.info(`${TAG} ====> subInfo: ${subInfo}`)
    console.info(TAG + `====>contentInfo: all`);
    messageView = 'HTTP/1.1 200 OK\r\ncontent-length:20\r\n\r\ndownload successful!'
    let tcpSendOption: socket.TCPSendOptions ={
      data: messageView
    }
    clientInfo.send(tcpSendOption, ()=>{
      console.info(TAG + '====>send success!');
    })
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
    tcpServer.on('connect', onConnectCallback);
    console.info(TAG + '====>on_connect success!');
    await tcpServer.setExtraOptions(tcpExtraOptions);
    console.info(TAG + '====>setExtraOptions success!');
  }
}