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

import Ability from '@ohos.app.ability.UIAbility'
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import { Hypium } from '@ohos/hypium'
import testsuite from '../test/List.test'

async function startAbilityTest(TAG, context) {
    let wantInfo = {
        bundleName: "com.example.aacommandtest",
        abilityName: "MainAbility"
    }
    await context.startAbility(wantInfo).then((data) => {
        console.log(TAG + "startAbility data : " + JSON.stringify(data));
    }).catch((err) => {
        console.log(TAG + "startAbility err : " + JSON.stringify(err));
    })
}

export default class MainAbility extends Ability {
    async onCreate(want, launchParam) {
        globalThis.abilityContext = this.context;
        console.log('MainAbility onCreate')
        let cmd: any
        let abilityDelegatorArguments: any
        let abilityDelegator: any

        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()

        cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s ' +
            'class AACommandTest#ACTS_AACommand_finish_01_0700 -s unittest OpenHarmonyTestRunner'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.log('ACTS_AACommand_finish_01_0700 start err: ' + JSON.stringify(err))
            console.log('ACTS_AACommand_finish_01_0700 stdResult = ' + data.stdResult)
            globalThis.stdResult1 = data.stdResult;
            console.log('ACTS_AACommand_finish_01_0700 - executeShellCommand: end ')
            await startAbilityTest('ACTS_AACommand_finish_01_0700', this.context);
        })

        await sleep(4000)

        cmd = 'aa dump -a'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.info('ACTS_AACommand_finish_01_0700 : err : ' + JSON.stringify(err));
            console.info('ACTS_AACommand_finish_01_0700 : data : ' + JSON.stringify(data));
            globalThis.stdResult2 = data["stdResult"];
            console.info('ACTS_AACommand_finish_01_0700 end');
        })

        await sleep(2000)

        cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class ' +
            'AACommandTest#ACTS_AACommand_finish_01_0400 -s unittest OpenHarmonyTestRunner'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.log('ACTS_AACommand_finish_01_0400 - executeShellCommand: start ')
            console.log('ACTS_AACommand_finish_01_0400 start err: ' + JSON.stringify(err))
            console.log('ACTS_AACommand_finish_01_0400 stdResult = ' + data.stdResult)
            globalThis.stdResult11 = data.stdResult;
            console.log('ACTS_AACommand_finish_01_0400 - executeShellCommand: end')
            await startAbilityTest('ACTS_AACommand_finish_01_0400', this.context);
        })

        await sleep(4000)

        cmd = 'aa dump -a'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.info('ACTS_AACommand_finish_01_0700 : err : ' + JSON.stringify(err));
            console.info('ACTS_AACommand_finish_01_0700 : data : ' + JSON.stringify(data));
            globalThis.stdResult12 = data["stdResult"];
            console.info('ACTS_AACommand_finish_01_0700 end');
        })

        await sleep(2000)

        cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s ' +
            'class AACommandTest#ACTS_AACommand_finish_01_0100 -s unittest OpenHarmonyTestRunner'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.log('ACTS_AACommand_finish_01_0100 - executeShellCommand: start ')
            console.log('ACTS_AACommand_finish_01_0100 start err: ' + JSON.stringify(err))
            console.log('ACTS_AACommand_finish_01_0100 stdResult = ' + data.stdResult)
            globalThis.stdResult13 = data.stdResult;
            console.log('ACTS_AACommand_finish_01_0100 - executeShellCommand: end')
            await startAbilityTest('ACTS_AACommand_finish_01_0100', this.context);
        })

        await sleep(4000)

        cmd = 'aa dump -a'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.info('ACTS_AACommand_finish_01_0700 : err : ' + JSON.stringify(err));
            console.info('ACTS_AACommand_finish_01_0700 : data : ' + JSON.stringify(data));
            globalThis.stdResult14 = data["stdResult"];
            console.info('ACTS_AACommand_finish_01_0700 end');
        })

        await sleep(2000)

        cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class ' +
            'AACommandTest#ACTS_AACommand_finish_01_0500 -s unittest OpenHarmonyTestRunner'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.log('ACTS_AACommand_finish_01_0500 - executeShellCommand: start ')
            console.log('ACTS_AACommand_finish_01_0500 start err: ' + JSON.stringify(err))
            console.log('ACTS_AACommand_finish_01_0500 stdResult = ' + data.stdResult)
            globalThis.stdResult15 = data.stdResult;
            console.log('ACTS_AACommand_finish_01_0500 - executeShellCommand: end')
            await startAbilityTest('ACTS_AACommand_finish_01_0500', this.context);
        })

        await sleep(4000)

        cmd = 'aa dump -a'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.info('ACTS_AACommand_finish_01_0500 : err : ' + JSON.stringify(err));
            console.info('ACTS_AACommand_finish_01_0500 : data : ' + JSON.stringify(data));
            globalThis.stdResult16 = data["stdResult"];
            console.info('ACTS_AACommand_finish_01_0500 end');
        })

        await sleep(2000)

        cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s ' +
            'class AACommandTest#ACTS_AACommand_finish_01_0600 -s unittest OpenHarmonyTestRunner'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.log('ACTS_AACommand_finish_01_0600 - executeShellCommand: start ')
            console.log('ACTS_AACommand_finish_01_0600 start err: ' + JSON.stringify(err))
            console.log('ACTS_AACommand_finish_01_0600 stdResult = ' + data.stdResult)
            globalThis.stdResult17 = data.stdResult;
            console.log('ACTS_AACommand_finish_01_0600 - executeShellCommand: end')
            await startAbilityTest('ACTS_AACommand_finish_01_0600', this.context);
        })

        await sleep(4000)

        cmd = 'aa dump -a'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.info('ACTS_AACommand_finish_01_0600 : err : ' + JSON.stringify(err));
            console.info('ACTS_AACommand_finish_01_0600 : data : ' + JSON.stringify(data));
            globalThis.stdResult18 = data["stdResult"];
            console.info('ACTS_AACommand_finish_01_0600 end');
        })

        await sleep(2000)

        cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s ' +
            'class AACommandTest#ACTS_AACommand_finish_01_0900 -s unittest OpenHarmonyTestRunner'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.log('ACTS_AACommand_finish_01_0900 - executeShellCommand: start ')
            console.log('ACTS_AACommand_finish_01_0900 start err: ' + JSON.stringify(err))
            console.log('ACTS_AACommand_finish_01_0900 stdResult = ' + data.stdResult)
            globalThis.stdResult19 = data.stdResult;
            console.log('ACTS_AACommand_finish_01_0900 - executeShellCommand: end')
            await startAbilityTest('ACTS_AACommand_finish_01_0900', this.context);
        })

        await sleep(4000)

        cmd = 'aa dump -a'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.info('ACTS_AACommand_finish_01_0900 : err : ' + JSON.stringify(err));
            console.info('ACTS_AACommand_finish_01_0900 : data : ' + JSON.stringify(data));
            globalThis.stdResult20 = data["stdResult"];
            console.info('ACTS_AACommand_finish_01_0900 end');
        })

        await sleep(2000)

        cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap ' +
            '-s class AACommandTest#ACTS_AACommand_finish_01_1300 -s unittest OpenHarmonyTestRunner'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.log('ACTS_AACommand_finish_01_1300 - executeShellCommand: start ')
            console.log('ACTS_AACommand_finish_01_1300 start err: ' + JSON.stringify(err))
            console.log('ACTS_AACommand_finish_01_1300 stdResult = ' + data.stdResult)
            globalThis.stdResult23 = data.stdResult;
            console.log('ACTS_AACommand_finish_01_1300 - executeShellCommand: end')
            await startAbilityTest('ACTS_AACommand_finish_01_1300', this.context);
        })

        await sleep(4000)

        cmd = 'aa dump -a'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.info('ACTS_AACommand_finish_01_1300 : err : ' + JSON.stringify(err));
            console.info('ACTS_AACommand_finish_01_1300 : data : ' + JSON.stringify(data));
            globalThis.stdResult24 = data["stdResult"];
            console.info('ACTS_AACommand_finish_01_1300 end');
        })

        await sleep(2000)

        cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap ' +
            '-s class AACommandTest#ACTS_AACommand_finish_01_1400 -s unittest OpenHarmonyTestRunner'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.log('ACTS_AACommand_finish_01_1400 - executeShellCommand: start ')
            console.log('ACTS_AACommand_finish_01_1400 start err: ' + JSON.stringify(err))
            console.log('ACTS_AACommand_finish_01_1400 stdResult = ' + data.stdResult)
            globalThis.stdResult25 = data.stdResult;
            console.log('ACTS_AACommand_finish_01_1400 - executeShellCommand: end')
            await startAbilityTest('ACTS_AACommand_finish_01_1400', this.context);
        })

        await sleep(4000)

        cmd = 'aa dump -a'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.info('ACTS_AACommand_finish_01_1400 : err : ' + JSON.stringify(err));
            console.info('ACTS_AACommand_finish_01_1400 : data : ' + JSON.stringify(data));
            globalThis.stdResult26 = data["stdResult"];
            console.info('ACTS_AACommand_finish_01_1400 end');
        })

        await sleep(2000)

        cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap ' +
            '-s class AACommandTest#ACTS_AACommand_finish_01_1500 -s unittest OpenHarmonyTestRunner'
        abilityDelegator.executeShellCommand(cmd, async  (err, data) => {
            console.log('ACTS_AACommand_finish_01_1500 - executeShellCommand: start ')
            console.log('ACTS_AACommand_finish_01_1500 start err: ' + JSON.stringify(err))
            console.log('ACTS_AACommand_finish_01_1500 stdResult = ' + data.stdResult)
            globalThis.stdResult27 = data.stdResult;
            console.log('ACTS_AACommand_finish_01_1500 - executeShellCommand: end')
            await startAbilityTest('ACTS_AACommand_finish_01_1500', this.context);
        })

        await sleep(4000)

        cmd = 'aa dump -a'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.info('ACTS_AACommand_finish_01_1500 : err : ' + JSON.stringify(err));
            console.info('ACTS_AACommand_finish_01_1500 : data : ' + JSON.stringify(data));
            globalThis.stdResult28 = data["stdResult"];
            console.info('ACTS_AACommand_finish_01_1500 end');
        })

        await sleep(2000)

        cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap ' +
            '-s class AACommandTest#ACTS_AACommand_finish_01_0300 -s unittest OpenHarmonyTestRunner'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.log('ACTS_AACommand_finish_01_0300 - executeShellCommand: start ')
            console.log('ACTS_AACommand_finish_01_0300 start err: ' + JSON.stringify(err))
            console.log('ACTS_AACommand_finish_01_0300 stdResult = ' + data.stdResult)
            console.log('ACTS_AACommand_finish_01_0300 - executeShellCommand: end')
            await startAbilityTest('ACTS_AACommand_finish_01_0300', this.context);
        })

        await sleep(2000)

        cmd = 'aa dump -a'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.info('ACTS_AACommand_finish_01_0300 : err : ' + JSON.stringify(err));
            console.info('ACTS_AACommand_finish_01_0300 : data : ' + JSON.stringify(data));
            globalThis.stdResult30 = data["stdResult"];
            console.info('ACTS_AACommand_finish_01_0300 end');
        })

        await sleep(4000)

        cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap' +
            ' -s class AACommandTest#ACTS_AACommand_finish_01_1600 -s unittest OpenHarmonyTestRunner'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.log('ACTS_AACommand_finish_01_1600 - executeShellCommand: start ')
            console.log('ACTS_AACommand_finish_01_1600 start err: ' + JSON.stringify(err))
            console.log('ACTS_AACommand_finish_01_1600 stdResult = ' + data.stdResult)
            console.log('ACTS_AACommand_finish_01_1600 - executeShellCommand: end')
            await startAbilityTest('ACTS_AACommand_finish_01_1600', this.context);
        })

        await sleep(2000)

        cmd = 'aa dump -a'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.info('ACTS_AACommand_finish_01_1600 : err : ' + JSON.stringify(err));
            console.info('ACTS_AACommand_finish_01_1600 : data : ' + JSON.stringify(data));
            globalThis.stdResult34 = data["stdResult"];
            console.info('ACTS_AACommand_finish_01_1600 end');
        })

        setTimeout(() => {
            Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
        }, 6000)
    }

    onDestroy() {
        console.log('MainAbility onDestroy')
    }

    onWindowStageCreate(windowStage) {
        console.log('MainAbility onWindowStageCreate')
        windowStage.setUIContent(this.context, 'pages/index', null)
    }

    onWindowStageDestroy() {
        console.log('MainAbility onWindowStageDestroy')
    }

    onForeground() {
        console.log('MainAbility onForeground')
    }

    onBackground() {
        console.log('MainAbility onBackground')
    }
};