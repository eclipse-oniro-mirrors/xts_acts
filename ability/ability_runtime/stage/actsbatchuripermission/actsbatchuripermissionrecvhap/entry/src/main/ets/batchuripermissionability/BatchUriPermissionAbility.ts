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
import type window from '@ohos.window';

function log(info) {
  console.info('BatchUriRecv: ', info);
}

export default class BatchUriPermissionAbility extends UIAbility {
  onCreate(want, launchParam) {
    log('onCreate');
    globalThis.abilityWant = want;
    if (want.parameters.testcase !== undefined) {
      globalThis.testcase = want.parameters.testcase;
    }
    if (want.parameters.filesDir !== undefined) {
      globalThis.filesDir = want.parameters.filesDir;
    }
    globalThis.preCount = want.parameters.preCount;
    globalThis.tempCount = want.parameters.tempCount;
    globalThis.context = this.context;
  }

  onNewWant(want, launchParam) {
    log('BatchUriPermissionAbility onNewWant');
    globalThis.abilityWant = want;
    if (want.parameters.testcase !== undefined) {
      globalThis.testcase = want.parameters.testcase;
    }
    if (want.parameters.filesDir !== undefined) {
      globalThis.filesDir = want.parameters.filesDir;
    }
    globalThis.preCount = want.parameters.preCount;
    globalThis.tempCount = want.parameters.tempCount;
    globalThis.context = this.context;
  }

  onDestroy() {
    log('BatchUriPermissionAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    log('BatchUriPermissionAbility onWindowStageCreate');
    windowStage.loadContent('pages/Index_auto', (err, data) => {
      if (err.code) {
        log('loadContent error: ' + JSON.stringify(err));
        return;
      }
      log('loadContent success:' + JSON.stringify(err));
    });
  }

  onWindowStageDestroy() {
    log('BatchUriPermissionAbility onWindowStageDestroy');
  }

  onForeground() {
    log('BatchUriPermissionAbility onForeground');
  }

  onBackground() {
    // Ability has back to background
    log('BatchUriPermissionAbility onBackground');
  }
}
