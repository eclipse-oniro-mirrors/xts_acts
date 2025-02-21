/*
* Copyright (c) 2024 Huawei Device Co., Ltd.
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
        bundleName: "com.acts.abilitytoolfinishtest",
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

        cmd = 'aa test -m entry_test -b com.acts.abilitytoolrely -s ' +
            'class AbilityToolRelyTest#SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20600 -s unittest OpenHarmonyTestRunner'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.log('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20600 start err: ' + JSON.stringify(err))
            console.log('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20600 stdResult = ' + data.stdResult)
            await startAbilityTest('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20600', this.context);
        })

        await sleep(4000)

        cmd = 'ps -ef | grep com.acts.abilitytoolrely'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20600 : err : ' + JSON.stringify(err));
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20600 : data : ' + JSON.stringify(data));
            globalThis.stdResult206 = data.stdResult;
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20600 end');
        })

        await sleep(2000)

        cmd = 'aa test -m entry_test -b com.acts.abilitytoolrely -s class ' +
            'AbilityToolRelyTest#SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20700 -s unittest OpenHarmonyTestRunner'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.log('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20700 start err: ' + JSON.stringify(err))
            console.log('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20700 stdResult = ' + data.stdResult)
            await startAbilityTest('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20700', this.context);
        })

        await sleep(4000)

        cmd = 'ps -ef | grep com.acts.abilitytoolrely'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20700 : err : ' + JSON.stringify(err));
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20700 : data : ' + JSON.stringify(data));
            globalThis.stdResult207 = data.stdResult;
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20700 end');
        })

        await sleep(2000)

        cmd = 'aa test -m entry_test -b com.acts.abilitytoolrely -s ' +
            'class AbilityToolRelyTest#SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20800 -s unittest OpenHarmonyTestRunner'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.log('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20800 start err: ' + JSON.stringify(err))
            console.log('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20800 stdResult = ' + data.stdResult)
            await startAbilityTest('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20800', this.context);
        })

        await sleep(4000)

        cmd = 'ps -ef | grep com.acts.abilitytoolrely'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20800 : err : ' + JSON.stringify(err));
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20800 : data : ' + JSON.stringify(data));
            globalThis.stdResult208 = data.stdResult;
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20800 end');
        })

        await sleep(2000)

        cmd = 'aa test -m entry_test -b com.acts.abilitytoolrely -s class ' +
            'AbilityToolRelyTest#SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20900 -s unittest OpenHarmonyTestRunner'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.log('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20900 start err: ' + JSON.stringify(err))
            console.log('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20900 stdResult = ' + data.stdResult)
            await startAbilityTest('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20900', this.context);
        })

        await sleep(4000)

        cmd = 'ps -ef | grep com.acts.abilitytoolrely'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20900 : err : ' + JSON.stringify(err));
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20900 : data : ' + JSON.stringify(data));
            globalThis.stdResult209 = data.stdResult;
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20900 end');
        })

        await sleep(2000)

        cmd = 'aa test -m entry_test -b com.acts.abilitytoolrely -s ' +
            'class AbilityToolRelyTest#SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21000 -s unittest OpenHarmonyTestRunner'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.log('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21000 start err: ' + JSON.stringify(err))
            console.log('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21000 stdResult = ' + data.stdResult)
            await startAbilityTest('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21000', this.context);
        })

        await sleep(4000)

        cmd = 'ps -ef | grep com.acts.abilitytoolrely'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21000 : err : ' + JSON.stringify(err));
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21000 : data : ' + JSON.stringify(data));
            globalThis.stdResult210 = data.stdResult;
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21000 end');
        })

        await sleep(2000)

        cmd = 'aa test -m entry_test -b com.acts.abilitytoolrely -s ' +
            'class AbilityToolRelyTest#SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21300 -s unittest OpenHarmonyTestRunner'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.log('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21300 start err: ' + JSON.stringify(err))
            console.log('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21300 stdResult = ' + data.stdResult)
            await startAbilityTest('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21300', this.context);
        })

        await sleep(4000)

        cmd = 'ps -ef | grep com.acts.abilitytoolrely'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21300 : err : ' + JSON.stringify(err));
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21300 : data : ' + JSON.stringify(data));
            globalThis.stdResult213 = data.stdResult;
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21300 end');
        })

        await sleep(2000)

        cmd = 'aa test -m entry_test -b com.acts.abilitytoolrely ' +
            '-s class AbilityToolRelyTest#SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21400 -s unittest OpenHarmonyTestRunner'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.log('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21400 start err: ' + JSON.stringify(err))
            console.log('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21400 stdResult = ' + data.stdResult)
            await startAbilityTest('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21400', this.context);
        })

        await sleep(4000)

        cmd = 'ps -ef | grep com.acts.abilitytoolrely'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21400 : err : ' + JSON.stringify(err));
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21400 : data : ' + JSON.stringify(data));
            globalThis.stdResult214 = data.stdResult;
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21400 end');
        })

        await sleep(2000)

        cmd = 'aa test -m entry_test -b com.acts.abilitytoolrely ' +
            '-s class AbilityToolRelyTest#SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21500 -s unittest OpenHarmonyTestRunner'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.log('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21500 start err: ' + JSON.stringify(err))
            console.log('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21500 stdResult = ' + data.stdResult)
            await startAbilityTest('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21500', this.context);
        })

        await sleep(4000)

        cmd = 'ps -ef | grep com.acts.abilitytoolrely'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21500 : err : ' + JSON.stringify(err));
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21500 : data : ' + JSON.stringify(data));
            globalThis.stdResult215 = data.stdResult;
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21500 end');
        })

        await sleep(2000)

        cmd = 'aa test -m entry_test -b com.acts.abilitytoolrely ' +
            '-s class AbilityToolRelyTest#SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21600 -s unittest OpenHarmonyTestRunner'
        abilityDelegator.executeShellCommand(cmd, async  (err, data) => {
            console.log('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21600 start err: ' + JSON.stringify(err))
            console.log('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21600 stdResult = ' + data.stdResult)
            await startAbilityTest('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21600', this.context);
        })

        await sleep(4000)

        cmd = 'ps -ef | grep com.acts.abilitytoolrely'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21600 : err : ' + JSON.stringify(err));
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21600 : data : ' + JSON.stringify(data));
            globalThis.stdResult216 = data.stdResult;
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21600 end');
        })

        await sleep(2000)

        cmd = 'aa test -m entry_test -b com.acts.abilitytoolrely ' +
            '-s class AbilityToolRelyTest#SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21700 -s unittest OpenHarmonyTestRunner'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.log('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21700 start err: ' + JSON.stringify(err))
            console.log('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21700 stdResult = ' + data.stdResult)
            await startAbilityTest('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21700', this.context);
        })

        await sleep(4000)

        cmd = 'ps -ef | grep com.acts.abilitytoolrely'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21700 : err : ' + JSON.stringify(err));
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21700 : data : ' + JSON.stringify(data));
            globalThis.stdResult217 = data.stdResult;
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21700 end');
        })

        await sleep(2000)

        cmd = 'aa test -m entry_test -b com.acts.abilitytoolrely ' +
            '-s class AbilityToolRelyTest#SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21800 -s unittest OpenHarmonyTestRunner'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.log('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21800 start err: ' + JSON.stringify(err))
            console.log('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21800 stdResult = ' + data.stdResult)
            await startAbilityTest('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21800', this.context);
        })

        await sleep(4000)

        cmd = 'ps -ef | grep com.acts.abilitytoolrely'
        abilityDelegator.executeShellCommand(cmd, async (err, data) => {
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21800 : err : ' + JSON.stringify(err));
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21800 : data : ' + JSON.stringify(data));
            globalThis.stdResult218 = data.stdResult;
            console.info('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21800 end');
        })

        await sleep(2000)

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