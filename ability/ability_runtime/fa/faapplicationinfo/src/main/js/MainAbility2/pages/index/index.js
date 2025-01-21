/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import commonEvent from '@ohos.commonEvent'
import featureAbility from '@ohos.ability.featureAbility'

let event = ''
let commonEventPublishData = ''

function PublishCallBackOne() {
    console.info("====>Publish CallBack SUB_AA_OpenHarmony_Want_0200_CommonEvent====>");
}
function PublishCallBackTwo() {
    console.info("====>Publish CallBack SUB_AA_OpenHarmony_Want_0300_CommonEvent====>");
}



export default {
    data: {
        title: ''
    },
    onInit() {
        this.title = this.$t('strings.world ApplicationMainAbility2');
    },
    onShow() {
        console.info('======Start MainAbility2 onShow======');
        featureAbility.getWant(
            (err, data) => {
                if (data.uri == '{true,true,false}'){
                    console.info("SUB_AA_OpenHarmony_Want_0200_StartAbility" + JSON
                    .stringify(data) + JSON.stringify(err));
                    event = data.uri
                    commonEventPublishData = {
                        data: event,
                    }
                    commonEvent.publish('SUB_AA_OpenHarmony_Want_0200_CommonEvent',
                    commonEventPublishData, PublishCallBackOne);
                } 
                if (data.type == 'MIMETYPE'){
                    console.info("SUB_AA_OpenHarmony_Want_0300_StartAbility" + JSON
                    .stringify(data) + JSON.stringify(err));
                    event = data.type
                    commonEventPublishData = {
                        data: event,
                    }
                    commonEvent.publish('SUB_AA_OpenHarmony_Want_0300_CommonEvent',
                    commonEventPublishData, PublishCallBackTwo);

                }
            }
        )
        featureAbility.terminateSelf((err, data)=>{
            console.debug('==========Terminate Ability Success==========')
        });
    },
    onReady() {
        console.info('ApplicationInfo MainAbility2 onReady');
    },
}