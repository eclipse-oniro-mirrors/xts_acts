/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { AbilityStage, Want } from '@kit.AbilityKit';
import hilog from '@ohos.hilog'
import window from '@ohos.window';
import { BusinessError } from '@ohos.base'
import { AppStorage } from '@ohos.arkui.stateManagement';

export default class MyAbilityStage extends AbilityStage {
  onCreate(): void {
    // 应用HAP首次加载时触发，可以在此执行该Module的初始化操作（例如资源预加载、线程创建等）。
    try {
      let appcontext = this.context.getApplicationContext();
      appcontext.getAllWindowStages()
        .then((data: Array<window.WindowStage>) => {
          hilog.info(0x0000, 'testTag', `[MyAbilityStage] getAllWindowStages size ${data.length}`);
          hilog.info(0x0000, 'testTag', '[MyAbilityStage] getAllWindowStages successfully. Data: ' + JSON.stringify(data));
          AppStorage.setOrCreate<Array<window.WindowStage>>('AbilityStage_WindowStage', data)
        })
        .catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', `[MyAbilityStage] getAllWindowStages error. code: ${err.code}, message: ${err.message}`);
        });
    } catch (e) {
      let err = e as BusinessError;
      hilog.error(0x0000, 'testTag', `[MyAbilityStage] getAllWindowStages failed. code: ${err.code}, message: ${err.message}`);
    }
  }

  onAcceptWant(want: Want): string {
    const abilityName = want.abilityName;
    hilog.info(0x0000, 'AbilityStage', `onAcceptWant: ${abilityName}`);
    if (abilityName === 'EntryAbility3') {
      const newInstanceId = `instance_${Date.now()}_${Math.random()}`;
      hilog.info(0x0000, 'AbilityStage', `${abilityName}: ${newInstanceId}`);
      return newInstanceId;
    }
    return '';
  }
}