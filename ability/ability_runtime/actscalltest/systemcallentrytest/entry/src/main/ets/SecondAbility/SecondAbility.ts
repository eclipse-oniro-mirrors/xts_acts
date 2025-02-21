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

var callerA = "SystemAppCallerA"
var callSeqA= new Array();
var callerB = "SystemAppCallerB"
var callSeqB= new Array();
var callerC = "SystemAppCallerC"
var callSeqC= new Array();
var seq = 0;

function isArrayEqual(a1, a2) {
    return a1.length==a2.length && a1.every(function(value,index) { return value === a2[index]});
}
function isArrayEqualWithoutOrder(a1, a2) {
    if (a1.length != a2.length) {
        return false;
    }
    for (let ind in a1) {
        if (a2.indexOf(a1[ind]) == -1) {
            return false;
        };
    }
    return true;
}
var expectStressResult=[0,1,2,3,4,5,6,7,8,9];

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
    console.log('======>SystemCallTest SecondAbility on testCall <======')
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

function testCall2(data) {
    let recvSequence = new MySequenceable(0, '', '');
    console.log('======>SystemCallTest SecondAbility on testCall <======')
    data.readParcelable(recvSequence);
    var result = recvSequence.str + 'processed2';
    var commonEventData = {
        code: 0,
        data: 'calleeCheckCall2Param',
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
    console.log('======>SystemCallTest SecondAbility on testCall <======')
    data.readParcelable(recvSequence);
    let result = recvSequence.str + 'processed';
    recvSequence.setMySequence(recvSequence.num, recvSequence.str, result);

    return recvSequence;
}

function test2100ReleaseCallback(data) {
    console.log('SystemCallTest SecondAbility test2100ReleaseCallback:' + data);
    test2100ReleaseFlag = data.toString();
}

var test2100ReleaseFlag = '';

export default class SecondAbility extends Ability {

    test2100(data) {
        let recvData = new MySequenceable(0, '', '');
        data.readParcelable(recvData);
        let want = {
            bundleName: "com.example.systemcalltest",
            abilityName: "com.example.systemcalltest.MainAbility",
        };
        console.log("SystemCallTest SecondAbility test2100 before startAbilityByCall");
        let resultData = new MySequenceable(0, '', '');
        globalThis.abilityContext2.startAbilityByCall(want).then((caller) => {
            let param = new MySequenceable(recvData.num + 1, recvData.str + "Second", recvData.result);
            caller.onRelease(test2100ReleaseCallback);
            for (let start=Date.now(); Date.now() - start <= 200;);
            caller.callWithResult('test2100', param).then((data2) => {
                data2.readParcelable(resultData);
                caller.release();
                for (let start=Date.now(); Date.now() - start <= 200;);
                resultData.result = test2100ReleaseFlag;
                let commonEventData = {
                    parameters: {
                        num: resultData.num,
                        str: resultData.str,
                        result: resultData.result,
                    }
                };
                commonEvent.publish('call_case2100_test_result', commonEventData, (err) => {
                    console.log('SystemCallTest SecondAbility publish call_case2200_test_result event');
                })

            });
        });
        return resultData;
    }

    testOff(data) {
        let recvSequence = new MySequenceable(0, '', '');
        data.readParcelable(recvSequence);
        return recvSequence;
    }

    stressMethod(data) {
        let recvData = new MySequenceable(0, '', '');
        data.readParcelable(recvData);
        console.log('SystemCallTest SecondAbility stressMethod caller ' + recvData.str);
        if (recvData.str == callerA) {
            callSeqA.push(recvData.num);
        } else if (recvData.str == callerB) {
            callSeqB.push(recvData.num);
        } else if (recvData.str == callerC) {
            callSeqC.push(recvData.num);
        }
        seq++;
        if (seq >= 30) {
            console.log('SystemCallTest SecondAbility stressMethod SystemAppCallerA ' + callSeqA);
            console.log('SystemCallTest SecondAbility stressMethod SystemAppCallerB ' + callSeqB);
            console.log('SystemCallTest SecondAbility stressMethod SystemAppCallerC ' + callSeqC);
            let stressResult=isArrayEqualWithoutOrder(callSeqA, expectStressResult);
            stressResult=stressResult&&isArrayEqualWithoutOrder(callSeqB, expectStressResult);
            stressResult=stressResult&&isArrayEqualWithoutOrder(callSeqC, expectStressResult);
            console.log('SystemCallTest SecondAbility stressMethod stressResult ' + stressResult);
            let commonEventData = {
                data: stressResult.toString(),
            };
            commonEvent.publish('com.example.systemcalltest.Test5600', commonEventData, (err) => {
                console.log('SystemCallTest SecondAbility stress test result event');
            });
            seq=0;
            callSeqA = [];
            callSeqB = [];
            callSeqC = [];
        }
        return recvData;
    }

    loopMethod(data) {
        let recvData = new MySequenceable(0, '', '');
        data.readParcelable(recvData);
        return new MySequenceable(recvData.num + 1, recvData.str, '');
    }

    onCreate(want, launchParam) {
        // Ability is creating, initialize resources for this ability
        console.log("SystemCallTest SecondAbility onCreate")
        globalThis.abilityWant = want;
        globalThis.secondCallee = this.callee;
        globalThis.abilityContext2 = this.context;
        this.callee.on('test2100', this.test2100);
        this.callee.on('testOff', this.testOff);
        this.callee.on('stressMethod', this.stressMethod);
        this.callee.on('loopMethod', this.loopMethod);
        this.callee.on('testCall', testCall);
        this.callee.on('testCall2', testCall2);
        this.callee.on('testCallWithResult', testCallWithResult);
    }

    onDestroy() {
        // Ability is destroying, release resources for this ability
        console.log("SystemCallTest SecondAbility onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("SystemCallTest SecondAbility onWindowStageCreate")
        windowStage.setUIContent(this.context, "pages/second/second", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("SystemCallTest SecondAbility onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("SystemCallTest SecondAbility onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.log("SystemCallTest SecondAbility onBackground")
    }
};
