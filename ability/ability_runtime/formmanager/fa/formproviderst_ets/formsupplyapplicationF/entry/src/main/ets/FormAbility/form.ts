import commonEvent from '@ohos.commonEvent';
import formBindingData from '@ohos.application.formBindingData';
import formProvider from '@ohos.application.formProvider';
import systemTime from '@ohos.systemTime';

let supplyForm_Event = "FMS_FormSupply_commonEvent";

function publishCallBack() {
    console.info("!!!====>FormAbility publishCallBack====>");
}

export default {
    async onCreate(want) {
        const time = await systemTime.getCurrentTime();
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
                "kind": "onCreate",
                "parameters": JSON.stringify(want),
                "data": JSON.stringify(formData),
                "time": time
            }
        };
        console.info(`FormAbility data ${JSON.stringify(commonEventPublishData)}`);
        commonEvent.publish(supplyForm_Event, commonEventPublishData, publishCallBack);
        return bindingData;
    },
    async onUpdate(formId) {
        const time = await systemTime.getCurrentTime();
        console.info('FormAbility onUpdate, formId: ' + formId);
        var commonEventPublishData = {
            parameters: {
                "kind": "onUpdate",
                "parameters": formId,
                "data": "",
                "time": time
            }
        };
        commonEvent.publish(supplyForm_Event, commonEventPublishData, publishCallBack);
    },
    async onCastToNormal(formId) {
        const time = await systemTime.getCurrentTime();
        console.info('FormAbility onCastTemp, formId: ' + formId);
        var commonEventPublishData = {
            parameters: {
                "kind": "onCastToNormal",
                "parameters": formId,
                "data": "",
                "time": time
            }
        };
        commonEvent.publish(supplyForm_Event, commonEventPublishData, publishCallBack);
    },
    async onEvent(formId, message) {
        const time = await systemTime.getCurrentTime();
        console.info('FormAbility onTriggerEvent, formId: ' + formId + 'message: ' + message);
        var commonEventPublishData = {
            parameters: {
                "kind": "onEvent",
                "parameters": formId,
                "data": message,
                "time": time
            }
        };
        commonEvent.publish(supplyForm_Event, commonEventPublishData, publishCallBack);
    },
    async onVisibilityChange(formEvents) {
        const time = await systemTime.getCurrentTime();
        console.info('FormAbility onVisibilityChanged, ' + JSON.stringify(formEvents));
        var commonEventPublishData = {
            parameters: {
                "kind": "onVisibilityChange",
                "parameters": JSON.stringify(formEvents),
                "data": "",
                "time": time
            }
        };
        commonEvent.publish(supplyForm_Event, commonEventPublishData, publishCallBack);

        for (let key in formEvents) {
            const value = formEvents[key];
            key = key.toString();
            console.log('form_extension onVisibilityChange, key:' + key + ", value=" + value);
            let dataObj = {
                temperature: "22°",
                time: "22:00",
                test: 22,
            };
            let obj = formBindingData.createFormBindingData(dataObj);

            const updateFormStartTime = await systemTime.getCurrentTime();
            let data = await formProvider.updateForm(key, obj);
            console.info('FormAbility onUpdateForm, res: ' + data);
            const updateFormEndTime = await systemTime.getCurrentTime();

            commonEventPublishData = {
                parameters: {
                    "kind": "onUpdateForm",
                    "parameters": key,
                    "data": "",
                    "time": updateFormEndTime - updateFormStartTime
                }
            };
            commonEvent.publish(supplyForm_Event, commonEventPublishData, publishCallBack);

            const setFormNextRefreshTimeStartTime = await systemTime.getCurrentTime();
            data = await formProvider.setFormNextRefreshTime(key, 5);
            console.info('FormAbility setFormNextRefreshTime, res: ' + data);
            const setFormNextRefreshTimeEndTime = await systemTime.getCurrentTime();

            commonEventPublishData = {
                parameters: {
                    "kind": "onSetFormNextRefreshTime",
                    "parameters": key,
                    "data": "",
                    "time": setFormNextRefreshTimeEndTime - setFormNextRefreshTimeStartTime
                }
            };
            commonEvent.publish(supplyForm_Event, commonEventPublishData, publishCallBack);
        }
    },
    async onDestroy(formId) {
        const time = await systemTime.getCurrentTime();
        console.info('FormAbility onDestroy, formId: ' + formId);
        var commonEventPublishData = {
            parameters: {
                "kind": "onDestroy",
                "parameters": formId,
                "data": "",
                "time": time
            }
        };
        commonEvent.publish(supplyForm_Event, commonEventPublishData, publishCallBack);
    }
};
