/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import CommonEventManager from '@ohos.commonEventManager';

class EntryAbility3 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag EntryAbility3', 'EntryAbility onCreate ' + want?.action);
    if(want?.action == 'killAllProcess-callback'){
      setTimeout(()=>{
        this.context.getApplicationContext().killAllProcesses((err:BusinessError | null):void=>{
          hilog.info(0x0000, 'testTag EntryAbility3', 'killAllProcesses result' + err?.code);
        })
      },1000)
    }
    if(want?.action == 'killAllProcess-promise'){
      setTimeout(()=>{
        this.context.getApplicationContext().killAllProcesses().then(():void=>{
          hilog.info(0x0000, 'testTag EntryAbility3', 'killAllProcesses promiseresult');
        }).catch((err:Error):void=>{
          hilog.info(0x0000, 'testTag EntryAbility3', 'killAllProcesses promise err' + err?.code);
        })
      },1000)
    }
    if(want?.action == 'killAllProcess-clearPageStack'){
      setTimeout(()=>{
        this.context.getApplicationContext().killAllProcesses(false).then(():void=>{
          hilog.info(0x0000, 'testTag EntryAbility3', 'killAllProcesses clearPageStackresult');
        }).catch((err:Error):void=>{
          hilog.info(0x0000, 'testTag EntryAbility3', 'killAllProcesses clearPageStack err' + err?.code);
        })
      },1000)
    }
    if(want?.action == 'clearUpApplicationData-callback'){
      setTimeout(()=>{
        this.context.getApplicationContext().clearUpApplicationData((err:BusinessError | null):void=>{
          hilog.info(0x0000, 'testTag EntryAbility3', 'clearUpApplicationData callback result' + err?.code);
        })
      },1000)
    }
    if(want?.action == 'clearUpApplicationData-promise'){
      setTimeout(()=>{
        this.context.getApplicationContext().clearUpApplicationData().then(():void=>{
          hilog.info(0x0000, 'testTag EntryAbility3', 'clearUpApplicationData promise result');
        }).catch((err:Error):void=>{
          hilog.info(0x0000, 'testTag EntryAbility3', 'clearUpApplicationData promise err' + err?.code);
        })
      },1000)
    }
    if(want?.action == 'restartApp-success'){
      setTimeout(()=>{
        this.context.getApplicationContext().restartApp({
          bundleName: 'com.acts.abilitydelegatorrely.static',
          abilityName: 'EntryAbility3',
        })
      },1000)
    }else{
      CommonEventManager.publish("RELY_ABILITY_RESTART_SUCCESS", ()=>{
        hilog.info(0x0000, 'testTag MainAbility3', 'EntryAbility RELY_ABILITY_RESTART_SUCCESS end ');
      });
      setTimeout(()=>{
        this.context.terminateSelf();
      },2000)
    }
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag EntryAbility3', 'EntryAbility onWindowStageCreate');
    try {
      windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
        hilog.info(0x0000, 'testTag EntryAbility', 'loadContent entering');
        if (err?.code) {
          hilog.info(0x0000, 'testTag EntryAbility', 'loadContent error');
          return;
        }
        hilog.info(0x0000, 'testTag EntryAbility', 'loadContent ok');
      });
    } catch (e) {
      hilog.info(0x0000, 'testTag EntryAbility', 'loadContent catch error:-----------' + e.message);
    }
  }

  onDestroy(): Promise<void> | undefined {
    hilog.info(0x0000, 'testTag EntryAbility3', 'EntryAbility onDestroy');
    return undefined;
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag EntryAbility3', 'EntryAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag EntryAbility3', 'EntryAbility onForeground');
  }

  onBackground() {
    hilog.info(0x0000, 'testTag  EntryAbility3', 'EntryAbility onBackground');
  }
}