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
import fileAccess from '@ohos.file.fileAccess'
import uri from '@ohos.uri';

function log(info){
  console.log('SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_Test:', info);
}

let SHARE_FILE_DIR = 'file://docs/storage/Users/currentUser/';

export function getTempUriList(root_path){
  log('getTempUriList');
  let uriList = [];
  for (let i = 0; i < 501; i++) {
    uriList.push(root_path + `/test_${i}.txt`);
  }
  log(uriList[0]);
  return uriList;
}

export function getPreUriList() {
  log('getPreUriList');
  let uriList = [];
  for (let i = 0; i < 501; i++) {
    let uri = SHARE_FILE_DIR + `test_${i}.txt`;
    uriList.push(uri);
  }
  log(uriList[0]);
  return uriList;
}

export function createTempFile(uriList) {
  log('createTempFile');
  let succ = 0;
  for (let i = 0; i < uriList.length; i++) {
    let res = fs.accessSync(uriList[i]);
    if (!res) {
      try {
        let file = fs.openSync(uriList[i], fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        fs.closeSync(file);
        succ++;
      } catch (err) {
        log('createTempFile Error:' + 'uri = ' + uri + ' '+ JSON.stringify(err));
        continue;
      }
    }
  }
  return (succ === uriList.length);
}

export async function createPreFile(uriList, callback) {
  log('createPreFile');
  let sourceUri = SHARE_FILE_DIR;
  let fileAcsHelper = null;
  let wantInfo = await fileAccess.getFileAccessAbilityInfo();
  try {
    fileAcsHelper = fileAccess.createFileAccessHelper(globalThis.abilityContext, wantInfo);
    if (!fileAcsHelper) {
      log('createFileAccessHelper interface returns an undefined object');
      callback(false);
      return;
    }
  } catch (error) {
    log('createFileAccessHelper failed, errCode:' + error.code + ', errMessage:' + error.message);
    callback(false);
    return;
  }
  log('uri0: ' + uriList[0]);
  for (let i = 0; i < uriList.length; i++) {
    let displayName = `test_${i}.txt`;
    let uri = sourceUri + displayName;
    try {
      uri = await fileAcsHelper.createFile(sourceUri, displayName);
      if (!uri) {
        log('createPreFile return undefined object');
        callback(false);
        return;
      }
    } catch (error) {
      if (error.code !== 13900015) {
        log('createPreFile failed, errCode:' + error.code + ', errMessage:' + error.message);
        callback(false);
        return;
      }
    }
  }
  log('createPreFile success');
  callback(true);
  return true;
}


