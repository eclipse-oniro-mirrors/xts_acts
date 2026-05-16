/**
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

import FormExtension from '@ohos.app.form.FormExtensionAbility';
import formBindingData from '@ohos.application.formBindingData';

export default class ServiceAbility extends FormExtension {
    onAddForm(want) {
        console.info('qianyiyingyong ServiceAbility onCreate');
        let formData = {};
        return formBindingData.createFormBindingData(formData);
    }

    onRequest(want, startId) {
        console.info('qianyiyingyong ServiceAbility onRequest');
    }

    onRemoveForm(formId) {
        console.info('qianyiyingyong ServiceAbility onDestroy');
    }
};