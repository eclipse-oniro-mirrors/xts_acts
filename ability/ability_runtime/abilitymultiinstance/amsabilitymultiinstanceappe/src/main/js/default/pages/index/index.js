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
import featureAbility from '@ohos.ability.featureAbility'
import commonEvent from '@ohos.commonEvent'

const injectRef = Object.getPrototypeOf(global) || global
injectRef.regeneratorRuntime = require('@babel/runtime/regenerator')
var callBackSeq = "";

function publishCallBack() {
    console.debug("====>AbilityMultiInstanceAppB Publish CallBack ====>");
}

async function startAbilityProcess(parameters) {
    let bundleName = "com.example.amsabilitymultiinstanceappa";
    let abilityName = "com.example.amsabilitymultiinstanceappa.MainAbility";

    let idx = parameters.nextStep;
    switch (parameters.step[idx]) {
        case "StartA1":
            parameters.startId = 1;
            break;
        case "StartA2":
            parameters.startId = 2;
            break;
        case "StartB":
            bundleName = "com.example.amsabilitymultiinstanceappb";
            abilityName = "com.example.amsabilitymultiinstanceappb.MainAbility";
            break;
        case "StartC":
            bundleName = "com.example.amsabilitymultiinstanceappc";
            abilityName = "com.example.amsabilitymultiinstanceappc.MainAbility";
            break;
        case "StartDMain1":
            bundleName = "com.example.amsabilitymultiinstanceappd";
            abilityName = "com.example.amsabilitymultiinstanceappd.MainAbility";
            parameters.startId = 1;
            break;
        case "StartDMain2":
            bundleName = "com.example.amsabilitymultiinstanceappd";
            abilityName = "com.example.amsabilitymultiinstanceappd.MainAbility";
            parameters.startId = 2;
            break;
        case "StartDSec":
            bundleName = "com.example.amsabilitymultiinstanceappd";
            abilityName = "com.example.amsabilitymultiinstanceappd.SecondAbility";
            break;
        case "StartDThd":
            bundleName = "com.example.amsabilitymultiinstanceappd";
            abilityName = "com.example.amsabilitymultiinstanceappd.ThirdAbility";
            break;
        case "StartE":
            bundleName = "com.example.amsabilitymultiinstanceappe";
            abilityName = "com.example.amsabilitymultiinstanceappe.MainAbility";
            break;

        default:
            break;
    }
    parameters.nextStep = ++idx;
    await featureAbility.startAbility({
        want:
        {
            bundleName: bundleName,
            abilityName: abilityName,
            parameters: parameters
        }
    });
}

async function onShowProcess() {
    var abilityWant = await featureAbility.getWant();
    var callBackData = "AppE:";
    callBackData += callBackSeq;
    var commonEventPublishData = {
        data: callBackData,
        parameters: abilityWant.parameters
    };
    if (abilityWant.parameters.nextStep >= abilityWant.parameters.stepNum) {
        commonEvent.publish("MultiInstanceStartFinish", commonEventPublishData, publishCallBack);
    } else {
        commonEvent.publish("MultiInstanceStartNext", commonEventPublishData, () => {
            startAbilityProcess(abilityWant.parameters);
        });
    }
    callBackSeq = "";
}

export default {
    data: {
        title: "AbilityMultiInstanceAppE"
    },
    onInit() {
        this.title = "AbilityMultiInstanceAppE";
        callBackSeq += "onInit";
        onShowProcess();
    },
    onStart() {
        console.log('AbilityMultiInstanceAppE onStart');
    },
    onStop() {
        console.log('AbilityMultiInstanceAppE onStop');
    },
}
