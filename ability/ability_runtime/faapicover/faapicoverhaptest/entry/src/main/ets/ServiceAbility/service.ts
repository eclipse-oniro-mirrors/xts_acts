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
import rpc from "@ohos.rpc";
import commonEvent from '@ohos.commonEvent';
import ability_particleAbility from '@ohos.ability.particleAbility';

class StubTest1 extends rpc.RemoteObject {
    constructor(des) {
        if (typeof des === 'string') {
            super(des);
        }
        else {
            return null;
        }
    }
    queryLocalInterface(descriptor) {
        return null;
    }
    getInterfaceDescriptor() {
        return "";
    }
    sendRequest(code, data, reply, options) {
        return null;
    }
    getCallingPid() {
        return 0;
    }
    getCallingUid() {
        return 0;
    }
    attachLocalInterface(localInterface, descriptor) { }
    onRemoteRequest(code, data, reply, options) {
        console.info(printLogS1 + "onRemoteRequest");
        if (code == 1) {
            console.info(printLogS1 + "onRemoteRequest code 1");
            let op1 = data.readInt();
            let op2 = data.readInt();
            console.info(printLogS1 + "onRemoteRequest op1 = " + op1 + ", op2 = " + op2);
            reply.writeInt(op1 + op2);
        }
        else {
            console.info(printLogS1 + "onRemoteRequest code = " + code);
        }
        return true;
    }
}

var printLogS1 = "Fa:Auxiliary:ServiceAbility:";
var listPushS1 = "Fa_Auxiliary_ServiceAbility_";
export default {
    onStart() {
        console.info(printLogS1 + 'onStart');

        commonEvent.publish(listPushS1 + "onStart", (err) => {
            console.info(printLogS1 + listPushS1 + "onStart");
        });
    },
    onStop() {
        console.info(printLogS1 + 'onStop');

        commonEvent.publish(listPushS1 + "onStop", (err) => {
            console.info(printLogS1 + listPushS1 + "onStop");
        });
    },
    onCommand(want, startId) {
        console.info(printLogS1 + 'onCommand');

        commonEvent.publish(listPushS1 + "onCommand", (err) => {
            console.info(printLogS1 + listPushS1 + "onCommand");
        });

        setTimeout(()=>{
            ability_particleAbility.terminateSelf().then((data) => {
                console.info(printLogS1 + "terminateSelf data = " + JSON.stringify(data));
            }).catch((err) => {
                console.info(printLogS1 + "terminateSelf err = " + JSON.stringify(err));
            });
        }, 3000)
    },
    onConnect(want) {
        console.info(printLogS1 + 'onConnect');

        return new StubTest1("Test1");
    },
    onDisconnect(want) {
        console.info(printLogS1 + 'onDisconnect');
    },
    onReconnect(want) {
        console.info(printLogS1 + 'onReconnect');
    }
};