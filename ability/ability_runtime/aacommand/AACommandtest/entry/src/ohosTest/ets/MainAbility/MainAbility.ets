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
import window from '@ohos.window';
import { Hypium } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';

async function startAbilityTest(TAG: string, context: common.UIAbilityContext) {
  let wantInfo: Want = {
    bundleName: "com.example.aacommandtest",
    abilityName: "MainAbility"
  }
  await context.startAbility(wantInfo).then((data) => {
    console.log(TAG + "startAbility data : " + JSON.stringify(data));
  }).catch((err: BusinessError) => {
    console.log(TAG + "startAbility err : " + JSON.stringify(err));
  })
}

function sleep(ms: number) {
  return new Promise<number>(resolve => setTimeout(resolve, ms));
}

export default class MainAbility extends Ability {
  async onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    AppStorage.setOrCreate<common.UIAbilityContext>("abilityContext", this.context);
    console.log('MainAbility onCreate');
    let cmd: string;
    let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs;
    let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator;

    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s ' +
      'class AACommandTest#ACTS_AACommand_finish_01_0700 -s unittest OpenHarmonyTestRunner';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.log('ACTS_AACommand_finish_01_0700 start err: ' + JSON.stringify(err));
      console.log('ACTS_AACommand_finish_01_0700 stdResult = ' + data.stdResult);
      AppStorage.setOrCreate<string>("stdResult1", data.stdResult);
      console.log('ACTS_AACommand_finish_01_0700 - executeShellCommand: end ');
      await startAbilityTest('ACTS_AACommand_finish_01_0700', this.context);
    })

    await sleep(4000);

    cmd = 'aa dump -a';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.info('ACTS_AACommand_finish_01_0700 : err : ' + JSON.stringify(err));
      console.info('ACTS_AACommand_finish_01_0700 : data : ' + JSON.stringify(data));
      AppStorage.setOrCreate<string>("stdResult2", data.stdResult);
      console.info('ACTS_AACommand_finish_01_0700 end');
    })

    await sleep(2000);

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class ' +
      'AACommandTest#ACTS_AACommand_finish_01_0400 -s unittest OpenHarmonyTestRunner';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.log('ACTS_AACommand_finish_01_0400 - executeShellCommand: start ');
      console.log('ACTS_AACommand_finish_01_0400 start err: ' + JSON.stringify(err));
      console.log('ACTS_AACommand_finish_01_0400 stdResult = ' + data.stdResult);
      AppStorage.setOrCreate<string>("stdResult11", data.stdResult);
      console.log('ACTS_AACommand_finish_01_0400 - executeShellCommand: end');
      await startAbilityTest('ACTS_AACommand_finish_01_0400', this.context);
    })

    await sleep(4000);

    cmd = 'aa dump -a';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.info('ACTS_AACommand_finish_01_0700 : err : ' + JSON.stringify(err));
      console.info('ACTS_AACommand_finish_01_0700 : data : ' + JSON.stringify(data));
      AppStorage.setOrCreate<string>("stdResult12", data.stdResult);
      console.info('ACTS_AACommand_finish_01_0700 end');
    })

    await sleep(2000);

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s ' +
      'class AACommandTest#ACTS_AACommand_finish_01_0100 -s unittest OpenHarmonyTestRunner';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.log('ACTS_AACommand_finish_01_0100 - executeShellCommand: start ');
      console.log('ACTS_AACommand_finish_01_0100 start err: ' + JSON.stringify(err));
      console.log('ACTS_AACommand_finish_01_0100 stdResult = ' + data.stdResult);
      AppStorage.setOrCreate<string>("stdResult13", data.stdResult);
      console.log('ACTS_AACommand_finish_01_0100 - executeShellCommand: end');
      await startAbilityTest('ACTS_AACommand_finish_01_0100', this.context);
    })

    await sleep(4000);

    cmd = 'aa dump -a';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.info('ACTS_AACommand_finish_01_0700 : err : ' + JSON.stringify(err));
      console.info('ACTS_AACommand_finish_01_0700 : data : ' + JSON.stringify(data));
      AppStorage.setOrCreate<string>("stdResult14", data.stdResult);
      console.info('ACTS_AACommand_finish_01_0700 end');
    })

    await sleep(2000);

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class ' +
      'AACommandTest#ACTS_AACommand_finish_01_0500 -s unittest OpenHarmonyTestRunner';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.log('ACTS_AACommand_finish_01_0500 - executeShellCommand: start ');
      console.log('ACTS_AACommand_finish_01_0500 start err: ' + JSON.stringify(err));
      console.log('ACTS_AACommand_finish_01_0500 stdResult = ' + data.stdResult);
      AppStorage.setOrCreate<string>("stdResult15", data.stdResult);
      console.log('ACTS_AACommand_finish_01_0500 - executeShellCommand: end');
      await startAbilityTest('ACTS_AACommand_finish_01_0500', this.context);
    })

    await sleep(4000);

    cmd = 'aa dump -a';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.info('ACTS_AACommand_finish_01_0500 : err : ' + JSON.stringify(err));
      console.info('ACTS_AACommand_finish_01_0500 : data : ' + JSON.stringify(data));
      AppStorage.setOrCreate<string>("stdResult16", data.stdResult);
      console.info('ACTS_AACommand_finish_01_0500 end');
    })

    await sleep(2000)

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s ' +
      'class AACommandTest#ACTS_AACommand_finish_01_0600 -s unittest OpenHarmonyTestRunner';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.log('ACTS_AACommand_finish_01_0600 - executeShellCommand: start ');
      console.log('ACTS_AACommand_finish_01_0600 start err: ' + JSON.stringify(err));
      console.log('ACTS_AACommand_finish_01_0600 stdResult = ' + data.stdResult);
      AppStorage.setOrCreate<string>("stdResult17", data.stdResult);
      console.log('ACTS_AACommand_finish_01_0600 - executeShellCommand: end');
      await startAbilityTest('ACTS_AACommand_finish_01_0600', this.context);
    })

    await sleep(4000);

    cmd = 'aa dump -a';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.info('ACTS_AACommand_finish_01_0600 : err : ' + JSON.stringify(err));
      console.info('ACTS_AACommand_finish_01_0600 : data : ' + JSON.stringify(data));
      AppStorage.setOrCreate<string>("stdResult18", data.stdResult);
      console.info('ACTS_AACommand_finish_01_0600 end');
    })

    await sleep(2000);

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s ' +
      'class AACommandTest#ACTS_AACommand_finish_01_0900 -s unittest OpenHarmonyTestRunner';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.log('ACTS_AACommand_finish_01_0900 - executeShellCommand: start ');
      console.log('ACTS_AACommand_finish_01_0900 start err: ' + JSON.stringify(err));
      console.log('ACTS_AACommand_finish_01_0900 stdResult = ' + data.stdResult);
      AppStorage.setOrCreate<string>("stdResult19", data.stdResult);
      console.log('ACTS_AACommand_finish_01_0900 - executeShellCommand: end');
      await startAbilityTest('ACTS_AACommand_finish_01_0900', this.context);
    })

    await sleep(4000);

    cmd = 'aa dump -a';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.info('ACTS_AACommand_finish_01_0900 : err : ' + JSON.stringify(err));
      console.info('ACTS_AACommand_finish_01_0900 : data : ' + JSON.stringify(data));
      AppStorage.setOrCreate<string>("stdResult20", data.stdResult);
      console.info('ACTS_AACommand_finish_01_0900 end');
    })

    await sleep(2000);

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap ' +
      '-s class AACommandTest#ACTS_AACommand_finish_01_1300 -s unittest OpenHarmonyTestRunner';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.log('ACTS_AACommand_finish_01_1300 - executeShellCommand: start ');
      console.log('ACTS_AACommand_finish_01_1300 start err: ' + JSON.stringify(err));
      console.log('ACTS_AACommand_finish_01_1300 stdResult = ' + data.stdResult);
      AppStorage.setOrCreate<string>("stdResult23", data.stdResult);
      console.log('ACTS_AACommand_finish_01_1300 - executeShellCommand: end');
      await startAbilityTest('ACTS_AACommand_finish_01_1300', this.context);
    })

    await sleep(4000);

    cmd = 'aa dump -a';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.info('ACTS_AACommand_finish_01_1300 : err : ' + JSON.stringify(err));
      console.info('ACTS_AACommand_finish_01_1300 : data : ' + JSON.stringify(data));
      AppStorage.setOrCreate<string>("stdResult24", data.stdResult);
      console.info('ACTS_AACommand_finish_01_1300 end');
    })

    await sleep(2000);

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap ' +
      '-s class AACommandTest#ACTS_AACommand_finish_01_1400 -s unittest OpenHarmonyTestRunner';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.log('ACTS_AACommand_finish_01_1400 - executeShellCommand: start ');
      console.log('ACTS_AACommand_finish_01_1400 start err: ' + JSON.stringify(err));
      console.log('ACTS_AACommand_finish_01_1400 stdResult = ' + data.stdResult);
      AppStorage.setOrCreate<string>("stdResult25", data.stdResult);
      console.log('ACTS_AACommand_finish_01_1400 - executeShellCommand: end');
      await startAbilityTest('ACTS_AACommand_finish_01_1400', this.context);
    })

    await sleep(4000);

    cmd = 'aa dump -a';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.info('ACTS_AACommand_finish_01_1400 : err : ' + JSON.stringify(err));
      console.info('ACTS_AACommand_finish_01_1400 : data : ' + JSON.stringify(data));
      AppStorage.setOrCreate<string>("stdResult26", data.stdResult);
      console.info('ACTS_AACommand_finish_01_1400 end');
    })

    await sleep(2000);

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap ' +
      '-s class AACommandTest#ACTS_AACommand_finish_01_1500 -s unittest OpenHarmonyTestRunner';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.log('ACTS_AACommand_finish_01_1500 - executeShellCommand: start ');
      console.log('ACTS_AACommand_finish_01_1500 start err: ' + JSON.stringify(err));
      console.log('ACTS_AACommand_finish_01_1500 stdResult = ' + data.stdResult);
      AppStorage.setOrCreate<string>("stdResult27", data.stdResult);
      console.log('ACTS_AACommand_finish_01_1500 - executeShellCommand: end');
      await startAbilityTest('ACTS_AACommand_finish_01_1500', this.context);
    })

    await sleep(4000);

    cmd = 'aa dump -a';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.info('ACTS_AACommand_finish_01_1500 : err : ' + JSON.stringify(err));
      console.info('ACTS_AACommand_finish_01_1500 : data : ' + JSON.stringify(data));
      AppStorage.setOrCreate<string>("stdResult28", data.stdResult);
      console.info('ACTS_AACommand_finish_01_1500 end');
    })

    await sleep(2000);

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap ' +
      '-s class AACommandTest#ACTS_AACommand_finish_01_0300 -s unittest OpenHarmonyTestRunner';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.log('ACTS_AACommand_finish_01_0300 - executeShellCommand: start ');
      console.log('ACTS_AACommand_finish_01_0300 start err: ' + JSON.stringify(err));
      console.log('ACTS_AACommand_finish_01_0300 stdResult = ' + data.stdResult);
      console.log('ACTS_AACommand_finish_01_0300 - executeShellCommand: end');
      await startAbilityTest('ACTS_AACommand_finish_01_0300', this.context);
    })

    await sleep(2000);

    cmd = 'aa dump -a';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.info('ACTS_AACommand_finish_01_0300 : err : ' + JSON.stringify(err));
      console.info('ACTS_AACommand_finish_01_0300 : data : ' + JSON.stringify(data));
      AppStorage.setOrCreate<string>("stdResult30", data.stdResult);
      console.info('ACTS_AACommand_finish_01_0300 end');
    })

    await sleep(4000);

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap' +
      ' -s class AACommandTest#ACTS_AACommand_finish_01_1600 -s unittest OpenHarmonyTestRunner';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.log('ACTS_AACommand_finish_01_1600 - executeShellCommand: start ');
      console.log('ACTS_AACommand_finish_01_1600 start err: ' + JSON.stringify(err));
      console.log('ACTS_AACommand_finish_01_1600 stdResult = ' + data.stdResult);
      console.log('ACTS_AACommand_finish_01_1600 - executeShellCommand: end');
      await startAbilityTest('ACTS_AACommand_finish_01_1600', this.context);
    })

    await sleep(2000);

    cmd = 'aa dump -a';
    abilityDelegator.executeShellCommand(cmd, async (err: BusinessError, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      console.info('ACTS_AACommand_finish_01_1600 : err : ' + JSON.stringify(err));
      console.info('ACTS_AACommand_finish_01_1600 : data : ' + JSON.stringify(data));
      AppStorage.setOrCreate<string>("stdResult34", data.stdResult);
      console.info('ACTS_AACommand_finish_01_1600 end');
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