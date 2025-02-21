/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import account_appAccount from '@ohos.account.appAccount';
import rpc from '@ohos.rpc';

var TAG = "[AccountTest]"
class MyParameter {
    constructor(params, size) {
        this.params = params
        this.size = size
    }

    marshalling(parcel) {
        parcel.writeInt(this.size)
        console.log(TAG + "size: " + this.size)
        for (var key in this.params) {
            parcel.writeString(key)
            console.log(TAG + "writeBoolean key: " + key)
            var value = this.params[key]
            switch (typeof value) {
                case 'string':
                    console.log(TAG + "writeString value: " + value)
                    parcel.writeInt(9)
                    parcel.writeString(value)
                    break
                case 'boolean':
                    console.log(TAG + "writeBoolean value: " + value)
                    parcel.writeInt(1)
                    parcel.writeBoolean(value)
                    break
            }
        }
        return true
    }

    unmarshalling(parcel) {
        this.size = parcel.readInt()
        console.log(TAG + "size: " + this.size)
        for (var i = 0; i < this.size; ++i) {
            var key = parcel.readString()
            console.log(TAG + "key: " + key)
            var type = parcel.readInt()
            console.log(TAG + "type: " + type)
            var value = null
            switch (type) {
                case 9:
                    value = parcel.readString()
                    break
                case 1:
                    value = parcel.readBool()
                    break
            }
            console.log(TAG + "value: " + value)
            this[key] = value
        }
    }
}

class MyWant {
    constructor(bundleName, abilityName, parameters) {
        this.bundleName = bundleName
        this.abilityName = abilityName
        this.paramSize = 0
        for (var key in parameters) {
            this.paramSize ++
        }
        this.parameters = new MyParameter(parameters, this.paramSize)
    }
    marshalling(parcel) {
        // action
        parcel.writeString("")
        // uri
        parcel.writeInt(-1)
        // entities
        parcel.writeInt(-1)
        // flag
        parcel.writeInt(0)
        if (this.bundleName == "" && this.abilityName == "") {
            // element
            parcel.writeInt(-1)
        } else {
            parcel.writeInt(1)
        }
        // parameters
        if (this.paramSize > 0) {
            parcel.writeInt(1)
            parcel.writeSequenceable(this.parameters)
        } else {
            parcel.writeInt(-1)
        }
        // bundleName
        parcel.writeString(this.bundleName)
        // picker
        parcel.writeInt(-1)
        return true
    }

    unmarshalling(parcel) {
        // action
        console.log(TAG + "action: " + parcel.readString());
        // uri
        console.log(TAG + "uri: " + parcel.readInt());
        // entities
        console.log(TAG + "entities: " + parcel.readInt());
        // flag
        console.log(TAG + "flag: " + parcel.readInt())
        // element
        console.log(TAG + "element: " + parcel.readInt())
        // parameters
        var hasParam = parcel.readInt()
        console.log(TAG + "hasParam: " + hasParam)
        if (hasParam == 1) {
            parcel.readSequenceable(this.parameters)
        }
        // bundleName
        parcel.readString()
        // picker
        parcel.readInt()
        return true;
    }
}

class VerifyCredentialOptions {
    constructor(credentialType, credential, parameters) {
        this.credential = credential
        this.credentialType = credentialType
        this.parameters = new MyParameter(parameters, 0)
    }

    unmarshalling(parcel) {
        this.credentialType = readString8(parcel)
        this.credential = readString8(parcel)
        parcel.readSequenceable(this.parameters)
        return true
    }
}

class SetPropertiesOptions {
    constructor(properties, parameters) {
        this.properties = new MyParameter(properties, 0)
        this.parameters = new MyParameter(parameters, 0)
    }

    unmarshalling(parcel) {
        parcel.readSequenceable(this.properties)
        parcel.readSequenceable(this.parameters)
        return true
    }
}

function readString8(data) {
    var size = data.readInt()
    var padSize = (((size + 4) & (~3)) - size - 1)
    console.log(TAG + "padSize: " + padSize)
    var str = ""
    var count = 0
    for (var i = 0; i < (size + 1 + padSize) / 4; ++i) {
        var result = data.readInt()
        if (count != size) {
            str += String.fromCharCode((result & 0x000000FF))
            count++
        }
        if (count != size) {
            str += String.fromCharCode((result & 0x0000FF00) >>> 8)
            count++
        }
        if (count != size) {
            str += String.fromCharCode((result & 0x00FF0000) >>> 16)
            count++
        }
        if (count != size) {
            str += String.fromCharCode((result & 0xFF000000) >>> 24)
            count++
        }
    }
    return str
}

function readStringArray(data) {
    var size = data.readInt()
    console.log(TAG + "label size: " + size)
    var result = []
    for (var i = 0; i < size; ++i) {
        result.push(readString8(data))
    }
    return result
}

