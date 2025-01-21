import FormExtension from '@ohos.app.form.FormExtensionAbility';
import formBindingData from '@ohos.application.formBindingData';
import formInfo from '@ohos.application.formInfo';

export default class FormAbility extends FormExtension {
    onCreate(want) {
        // Called to return a FormBindingData object.
        let formData = {};
        return formBindingData.createFormBindingData(formData);
    }

    onCastToNormal(formId) {
        // Called when the form provider is notified that a temporary form is successfully
        // converted to a normal form.
    }

    onUpdate(formId) {
        // Called to notify the form provider to update a specified form.
    }

    onVisibilityChange(newStatus) {
        // Called when the form provider receives form events from the system.
    }

    onEvent(formId, message) {
        // Called when a specified message event defined by the form provider is triggered.
    }

    onDestroy(formId) {
        // Called to notify the form provider that a specified form has been destroyed.
    }

    onAcquireFormState(want) {
        // Called to return a {@link FormState} object.
        return formInfo.FormState.READY;
    }
};