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

class MySequenceable {
    num: number = 0;
    str: String = "";
    result: String = "";

    constructor(num, string, result) {
        this.num = num;
        this.str = string;
        this.result = result;
    }

    setMySequence(num, string, result) {
        this.num = num;
        this.str = string;
        this.result = result;
    }

    marshalling(messageParcel) {
        messageParcel.writeInt(this.num);
        messageParcel.writeString(this.str);
        messageParcel.writeString(this.result);
        return true;
    }

    unmarshalling(messageParcel) {
        this.num = messageParcel.readInt();
        this.str = messageParcel.readString();
        this.result = messageParcel.readString();
        return true;
    }
}

function testCall(data) {
    let recvSequence = new MySequenceable(0, '', '');
    console.log('======>SystemCallTest ForthAbility on testCall <======')
    data.readParcelable(recvSequence);
    var result = recvSequence.str + 'processed';
    var commonEventData = {
        code: 0,
        data: 'calleeCheckCallParam',
        parameters: {
            num: recvSequence.num,
            str: recvSequence.str,
            result: result
        }
    }
    commonEvent.publish('CallTest', commonEventData, (err) => {
        console.log('======>CallTestSysA ForthAbility Call_Finish<======')
    })
    return recvSequence;
}

function testCallWithResult(data) {
    let recvSequence = new MySequenceable(0, '', '');
    console.log('======>SystemCallTest ForthAbility on testCall <======')
    data.readParcelable(recvSequence);
    let result = recvSequence.str + 'processed';
    recvSequence.setMySequence(recvSequence.num, recvSequence.str, result);

    return recvSequence;
}

export default class ForthAbility extends Ability {
    onCreate(want, launchParam) {
        // Ability is creating, initialize resources for this ability
        console.log("SystemCallTest ForthAbility onCreate")
        globalThis.abilityWant = want;
        this.callee.on('testCall', testCall);
        this.callee.on('testCallWithResult', testCallWithResult);
    }

    onDestroy() {
        // Ability is destroying, release resources for this ability
        console.log("SystemCallTest ForthAbility onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("SystemCallTest ForthAbility onWindowStageCreate")
        windowStage.setUIContent(this.context, "MainAbility/pages/second/second", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("SystemCallTest ForthAbility onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("SystemCallTest ForthAbility onForeground")
        if ((globalThis.abilityWant.parameters.case_num == "case1300") ||
            (globalThis.abilityWant.parameters.case_num == "case1400")) {
            var publishData = globalThis.abilityWant.parameters.case_num + "targetForeground";
            var commonEventData = {
                data: publishData,
            }
            commonEvent.publish('CallTest', commonEventData, (err) => {
                console.log('======>SystemAppCallerA ForthAbility Call_Finish<======')
            })
        }
    }

    onBackground() {
        // Ability has back to background
        console.log("SystemCallTest ForthAbility onBackground")
    }
};
