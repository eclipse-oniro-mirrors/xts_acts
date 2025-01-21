/*
 * Copyright (C) 2021-2023 Huawei Device Co., Ltd.
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

export default {
    data:{
        title:""
    },
    onInit() {
        this.title = this.$t('strings.world');
    },
    onShow() {
        let canvas1 = this.$refs.canvas1;
        let canvas2 = this.$refs.canvas2;
        global.gl = canvas1.getContext('webgl', {antialias: true, alpha: true, depth: true});
        global.gl2 = canvas2.getContext('webgl2', {antialias: true, alpha: true, depth: true});
        var abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        var abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
        console.info('start run testcase!!!')
        Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
    }
}
