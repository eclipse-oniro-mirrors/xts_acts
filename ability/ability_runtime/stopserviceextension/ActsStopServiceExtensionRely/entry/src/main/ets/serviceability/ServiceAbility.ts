/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import ServiceExtensionAbility from '@ohos.app.ability.ServiceExtensionAbility'
import rpc from '@ohos.rpc';
import commonEvent from '@ohos.commonEvent'
let message;
let commonEventData={
    parameters:{
        message:message,
    }
}

class StubTest extends rpc.RemoteObject {
    constructor(des) {
        super(des)
    }

    onRemoteRequest(code, data, reply, option) {
        console.info('ServiceAbility onRemoteRequest');
        if (code === 1) {
            let op1 = data.readInt();
            let op2 = data.readInt();
            reply.writeInt(op1 + op2);
            console.info('ServiceAbility op1:' + op1 + ' op2:' + op2);
        }
        return true;
    }
}

let strAction = '';
let remoteOBJ = new StubTest("test");
export default class ServiceAbility extends ServiceExtensionAbility {
    onCreate(want){
        let disConnect = false;
        strAction = want.action;
        console.info('ServiceAbility onCreate');
        commonEventData.parameters.message = want;
        let NewWant = {
            bundleName: "com.acts.stopserviceextensiontest",
            abilityName: "ServiceAbilitySec",
            action: strAction
        }
        let options = {
            onConnect: async function (element: any, proxy: any) {
                console.info("Acts_StopServiceExtension_0600 service onConnect success!!!")
                console.info('Acts_StopServiceExtension_0600 service onConnect element : ' + JSON.stringify(element));
                console.info('Acts_StopServiceExtension_0600 service onConnect proxy : ' + JSON.stringify(proxy));
            },
            onDisconnect: async function (element1: any) {
                disConnect = true;
                console.info("Acts_StopServiceExtension_0600 service onDisconnect success!!!")
                console.info('Acts_StopServiceExtension_0600 service onDisconnect ele : ' + JSON.stringify(element1));
            },
            onFailed: async function (code: any) {
                console.info("Acts_StopServiceExtension_0600 service onFailed!!!")
                console.info('Acts_StopServiceExtension_0600 service onFailed errCode : ' + JSON.stringify(code));
            },
        }
        if (strAction == "Acts_StopServiceExtension_0100" || strAction == "Acts_StopServiceExtension_0300" ||
            strAction == "Acts_StopServiceExtension_0500" || strAction == "Acts_StopServiceExtension_1700") {
            commonEvent.publish("ACTS_StopEvent_First", commonEventData, (err) => {
                console.info("====>" + strAction + " publish err: " + JSON.stringify(err));
            })
        }
        if (strAction == "Acts_StopServiceExtension_0200") {
            setTimeout(()=>{
                this.context.startAbility(NewWant, (err)=>{
                    console.info("====>" + strAction + " startAbility serviceExtension err: " + JSON.stringify(err));
                    setTimeout(()=>{
                        this.context.stopServiceExtensionAbility(NewWant, (err)=>{
                            console.info("====>" + strAction + " stop ServiceAbilitySec err: " +
                                JSON.stringify(err));
                            commonEventData.parameters.message = err.code;
                            commonEvent.publish("ACTS_StopEvent_First", commonEventData, (err) => {
                                console.info("====>" + strAction + " First publish err: " + JSON.stringify(err));
                            })
                        })
                    }, 200)
                })
            }, 100)
        }
        if (strAction == "Acts_StopServiceExtension_0400") {
            setTimeout(()=>{
                this.context.startServiceExtensionAbility(NewWant, (err)=>{
                    console.info("====>" + strAction + " startAbility serviceExtension err: " + JSON.stringify(err));
                    setTimeout(()=>{
                        this.context.stopServiceExtensionAbility(NewWant, (err)=>{
                            console.info("====>" + strAction + " stop ServiceAbilitySec err: " +
                            JSON.stringify(err));
                            commonEventData.parameters.message = err.code;
                            commonEvent.publish("ACTS_StopEvent_First", commonEventData, (err) => {
                                console.info("====>" + strAction + " First publish err: " + JSON.stringify(err));
                            })
                        })
                    }, 200)
                })
            }, 100)
        }
        if (strAction == "Acts_StopServiceExtension_0600") {
            setTimeout(()=>{
                let data = this.context.connectServiceExtensionAbility(NewWant, options);
                console.info("====>" + strAction + " connect ServiceAbilitySec: " + JSON.stringify(data));
                setTimeout(() => {
                    this.context.stopServiceExtensionAbility(NewWant, (err) => {
                        console.info("====>" + strAction + " stop ServiceAbilitySec err: " +
                        JSON.stringify(err));
                        commonEventData.parameters.message = err.code;
                        commonEvent.publish("ACTS_StopEvent_First", commonEventData, (err) => {
                            console.info("====>" + strAction + " First publish err: " + JSON.stringify(err));
                            setTimeout(()=>{
                                commonEventData.parameters.message = disConnect;
                                console.info("Acts_StopServiceExtension_0600 message : " + JSON.stringify(disConnect));
                                commonEvent.publish("ACTS_StopEvent_Third", commonEventData, (err) => {
                                    console.info("====>" + strAction + " Third publish err: " + JSON.stringify(err));
                                })
                            }, 200)
                        })
                    })
                }, 200)
            }, 100)
        }
        if (strAction == "Acts_StopServiceExtension_0800") {
            setTimeout(()=>{
                this.context.stopServiceExtensionAbility({
                    deviceId: "abcdefg12345678",
                    bundleName: "com.acts.stopserviceextensiontest",
                    abilityName: "ServiceAbilitySec",
                    action: strAction
                }, (err)=>{
                    console.info("====>" + strAction + " stop ServiceAbilitySec err: " + JSON.stringify(err));
                    commonEventData.parameters.message = err.code;
                    commonEvent.publish("ACTS_StopEvent_First", commonEventData, (err) => {
                        console.info("====>" + strAction + " publish err: " + JSON.stringify(err));
                    })
                })
            }, 100)
        }
        if (strAction == "Acts_StopServiceExtension_1800") {
            setTimeout(()=>{
                this.context.stopServiceExtensionAbility({
                    deviceId: undefined,
                    bundleName: "com.acts.stopserviceextensiontest",
                    abilityName: "ServiceAbilitySec",
                    action: strAction
                }, (err)=>{
                    console.info("====>" + strAction + " stop ServiceAbilitySec err: " + JSON.stringify(err));
                    commonEventData.parameters.message = err.code;
                    commonEvent.publish("ACTS_StopEvent_First", commonEventData, (err) => {
                        console.info("====>" + strAction + " publish err: " + JSON.stringify(err));
                    })
                })
            }, 100)
        }
    }
    onDestroy() {
        console.info('ServiceAbility onDestroy');
    }

    onRequest(want, startId) {
        console.info('ServiceAbility onRequest');
    }

    onConnect(want) {
        console.info('ServiceAbility onConnect');
        return remoteOBJ;
    }

    onDisconnect(want) {
        console.info('ServiceAbility onDisconnect');
    }

    onReconnect(want) {
        console.info('ServiceAbility onReconnect');
    }

    onConfigurationUpdate(newConfig) {
        console.info('ServiceAbility onConfigurationUpdate');
    }

    onDump(params) {
        console.info('ServiceAbility onDump');
        return params;
    }
};
