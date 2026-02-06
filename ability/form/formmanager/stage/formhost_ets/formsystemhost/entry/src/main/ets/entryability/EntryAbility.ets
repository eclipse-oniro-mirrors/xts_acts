/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base';
import CommonEventManager from '@ohos.commonEventManager';

export default class EntryAbility extends UIAbility {
  private subscriberTestFinish:CommonEventManager.CommonEventSubscriber|null = null;
  private subscriberTestFinishEvent:CommonEventManager.CommonEventSubscribeInfo = {
    events: ["FMS_FormTestFinish_commonEvent"],
  };

  private finishCallBack: (err:BusinessError, data:CommonEventManager.CommonEventData) => void = 
    (err:BusinessError, data:CommonEventManager.CommonEventData) => {
      console.info(`!!!====>formsystemhost finishCallBack start:====>` + JSON.stringify(data));
      this.context.terminateSelf();
      console.info(`!!!====>formsystemhost finishCallBack end ====>`);
    };

  public onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    console.info('Ability onCreate');
    AppStorage.setOrCreate('want', want);
    CommonEventManager.createSubscriber(this.subscriberTestFinishEvent).then(async (data) => {
      console.info(`formsystemhost Subscriber FormFinish data:`, JSON.stringify(data));
      this.subscriberTestFinish = data;
      await CommonEventManager.subscribe(this.subscriberTestFinish, this.finishCallBack);
    });
  }

  public onDestroy(): void {
    console.info('Ability onDestroy');
  }

  public onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    console.info('Ability onNewWant');
    AppStorage.setOrCreate('want', want);
  }

  public onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    console.info('Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        console.error(`Failed to load the content. Cause: %{public}s`, JSON.stringify(err));
        return;
      }
      console.info('Succeeded in loading the content.');
    });
  }

  public onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    console.info('Ability onWindowStageDestroy');
  }

  public onForeground(): void {
    // Ability has brought to foreground
    console.info('Ability onForeground');
  }

  public onBackground(): void {
    // Ability has back to background
    console.info('Ability onBackground');
  }
}