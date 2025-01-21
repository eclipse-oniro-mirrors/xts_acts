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

import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import type window from '@ohos.window';
import commonEvent from '@ohos.commonEventManager';
import fs, { type Filter } from '@ohos.file.fs';

const BUFSIZE = 1024;
let DELAY_TIME = 100;
let CLEAN_TEMP_DELAY_TIME = 1000;
let OFFSETNUMBER = 0;

let message;
let secondMessage;
let result;
let files;
let secFiles;
let commonEventData = {
  parameters: {
    message: message,
    secondMessage: secondMessage,
    result: result,
    files: files,
    secFiles: secFiles
  }
};
let actionStr;
let tempDir;
let applicationContext;
let applicationTempDir;

function getListFile(dir): number {
  class ListFileOption {
    public recursion: boolean = false;
    public listNum: number = 0;
    public filter: Filter = {};
  }
  let option = new ListFileOption();
  option.filter.displayName = ['temp_useless*'];
  let files = fs.listFileSync(dir, option);
  for (let i = 0; i < files.length; i++) {
    console.info(`The name of file: ${files[i]}`);
  }
  return files.length;
}

function startAndTerminate(context, action): void {
  setTimeout(() => {
    context.startAbility(
      {
        bundleName: 'com.acts.cleancachefilesreply',
        abilityName: 'SecondAbility',
        parameters: {
          key: action
        }
      }, (err) => {
        console.log(action + ' startAbility err: ' + JSON.stringify(err));
        if (action !== 'Acts_CleanTempFiles_0203') {
          setTimeout(() => {
            context.terminateSelf().then(() => {
              console.log(action + 'rely terminateSelf end');
            }).catch((err) => {
              console.log(action + 'rely terminateSelf err: ' + JSON.stringify(err));
            });
          }, DELAY_TIME);
        }
      });
  }, DELAY_TIME);
}

