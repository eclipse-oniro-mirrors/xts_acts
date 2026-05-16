/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
 
//index.js
var h5Port;
window.addEventListener('message', function(event) {
    if (event.data == 'init_web_messageport') {
        if(event.ports[0] != null) {
            h5Port = event.ports[0]; // 1. 保存从ets侧发送过来的端口
            h5Port.onmessage = function(event) {
                console.log("hwd In html got message");
                // 2. 接收ets侧发送过来的消息.
                var result = event.data;
                console.log("In html got message, typeof: ", typeof(result));
                console.log("In html got message, result: ", (result));
                if (typeof(result) == "string") {
                    console.log("In html got message, String: ", result);
                    document.getElementById("msg").innerHTML  =  "String:" + result;
                } else if (typeof(result) == "number") {
                  console.log("In html side got message, number: ", result);
                    document.getElementById("msg").innerHTML = "Number:" + result;
                } else if (typeof(result) == "boolean") {
                    console.log("In html side got message, boolean: ", result);
                    document.getElementById("msg").innerHTML = "Boolean:" + result;
                } else if (typeof(result) == "object") {
                    if (result instanceof ArrayBuffer) {
                        document.getElementById("msg2").innerHTML  =  "ArrayBuffer:" + result.byteLength;
                        console.log("In html got message, byteLength: ", result.byteLength);
                    } else if (result instanceof Error) {
                        console.log("In html error message, err:" + (result));
                        console.log("In html error message, typeof err:" + typeof(result));
                        document.getElementById("msg2").innerHTML  =  "Error:" + result.name + ", msg:" + result.message;
                    } else if (result instanceof Array) {
                        console.log("In html got message, Array");
                        console.log("In html got message, Array length:" + result.length);
                        console.log("In html got message, Array[0]:" + (result[0]));
                        console.log("In html got message, typeof Array[0]:" + typeof(result[0]));
                        document.getElementById("msg2").innerHTML  =  "Array len:" + result.length + ", value:" + result;
                    } else {
                        console.log("In html got message, not any instance of support type");
                        document.getElementById("msg").innerHTML  = "not any instance of support type";
                    }
                } else {
                    console.log("In html got message, not support type");
                    document.getElementById("msg").innerHTML  = "not support type";
                }
            }
            h5Port.onmessageerror = (event) => {
                console.error(`hwd In html Error receiving message: ${event}`);
            };
        }
    }
})

// 使用h5Port往ets侧发送String类型的消息.
function postStringToApp() {
    if (h5Port) {
        console.log("In html send string message");
        h5Port.postMessage("hello");
        console.log("In html send string message end");
    } else {
        console.error("In html h5port is null, please init first");
    }
}

// 使用h5Port往ets侧发送Number类型的消息.
function postNumberToApp() {
    if (h5Port) {
        console.log("In html send number message");
        h5Port.postMessage(123456);
        console.log("In html send number message end");
    } else {
        console.error("In html h5port is null, please init first");
    }
}

// 使用h5Port往ets侧发送Boolean类型的消息.
function postBooleanToApp() {
    if (h5Port) {
        console.log("In html send boolean message");
        h5Port.postMessage(true);
        console.log("In html send boolean message end");
    } else {
        console.error("In html h5port is null, please init first");
    }
}

// 使用h5Port往ets侧发送ArrayBuffer类型的消息.
function postArrayBufferToApp() {
    if (h5Port) {
        console.log("In html send ArrayBuffer message");
        let buffer = new ArrayBuffer(12);
        buffer[0] = 'a';
        h5Port.postMessage(buffer);
        console.log("In html send ArrayBuffer message end");
    } else {
        console.error("In html h5port is null, please init first");
    }
}

// 使用h5Port往ets侧发送Array类型的消息.
function postArrayToApp() {
    if (h5Port) {
        console.log("In html send Array message");
        let a = Array("apple", "banana", "cherry");
        h5Port.postMessage(a);
        console.log("In html send Array message end");
    } else {
        console.error("In html h5port is null, please init first");
    }
}

// 使用h5Port往ets侧发送Error类型的消息.
function postErrorToApp() {
    if (h5Port) {
        console.log("In html send Error message");
        let err = new Error('An error occurred!', { cause: '4321' })
        h5Port.postMessage(err);
        console.log("In html send Error message end");
    } else {
        console.error("In html h5port is null, please init first");
    }
}

function closeWin() {
    window.opener = null
    window.open('', '_self',)
    window.close()
    return true
}

function portClose() {
    h5Port.close()
}

function test() {
    backToEts.test("backToEts")
}