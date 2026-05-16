/*
 * Copyright (C) 2024 HiHope Open Source Organization
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
import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { rpc } from '@kit.IPCKit';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import EmbeddableUIAbility from '@ohos.app.ability.EmbeddableUIAbility';

const TAG: string = 'ServiceExtensionAbility';
const DOMAIN_NUMBER: number = 0xFF00;
let commRemote: rpc.IRemoteObject | null = null;

export default class ServiceExtensionAbility extends EmbeddableUIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onCreate');


  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onDestroy');
  }
  onFormEvent(formId: string, message: string) {
    // 当触发卡片message事件时，执行connectServiceExtensionAbility
    console.log(`FormExtensionAbility onFormEvent, formId:${formId}, message:${message}`);
    let want: Want = {
      deviceId: '',
      bundleName: 'com.example.appa',
      abilityName: 'terminateSelfWithResult',
      parameters: {
        'message': message
      }
    };
    let options: common.ConnectOptions = {
      onConnect(elementName, remote) {
        commRemote = remote;
        console.log('----------- onConnect -----------');
      },
      onDisconnect(elementName) {
        console.log('----------- onDisconnect -----------')
      },
      onFailed(code) {
        console.error('----------- onFailed -----------')
      }
    };

    let connection: number | null = null;
    try {
      connection = this.context.connectServiceExtensionAbility(want, options);
      console.log('success connectServiceExtensionAbility');
    } catch (paramError) {
      console.error(`error.code: ${(paramError as BusinessError).code}, error.message: ${(paramError as BusinessError).message}`);
    }
  }


  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTAG', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTAG', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onBackground');
  }
}
