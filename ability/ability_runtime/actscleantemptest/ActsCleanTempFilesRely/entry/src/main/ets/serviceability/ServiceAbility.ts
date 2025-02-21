/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import ServiceExtensionAbility from '@ohos.app.ability.ServiceExtensionAbility';
import rpc from '@ohos.rpc';
import commonEvent from '@ohos.commonEventManager';
import fs from '@ohos.file.fs';

class StubTest extends rpc.RemoteObject {
  constructor(des) {
    super(des);
  }

  onRemoteRequest(code, data, reply, option): boolean {
    console.info('ServiceAbility onRemoteRequest');
    if (code === 1) {
      let op1 = data.readInt();
      let op2 = data.readInt();
      reply.writeInt(op1 + op2);
      console.info('ServiceAbility op1:' + op1 + ' op2:' + op2);
    }
    return true;
  }
}

const BUFSIZE = 1024;
let DELAY_TIME = 100;
let OFFSETNUMBER = 0;
let message;
let commonEventData = {
  parameters: {
    message: message
  }
};
let actionStr;
let remoteOBJ = new StubTest('test');

export default class ServiceAbility extends ServiceExtensionAbility {
  onCreate(want): void {
    console.info('ServiceAbility onCreate want: ' + JSON.stringify(want));
  }

  onDestroy(): void {
    console.info('ServiceAbility onDestroy');
  }

  onRequest(want, startId): void {
    console.info('ServiceAbility onRequest');
  }

  onConnect(want): rpc.RemoteObject {
    console.info('ServiceAbility onConnect');
    actionStr = want.parameters.key;
    let tempDir = this.context.tempDir;
    console.log('create virable end');
    if (actionStr === 'Acts_CleanTempFiles_0401') {
      let file = fs.openSync(tempDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, 'Try to write Acts_CleanTempFiles_0400 str.');
      console.log('Acts_CleanTempFiles_0401 The length of str is: ' + JSON.stringify(writeLen));
      let buf = new ArrayBuffer(BUFSIZE);
      let readLen = fs.readSync(file.fd, buf, {
        offset: OFFSETNUMBER
      });
      let readBuf = String.fromCharCode.apply(null, new Uint8Array(buf.slice(OFFSETNUMBER, readLen)));
      console.log('Acts_CleanTempFiles_0401 the content of file: ' + JSON.stringify(readBuf));
      fs.closeSync(file);
      commonEventData.parameters.message = readBuf;
      commonEvent.publish('Acts_CleanTempFiles_0401', commonEventData, (err) => {
        console.log('Acts_CleanTempFiles_0401 publish err: ' + JSON.stringify(err));
      });
    } else if (actionStr === 'Acts_CleanTempFiles_0402') {
      let file = fs.openSync(tempDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let buf = new ArrayBuffer(BUFSIZE);
      let readLen = fs.readSync(file.fd, buf, {
        offset: OFFSETNUMBER
      });
      fs.closeSync(file);
      commonEventData.parameters.message = readLen;
      console.log('Acts_CleanTempFiles_0402 Message: ' + JSON.stringify(readLen));
      commonEvent.publish('Acts_CleanTempFiles_0402', commonEventData, (err) => {
        console.log('Acts_CleanTempFiles_0402 publish err: ' + JSON.stringify(err));
        setTimeout(() => {
          this.context.terminateSelf().then(() => {
            console.log('Acts_CleanTempFiles_0402 rely terminateSelf end');
          }).catch((err) => {
            console.log('Acts_CleanTempFiles_0402 rely terminateSelf err: ' + JSON.stringify(err));
          });
        }, DELAY_TIME);
      });
    }
    return remoteOBJ;
  }

  onDisconnect(want): void {
    console.info('ServiceAbility onDisconnect');
  }

  onReconnect(want): void {
    console.info('ServiceAbility onReconnect');
  }

  onConfigurationUpdate(newConfig): void {
    console.info('ServiceAbility onConfigurationUpdate');
  }

  onDump(params): Array<string> {
    console.info('ServiceAbility onDump');
    return params;
  }
};