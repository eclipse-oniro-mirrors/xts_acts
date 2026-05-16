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

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

import { TestRunner } from '@kit.TestKit';
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog';
import { ShellCmdResult } from 'application.shellCmdResult';
import { Hypium } from '../../../hypium/index';
import testsuite from '../test/List.test';
import { globalThis } from '../test/Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export class OpenHarmonyTestRunner implements TestRunner {
  constructor() {}

  public onPrepare: () => void = () => {
    hilog.info(domain, tag, '%{public}s', 'OpenHarmonyTestRunner OnPrepare');
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  }

  public onRun: () => void = () => {
    hilog.info(domain, tag, '%{public}s', 'OpenHarmonyTestRunner onRun');

    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    hilog.info(domain, tag, '%{public}s', 'start run testcase!!!');
    let cmd = 'aa start -d 0 -a EntryAbility' + ' -b ' + abilityDelegatorArguments.bundleName
    let debug = abilityDelegatorArguments.parameters['-D']
    if (debug == 'true') {
      cmd += ' -D'
    }
    setTimeout(() => {
      hilog.info(domain, tag, '%{public}s', 'hypiumTest start');
      globalThis.abilityContext = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
      Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
    }, 5000)
    abilityDelegator.executeShellCommand(cmd, (err: BusinessError<void> | null, d: ShellCmdResult | undefined) => {
      hilog.info(0x0000, 'testTag', 'executeShellCommand : err : %{public}s', JSON.stringify(err) ?? '');
      hilog.info(0x0000, 'testTag', 'executeShellCommand : data : %{public}s', d?.stdResult ?? '');
      hilog.info(0x0000, 'testTag', 'executeShellCommand : data : %{public}s', d?.exitCode ?? '');
    })
    hilog.info(domain, tag, '%{public}s', 'OpenHarmonyTestRunner onRun end');
  }
}
