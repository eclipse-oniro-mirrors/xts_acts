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
import commonEvent from '@ohos.commonEvent'

export default class MainAbility extends Ability {
    onCreate(want, launchParam) {
        console.info('ActsStageContextAssistOne MainAbility3 onCreate')
    }

    onDestroy() {
        console.info('ActsStageContextAssistOne MainAbility3 onDestroy')
    }

    onWindowStageCreate(windowStage) {
        console.info('ActsStageContextAssistOne MainAbility3 onWindowStageCreate')
        windowStage.setUIContent(this.context, 'pages/index', null)
    }

    onWindowStageDestroy() {
        console.info('ActsStageContextAssistOne MainAbility3 onWindowStageDestroy')
    }

    onForeground() {
        console.info('ActsStageContextAssistOne MainAbility3 onForeground')
        globalThis.abilityContextA = this.context
        commonEvent.publish("StartMainAbility3_CommonEvent_ContextOne", () => {
            console.log("Publish StartMainAbility3_CommonEvent_ContextOne callback")
        })
    }

    onBackground() {
        console.info('ActsStageContextAssistOne MainAbility3 onBackground')
    }
};