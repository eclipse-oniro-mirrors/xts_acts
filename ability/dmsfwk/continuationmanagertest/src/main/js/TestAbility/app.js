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

import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import { Hypium } from '@ohos/hypium'
import { UiDriver, BY } from '@ohos.UiTest'
import testsuite from '../test/List.test'

import featureAbility from '@ohos.ability.featureAbility';

async function requestPermission() {
    try {
        let context = featureAbility.getContext();
        await context.requestPermissionsFromUser(['ohos.permission.DISTRIBUTED_DATASYNC'], 666, (data) => {
            console.info('TestApplication requestPermission data: ' + JSON.stringify(data));
        });
    } catch (err) {
        console.error('TestApplication permission' + JSON.stringify(err));
    }
}

async function clickPermission(driver) {
    console.info("clickPermission begin");
    await driver.delayMs(2000);

    var data_sync_allow = await driver.findComponent(BY.text("允许"))
    await driver.delayMs(1000)
    var wait_count = 0
    while (data_sync_allow == null || data_sync_allow == undefined) {
        data_sync_allow = await driver.findComponent(BY.text("允许"))
        wait_count += 1
        await driver.delayMs(1000)
        if (wait_count == 15) {
            break
        }
    }
    if (data_sync_allow == null) {
        console.info('应用非首次开启')
    } else {
        await data_sync_allow.click()
        console.log('点击多设备授权框的允许按钮')
    }
}

export default {
    onCreate() {
        console.info('TestApplication onCreate')
        var abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        var abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
        console.info('start run testcase!!!')
        Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
        var driver = UiDriver.create()
        requestPermission()
        clickPermission(driver)
    },
    onDestroy() {
        console.info("TestApplication onDestroy");
    }
};
