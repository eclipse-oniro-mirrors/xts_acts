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

import fs from '@ohos.file.fs';
import UIExtensionAbility from '@ohos.app.ability.UIExtensionAbility';

function log(info) {
  console.log('MyUIExtension:' + info);
}

let SHARE_FILE_DIR = 'file://docs/storage/Users/currentUser/';

async function readTemp(rootPath, tempCount) {
  log('readTemp');
  let succ = 0;
  let uri = '';
  let t1 = new Date().getTime();
  for (let i = 0; i < tempCount; i++) {
    uri = rootPath + `/test_${i}.txt`;
    await fs.open(uri, fs.OpenMode.READ_ONLY).then((file)=>{
      if (file.fd) {
        fs.closeSync(file);
        succ++;
      }
    }).catch((error)=>{
      log('read error: uri = ' + uri + ' ' + JSON.stringify(error));
    });
  }
  let t2 = new Date().getTime();
  log('readTemp: ' + `${succ} cost: ${t2 - t1}`);
  globalThis.session.terminateSelfWithResult({
    'resultCode': 0,
    'want':{
      parameters: {
        'successCount': `${succ}`
      }
    }
  });
}

async function writeTemp(rootPath, tempCount) {
  log('writeTemp');
  let succ = 0;
  let uri = '';
  let t1 = new Date().getTime();
  for (let i = 0; i < tempCount; i++) {
    uri = rootPath + `/test_${i}.txt`;
    await fs.open(uri, fs.OpenMode.READ_WRITE).then((file)=>{
      if (file.fd) {
        fs.closeSync(file);
        succ++;
      }
    }).catch((error)=>{});
  }
  let t2 = new Date().getTime();
  log('writeTemp: ' + `${succ} cost: ${t2 - t1}`);
  globalThis.session.terminateSelfWithResult({
    'resultCode': 0,
    'want':{
      parameters: {
        'successCount': `${succ}`
      }
    }
  });
}

async function readPre(preCount) {
  log('readPre: ' + `${preCount}`);
  let succ = 0;
  let uri = '';
  let t1 = new Date().getTime();
  for (let i = 0; i < preCount; i++) {
    uri = SHARE_FILE_DIR + `test_${i}.txt`;
    await fs.open(uri, fs.OpenMode.READ_ONLY).then((file)=>{
      if (file.fd) {
        fs.closeSync(file);
        succ++;
      }
    }).catch((error)=>{});
  }
  let t2 = new Date().getTime();
  log('readPre: ' + `${succ} cost: ${t2 - t1}`);
  globalThis.session.terminateSelfWithResult({
    'resultCode': 0,
    'want':{
      parameters: {
        'successCount': `${succ}`
      }
    }
  });
}

async function writePre(preCount) {
  log('writePre');
  let succ = 0;
  let uri = '';
  let t1 = new Date().getTime();
  for (let i = 0; i < preCount; i++) {
    uri = SHARE_FILE_DIR + `test_${i}.txt`;
    await fs.open(uri, fs.OpenMode.READ_WRITE).then((file)=>{
      if (file.fd) {
        fs.closeSync(file);
        succ++;
      }
    }).catch((error)=>{});
  }
  let t2 = new Date().getTime();
  log('writePre: ' + `${succ} cost: ${t2 - t1}`);
  globalThis.session.terminateSelfWithResult({
    'resultCode': 0,
    'want':{
      parameters: {
        'successCount': `${succ}`
      }
    }
  });
}

export default class UIExtAbility extends UIExtensionAbility {
  onCreate() {
    log('UIExtAbility onCreate');
    globalThis.context = this.context;
  }

  onForeground() {
    log('UIExtAbility onForeground');
    if (globalThis.testcase === 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0600' ||
    globalThis.testcase === 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_1000') {
      readTemp(globalThis.filesDir, globalThis.tempCount);
    } else if (globalThis.testcase === 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0700') {
      writeTemp(globalThis.filesDir, globalThis.tempCount);
    } else if (globalThis.testcase === 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0800') {
      readPre(globalThis.preCount);
    } else if (globalThis.testcase === 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0900') {
      writePre(globalThis.preCount);
    } else {
      globalThis.session.terminateSelfWithResult({
        'resultCode': 0,
        'want':{
          parameters: {
            'successCount': `${-1}`
          }
        }
      });
    }
  }

  onBackground() {
    log('UIExtAbility onBackground');
  }

  onDestroy() {
    log('UIExtAbility onDestroy');
  }

  onSessionCreate(want, session) {
    log('UIExtAbility onSessionCreate');
    let storage: LocalStorage = new LocalStorage({
      'session': session
    });
    globalThis.session = session;
    globalThis.testcase = want.parameters.testcase;
    globalThis.filesDir = want.parameters.filesDir;
    globalThis.preCount = want.parameters.preCount;
    globalThis.tempCount = want.parameters.tempCount;
    log(' filesDir = ' + want.parameters.filesDir);
    log(' testcase = ' + want.parameters.testcase);
    log(' preCount = ' + want.parameters.preCount);
    log(' tempCount = ' + want.parameters.tempCount);
    session.loadContent('pages/UIExtensionIndex', storage);
  }

  onSessionDestroy(session) {
    log('UIExtAbility onSessionDestroy');
  }
};