function onForegroundInner(actionStr, context): void {
  if (actionStr === 'Acts_CleanTempFiles_0201') {
    let file = fs.openSync(tempDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let writeLen = fs.writeSync(file.fd, 'Try to write str.');
    let buf = new ArrayBuffer(BUFSIZE);
    let readLen = fs.readSync(file.fd, buf, {
      offset: OFFSETNUMBER
    });
    let readBuf = String.fromCharCode.apply(null, new Uint8Array(buf.slice(OFFSETNUMBER, readLen)));
    console.log('Acts_CleanTempFiles_0201 writeLen is: ' + writeLen + 'readBuf is: ' + readBuf);
    fs.closeSync(file);
    commonEventData.parameters.message = readBuf;

    let applicationFile = fs.openSync(applicationTempDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let applicationWriteLen = fs.writeSync(applicationFile.fd, 'Try to write application str.');
    let applicationReadLen = fs.readSync(applicationFile.fd, buf, {
      offset: OFFSETNUMBER
    });
    let applicReadBuf = String.fromCharCode.apply(null, new Uint8Array(buf.slice(OFFSETNUMBER, applicationReadLen)));
    console.log('Acts_CleanTempFiles_0201 secWriteLen is: ' + applicationWriteLen + 'secreadBuf is: ' + applicReadBuf);
    fs.closeSync(applicationFile);
    commonEventData.parameters.secondMessage = applicReadBuf;
    commonEvent.publish('Acts_CleanTempFiles_0201', commonEventData, (err) => {
      console.log('Acts_CleanTempFiles_0201 publish err: ' + JSON.stringify(err));
      startAndTerminate(context, 'Acts_CleanTempFiles_0203');
    });
  } else if (actionStr === 'Acts_CleanTempFiles_0202') {
    setTimeout(() => {
      let file = fs.openSync(tempDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let buf = new ArrayBuffer(BUFSIZE);
      let readLen = fs.readSync(file.fd, buf, {
        offset: OFFSETNUMBER
      });
      fs.closeSync(file);
      let readBuf = String.fromCharCode.apply(null, new Uint8Array(buf.slice(OFFSETNUMBER, readLen)));
      commonEventData.parameters.message = readBuf;

      let applicationFile = fs.openSync(applicationTempDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let applicationReadLen = fs.readSync(applicationFile.fd, buf, {
        offset: OFFSETNUMBER
      });
      fs.closeSync(applicationFile);
      let applicaReadBuf = String.fromCharCode.apply(null, new Uint8Array(buf.slice(OFFSETNUMBER, applicationReadLen)));
      console.log('Acts_CleanTempFiles_0202 application Message: ' + JSON.stringify(applicationReadLen));
      commonEventData.parameters.secondMessage = applicaReadBuf;
      commonEvent.publish('Acts_CleanTempFiles_0202', commonEventData, (err) => {
        console.log('Acts_CleanTempFiles_0202 publish err: ' + JSON.stringify(err));
        startAndTerminate(context, 'Acts_CleanTempFiles_0204');
      });
    }, CLEAN_TEMP_DELAY_TIME)
  }
  cleanTempFiles(actionStr, context);
}

function cleanTempFiles(actionStr, context): void {
  if (actionStr === 'Acts_CleanTempFiles_0301') {
    AppStorage.setOrCreate('message', actionStr);
    let file = fs.openSync(tempDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let writeLen = fs.writeSync(file.fd, 'Try to write Acts_CleanTempFiles_0301 str.');
    console.log('Acts_CleanTempFiles_0301 The length of str is: ' + writeLen);
    let buf = new ArrayBuffer(BUFSIZE);
    let readLen = fs.readSync(file.fd, buf, {
      offset: OFFSETNUMBER
    });
    let readBuf = String.fromCharCode.apply(null, new Uint8Array(buf.slice(OFFSETNUMBER, readLen)));
    console.log('Acts_CleanTempFiles_0301 the content of file: ' + readBuf);
    fs.closeSync(file);
    console.log('Acts_CleanTempFiles_0301 Message: ' + JSON.stringify(readBuf));
    commonEventData.parameters.message = readBuf;
    commonEvent.publish('Acts_CleanTempFiles_0301', commonEventData, (err) => {
      console.log('Acts_CleanTempFiles_0301 publish err: ' + JSON.stringify(err));
      setTimeout(() => {
        this.context.terminateSelf();
      }, DELAY_TIME);
    });
  } else if (actionStr === 'Acts_CleanTempFiles_0302') {
    setTimeout(() => {
      AppStorage.setOrCreate('message', actionStr);
      let file = fs.openSync(tempDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let buf = new ArrayBuffer(BUFSIZE);
      let readLen = fs.readSync(file.fd, buf, {
        offset: OFFSETNUMBER
      });
      fs.closeSync(file);
      let readBuf = String.fromCharCode.apply(null, new Uint8Array(buf.slice(OFFSETNUMBER, readLen)));
      console.log('Acts_CleanTempFiles_0302 Message: ' + JSON.stringify(readLen));
      commonEventData.parameters.message = readBuf;
      commonEvent.publish('Acts_CleanTempFiles_0302', commonEventData, (err) => {
        console.log('Acts_CleanTempFiles_0302 publish err: ' + JSON.stringify(err));
        context.terminateSelf();
      });
    }, CLEAN_TEMP_DELAY_TIME)
  }
}

export default class EntryAbility extends UIAbility {
  onCreate(want): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    actionStr = want.parameters.key;
    tempDir = this.context.tempDir;
    applicationContext = this.context.getApplicationContext();
    applicationTempDir = applicationContext.tempDir;
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: ', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: ', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    if (actionStr === 'Acts_CleanTempFiles_0101') {
      let file = fs.openSync(tempDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, 'Try to write str.');
      let buf = new ArrayBuffer(BUFSIZE);
      let readLen = fs.readSync(file.fd, buf, {
        offset: OFFSETNUMBER
      });
      let readBuf = String.fromCharCode.apply(null, new Uint8Array(buf.slice(OFFSETNUMBER, readLen)));
      console.log('Acts_CleanTempFiles_0101 writeLen is: ' + writeLen + 'readBuf is: ' + readBuf);
      fs.closeSync(file);
      commonEventData.parameters.message = readBuf;
      let applicationFile = fs.openSync(applicationTempDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let applicationWriteLen = fs.writeSync(applicationFile.fd, 'Try to write application str.');
      let applicationReadLen = fs.readSync(applicationFile.fd, buf, {
        offset: OFFSETNUMBER
      });
      let applicaReadBuf = String.fromCharCode.apply(null, new Uint8Array(buf.slice(OFFSETNUMBER, applicationReadLen)));
      fs.closeSync(applicationFile);
      console.log('Acts_CleanTempFiles_0101 secWriteLen: ' + applicationWriteLen + 'secreadBuf: ' + applicaReadBuf);
      commonEventData.parameters.secondMessage = applicaReadBuf;
      commonEvent.publish('Acts_CleanTempFiles_0101', commonEventData, (err) => {
        console.log('Acts_CleanTempFiles_0101 publish err: ' + JSON.stringify(err));
        startAndTerminate(this.context, 'Acts_CleanTempFiles_0103');
      });
    } else if (actionStr === 'Acts_CleanTempFiles_0102') {
      setTimeout(() => {
        let file = fs.openSync(tempDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        let buf = new ArrayBuffer(BUFSIZE);
        let readLen = fs.readSync(file.fd, buf, {
          offset: OFFSETNUMBER
        });
        fs.closeSync(file);
        commonEventData.parameters.message = readLen;
        let dir = tempDir.split('temp');
        commonEventData.parameters.files = getListFile(dir[0]);
        let applicationFile = fs.openSync(applicationTempDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        let applicationReadLen = fs.readSync(applicationFile.fd, buf, {
          offset: OFFSETNUMBER
        });
        fs.closeSync(applicationFile);
        commonEventData.parameters.secondMessage = applicationReadLen;
        let secDir = tempDir.split('temp');
        commonEventData.parameters.secFiles = getListFile(secDir[0]);
        commonEvent.publish('Acts_CleanTempFiles_0102', commonEventData, (err) => {
          console.log('Acts_CleanTempFiles_0102 publish err: ' + JSON.stringify(err));
          startAndTerminate(this.context, 'Acts_CleanTempFiles_0104');
        });
      }, CLEAN_TEMP_DELAY_TIME)
    }
    onForegroundInner(actionStr, this.context);
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}