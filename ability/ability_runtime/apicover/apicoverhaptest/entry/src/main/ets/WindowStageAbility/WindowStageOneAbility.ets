/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import commonEventManager from '@ohos.commonEventManager';

let subscriber = undefined;
let onCreateResult: boolean = false;
let onDestroyResult: boolean = false;
let onWindowStageCreateResult: boolean = true;
let onWindowStageDestroyResult: boolean = false;
let onForegroundResult: boolean = true;

export default class OneAbility extends UIAbility {
  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'OneAbility onCreate');
    if (this.context.windowStage) {
      onCreateResult = true;
      hilog.info(0x0000, 'testTag', '%{public}s', 'onCreate , windowStage is exit.');
    } else {
      onCreateResult = false;
      hilog.info(0x0000, 'testTag', '%{public}s', 'onCreate , windowStage is no exit.');
    }
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'OneAbility onDestroy');
    if (this.context.windowStage) {
      onDestroyResult = true;
      hilog.info(0x0000, 'testTag', '%{public}s', 'onDestroy , windowStage is exit.');
    } else {
      onDestroyResult = false;
      hilog.info(0x0000, 'testTag', '%{public}s', 'onDestroy , windowStage is no exit.');
    }
    setTimeout(()=>{
      commonEventManager.publish('ACTS_GetWindowStage', {
        parameters: {
          onCreateResult: onCreateResult,
          onDestroyResult: onDestroyResult,
          onWindowStageCreateResult: onWindowStageCreateResult,
          onWindowStageDestroyResult: onWindowStageDestroyResult,
          onForegroundResult: onForegroundResult
        }
      }, (err) => {
        hilog.info(0x0000, 'testTag', '%{public}s', 'OneAbility commonEventManager publish end' + JSON.stringify(err));
      })
      if (subscriber) {
        commonEventManager.unsubscribe(subscriber)
      }
    }, 1000)
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'OneAbility onWindowStageCreate');
    if (!this.context.windowStage || !this.context.windowStage.on) {
      hilog.info(0x0000, 'testTag', '%{public}s', 'onWindowStageCreate , windowStage is error.');
      onWindowStageCreateResult = false;
    }
    this.context.windowStage.loadContent('WindowStageAbility/pages/one', (err, data) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'onWindowStageCreate , err = ' + JSON.stringify(err));
      if (err.code !== 0) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'onWindowStageCreate , err1 = ' + JSON.stringify(err));
        onWindowStageCreateResult = false;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });

  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'OneAbility onWindowStageDestroy');
    if (this.context.windowStage) {
      onWindowStageDestroyResult = true;
      hilog.info(0x0000, 'testTag', '%{public}s', 'onWindowStageDestroy , windowStage is exit.');
    } else {
      onWindowStageDestroyResult = false;
      hilog.info(0x0000, 'testTag', '%{public}s', 'onWindowStageDestroy , windowStage is no exit.');
    }
  }

  onForeground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'OneAbility onForeground');
    setTimeout(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'OneAbility terminateSelf');
      this.context.terminateSelf();
    }, 2000)
    if (this.context.windowStage) {
      onForegroundResult = true;
      hilog.info(0x0000, 'testTag', '%{public}s', 'onForeground , windowStage is exit.');
    } else {
      onForegroundResult = false;
      hilog.info(0x0000, 'testTag', '%{public}s', 'onForeground , windowStage is no exit.');
    }
  }
}