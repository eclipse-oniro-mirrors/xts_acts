/*
 * Copyright (C) 2022-2023 Huawei Device Co., Ltd.
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

function stringToArray(str) {
    var arr = [];
    for (var i = 0, j = str.length; i < j; ++i) {
        arr.push(str.charCodeAt(i));
    }
    return arr;
}

//字节流转成可理解的字符串
function uInt8ArrayToString(fileData) {
    var dataString = "";
    for (var i = 0; i < fileData.length; i++) {
        dataString += String.fromCharCode(fileData[i]);
    }
    return dataString;
}

//可理解的字符串转成自字节流
function stringTouInt8Array(str) {
    if (str.length == 0) {
        console.error("stringTouInt8Array length is 0");
    }
    var arr = [];
    for (var i = 0, j = str.length; i < j; ++i) {
        arr.push(str.charCodeAt(i));
    }
    var tmpUint8Array = new Uint8Array(arr);
    return tmpUint8Array;
}

//字节流以16进制形式输出
function uInt8ArrayToShowStr(uInt8Array) {
    if (uInt8Array.length == 0) {
        console.error("uInt8ArrayToShowStr length is 0");
    }
    return Array.prototype.map
        .call(uInt8Array, (x) => ("00" + x.toString(16)).slice(-2))
        .join("");
}

function genIvParamsSpec(n) {
    var arr;
    if (n == 8) {
        arr = [0, 0, 0, 0, 0, 0, 0, 0];
    } else if (n == 16) {
        arr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    } else {
        console.error("genIvParamsSpec error: n = " + n);
        return null;
    }
    var dataIv = new Uint8Array(arr);
    var dataBlob = { data: dataIv };
    var ivParamSpec = {
        iv: dataBlob,
        algName: "IvParamsSpec",
    };
    return ivParamSpec;
}

function genGcmParamsSpec() {
    var arr = [0, 0, 0, 0, 0, 0, 0, 0];
    var dataAad = new Uint8Array(arr);
    var aadBlob = { data: dataAad };
    var arr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    var dataIv = new Uint8Array(arr);
    var ivBlob = { data: dataIv };
    var arr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    var dataTag = new Uint8Array(arr);
    var tagBlob = { data: dataTag };
    var gcmParamsSpec = {
        iv: ivBlob,
        aad: aadBlob,
        authTag: tagBlob,
        algName: "GcmParamsSpec",
    };
    return gcmParamsSpec;
}

function genCcmParamsSpec() {
    var arr = [0, 0, 0, 0, 0, 0, 0];
    var dataIv = new Uint8Array(arr);
    var ivBlob = { data: dataIv };
    var arr = [0, 0, 0, 0, 0, 0, 0, 0];
    var dataAad = new Uint8Array(arr);
    var aadBlob = { data: dataAad };
    var arr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    var dataTag = new Uint8Array(arr);
    var tagBlob = { data: dataTag };
    var ccmParamsSpec = {
        iv: ivBlob,
        aad: aadBlob,
        authTag: tagBlob,
        algName: "CcmParamsSpec",
    };
    return ccmParamsSpec;
}

export {
    stringToArray,
    uInt8ArrayToString,
    stringTouInt8Array,
    uInt8ArrayToShowStr,
    genGcmParamsSpec,
    genIvParamsSpec,
    genCcmParamsSpec,
};
