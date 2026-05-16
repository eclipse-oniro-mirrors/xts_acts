/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

// 当前示例代码仅适用于Stage模型
import pluginComponentManager from '@ohos.pluginComponent'

var userBundleName = 'com.example.actsvalidator'
var userAbilityName = 'com.example.actsvalidator.EntryAbility'
var userName = 'Index'
var providerBundleName = 'com.example.provider'
var providerAbilityName = 'com.example.provider.EntryAbility'
var providerName = 'Index'

// push事件监听
function onPushListener(source, template, data, extraData) {
    console.log("yjl onPushListener template.source=" + template.source)
    console.log("yjl onPushListener template.ability=" + template.ability)
    console.log("yjl onPushListener data=" + JSON.stringify(data))
    console.log("yjl onPushListener extraData=" + JSON.stringify(extraData))
}

function onPushListener3(source, template, data) {
    console.log("yjl onPushListener3333333333333333333 no extraData")
    console.log("yjl onPushListener source=" + JSON.stringify(source))
    console.log("yjl onPushListener template.source=" + template.source)
    console.log("yjl onPushListener template.ability=" + template.ability)
    console.log("yjl onPushListener data=" + JSON.stringify(data))
}

function onPushListener2(source, template) {
    console.log("yjl onPushListener222222222222222222 no extraData and data")
    console.log("yjl onPushListener source=" + JSON.stringify(source))
    console.log("yjl onPushListener template.source=" + template.source)
    console.log("yjl onPushListener template.ability=" + template.ability)
}

function onPushListener1(source) {
    console.log("yjl onPushListener11111111111111111111 no extraData and data and template")
    console.log("yjl onPushListener source=" + source)
}

function onPushListener0() {
    console.log("yjl onPushListener0000000000000000000 no params!")
}

export default {
    // 注册监听事件
    onListener(num=4) {
        console.log("yjl onPushListener num=" + num)
        if (num == 0) {
            pluginComponentManager.on("push", onPushListener0)
        } else if (num == 1) {
            pluginComponentManager.on("push", onPushListener1)
        } else if (num == 2) {
            pluginComponentManager.on("push", onPushListener2)
        } else if (num == 3) {
            pluginComponentManager.on("push", onPushListener3)
        } else {
            pluginComponentManager.on("push", onPushListener)
        }
    },
    Push(key='', value='', uName=userName) {
        console.log("yjl push key=" + key + ", value=" + value + ", name=" + uName)
        // 原始赋值
        var owner_bundleName = providerBundleName
        var owner_abilityName = providerAbilityName
        var target_bundleName = userBundleName
        var target_abilityName = userAbilityName
        var name = uName
        var data = {
            "key_1": "plugin component push data",
            "key_2": 12345
        }
        var extraData = {
            "extra_str": "this is push event"
        }
        var jsonPath = ''
        var callback = (err, data) => {
            console.log("yjl push_callback: push ok!");
        }

        // 改值
        if (key == 'owner_bundleName') {
            owner_bundleName = value
        } else if (key == 'owner_abilityName') {
            owner_abilityName = value
        } else if (key == 'target_bundleName') {
            target_bundleName = value
        } else if (key == 'target_abilityName') {
            target_abilityName = value
        } else if (key == 'name') {
            name = value
        } else if (key == 'data') {
            data = {
                "key_1" : value
            }
        } else if (key == 'extraData') {
            extraData = {
                "extra_str" : value
            }
        } else if (key == 'jsonPath') {
            jsonPath = value
        } else if (key == 'callback') {
            callback = (err, data) => {}
        }

        // 组件提供方主动发送事件，owner:提供方，target:使用方

        pluginComponentManager.push(
            {
                owner: {
                    bundleName: owner_bundleName,
                    abilityName: owner_abilityName,
                },
                target: {
                    bundleName: target_bundleName,
                    abilityName: target_abilityName,
                },
                name: name,
                data: data,
                extraData: extraData,
                jsonPath: jsonPath,
            },
            callback
        )
    },
    Request(key='', value='', uName=providerName) {
        console.log("yjl request key=" + key + ", value=" + value + value + ", name=" + uName)
        // 原始赋值
        var owner_bundleName = userBundleName
        var owner_abilityName = userAbilityName
        var target_bundleName = providerBundleName
        var target_abilityName = providerAbilityName
        var name = uName
        var data = {
            "key_1": "plugin component request data",
            "key_2": 67890
        }
        var jsonPath = ''
        var callback = (err, data) => {
            console.log("yjl request_callback: componentTemplate.ability=" + data.componentTemplate.ability)
            console.log("yjl request_callback: componentTemplate.source=" + data.componentTemplate.source)
            console.log("yjl request_callback: data=" + JSON.stringify(data.data))
            console.log("yjl request_callback: extraData=" + JSON.stringify(data.extraData))
        }

        // 改值
        if (key == 'owner_bundleName') {
            owner_bundleName = value
        } else if (key == 'owner_abilityName') {
            owner_abilityName = value
        } else if (key == 'target_bundleName') {
            target_bundleName = value
        } else if (key == 'target_abilityName') {
            target_abilityName = value
        } else if (key == 'name') {
            name = value
        } else if (key == 'data') {
            data = {
                "key_1" : value
            }
        } else if (key == 'jsonPath') {
            jsonPath = value
        } else if (key == 'callback') {
            callback = (err, data) => {}
        }



        // 组件使用方主动发送事件，owner:使用方，target:提供方
        pluginComponentManager.request({
            owner: {
                bundleName: owner_bundleName,
                abilityName: owner_abilityName,
            },
            target: {
                bundleName: target_bundleName,
                abilityName: target_abilityName,
            },
            name: name,
            data: data,
            jsonPath: jsonPath,
        },
            callback
        )
    }
}