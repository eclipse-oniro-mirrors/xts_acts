/**
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
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import hilog from '@ohos.hilog';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import dlpPermission from '@ohos.dlpPermission';
import {terminateSelfWithResult} from '../common/utils';

const TAG = "DLP_XTS_GetDLPFileAccessRecordsPromise";

export default class GetDLPFileAccessRecordsPromise extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    globalThis.context = this.context;
  }

  onDestroy() {
  }

  async onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    try {
      var date = await dlpPermission.getDLPFileAccessRecords();
      console.info(TAG, "getDLPFileAccessRecords promise pass");
      terminateSelfWithResult(0);
    } catch (error) {
      console.error(TAG, "getDLPFileAccessRecords promise fail", error.code, error.message);
      terminateSelfWithResult(error.code);
    }
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
  }

  onForeground() {
    // Ability has brought to foreground
  }

  onBackground() {
    // Ability has back to background
  }
}
