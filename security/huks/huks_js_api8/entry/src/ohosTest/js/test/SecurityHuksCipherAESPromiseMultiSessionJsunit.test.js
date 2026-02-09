/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import { HuksCipherAES } from './utils/param/cipher/publicCipherParam';
import { HksTag } from './utils/param/publicParam';
import { stringToUint8Array, uint8ArrayToString } from './utils/param/publicFunc';
import { logger } from './utils/common/logger';

let IV = '0000000000000000';

let srcData63 = 'Hks_AES_Cipher_Test_000000000000000000000_string';
let srcData63Kb = stringToUint8Array(srcData63);
let updateResult = new Array();
let finishData = new Array();
let encryptedData = new Array();
let handleSession = [];
var srcKeyAlias = [];
let resultSession = [];
let sessionCount = 100; // suggest count >= 32
let singleMaxCount = 32;
let totalMaxCount = 96;


async function publicGenerateKeyFunc(srcKeyAlias, genHuksOptionsNONECBC) {
    logger.info(`enter promise generateKeyItem`);
    try {
        await huks.generateKeyItem(srcKeyAlias, genHuksOptionsNONECBC)
            .then((data) => {
                logger.info(`promise: generateKeyItem success, data = ${JSON.stringify(data)}`);
            })
            .catch(error => {
                logger.error(`promise: generateKeyItem failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        logger.error(`promise: generateKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

async function publicInitFunc(srcKeyAlias, HuksOptions, SessionNum) {
    logger.info(`enter promise doInit`);
    try {
        await huks.initSession(srcKeyAlias, HuksOptions)
            .then((data) => {
                logger.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
                handleSession[SessionNum] = data.handle;
            })
            .catch(error => {
                logger.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        logger.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

async function publicUpdateFunc(HuksOptions, thirdInterfaceName, SessionNum) {
    let dateSize = 64;
    let huksOptionsInData = HuksOptions.inData;
    let inDataArray = HuksOptions.inData;
    let handle = handleSession[SessionNum];
    if (Array.from(inDataArray).length < dateSize) {
        await update(handle, HuksOptions, SessionNum);
        HuksOptions.inData = new Uint8Array(new Array());
        await publicFinishAbortFunc(HuksOptions, thirdInterfaceName, SessionNum);
    } else {
        let count = Math.floor(Array.from(inDataArray).length / dateSize);
        let remainder = Array.from(inDataArray).length % dateSize;
        for (let i = 0; i < count; i++) {
            HuksOptions.inData = new Uint8Array(Array.from(huksOptionsInData).slice(dateSize * i, dateSize * (i + 1)));
            await update(handle, HuksOptions, SessionNum);
        }
        HuksOptions.inData = huksOptionsInData;
        if (remainder !== 0) {
            HuksOptions.inData = new Uint8Array(
                Array.from(huksOptionsInData).slice(dateSize * count, uint8ArrayToString(inDataArray).length)
            );
        } else {
            HuksOptions.inData = new Uint8Array(new Array());
        }
        await publicFinishAbortFunc(HuksOptions, thirdInterfaceName, SessionNum);
    }
}

async function update(handle, HuksOptions, SessionNum) {
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
                resultSession[SessionNum] = error.code;
            });
    } catch (error) {
        logger.error(`promise: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
        resultSession[SessionNum] = 'fail';
    }
}


async function publicFinishAbortFunc(HuksOptions, thirdInterfaceName, SessionNum) {
    if (thirdInterfaceName == 'finish') {
        await finish(HuksOptions, SessionNum);
    } else if (thirdInterfaceName == 'abort') {
        await abort(HuksOptions, SessionNum);
    }
}

async function finish(HuksOptions, SessionNum) {
    logger.info(`enter promise doFinish`);
    try {
        let handle = handleSession[SessionNum];
        await huks.finishSession(handle, HuksOptions)
            .then((data) => {
                logger.info(`promise: doFinish success, data = ${JSON.stringify(data)}`);
                if (encryptedData.length > 64) {
                    finishData = uint8ArrayToString(updateResult.concat(Array.from(data.outData)));
                    updateResult = updateResult.concat(Array.from(data.outData));
                } else {
                    logger.info(`updateResult: updateResult success, data = ${JSON.stringify(updateResult)}`);
                    finishData = uint8ArrayToString(updateResult);
                }
            })
            .catch(error => {
                logger.error(`promise: doFinish failed, code: ${error.code}, msg: ${error.message}`);
                resultSession[SessionNum] = resultSession[SessionNum] != 'success' ? resultSession[SessionNum] : error.code;
            });
    } catch (error) {
        logger.error(`promise: doFinish input arg invalid, code: ${error.code}, msg: ${error.message}`);
        resultSession[SessionNum] = 'fail';
    }
}

async function abort(HuksOptions, SessionNum) {
    logger.info(`enter promise doAbort`);
    try {
        let handle = handleSession[SessionNum];
        await huks.abortSession(handle, HuksOptions)
            .then((data) => {
                logger.info(`promise: doAbort success, data = ${JSON.stringify(data)}`);
            })
            .catch(error => {
                logger.error(`promise: doAbort failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        logger.error(`promise: doAbort input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
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
                expect(null).assertFail();
            });
    } catch (error) {
        logger.error(`promise: deleteKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}


async function publicCipherFuncWithoutEndSession(srcKeyAlias, genHuksOptionsNONECBC, HuksOptions, isEncrypt, sessionNum) {
    updateResult = new Array();
    if (isEncrypt) {
        await publicGenerateKeyFunc(srcKeyAlias, genHuksOptionsNONECBC);
        encryptedData = HuksOptions.inData;
        await publicInitFunc(srcKeyAlias, HuksOptions, sessionNum);
    }
}

export default function SecurityHuksCipherAESPromiseMultiSessionJsunit() {
    describe('SecurityHuksCipherAESPromiseMultiSessionJsunit', function () {
        /**
         * @tc.name   Security_HUKS_DFX_MultiSessionCipherAES100
         * @tc.number Security_HUKS_DFX_MultiSessionCipherAES100
         * @tc.desc   Security_HUKS_DFX_MultiSessionCipherAES100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_DFX_MultiSessionCipherAES100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let genHuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurpose,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                ),
                inData: new Uint8Array(new Array()),
            };
            let HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData63Kb,
            };


            for (let sessionNum = 0; sessionNum < sessionCount; sessionNum++) {
                srcKeyAlias[sessionNum] = 'Security_HUKSTest_MultiSessionCipherAES100_' + sessionNum.toString();
                resultSession[sessionNum] = 'success';
                await publicCipherFuncWithoutEndSession(srcKeyAlias[sessionNum], genHuksOptions, HuksOptions, 'finish', sessionNum);
            }

            //对所有的session 进行加密操作，观察结果
            for (let sessionNum = 0; sessionNum < sessionCount; sessionNum++) {
                HuksOptions.inData = srcData63Kb;
                await publicUpdateFunc(HuksOptions, 'finish', sessionNum);
            }

            // 对最终的结果进行判断，如果其中有sessionCount - 32个失败; 其余为成功的，否则用例执行失败。
            for (let sessionNum = 0; sessionNum < sessionCount; sessionNum++) {
                logger.log(`session result:  ${resultSession[sessionNum]}`);
                if (sessionNum < sessionCount - singleMaxCount) {
                    expect(resultSession[sessionNum]).assertEqual(12000011);
                } else {
                    expect(resultSession[sessionNum]).assertEqual('success');
                }
            }
            // finally, delete all the generated key
            for (let i = 0; i < sessionCount; i++) {
                await publicDeleteKeyFunc(srcKeyAlias[i], genHuksOptions);
            }
            done();
        });
    });
}
