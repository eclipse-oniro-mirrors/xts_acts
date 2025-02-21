/*
* Copyright (c) 2022 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import Ability from '@ohos.app.ability.UIAbility'
import dataShare from '@ohos.data.dataShare'
import rpc from "@ohos.rpc";

var seConnect = {
    onConnect:function (elementName, proxy) {
        console.log("[ttt] [DataShareTest] <<Consumer>> seConnect onConnect called.");
        console.log("[ttt] [DataShareTest] <<Consumer>> seConnect onConnect elementName = " + elementName);
        console.log("[ttt] [DataShareTest] <<Consumer>> seConnect onConnect proxy = " + proxy);
         let data = rpc.MessageParcel.create();
         let reply = rpc.MessageParcel.create();
         let option = new rpc.MessageOption();
         data.writeInterfaceToken("connect-test");
         data.writeInt(111);

         console.log("[ttt] [DataShareTest] <<Consumer>> seConnect onConnect sendRequest.");
         proxy.sendRequest(1, data, reply, option)
             .then(function (result) {
                 if (result.errCode === 0) {
                     // let msg = reply.readString();
                     let msg = result.reply.readInt();
                     console.log("[ttt] [DataShareTest] <<Consumer>> seConnect reply msg: " + msg);
                 } else {
                     console.log("[ttt] [DataShareTest] <<Consumer>> seConnect sendRequest failed, errCode: " + result.errCode);
                 }
                 // callback没有返回值，默认返回undefined
             }).catch(function (e) {
             console.log("[ttt] [DataShareTest] <<Consumer>> seConnect sendRequest got exception: " + e);
         }).finally (async () => {
             console.log("[ttt] [DataShareTest] <<Consumer>> seConnect sendRequest ends, reclaim parcel");
             data.reclaim();
             reply.reclaim();
         })
    },
    onDisconnect:function (elementName) {
        console.log("[ttt] [DataShareTest] <<Consumer>> seConnect onDisconnect");
    },
    onFailed:function (code) {
        console.log("[ttt] [DataShareTest] <<Consumer>> seConnect onFailed");
    }
};

let dseProxy = 0;
let dseUri = ("datashare:///com.samples.datasharekvtest.DataShare");

var dseConnect = {
    onConnect:function (elementName, proxy) {
        console.log("[ttt] [DataShareTest] <<Consumer>> dseConnect onConnect called.");
        // console.log("[ttt] [DataShareTest] <<Consumer>> dseConnect onConnect elementName = " + elementName);
        // console.log("[ttt] [DataShareTest] <<Consumer>> dseConnect onConnect proxy = " + proxy);
        dseProxy = proxy;
    },
    onDisconnect:function (elementName) {
        console.log("[ttt] [DataShareTest] <<Consumer>> dseConnect onDisconnect, elementName:" + elementName);
    },
    onFailed:function (code) {
        console.log("[ttt] [DataShareTest] <<Consumer>> dseConnect onFailed, code:" + code);
    }
};

let seConnectionId = -1;
let dseConnectionId = -1;

let seWant = {
    "bundleName": "com.samples.datasharetest",
    "abilityName": "ServiceExtAbility",
}

let dseWant = {
    "bundleName": "com.samples.datasharetest",
    "abilityName": "DataShareExtAbility",
}

export function onCallback() {
    console.info("[ttt] [DataShareTest] <<Consumer>> **** Observer on callback ****");
}

export function offCallback() {
    console.info("[ttt] [DataShareTest] <<Consumer>> **** Observer off callback ****");
}

export default class MainAbility extends Ability {
    onCreate(want, launchParam) {
        // Ability is creating, initialize resources for this ability
        console.log("[ttt] [DataShareTest] <<Consumer>> MainAbility onCreate")
        globalThis.abilityWant = want;
    }

    onDestroy() {
        // Ability is destroying, release resources for this ability
        console.log("[ttt] [DataShareTest] <<Consumer>> MainAbility onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[ttt] [DataShareTest] <<Consumer>> MainAbility onWindowStageCreate")
        globalThis.abilityContext = this.context;
        let context = this.context;
        dseConnectionId = context.connectServiceExtensionAbility(dseWant, dseConnect);
        globalThis.connectDataShareExtAbility = (async () => {
            console.log("[ttt] [DataShareTest] <<Consumer>> connectDataShareExtAbility begin");
            await dataShare.createDataShareHelper(globalThis.abilityContext, dseUri, (err,data)=>{
                globalThis.helper = data;
                globalThis.testhelper = data;
                console.info("[ttt] [DataShareTest] <<Consumer>> ----- 1 -----, globalThis.helper = " + globalThis.helper);
                console.info("[ttt] [DataShareTest] <<Consumer>> ----- 2 -----, data = " + data);
                console.info("[ttt] [DataShareTest] <<Consumer>> ----- 3 -----, err = " + err);
                console.info("[ttt] [DataShareTest] <<Consumer>> ----- 4 -----, JSON.stringify(err) = " + JSON.stringify(err));
            });
            dseConnectionId = await context.connectServiceExtensionAbility(dseWant, dseConnect);
        })
        windowStage.setUIContent(this.context, "MainAbility/pages/index", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[ttt] [DataShareTest] <<Consumer>> MainAbility onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[ttt] [DataShareTest] <<Consumer>> MainAbility onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.log("[ttt] [DataShareTest] <<Consumer>> MainAbility onBackground")
    }
};
