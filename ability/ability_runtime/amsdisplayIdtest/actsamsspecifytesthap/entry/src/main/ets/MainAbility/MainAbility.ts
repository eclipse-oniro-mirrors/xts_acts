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

var callBackSeq = "";

function publishCallBack() {
    console.debug("====>Publish CallBack ====>");
}

async function startAbilityProcess(abilityContext, options, parameters) {
    let bundleName;
    let abilityName;

    let idx = parameters.nextStep;
    switch (parameters.step[idx]) {
        case "testA":
            bundleName = "com.example.actsspecifytesthap";
            abilityName = "com.example.actsspecifytesthap.MainAbility";
            break;
        default:
            break;
    }
    parameters.nextStep = ++idx;
    abilityContext.startAbility({
        bundleName: bundleName,
        abilityName: abilityName,
        parameters: parameters,
    }, options, (error, data) => {
        console.log('startAbilityProcess result: ' + JSON.stringify(error) + ", " + JSON.stringify(data))
    })
}

async function onShowProcess() {
    var abilityWant = globalThis.abilityWant;
    var callBackData = "actsspecifytesthap:"
    callBackData += callBackSeq;

    var commonEventPublishData = {
        data: callBackData,
        parameters: {
            displayId: globalThis.abilityWant.parameters['ohos.aafwk.param.displayId'],
        }
    };

    console.log("AbilityMultiInstanceAppA abilityWant = " + JSON.stringify(abilityWant));
    if (abilityWant.parameters.nextStep >= abilityWant.parameters.stepNum) {
        commonEvent.publish("MultiInstanceStartFinish", commonEventPublishData, () => {
            console.log('============>querytestsecond success==========>>')
            callBackSeq = "";
        });
    } else {
        commonEvent.publish("MultiInstanceStartNext", commonEventPublishData, () => {
            callBackSeq = "";
            console.log('============>querytest success==========>>')
            startAbilityProcess(globalThis.abilityContext, globalThis.abilityWant.options, abilityWant.parameters);
        });
    }
}

export default class MainAbility extends Ability {
    onCreate(want, launchParam) {
        // Ability is creating, initialize resources for this ability
        console.log("actsspecifytesthap onCreate")
        callBackSeq += "onCreate";
        globalThis.abilityWant = want;
    }

    onDestroy() {
        // Ability is destroying, release resources for this ability
        console.log("actsspecifytesthap onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("actsspecifytesthap onWindowStageCreate")
        //       callBackSeq += "onWindowStageCreate";
        globalThis.abilityContext = this.context
        windowStage.setUIContent(this.context, "pages/index/index", null)
        console.log("actsspecifytesthap onWindowStageCreate finish")
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("actsspecifytesthap onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("actsspecifytesthap onForeground")
        callBackSeq += "onForeground";
        onShowProcess();
        setTimeout(()=>{
          this.context.terminateSelf().then((data) => {
              console.info("actsspecifytesthap MainAbility terminateSelf data = " + JSON.stringify(data));
          }).catch((err) => {
              console.info("actsspecifytesthap MainAbility terminateSelf err = " + JSON.stringify(err));
          });
      }, 2000)
    }

    onBackground() {
        // Ability has back to background
        console.log("actsspecifytesthap onBackground")
    }
};
