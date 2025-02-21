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
import commonEvent from "@ohos.commonEvent"
import particleAbility from '@ohos.ability.particleAbility'
export default {
    onStart() {
        console.info('ServiceAbility onStart');
        commonEvent.publish("ACTS_InterfaceMultiUsers_0100_Start_CommonEvent", () => {
            console.log(" Publish ACTS_InterfaceMultiUsersExtension_CommonEvent callback")
            particleAbility.terminateSelf().then(() => {
                console.log('terminateSelf promise');
                commonEvent.publish("ACTS_TerminateSelf_CommonEvent", () => {
                    console.log(" Publish ACTS_TerminateSelf_CommonEvent callback")
                })
            });
        })
    },
    onStop() {
        console.info('ServiceAbility onStop');
    },
    onCommand(want, startId) {
        console.info('ServiceAbility onCommand');
    }
};