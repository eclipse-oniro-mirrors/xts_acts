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
import { Hypium, Level } from '@ohos/hypium'
import testsuite from '../test/List.test'
import window from '@ohos.window';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';

export default class TestAbility extends Ability {
    onCreate(want:Want, launchParam:AbilityConstant.LaunchParam) {
        console.log('TestAbility onCreate')
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
        console.info('start run testcase!!!')
        Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
    }

    onDestroy() {
        console.log('TestAbility onDestroy')
    }

    onWindowStageCreate(windowStage:window.WindowStage) {
        console.log('TestAbility onWindowStageCreate')
        windowStage.loadContent('TestAbility/pages/index', null)

        globalThis.abilityContext = this.context;
    }

    onWindowStageDestroy() {
        console.log('TestAbility onWindowStageDestroy')
    }

    onForeground() {
        console.log('TestAbility onForeground')
    }

    onBackground() {
        console.log('TestAbility onBackground')
    }
};