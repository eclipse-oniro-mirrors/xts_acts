/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { AbilityConstant, common, UIAbility, Want } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import Utils from '../common/Utils';

export default class TestAbility1 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    hilog.info(0x0000, 'testTag', '%{public}s', 'launchParam:'+ JSON.stringify(launchParam) ?? '');
    let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    AppStorage.setOrCreate<common.UIAbilityContext>('TestAbility1_UIAbilityContext', this.context)
    try {
      let appcontext = this.context.getApplicationContext();
      appcontext.getAllWindowStages()
        .then((data: Array<window.WindowStage>) => {
          hilog.info(0x0000, 'testTag', `[onCreate] getAllWindowStages size ${data.length}`);
          hilog.info(0x0000, 'testTag', '[onCreate] getAllWindowStages successfully. Data: ' + JSON.stringify(data));
          AppStorage.setOrCreate<Array<window.WindowStage>>('onCreate_WindowStage', data)
        })
        .catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', `[onCreate] getAllWindowStages error. code: ${err.code}, message: ${err.message}`);
        });
    } catch (e) {
      let err = e as BusinessError;
      hilog.error(0x0000, 'testTag', `[onCreate] getAllWindowStages failed. code: ${err.code}, message: ${err.message}`);
    }
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onDestroy');
    try {
      let appcontext = this.context.getApplicationContext();
      appcontext.getAllWindowStages()
        .then((data: Array<window.WindowStage>) => {
          hilog.info(0x0000, 'testTag', `[onDestroy] getAllWindowStages size ${data.length}`);
          hilog.info(0x0000, 'testTag', '[onDestroy] getAllWindowStages successfully. Data: ' + JSON.stringify(data));
          AppStorage.setOrCreate<Array<window.WindowStage>>('onDestroy_WindowStage', data)
        })
        .catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', `[onDestroy] getAllWindowStages error. code: ${err.code}, message: ${err.message}`);
        });
    } catch (e) {
      let err = e as BusinessError;
      hilog.error(0x0000, 'testTag', `[onDestroy] getAllWindowStages failed. code: ${err.code}, message: ${err.message}`);
    }
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onWindowStageCreate');
    windowStage.loadContent('testability1/pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '');
    });
    try {
      let appcontext = this.context.getApplicationContext();
      appcontext.getAllWindowStages()
        .then((data: Array<window.WindowStage>) => {
          hilog.info(0x0000, 'testTag', `[onWindowStageCreate] getAllWindowStages size ${data.length}`);
          hilog.info(0x0000, 'testTag', '[onWindowStageCreate] getAllWindowStages successfully. Data: ' + JSON.stringify(data));
          AppStorage.setOrCreate<Array<window.WindowStage>>('onWindowStageCreate_WindowStage', data)
        })
        .catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', `[onWindowStageCreate] getAllWindowStages error. code: ${err.code}, message: ${err.message}`);
        });
    } catch (e) {
      let err = e as BusinessError;
      hilog.error(0x0000, 'testTag', `[onWindowStageCreate] getAllWindowStages failed. code: ${err.code}, message: ${err.message}`);
    }
  }

onWindowStageWillDestroy(windowStage: window.WindowStage): void {
  hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onWindowStageWillDestroy');
  try {
    let appcontext = this.context.getApplicationContext();
    appcontext.getAllWindowStages()
      .then((data: Array<window.WindowStage>) => {
        hilog.info(0x0000, 'testTag', `[onWindowStageWillDestroy] getAllWindowStages size ${data.length}`);
        hilog.info(0x0000, 'testTag', '[onWindowStageWillDestroy] getAllWindowStages successfully. Data: ' + JSON.stringify(data));
        AppStorage.setOrCreate<Array<window.WindowStage>>('onWindowStageWillDestroy_WindowStage', data)
      })
      .catch((e: Error) => {
        let err = e as BusinessError
        hilog.error(0x0000, 'testTag', `[onWindowStageWillDestroy] getAllWindowStages error. code: ${err.code}, message: ${err.message}`);
      });
  } catch (e) {
    let err = e as BusinessError;
    hilog.error(0x0000, 'testTag', `[onWindowStageWillDestroy] getAllWindowStages failed. code: ${err.code}, message: ${err.message}`);
  }
}

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onWindowStageDestroy');
    try {
      let appcontext = this.context.getApplicationContext();
      appcontext.getAllWindowStages()
        .then((data: Array<window.WindowStage>) => {
          hilog.info(0x0000, 'testTag', `[onWindowStageDestroy] getAllWindowStages size ${data.length}`);
          hilog.info(0x0000, 'testTag', '[onWindowStageDestroy] getAllWindowStages successfully. Data: ' + JSON.stringify(data));
          AppStorage.setOrCreate<Array<window.WindowStage>>('onWindowStageDestroy_WindowStage', data)
        })
        .catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', `[onWindowStageDestroy] getAllWindowStages error. code: ${err.code}, message: ${err.message}`);
        });
    } catch (e) {
      let err = e as BusinessError;
      hilog.error(0x0000, 'testTag', `[onWindowStageDestroy] getAllWindowStages failed. code: ${err.code}, message: ${err.message}`);
    }
  }

  onForeground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onForeground');
    try {
      let appcontext = this.context.getApplicationContext();
      appcontext.getAllWindowStages()
        .then((data: Array<window.WindowStage>) => {
          hilog.info(0x0000, 'testTag', `[onForeground] getAllWindowStages size ${data.length}`);
          hilog.info(0x0000, 'testTag', '[onForeground] getAllWindowStages successfully. Data: ' + JSON.stringify(data));
          AppStorage.setOrCreate<Array<window.WindowStage>>('onForeground_WindowStage', data)
        })
        .catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', `[onForeground] getAllWindowStages error. code: ${err.code}, message: ${err.message}`);
        });
    } catch (e) {
      let err = e as BusinessError;
      hilog.error(0x0000, 'testTag', `[onForeground] getAllWindowStages failed. code: ${err.code}, message: ${err.message}`);
    }
  }

  async onBackground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility 1 onBackground');
    await Utils.sleep(1000);
    try {
      let appcontext = this.context.getApplicationContext();
      await appcontext.getAllWindowStages()
        .then((data: Array<window.WindowStage>) => {
          hilog.info(0x0000, 'testTag', `[onBackground] getAllWindowStages size ${data.length}`);
          hilog.info(0x0000, 'testTag', '[onBackground] getAllWindowStages successfully. Data: ' + JSON.stringify(data));
          AppStorage.setOrCreate<Array<window.WindowStage>>('onBackground_WindowStage', data)
        })
        .catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', `[onBackground] getAllWindowStages error. code: ${err.code}, message: ${err.message}`);
        });
    } catch (e) {
      let err = e as BusinessError;
      hilog.error(0x0000, 'testTag', `[onBackground] getAllWindowStages failed. code: ${err.code}, message: ${err.message}`);
    }
  }
}