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

function log(info){
  console.info('BatchUriRecv: ', info);
}

let SHARE_FILE_DIR = 'file://docs/storage/Users/currentUser/';

async function readTemp(root_path,tempCount) {
  log('readTemp')
  let succ = 0;
  let uri = '';
  let t1 = new Date().getTime();
  for (let i = 0; i < tempCount; i++) {
    uri = root_path + `/test_${i}.txt`;
    await fs.open(uri, fs.OpenMode.READ_ONLY).then((file)=>{
      if (file.fd) {
        fs.closeSync(file);
        succ++;
      }
    }).catch((error)=>{
      log(JSON.stringify(error) + ` ${uri}`);
    })
  }
  let t2 = new Date().getTime();
  log('readTemp: ' + `${succ} cost: ${t2-t1}`);
  globalThis.context.terminateSelfWithResult({
    want: { parameters: {'successCount': `${succ}`}},
    resultCode: 0
  });
}

async function writeTemp(root_path, tempCount) {
  log('writeTemp')
  let succ = 0;
  let uri = ''
  let t1 = new Date().getTime();
  for (let i =0; i < tempCount; i++) {
    uri = root_path + `/test_${i}.txt`;
    await fs.open(uri, fs.OpenMode.READ_WRITE).then((file)=>{
      if (file.fd) {
        fs.closeSync(file);;
        succ++;
      }
    }).catch((error)=>{})
  }
  let t2 = new Date().getTime();
  log('writeTemp: ' + `${succ} cost: ${t2-t1}`);
  globalThis.context.terminateSelfWithResult({
    want: { parameters: {'successCount': `${succ}`}},
    resultCode: 0
  });
}

async function readPre(preCount) {
  log('readPre: ' + `${preCount}`)
  let succ = 0;
  let uri = '';
  let t1 = new Date().getTime();
  for (let i = 0; i < preCount; i++) {
    uri =  SHARE_FILE_DIR + `test_${i}.txt`;
    await fs.open(uri, fs.OpenMode.READ_ONLY).then((file)=>{
      if (file.fd) {
        fs.closeSync(file);
        succ++;
      }
    }).catch((error)=>{})
  }
  let t2 = new Date().getTime();
  log('readPre: ' + `${succ} cost: ${t2-t1}`);
  globalThis.context.terminateSelfWithResult({
    want: { parameters: {'successCount': `${succ}`}},
    resultCode: 0
  })
}

async function writePre(preCount) {
  log('writePre');
  let succ = 0;
  let uri = '';
  let t1 = new Date().getTime();
  for (let i = 0; i < preCount; i++) {
    uri =  SHARE_FILE_DIR + `test_${i}.txt`;
    await fs.open(uri, fs.OpenMode.READ_WRITE).then((file)=>{
      if (file.fd) {
        fs.closeSync(file);
        succ++;
      }
    }).catch((error)=>{})
  }
  let t2 = new Date().getTime();
  log('writePre: ' + `${succ} cost: ${t2-t1}`);
  globalThis.context.terminateSelfWithResult({
    want: { parameters: {'successCount': `${succ}`}},
    resultCode: 0
  })
}

@Entry
@Component
struct Index {
  @State message: string = 'UIAbility 正在授权...';

  onPageShow() {
    log('onPageShow');
    log('testcase:' + globalThis.testcase);
    log('filesDir: ' + globalThis.filesDir);
    log('preCount: ' + globalThis.preCount);
    log('tempCount: ' + globalThis.tempCount);
    if (globalThis.testcase === 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0100' ||
      globalThis.testcase === 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0500'){
      readTemp(globalThis.filesDir, globalThis.tempCount);
    } else if (globalThis.testcase === 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0200'){
      writeTemp(globalThis.filesDir, globalThis.tempCount);
    } else if (globalThis.testcase === 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0300'){
      readPre(globalThis.preCount);
    } else if (globalThis.testcase === 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0400') {
      writePre(globalThis.preCount);
    } else {
      globalThis.context.terminateSelfWithResult({
        want: { parameters: {'successCount': `${-1}`}},
        resultCode: 0
      })
    }
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}