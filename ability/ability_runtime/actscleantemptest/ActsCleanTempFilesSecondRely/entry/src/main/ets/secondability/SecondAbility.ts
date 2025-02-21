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
import window from '@ohos.window';
import commonEvent from '@ohos.commonEventManager';
import fs, { type Filter } from '@ohos.file.fs';

const BUFSIZE = 1024;
let DELAY_TIME = 100;
let CLEAN_TEMP_DELAY_TIME = 1000;
let OFFSETNUMBER = 0;

let message;
let result;
let files;
let commonEventData = {
  parameters: {
    message: message,
    result: result,
    files: files
  }
};
let actionStr;

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

function onForegroundInner(actionStr, tempDir, context): void {
  if (actionStr === 'Acts_CleanTempFiles_0203') {
    AppStorage.setOrCreate('message', actionStr);
    let file = fs.openSync(tempDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let writeLen = fs.writeSync(file.fd, 'Try to write feature str.');
    console.log('Acts_CleanTempFiles_0203 The length of str is: ' + writeLen);
    let buf = new ArrayBuffer(BUFSIZE);
    let readLen = fs.readSync(file.fd, buf, {
      offset: OFFSETNUMBER
    });
    let readBuf = String.fromCharCode.apply(null, new Uint8Array(buf.slice(OFFSETNUMBER, readLen)));
    console.log('Acts_CleanTempFiles_0203 the content of file: ' + readBuf);
    fs.closeSync(file);
    commonEventData.parameters.message = readBuf;
    console.log('Acts_CleanTempFiles_0203 Message: ' + JSON.stringify(readBuf));
    commonEvent.publish('Acts_CleanTempFiles_0203', commonEventData, (err) => {
      console.log('Acts_CleanTempFiles_0203 publish err: ' + JSON.stringify(err));
    });
  } else if (actionStr === 'Acts_CleanTempFiles_0204') {
    setTimeout(() => {
      AppStorage.setOrCreate('message', actionStr);
      let file = fs.openSync(tempDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let buf = new ArrayBuffer(BUFSIZE);
      let readLen = fs.readSync(file.fd, buf, {
        offset: OFFSETNUMBER
      });
      fs.closeSync(file);
      let readBuf = String.fromCharCode.apply(null, new Uint8Array(buf.slice(OFFSETNUMBER, readLen)));
      commonEventData.parameters.message = readBuf;
      console.log('Acts_CleanTempFiles_0204 Message: ' + JSON.stringify(readLen));
      commonEvent.publish('Acts_CleanTempFiles_0204', commonEventData, (err) => {
        console.log('Acts_CleanTempFiles_0204 publish err: ' + JSON.stringify(err));
        setTimeout(() => {
          context.terminateSelf().then(() => {
            console.log('Acts_CleanTempFiles_0101 rely terminateSelf end');
          }).catch((err) => {
            console.log('Acts_CleanTempFiles_0101 rely terminateSelf err: ' + JSON.stringify(err));
          });
        }, DELAY_TIME);
      });
    }, CLEAN_TEMP_DELAY_TIME)
  }
}

export default class SecondAbility extends UIAbility {
  onCreate(want, launchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    actionStr = want.parameters.key;
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    let tempDir = this.context.tempDir;
    console.log('create virable end');
    if (actionStr === 'Acts_CleanTempFiles_0103') {
      let file = fs.openSync(tempDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, 'Try to write feature str.');
      let buf = new ArrayBuffer(BUFSIZE);
      let readLen = fs.readSync(file.fd, buf, {
        offset: OFFSETNUMBER
      });
      let readBuf = String.fromCharCode.apply(null, new Uint8Array(buf.slice(OFFSETNUMBER, readLen)));
      console.log('Acts_CleanTempFiles_0103 write: ' + JSON.stringify(writeLen) + 'readBuf:' + JSON.stringify(readBuf));
      fs.closeSync(file);
      commonEventData.parameters.message = readBuf;
      commonEvent.publish('Acts_CleanTempFiles_0103', commonEventData, (err) => {
        console.log('Acts_CleanTempFiles_0103 publish err: ' + JSON.stringify(err));
        setTimeout(() => {
          this.context.terminateSelf().then(() => {
            console.log('Acts_CleanTempFiles_0103 rely terminateSelf end');
          }).catch((err) => {
            console.log('Acts_CleanTempFiles_0103 rely terminateSelf err: ' + JSON.stringify(err));
          });
        }, DELAY_TIME);
      });
    } else if (actionStr === 'Acts_CleanTempFiles_0104') {
      AppStorage.setOrCreate('message', actionStr);
      setTimeout(() => {
        let file = fs.openSync(tempDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        let buf = new ArrayBuffer(BUFSIZE);
        let readLen = fs.readSync(file.fd, buf, {
          offset: OFFSETNUMBER
        });
        fs.closeSync(file);
        commonEventData.parameters.result = readLen;
        let dir = tempDir.split('temp');
        commonEventData.parameters.files = getListFile(dir[0]);
        console.log('Acts_CleanTempFiles_0104 Message: ' + JSON.stringify(readLen));
        commonEvent.publish('Acts_CleanTempFiles_0104', commonEventData, (err) => {
          console.log('Acts_CleanTempFiles_0104 publish err: ' + JSON.stringify(err));
          setTimeout(() => {
            this.context.terminateSelf().then(() => {
              console.log('Acts_CleanTempFiles_0104 rely terminateSelf end');
            }).catch((err) => {
              console.log('Acts_CleanTempFiles_0104 rely terminateSelf err: ' + JSON.stringify(err));
            });
          }, DELAY_TIME);
        });
      }, CLEAN_TEMP_DELAY_TIME)
    }
    onForegroundInner(actionStr, tempDir, this.context);
    console.log('onForeground end');
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}