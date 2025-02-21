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

function sleep(delay) {
    let start = new Date().getTime();
    while (true) {
        if (new Date().getTime() - start > delay) {
            break;
        }
    }
}

export default class SecondAbility extends Ability {

    onCreate(want, launchParam) {
        // Ability is creating, initialize resources for this ability
        console.log("ACTS_NewWant SecondAbility onCreate")
        globalThis.abilityWant = want;
        commonEvent.publish("onCreateSecond_To_Test_CommonEvent", () => {
            console.log("ACTS_NewWant Publish CallBack onCreateSecond_To_Test_CommonEvent")
        });
    }

    onDestroy() {
        // Ability is destroying, release resources for this ability
        console.log("ACTS_NewWant SecondAbility onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("ACTS_NewWant SecondAbility onWindowStageCreate")
        globalThis.abilityContext = this.context
        windowStage.setUIContent(this.context, "pages/index/index", null)

        commonEvent.publish("onWindowStageCreateSecond_To_Test_CommonEvent", () => {
            console.log("ACTS_NewWant Publish CallBack onWindowStageCreateSecond_To_Test_CommonEvent")
        });
    }
    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("ACTS_NewWant SecondAbility onWindowStageDestroy")
    }

    onForeground() {
        sleep(1000)
        // Ability has brought to foreground
        var connId;
        console.log("ACTS_NewWant SecondAbility onForeground")
        if (globalThis.abilityWant.action == 'startSingleton0400')
        {
            globalThis.abilityContext.startAbility({
                bundleName: "com.example.newwanthap",
                abilityName: "com.example.newwanthapa.MainAbility",
                action:"startStandard0400"
            }, (error, data) => {
                console.log('ACTS_NewWant SecondAbility onForeground - startAbility start standard: '
                + JSON.stringify(error) + ", " + JSON.stringify(data))
            })
        }
        if (globalThis.abilityWant.action == 'startSingleton0300')
        {
            globalThis.abilityContext.startAbility({
                bundleName: "com.example.newwanthap",
                abilityName: "com.example.newwanthapa.MainAbility",
                action:"restartSingleton"
            }, (error, data) => {
                console.log('ACTS_NewWant SecondAbility onForeground - startAbility restart standard: '
                + JSON.stringify(error) + ", " + JSON.stringify(data))
            })
        }
        if (globalThis.abilityWant.action == 'startHapA0500') {
            globalThis.abilityContext.startAbility({
                bundleName: "com.example.newwanthap",
                abilityName: "com.example.newwanthapb.MainAbility",
                action: "restartHapB"
            }, (error, data) => {
                console.log('ACTS_NewWant SecondAbility onForeground - startAbility restart HapB: '
                + JSON.stringify(error) + ", " + JSON.stringify(data))
            })
        }
        if (globalThis.abilityWant.action == 'startHapA0600') {
            globalThis.abilityContext.startAbility({
                bundleName: "com.example.newwanthapa",
                abilityName: "com.example.newwanthapc.MainAbility",
                action: "restartHapC"
            }, (error, data) => {
                console.log('ACTS_NewWant SecondAbility onForeground - startAbility restart HapC: '
                + JSON.stringify(error) + ", " + JSON.stringify(data))
            })
        }
        if (globalThis.abilityWant.action == 'startSecondAbility0700') {
            globalThis.abilityContext.startAbility(
                {
                    bundleName: "com.example.newwanthap",
                    abilityName: "com.example.newwanthapa.MainAbility",
                    action: "startMainAbility0700"
                }, (error, data) => {
                console.log('ACTS_NewWant SecondAbility onForeground - startAbility startMainAbility0700: '
                + JSON.stringify(error) + ", " + JSON.stringify(data))
            });
        }
        if (globalThis.abilityWant.action == 'startSecondAbility0800') {
            globalThis.abilityContext.startAbility(
                {
                    bundleName: "com.example.newwanthapapi7",
                    abilityName: "com.example.newwanthapapi7.MainAbility",
                    action: "startapi70800"
                }, (error, data) => {
                console.log('ACTS_NewWant SecondAbility onForeground - startAbility startapi70800: '
                + JSON.stringify(error) + ", " + JSON.stringify(data))
            });
        }
        commonEvent.publish("onForegroundSecond_To_Test_CommonEvent", () => {
            console.log("ACTS_NewWant SecondAbility Publish CallBack onForegroundSecond_To_Test_CommonEvent")
        });
    }

    onBackground() {
        // Ability has back to background
        console.log("ACTS_NewWant SecondAbility onBackground")
    }

    onNewWant(want) {
        // Ability has brought to foreground when it already in foreground
        console.log("ACTS_NewWant SecondAbility onNewWant")
        globalThis.abilityWant = want;
        console.log("ACTS_NewWant SecondAbility onNewWant deviceId :" + want.deviceId)
        console.log("ACTS_NewWant SecondAbility onNewWant bundleName :" + want.bundleName)
        console.log("ACTS_NewWant SecondAbility onNewWant abilityName :" + want.abilityName)
        console.log("ACTS_NewWant SecondAbility onNewWant uri :" + want.uri)
        console.log("ACTS_NewWant SecondAbility onNewWant type :" + want.type)
        console.log("ACTS_NewWant SecondAbility onNewWant flags :" + want.flags)
        console.log("ACTS_NewWant SecondAbility onNewWant action :" + want.action)
        var publishData = {
            data: want.action
        }
        commonEvent.publish("onNewWantSecond_To_Test_CommonEvent", publishData,() => {
            console.log("ACTS_NewWant SecondAbility Publish CallBack onNewWantSecond_To_Test_CommonEvent")
        });
        switch (want.action) {
          case 'restartSingleton':
            commonEvent.publish("onNewWantSecond1_To_Test_CommonEvent", publishData,() => {
                console.log("ACTS_NewWant SecondAbility Publish CallBack onNewWantSecond1_To_Test_CommonEvent")
            });
            break;
          case 'restartSecondAbility0700':
            commonEvent.publish("onNewWantSecond2_To_Test_CommonEvent", publishData,() => {
                console.log("ACTS_NewWant SecondAbility Publish CallBack onNewWantSecond2_To_Test_CommonEvent")
            });
            break;
          case 'restartSecondAbility0800':
            commonEvent.publish("onNewWantSecond3_To_Test_CommonEvent", publishData,() => {
                console.log("ACTS_NewWant SecondAbility Publish CallBack onNewWantSecond3_To_Test_CommonEvent")
            });
            break;
        }
    }
};
