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
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import type { Permissions } from '@ohos.abilityAccessCtrl';

const TAG = 'PermissionUtil';

export class PermissionUtil {
  private static permissions: Array<Permissions> = ['ohos.permission.READ_CALENDAR'];

  public static async requestOAIDTrackingConsentPermissions(context: any): Promise<void> {
    let atManager = abilityAccessCtrl.createAtManager();
    return new Promise<void>(async (resolve, reject) => {
      console.log(TAG, 'requestPermission begin');
      let data = await atManager.requestPermissionsFromUser(context, ['ohos.permission.APP_TRACKING_CONSENT']);
      console.log(TAG, 'requestPermissionsFromUser data=' + JSON.stringify(data));
      if (data && data.authResults) {
        let result = 0;
        for (let i = 0; i < data.authResults.length; i++) {
          result += data.authResults[i];
        }
        if (result === 0) {
          resolve();
        } else {
          console.log(TAG, 'requestPermission user rejected');
          reject();
        }
      } else {
        console.log(TAG, 'requestPermission failed');
        reject();
      }
      console.log(TAG, 'requestPermission end');
    });
  }
}