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

import particleAbility from '@ohos.ability.particleAbility';
import rpc from '@ohos.rpc';
import commonEvent from '@ohos.commonEventManager';

let publishConnectOptions = {
    parameters: {
        "assertData": "onConnect"
    }
};
let publishDisconnectOptions = {
    parameters: {
        "assertData": "onDisconnect"
    }
};
let publishFailedOptions = {
    parameters: {
        "assertData": "onFailed"
    }
};

function PublishCallBack(err) {
    if (err.code) {
        console.error("FreeInstall_FA_ConnectAbility_PA service4 publish failed " + JSON.stringify(err));
    } else {
        console.info("FreeInstall_FA_ConnectAbility_PA service4 publish success!!!");
    }
}

export default {
    onStart() {
        console.info('FreeInstall_FA_ConnectAbility_PA service4 onStart');
    },
    onStop() {
        console.info('FreeInstall_FA_ConnectAbility_PA service4 onStop');
    },
    onCommand(want, startId) {
        console.info('FreeInstall_FA_ConnectAbility_PA service4 onCommand');
        let request = {
            'bundleName': 'com.example.different.hmservice',
            'abilityName': 'com.example.different.ServiceAbility',
            'moduleName': 'entry',
        }
        let options = {
            onConnect: async function (element: any, proxy: any) {
                console.info("FreeInstall_FA_ConnectAbility_PA service4 onConnect success!!!")
                commonEvent.publish("service4_event", publishConnectOptions, PublishCallBack);
                console.info('FreeInstall_FA_ConnectAbility_PA service4 onConnect element : ' + JSON.stringify(element));
                console.info('FreeInstall_FA_ConnectAbility_PA service4 onConnect proxy : ' + JSON.stringify(proxy));
                if (proxy == null) {
                    console.error("freeInstall_featureAbility_connectAbility proxy null");
                    return;
                }
                let option = new rpc.MessageOption();
                let data = new rpc.MessageParcel();
                let reply = new rpc.MessageParcel();
                data.writeInterfaceToken("ohos.appexecfwk.IApplicationStateObserver");
                proxy.sendRequest(0, data, reply, option);
            },
            onDisconnect: async function (element1: any) {
                console.info("FreeInstall_FA_ConnectAbility_PA service4 onDisconnect success!!!")
                commonEvent.publish("service4_event",publishDisconnectOptions,PublishCallBack);
                console.info('FreeInstall_FA_ConnectAbility_PA service4 onDisconnect ele : ' + JSON.stringify(element1));
            },
            onFailed: async function (code: any) {
                console.info("FreeInstall_FA_ConnectAbility_PA service4 onFailed!!!")
                commonEvent.publish("service4_event",publishFailedOptions,PublishCallBack);
                console.info('FreeInstall_FA_ConnectAbility_PA service4 onFailed errCode : ' + JSON.stringify(code));
            },
        }
        console.info('FreeInstall_FA_ConnectAbility_PA service4 connect start ');
        let connection = particleAbility.connectAbility(request, options);
        console.info('FreeInstall_FA_ConnectAbility_PA service4  request is:' + JSON.stringify(request));
        console.info('FreeInstall_FA_ConnectAbility_PA service4 options is:' + JSON.stringify(options));
        console.info('FreeInstall_FA_ConnectAbility_PA service4 connection=: ' + connection);
    }
};