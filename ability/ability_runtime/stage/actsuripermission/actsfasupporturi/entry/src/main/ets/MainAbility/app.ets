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
import ability from '@ohos.ability.ability';
import featureAbility from '@ohos.ability.featureAbility';
import Want from '@ohos.app.ability.Want';
import fileUri from '@ohos.file.fileuri';
import fs from '@ohos.file.fs';
import wantConstant from '@ohos.ability.wantConstant';
import { BusinessError } from '@ohos.base';

let printLog1 : string = '[demo] FaMainAbility'

class Test {
  onCreate() {
    console.info(printLog1 + 'onCreate');
    let context = featureAbility.getContext()
    console.info(printLog1 + ' onCreate get context');
    context.getFilesDir().then((path) => {
      console.info(printLog1 + ' onCreate get path');
      let filePath : string = path + "/test_A.txt";
      fs.open(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE, (err, file) => {
        if (err) {
          console.info(printLog1 + " mkdir failed with error message: " + err.message + ", error code: " + err.code);
        } else {
          console.info(printLog1 + " file created, fd: " + file.fd);
          let uri : string = fileUri.getUriFromPath(filePath);
          console.info(printLog1 + ' onCreate uri: ' + JSON.stringify(uri));
          let want: Want = {
            flags : wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION,
            bundleName : "com.acts.authorizeduriapplication",
            abilityName : "Hap2MainAbility1",
            uri : uri,
            parameters : {
              number : 19
            }
          }
          let param: ability.StartAbilityParameter = {
            want: want
          }
          featureAbility.startAbility(param).then(() => {
            console.log('startAbility succeed');
          }).catch((error: BusinessError) => {
            console.log('startAbility failed, error.code: ' + JSON.stringify(error.code) + ' error.message: ' + JSON.stringify(error.message));
          });
        }
      });
    })
  }

  onDestroy() {
    console.info(printLog1 + 'onDestroy');
  }

  onActive() {
    console.info(printLog1 + 'onActive');
  }

  onInactive() {
    console.info(printLog1 + 'onInactive');
  }

  onShow() {
    console.info(printLog1 + 'onShow');
  }

  onHide() {
    console.info(printLog1 + 'onHide');
  }
}

export default new Test()