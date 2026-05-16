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

class StubTest2 extends rpc.RemoteObject {
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

var printLogS1 = "Fa:Auxiliary:ServiceAbility2:";
var listPushS1 = "Fa_Auxiliary_ServiceAbility2_";
export default {
    onStart() {
        console.info(printLogS1 + 'onStart');
    },
    onStop() {
        console.info(printLogS1 + 'onStop');
    },
    onCommand(want, startId) {
        console.info(printLogS1 + 'onCommand');
    },
    onConnect(want) {
        console.info(printLogS1 + 'onConnect');

        commonEvent.publish(listPushS1 + "onConnect", (err) => {
            console.info(printLogS1 + listPushS1 + "onCreate");
        });

        return new StubTest2("Test1");
    },
    onDisconnect(want) {
        console.info(printLogS1 + 'onDisconnect');

        commonEvent.publish(listPushS1 + "onDisconnect", (err) => {
            console.info(printLogS1 + listPushS1 + "onDisconnect");
        });
    },
    onReconnect(want) {
        console.info(printLogS1 + 'onReconnect');
    }
};