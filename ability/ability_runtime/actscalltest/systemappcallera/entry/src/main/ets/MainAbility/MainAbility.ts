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

var bundleNameCallee = "com.example.systemcalltest";
var abilityNameCallee = "com.example.systemcalltest.SecondAbility";
var subscriber;
var caller;
var event_getcaller = "getcaller.com.example.systemcalltest.SecondAbility";
var event_call = "call.com.example.systemcalltest.SecondAbility";
var event_release = "release.com.example.systemcalltest.SecondAbility";
var subscribeInfo = {
    events: [event_getcaller, event_call, event_release, ],
};

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

function getCaller(context) {
    console.log("SystemAppCallerA MainAbility getCaller");
    let want = {
        bundleName: bundleNameCallee,
        abilityName: abilityNameCallee,
    };
    context.startAbilityByCall(want).then(data => {
        if (typeof data !== "object" || data == null) {
            console.log('SystemAppCallerA MainAbility startAbilityByCall fail');
        }
        caller = data;
    });
}

function stressCall() {
    console.log('SystemAppCallerA MainAbility stressCall begin');
    if (typeof caller !== "object" || caller == null) {
        console.log('SystemAppCallerA MainAbility caller error in stressCall');
    }
    let times = 10;
    for (let i = 0; i < times; i++) {
        let data = new MySequenceable(i, "SystemAppCallerA", '');
        caller.call('stressMethod', data);
    }
}

function unsubscribeCallback() {
    console.debug("SystemAppCallerA MainAbility  unsubscribeCallback");
}

function releaseCallee() {
    try {
        caller.onRelease(data => {
            console.log('SystemAppCallerA MainAbility releaseCallBack:' + data);
        });
        caller.release();
    } catch (e) {
        console.log('SystemAppCallerA MainAbility release fail ' + e);
    }
    commonEvent.unsubscribe(subscriber, unsubscribeCallback);
}

function startNext(context) {
    console.log("SystemAppCallerA MainAbility startNext");
    let want = {
        bundleName: "com.example.systemappcallerb",
        abilityName: "com.example.systemappcallerb.MainAbility",
        parameters: {case_num: "case5600"},
    }
    context.startAbility(want,
        (err) => {console.log("SystemAppCallerA MainAbility startAbility callback");});
}

function testCall(data) {
    let recvSequence = new MySequenceable(0, '', '');
    console.log('======>SystemAppCallerA MainAbility on testCall <======')
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
    console.log('======>SystemAppCallerA MainAbility on testCall <======')
    data.readParcelable(recvSequence);
    let result = recvSequence.str + 'processed';
    recvSequence.setMySequence(recvSequence.num, recvSequence.str, result);

    return recvSequence;
}

export default class MainAbility extends Ability {

    subscribeCallBack(err, data) {
        console.log('SystemAppCallerA MainAbility subscribeCallBack data:' + JSON.stringify(data));
        switch (data.event) {
            case event_call:
                stressCall();
                break;
            case event_release:
                releaseCallee();
                break;
            default:
                console.log('SystemAppCallerA MainAbility subscribeCallBack event error:' + data.event);
                break;
        }
    }

    onCreate(want, launchParam) {
        // Ability is creating, initialize resources for this ability
        console.log("SystemAppCallerA MainAbility onCreate")
        globalThis.abilityWant = want;
        globalThis.abilityContext = this.context;
        this.callee.on('testCall', testCall);
        this.callee.on('testCallWithResult', testCallWithResult);
    }

    onDestroy() {
        // Ability is destroying, release resources for this ability
        console.log("SystemAppCallerA MainAbility onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("SystemAppCallerA MainAbility onWindowStageCreate")
        windowStage.setUIContent(this.context, "pages/index/index", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("SystemAppCallerA MainAbility onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("SystemAppCallerA MainAbility onForeground");
        commonEvent.createSubscriber(subscribeInfo).then((data) => {
            console.log("SystemAppCallerA MainAbility createSubscriber");
            subscriber = data;
            commonEvent.subscribe(subscriber, this.subscribeCallBack);
            if (globalThis.abilityWant.parameters["case_num"] == "case5600") {
                getCaller(this.context);
                startNext(this.context);
            }
        });
    }

    onBackground() {
        // Ability has back to background
        console.log("SystemAppCallerA MainAbility onBackground")
    }
};
