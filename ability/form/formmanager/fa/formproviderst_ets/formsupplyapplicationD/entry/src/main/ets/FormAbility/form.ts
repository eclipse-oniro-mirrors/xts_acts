/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import formBindingData from '@ohos.application.formBindingData'
import formProvider from '@ohos.application.formProvider'
import commonEvent from '@ohos.commonEvent'

let supplyForm_Event = "FMS_FormSupply_commonEvent";

function publishCallBack() {
    console.info("!!!====>FormAbility publishCallBack====>");
}

export default {
    onCreate(want) {
        console.info('FormAbility onCreate, want:' + JSON.stringify(want));
        let formData = {
            temperature: "11°",
            time: "11:00",
            area: "Shenyang",
            epidemic: true,
            count: 10
        };
        let bindingData = formBindingData.createFormBindingData(formData);
        let commonEventPublishData = {
            parameters: {
                "kind" : "onCreate",
                "parameters" : JSON.stringify(want),
                "data" : JSON.stringify(formData)
            }
        };
        commonEvent.publish(supplyForm_Event, commonEventPublishData, publishCallBack);
        return bindingData;
    },
    onUpdate(formId) {
        console.info('FormAbility onUpdate, formId: ' + formId);
        let commonEventPublishData = {
            parameters: {
                "kind" : "onUpdate",
                "parameters" : formId,
                "data" : ""
            }
        };
        commonEvent.publish(supplyForm_Event, commonEventPublishData, publishCallBack);
    },
    onCastToNormal(formId) {
        console.info('FormAbility onCastTemp, formId: ' + formId);

        let commonEventPublishData = {
            parameters: {
                "kind" : "onCastToNormal",
                "parameters" : formId,
                "data" : ""
            }
        };
        commonEvent.publish(supplyForm_Event, commonEventPublishData, publishCallBack);
    },
    onEvent(formId, message) {
        console.info('FormAbility onTriggerEvent, formId: ' + formId + 'message: ' + message);

        let commonEventPublishData = {
            parameters: {
                "kind" : "onEvent",
                "parameters" : formId,
                "data" : message
            }
        };
        commonEvent.publish(supplyForm_Event, commonEventPublishData, publishCallBack);
    },
    onVisibilityChange(formEvents) {
        console.info('FormAbility onVisibilityChanged, ' + JSON.stringify(formEvents));
        var commonEventPublishData = {
            parameters: {
                "kind" : "onVisibilityChange",
                "parameters" : JSON.stringify(formEvents),
                "data" : ""
            }
        };
        commonEvent.publish(supplyForm_Event, commonEventPublishData, publishCallBack);
    },
    onDestroy(formId) {
        console.info('FormAbility onDestroy, formId: ' + formId);
        let commonEventPublishData = {
            parameters: {
                "kind" : "onDestroy",
                "parameters" : formId,
                "data" : ""
            }
        };
        commonEvent.publish(supplyForm_Event, commonEventPublishData, publishCallBack);
    }
};