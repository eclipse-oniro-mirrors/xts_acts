import formBindingData from '@ohos.application.formBindingData'
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
        var commonEventPublishData = {
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
        var commonEventPublishData = {
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

        var commonEventPublishData = {
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

        var commonEventPublishData = {
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
        var commonEventPublishData = {
            parameters: {
                "kind" : "onDestroy",
                "parameters" : formId,
                "data" : ""
            }
        };
        commonEvent.publish(supplyForm_Event, commonEventPublishData, publishCallBack);
    }
};