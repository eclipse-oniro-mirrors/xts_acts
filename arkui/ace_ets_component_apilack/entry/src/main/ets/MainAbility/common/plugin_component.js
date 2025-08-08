/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import pluginComponentManager from '@ohos.pluginComponent'

function onPushListener(source, template, data, extraData) {
    console.log("onPushListener template.source=" + template.source)
    var jsonObject = JSON.parse(data.componentTemplate.source)
    console.log("request_callback1:source json object" + jsonObject)
    var jsonArry = jsonObject.ExternalComponent
    for (var i in jsonArry) {
        console.log(jsonArry[i])
    }
    console.log("onPushListener:source json object" + jsonObject)
    console.log("onPushListener:source json string" + JSON.stringify(jsonObject))
    console.log("onPushListener template.ability=" + template.ability)
    console.log("onPushListener data=" + JSON.stringify(data))
    console.log("onPushListener extraData=" + JSON.stringify(extraData))
}

function onRequestListener(source, name, data) {
    console.log("onRequestListener name=" + name);
    console.log("onRequestListener data=" + JSON.stringify(data));
    return { template: "plugintemplate", data: data };
}

export default {
    //register listener
    onListener() {
        pluginComponentManager.on("push", onPushListener)
        pluginComponentManager.on("request", onRequestListener)
    },
    Push() {
        // 组件提供方主动发送事件
        pluginComponentManager.push(
            {
                want: {
                    bundleName: "com.example.myapplication",
                    abilityName: "com.example.myapplication.MainAbility",
                },
                name: "plugintemplate",
                data: {
                    "key_1": "plugin component test",
                    "key_2": 34234
                },
                extraData: {
                    "extra_str": "this is push event"
                },
                jsonPath: "",
            },
            (err, data) => {
                console.log("push_callback: push ok!");
            }
        )
    },
    Request() {
        // 组件使用方主动发送事件
        pluginComponentManager.request({
            want: {
                bundleName: "com.example.myapplication",
                abilityName: "com.example.myapplication.MainAbility",
            },
            name: "plugintemplate",
            data: {
                "key_1": "plugin component test",
                "key_2": 34234
            },
            jsonPath: "",
        },
            (err, data) => {
                console.log("request_callback: componentTemplate.ability=" + data.componentTemplate.ability)
                console.log("request_callback: componentTemplate.source=" + data.componentTemplate.source)
                var jsonObject = JSON.parse(data.componentTemplate.source)
                console.log("request_callback:source json object" + jsonObject)
                var jsonArry = jsonObject.ExternalComponent
                for (var i in jsonArry) {
                    console.log(jsonArry[i])
                }
                console.log("request_callback:source json string" + JSON.stringify(jsonObject))
                console.log("request_callback: data=" + JSON.stringify(data.data))
                console.log("request_callback: extraData=" + JSON.stringify(data.extraData))
            }
        )
    }
}