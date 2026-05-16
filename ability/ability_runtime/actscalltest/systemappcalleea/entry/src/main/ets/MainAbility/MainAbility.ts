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
var event_case2000 = "call_case2000_test";
var subscribeInfo = {
    events: [event_case2000, ],
};
var subscriber;
function test2200ReleaseCallback(data) {
    console.log('SystemAppCalleeA MainAbility test2200ReleaseCallback:' + data);
    test2200ReleaseFlag = data.toString();
}

var test2200ReleaseFlag = '';

function testCall(data) {
    let recvSequence = new MySequenceable(0, '', '');
    console.log('======>SystemAppCalleeA MainAbility on testCall <======')
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
        console.log('======>CallTestSysA SecondAbility Call_Finish<======')
    })

    return recvSequence;
}

function testCallWithResult(data) {
    let recvSequence = new MySequenceable(0, '', '');
    console.log('======>SystemAppCalleeA MainAbility on testCall <======')
    data.readParcelable(recvSequence);
    let result = recvSequence.str + 'processed';
    recvSequence.setMySequence(recvSequence.num, recvSequence.str, result);

    return recvSequence;
}

export default class MainAbility extends Ability {

    test2200(data) {
        console.log("SystemAppCalleeA MainAbility test2200");
        let recvData = new MySequenceable(0, '', '');
        data.readParcelable(recvData);

        let want = {
            bundleName: "com.example.systemappcalleea",
            abilityName: "com.example.systemappcalleea.SecondAbility",
        };
        console.log("SystemAppCalleeA MainAbility test2200 before startAbilityByCall");
        let resultData = new MySequenceable(0, '', '');
        globalThis.abilityContext.startAbilityByCall(want).then((caller) => {
            let param = new MySequenceable(recvData.num + 1, recvData.str + "SystemAppCalleeA", '');
            caller.onRelease(test2200ReleaseCallback);
            caller.callWithResult('test2200', param).then((data2) => {
                data2.readParcelable(resultData);
                caller.release();
                for (let start=Date.now(); Date.now() - start <= 200;);
                resultData.result = test2200ReleaseFlag;
                let commonEventData = {
                    parameters: {
                        num: resultData.num,
                        str: resultData.str,
                        result: resultData.result,
                    }
                };
                commonEvent.publish('call_case2200_test_result', commonEventData, (err) => {
                    console.log('SystemAppCalleeA publish call_case2200_test_result event')
                })

            });
        });
        return resultData;
    }

    subscribeCallBack(err, data) {
        console.log('SystemAppCalleeA MainAbility subscribeCallBack data:' + JSON.stringify(data));
        switch (data.event) {
            case event_case2000:
                globalThis.abilityContext.terminateSelf();
                break;
            default:
                console.log('SystemAppCalleeA MainAbility subscribeCallBack event error:' + data.event);
                break;
        }
    }

    onCreate(want, launchParam) {
        // Ability is creating, initialize resources for this ability
        console.log("SystemAppCalleeA MainAbility onCreate")
        globalThis.abilityWant = want;
        globalThis.abilityContext = this.context;
        this.callee.on('test2200', this.test2200);
        this.callee.on('testCall', testCall);
        this.callee.on('testCallWithResult', testCallWithResult);
        commonEvent.createSubscriber(subscribeInfo).then((data) => {
            console.log("SystemAppCalleeA MainAbility createSubscriber");
            subscriber = data;
            commonEvent.subscribe(subscriber, this.subscribeCallBack);
        });
    }

    onDestroy() {
        // Ability is destroying, release resources for this ability
        console.log("SystemAppCalleeA MainAbility onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("SystemAppCalleeA MainAbility onWindowStageCreate")
        windowStage.setUIContent(this.context, "pages/index/index", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("SystemAppCalleeA MainAbility onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("SystemAppCalleeA MainAbility onForeground");
    }

    onBackground() {
        // Ability has back to background
        console.log("SystemAppCalleeA MainAbility onBackground")
    }
};
