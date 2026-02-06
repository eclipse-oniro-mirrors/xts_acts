/*
* Copyright (c) 2022 Huawei Device Co., Ltd.
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

import Ability from '@ohos.app.ability.UIAbility';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import testsuite from '../test/List.test';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import { BusinessError } from '@ohos.base';
import { Hypium } from '@ohos/hypium';
import window from '@ohos.window';

async function startAbilityTest(TAG: string, context: common.UIAbilityContext) {
  let wantInfo: Want = {
    bundleName: "com.example.aacommandprintsynctest",
    abilityName: "MainAbility"
  };
  await context.startAbility(wantInfo).then((data) => {
    console.log(TAG + "startAbility data : " + JSON.stringify(data));
  }).catch((err: BusinessError) => {
    console.log(TAG + "startAbility err : " + JSON.stringify(err));
  })
}

function sleep(ms: number) {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

export default class MainAbility extends Ability {
  async onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    AppStorage.setOrCreate<common.UIAbilityContext>("abilityContext", this.context);
    console.log('MainAbility onCreate');
    let cmd: string;
    let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs = AbilityDelegatorRegistry.getArguments();
    let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    cmd = 'aa test -b com.example.aacommandprintsync -m entry_test  -s class ' +
      'AACommandPrintTest#ACTS_AACommand_printSync_01_0100 -s unittest OpenHarmonyTestRunner';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.log('ACTS_AACommand_printSync_01_0100 start err: ' + JSON.stringify(err));
      console.log('ACTS_AACommand_printSync_01_0100 stdResult = ' + data.stdResult);
      AppStorage.setOrCreate<string>("stdResult1", data.stdResult);
      console.log('ACTS_AACommand_printSync_01_0100 - executeShellCommand: end ');
      await startAbilityTest('ACTS_AACommand_printSync_01_0100', this.context);
    })

    await sleep(3000);

    cmd = 'aa test -m entry_test -b com.example.aacommandprintsync -s class ' +
      'AACommandPrintTest#ACTS_AACommand_printSync_01_0200 -s unittest OpenHarmonyTestRunner';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.log('ACTS_AACommand_printSync_01_0200 start err: ' + JSON.stringify(err));
      console.log('ACTS_AACommand_printSync_01_0200 stdResult = ' + data.stdResult);
      AppStorage.setOrCreate<string>("stdResult2", data.stdResult);
      console.log('ACTS_AACommand_printSync_01_0200 - executeShellCommand: end ');
      await startAbilityTest('ACTS_AACommand_printSync_01_0200', this.context);
    })

    await sleep(3000);

    cmd = 'aa test -m entry_test -b com.example.aacommandprintsync -s class ' +
      'AACommandPrintTest#ACTS_AACommand_printSync_01_0300 -s unittest OpenHarmonyTestRunner';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.log('ACTS_AACommand_printSync_01_0300 start err: ' + JSON.stringify(err));
      console.log('ACTS_AACommand_printSync_01_0300 stdResult = ' + data.stdResult);
      AppStorage.setOrCreate<string>("stdResult3", data.stdResult);
      console.log('ACTS_AACommand_printSync_01_0300 - executeShellCommand: end ');
      await startAbilityTest('ACTS_AACommand_printSync_01_0300', this.context);
    })

    await sleep(3000);

    cmd = 'aa test -m entry_test -b com.example.aacommandprintsync -s class ' +
      'AACommandPrintTest#ACTS_AACommand_printSync_01_0400 -s unittest OpenHarmonyTestRunner';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.log('ACTS_AACommand_printSync_01_0400 start err: ' + JSON.stringify(err));
      console.log('ACTS_AACommand_printSync_01_0400 stdResult = ' + data.stdResult);
      AppStorage.setOrCreate<string>("stdResult4", data.stdResult);
      console.log('ACTS_AACommand_printSync_01_0400 - executeShellCommand: end ');
      await startAbilityTest('ACTS_AACommand_printSync_01_0400', this.context);
    })

    setTimeout(() => {
      Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
    }, 6000)
  }

  onDestroy() {
    console.log('MainAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    console.log('MainAbility onWindowStageCreate');
    windowStage.loadContent('pages/index', null);
  }

  onWindowStageDestroy() {
    console.log('MainAbility onWindowStageDestroy');
  }

  onForeground() {
    console.log('MainAbility onForeground');
  }

  onBackground() {
    console.log('MainAbility onBackground');
  }
}