class MyAuthenticatorCallback {

    constructor(callback) {
        this.callback = callback
        this.newData = new rpc.MessageParcel()
        this.newReply = new rpc.MessageParcel()
        this.newOptions = new rpc.MessageOption()
        this.newData.writeInterfaceToken("ohos.accountfwk.IAppAccountAuthenticatorCallback")
    }

    onResult(resultCode, result) {
        this.newData.writeInt(resultCode)
        var want = new MyWant("", "", result)
        this.newData.writeSequenceable(want)
        this.callback.sendRequest(0, this.newData, this.newReply, this.newOptions)
    }

    onRequestRedirected(request) {
        this.newData.writeSequenceable(request)
        this.callback.sendRequest(1, this.newData, this.newReply, this.newOptions)
    }

    onRequestContinued() {
        this.callback.sendRequest(2, this.newData, this.newReply, this.newOptions)
    }
}

class MyAuthenticator extends rpc.RemoteObject {
    authenticatorImpl = new MyAuthenticatorImpl()
    constructor() {
        super("authenticator")
    }

    onRemoteRequest(code, data, reply, options) {
        console.log(TAG + "code: " + code)
        data.readInterfaceToken()
        var name = null
        var callback = null
        switch (code) {
            case 2 :
                name = readString8(data)
                var verifyOptions = new VerifyCredentialOptions("", "", {})
                data.readSequenceable(verifyOptions)
                callback = new MyAuthenticatorCallback(data.readRemoteObject())
                this.authenticatorImpl.verifyCredential(name, verifyOptions, callback)
                break
            case 3 :
                name = readString8(data)
                var labels = readStringArray(data)
                callback = new MyAuthenticatorCallback(data.readRemoteObject())
                console.log(TAG + "callback: " + callback)
                this.authenticatorImpl.checkAccountLabels(name, labels, callback)
                break
            case 4 :
                var setOptions = new SetPropertiesOptions({}, {})
                data.readSequenceable(setOptions)
                callback = new MyAuthenticatorCallback(data.readRemoteObject())
                this.authenticatorImpl.setProperties(setOptions, callback)
                break
            case 5 :
                name = readString8(data)
                callback = new MyAuthenticatorCallback(data.readRemoteObject())
                this.authenticatorImpl.checkAccountRemovable(name, callback)
                break
        }
        return true
    }

    getRemoteObject() {
        return this
    }
}

class MyAuthenticatorImpl {
    accountLables = {
        "zhangsan": ["male", "30-40", "level4"],
        "lisi": ["female"]
    }

    accountCredentials = {
        "zhangsan": {
            "PIN": "123456",
            "NUMBER": "12356789"
        },
        "lisi": {
            "FACE": "X00001"
        }
    }

    accountRemovability = {
        "zhangsan": false,
        "lisi": true
    }

    properties = {}

    verifyCredential(name, options, callback) {
        console.log(TAG + "name: " + name + ", options: " + JSON.stringify(options))
        if (name == "xiaoming") {
            callback.onRequestContinued()
            return
        }
        var credentialInfo = this.accountCredentials[name]
        if (credentialInfo == undefined) {
            callback.onResult(0, {"booleanResult": false})
            return
        }
        if (options.credentialType == undefined || options.credential == undefined) {
            var want = new MyWant("com.ohos.accountauthenticator", "VerifyAbility",
                {"credentialType": options.credentialType, "credential": options.credential})
            callback.onRequestRedirected(want)
            return
        }
        var credential = credentialInfo[options.credentialType.toUpperCase()]
        if (credential == undefined || credential != options.credential) {
            callback.onResult(0, {"booleanResult": false})
            return
        }
        callback.onResult(0, {"booleanResult": true})
    }

    checkAccountLabels(name, labels, callback) {
        console.log(TAG + "name: " + name + ", labels: " + JSON.stringify(labels))
        if (labels.length == 0) {
            callback.onResult(0, {"booleanResult": true})
            return
        }
        var allLabels = this.accountLables[name]
        if (allLabels == undefined || allLabels.length == 0) {
            callback.onResult(0, {"booleanResult": false})
            return
        }
        for (var i = 0; i < labels.length; ++i) {
            if (allLabels.indexOf(labels[i]) == -1) {
                callback.onResult(0, {"booleanResult": false})
                return
            }
        }
        callback.onResult(0, {"booleanResult": true})
    }

    setProperties(options, callback) {
        console.log(TAG + "options: " + JSON.stringify(options))
        callback.onResult(10016, {})
    }

    checkAccountRemovable(name, callback) {
        console.log(TAG + "name: " + name)
        var isRemovable = this.accountRemovability[name]
        if (isRemovable == undefined || isRemovable == false) {
            callback.onResult(0, {"booleanResult": false})
            return
        }
        callback.onResult(0, {"booleanResult": true})
    }
}

export {MyAuthenticator}