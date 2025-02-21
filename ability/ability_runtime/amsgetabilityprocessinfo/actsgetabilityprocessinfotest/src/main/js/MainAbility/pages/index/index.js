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
import testsuite from '../../../test/List.test'

const injectRef = Object.getPrototypeOf(global) || global
injectRef.regeneratorRuntime = require('@babel/runtime/regenerator')

export default {
    data: {
        title: "",
        testTime: 0
    },
    onInit() {
        console.info('ActsProcessManageJsTest onInit');
        this.title = this.$t('strings.world');
    },
    onShow() {
        console.info('ActsProcessManageJsTest onShow');
        console.info('ActsProcessManageJsTest testTime' + this.testTime);
        if (this.testTime == 0) {
            var abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
            var abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
            console.info('start run testcase!!!')
            Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
        }
        this.testTime++;
    },
    onReady() {
        console.info('ActsProcessManageJsTest onReady');
    },
    onActive() {
        console.info('ActsProcessManageJsTest onActive');
    },
    onInactive() {
        console.info('ActsProcessManageJsTest onInactive');
    },
    onHide() {
        console.info('ActsProcessManageJsTest onHide');
    },
    onDestroy() {
        console.info('ActsProcessManageJsTest onDestroy');
    },
    onBackPress() {
        console.info('ActsProcessManageJsTest onBackPress');
    },
    onNewRequest() {
        console.info('ActsProcessManageJsTest onNewRequest');
    },
    onStartContinuation() {
        console.info('ActsProcessManageJsTest onStartContinuation');
    },
    onSaveData(value) {
        console.info('ActsProcessManageJsTest onSaveData:' + JSON.stringify(value));
    },
    onRestoreData(value) {
        console.info('ActsProcessManageJsTest onRestoreData:' + JSON.stringify(value));
    },
    onCompleteContinuation(code) {
        console.info('ActsProcessManageJsTest onCompleteContinuation:' + JSON.stringify(code));
    },
    onConfigurationUpdated(configuration) {
        console.info('ActsProcessManageJsTest onConfigurationUpdated:' + JSON.stringify(configuration));
    }
}
