/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import huks from '@ohos.security.huks';
import { HuksSignVerifyDSA } from './signVerify/publicSignVerifyParam';
import { logger } from '../common/logger.js';

function stringToArray(str) {
    var arr = [];
    for (var i = 0, j = str.length; i < j; ++i) {
        arr.push(str.charCodeAt(i));
    }
    return arr;
}

function uint8ArrayToString(fileData) {
    var dataString = '';
    for (var i = 0; i < fileData.length; i++) {
        dataString += String.fromCharCode(fileData[i]);
    }
    return dataString;
}

function stringToUint8Array(str) {
    var arr = [];
    for (var i = 0, j = str.length; i < j; ++i) {
        arr.push(str.charCodeAt(i));
    }
    var tmpUint8Array = new Uint8Array(arr);
    return tmpUint8Array;
}

export function makeOptions(baseOptions, addStart, addArray, inData) {
    if (addArray.length > 0) {
        for (let i = 0; i < addArray.length; i++) {
            baseOptions.properties.splice(addStart, 0, addArray[i]);
            addStart++;
        }
    }
    baseOptions.inData = inData;
    return baseOptions;
}

function arrayEqual(a, b) {
    if ((!a instanceof Array) || (!b instanceof Array)) {
        return false;
    }
    if (a.length !== b.length) {
        return false;
    }
    for (let i = 0; i < a.length; ++i) {
        if ((!a instanceof Number) || (!b instanceof Number)) {
            return false;
        }
        if (a[i] !== b[i]) {
            return false;
        }
    }
    return true;
}

async function checkSoftware() {
    let dsaAlias = "useDsaToCheckSoftware";
    let dsaOption = {
        properties: new Array(
            HuksSignVerifyDSA.HuksKeyAlgDSA,
            HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY,
            HuksSignVerifyDSA.HuksKeySIZE1024,
            HuksSignVerifyDSA.HuksTagDSADigestSHA256
        )
    };
    let res = await huks.generateKey(dsaAlias, dsaOption);
    logger.log(`test generate:${JSON.stringify(res)}`);
    if (res.errorCode == 0) {
        await huks.deleteKey(dsaAlias, dsaOption);
        logger.error("This device uses software");
        return true;
    } else {
        logger.error("This device does not use software");
        return false;
    }
}

export { stringToArray, uint8ArrayToString, stringToUint8Array, arrayEqual, checkSoftware };
