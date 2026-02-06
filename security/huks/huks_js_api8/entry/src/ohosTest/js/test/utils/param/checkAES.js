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
import { HuksCipherAES } from './cipher/publicCipherParam';
import { arrayEqual, stringToUint8Array, uint8ArrayToString } from './publicFunc';
import Data from '../common/data.js';
import { logger } from '../common/logger.js';

let srcData64Kb = stringToUint8Array(Data.data64B)
let updateResult = new Array();
let finishData = new Array();
let dataBeforeEncrypt = new Array();
let handle;
let res = true;

async function publicInitFunc(srcKeyAlias, HuksOptions) {
    logger.info(`enter promise doInit`);
    try {
        await huks.initSession(srcKeyAlias, HuksOptions)
            .then((data) => {
                logger.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
                handle = data.handle;
            })
            .catch(error => {
                logger.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
                res = false;
            });
    } catch (error) {
        logger.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
        res = false;
    }
}

async function publicUpdateFunc(HuksOptions, thirdInterfaceName, isEncrypt) {
    let dateSize = 64;
    let huksOptionsInData = HuksOptions.inData;
    let inDataArray = HuksOptions.inData;
    if (Array.from(inDataArray).length < dateSize) {
        await update(handle, HuksOptions);
        HuksOptions.inData = new Uint8Array(new Array());
        await publicFinishAbortFunc(HuksOptions, thirdInterfaceName, isEncrypt);
    } else {
        let count = Math.floor(Array.from(inDataArray).length / dateSize);
        let remainder = Array.from(inDataArray).length % dateSize;
        for (let i = 0; i < count; i++) {
            HuksOptions.inData = new Uint8Array(Array.from(huksOptionsInData).slice(dateSize * i, dateSize * (i + 1)));
            await update(handle, HuksOptions);
        }
        HuksOptions.inData = huksOptionsInData;
        if (remainder !== 0) {
            HuksOptions.inData = new Uint8Array(
                Array.from(huksOptionsInData).slice(dateSize * count, uint8ArrayToString(inDataArray).length)
            );
        } else {
            HuksOptions.inData = new Uint8Array(new Array());
        }
        await publicFinishAbortFunc(HuksOptions, thirdInterfaceName, isEncrypt);
    }
}

async function update(handle, HuksOptions) {
    logger.info(`enter promise doUpdate`);
    try {
        await huks.updateSession(handle, HuksOptions)
            .then((data) => {
                logger.info(`promise: doUpdate success, data = ${JSON.stringify(data)}`);
                if (updateResult.length !== 0) {
                    logger.log(`test update outDatalength ${updateResult.length}`);
                    updateResult = updateResult.concat(Array.from(data.outData));
                } else {
                    logger.log(`test update outDatalength ${updateResult.length}`);
                    updateResult = Array.from(data.outData);
                }
            })
            .catch(error => {
                logger.error(`promise: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
                res = false;
            });
    } catch (error) {
        logger.error(`promise: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
        res = false;
    }
}

async function publicFinishAbortFunc(HuksOptions, thirdInterfaceName, isEncrypt) {
    if (thirdInterfaceName == 'finish') {
        await finish(HuksOptions, isEncrypt);
    } else if (thirdInterfaceName == 'abort') {
        await abort(HuksOptions);
    }
}

async function finish(HuksOptions, isEncrypt) {
    logger.info(`enter promise doFinish`);
    try {
        await huks.finishSession(handle, HuksOptions)
            .then((data) => {
                logger.info(`promise: doFinish success, data = ${JSON.stringify(data)}`);
                if (dataBeforeEncrypt.length > 64) {
                    finishData = uint8ArrayToString(updateResult.concat(Array.from(data.outData)));
                    updateResult = updateResult.concat(Array.from(data.outData));
                } else {
                    logger.info(`updateResult: updateResult success, data = ${JSON.stringify(updateResult)}`);
                    finishData = uint8ArrayToString(updateResult);
                }
            })
            .catch(error => {
                logger.error(`promise: doFinish failed, code: ${error.code}, msg: ${error.message}`);
                res = false;
            });
    } catch (error) {
        logger.error(`promise: doFinish input arg invalid, code: ${error.code}, msg: ${error.message}`);
        res = false;
    }
}

async function abort(HuksOptions) {
    logger.info(`enter promise doAbort`);
    try {
        await huks.abortSession(handle, HuksOptions)
            .then((data) => {
                logger.info(`promise: doAbort success, data = ${JSON.stringify(data)}`);
            })
            .catch(error => {
                logger.error(`promise: doAbort failed, code: ${error.code}, msg: ${error.message}`);
                res = false;
            });
    } catch (error) {
        logger.error(`promise: doAbort input arg invalid, code: ${error.code}, msg: ${error.message}`);
        res = false;
    }
}

async function publicDeleteKeyFunc(srcKeyAlias, genHuksOptionsNONECBC) {
    logger.info(`enter promise deleteKeyItem`);
    try {
        await huks.deleteKeyItem(srcKeyAlias, genHuksOptionsNONECBC)
            .then((data) => {
                logger.info(`promise: deleteKeyItem key success, data = ${JSON.stringify(data)}`);
            })
            .catch(error => {
                logger.error(`promise: deleteKeyItem failed, code: ${error.code}, msg: ${error.message}`);
                res = false;
            });
    } catch (error) {
        logger.error(`promise: deleteKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
        res = false;
    }
}

async function publicCipherFunc(srcKeyAlias, HuksOptions, thirdInterfaceName, isEncrypt) {
    try {
        updateResult = new Array();
        if (isEncrypt) {
            dataBeforeEncrypt = HuksOptions.inData; //原始数据
        }
        await publicInitFunc(srcKeyAlias, HuksOptions);
        await publicUpdateFunc(HuksOptions, thirdInterfaceName, isEncrypt);
        if (!isEncrypt || (isEncrypt && thirdInterfaceName == 'abort')) {
            await publicDeleteKeyFunc(srcKeyAlias, HuksOptions);
        }
    } catch (e) {
        res = false;
    }
}


async function checkAESCipher(srcKeyAliasFirst, srcKeyAliasSecond, HuksOptions) {
    updateResult = new Array();
    HuksOptions.inData = srcData64Kb;
    HuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyPurposeDECRYPT);
    //加密
    await publicCipherFunc(srcKeyAliasFirst, HuksOptions, 'finish', true);
    //解密
    HuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyPurposeENCRYPT);
    HuksOptions.inData = new Uint8Array(updateResult);
    await publicCipherFunc(srcKeyAliasSecond, HuksOptions, 'finish', false);
    let arrayEqualRes = arrayEqual(Array.from(updateResult), Array.from(srcData64Kb))
    if (!arrayEqualRes) { // if not success then res comes to false
        res = false;
    }
    return res;
}

export { checkAESCipher };