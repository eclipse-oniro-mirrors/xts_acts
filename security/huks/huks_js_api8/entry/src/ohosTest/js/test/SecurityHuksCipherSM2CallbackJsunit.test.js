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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import { arrayEqual, stringToUint8Array } from './utils/param/publicFunc';
import { logger } from './utils/common/logger';
import * as huksCallback from './utils/param/huksCallback.js';

let gInData64 =
    'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt';

let gInData64Array = stringToUint8Array(gInData64);
var handle;
let encryptedResult = new Array();
let exportKey;
let decryptedResult;
let plainData;


async function publicGenerateKeyFunc(srcKeyAlias, genHuksOptionsNONC) {
    await huksCallback.generateKey(srcKeyAlias, genHuksOptionsNONC)
        .then((data) => {
            logger.error(`test generateKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
            expect(data.outData == null).assertTrue();
            expect(data.properties == null).assertTrue();
            expect(huks.getSdkVersion(genHuksOptionsNONC) != null).assertTrue();
        })
        .catch((err) => {
            logger.log('test generateKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicExportKeyFunc(srcKeyAlias, genHuksOptionsNONC) {
    await huksCallback.exportKey(srcKeyAlias, genHuksOptionsNONC)
        .then((data) => {
            logger.log(`test ExportKey data: ${JSON.stringify(data)}`);
            exportKey = data.outData;
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.log('test ImportKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicImportKeyFunc(srcKeyAlias, HuksOptions) {
    let temp;
    if (HuksOptions.hasOwnProperty('inData')) {
        temp = HuksOptions.inData;
    }
    HuksOptions.inData = exportKey;
    await huksCallback.importKey(srcKeyAlias, HuksOptions)
        .then((data) => {
            if (HuksOptions.hasOwnProperty('inData')) {
                HuksOptions.inData = temp;
            }
            logger.log(`test ImportKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.log('test ImportKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicInitFunc(srcKeyAlias, HuksOptions) {
    await huksCallback.init(srcKeyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test init data: ${JSON.stringify(data)}`);
            handle = data.handle;
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.log('test init err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function update(handle, HuksOptions) {
    await huksCallback.update(handle, HuksOptions)
        .then(async (data) => {
            logger.log(`test update data ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.log('test update err information: ' + err);
            expect(null).assertFail();
        });
}

async function finish(HuksOptions, isEncrypt) {
    try {
        await huksCallback.finish(handle, HuksOptions)
            .then((data) => {
                logger.log(`test finish data: ${JSON.stringify(data)}`);
                if (isEncrypt) {
                    encryptedResult = Array.from(data.outData);
                    logger.info(`callback: doFinish success, data2 = ` + encryptedResult);
                } else {
                    decryptedResult = Array.from(data.outData);
                }
            })
            .catch(error => {
                logger.error(`callback: doFinish failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        logger.error(`callback: doFinish input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

async function publicDeleteKeyFunc(srcKeyAlias, genHuksOptionsNONC) {
    await huksCallback.deleteKey(srcKeyAlias, genHuksOptionsNONC)
        .then((data) => {
            logger.log(`test deleteKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.log('test deleteKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

let genHuksOptions = {
    properties: new Array(
        {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_SM2,
        },
        {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
        },
        {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256,
        },
    ),
};

export default function SecurityHuksCipherSM2CallbackJsunit() {
    describe('SecurityHuksCipherSM2CallbackJsunit', function () {

        /**
         * @tc.name   Security_HUKS_Cipher_API8_SM2_001
         * @tc.number Security_HUKS_Cipher_API8_SM2_001
         * @tc.desc   Security_HUKS_Cipher_API8_SM2_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_SM2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_SM2_001A';
            const newSrcKeyAlias = 'Security_HUKS_Cipher_API8_SM2_001B';

            let HuksOptions = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                        value: huks.HuksKeyAlg.HUKS_ALG_SM2
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                ),
                inData: gInData64Array,
            }

            //init
            encryptedResult = new Array();
            decryptedResult = new Array();
            plainData = HuksOptions.inData;

            await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlias, genHuksOptions);
            //public Key, purpose should change, cause there is only one key
            await publicImportKeyFunc(newSrcKeyAlias, HuksOptions); //这里修改了huksOptions的.indata

            //Encrypt
            await publicInitFunc(newSrcKeyAlias, HuksOptions);
            await update(handle, HuksOptions)
            HuksOptions.inData = stringToUint8Array(new Array());
            await finish(HuksOptions, true);

            //Decrypt
            HuksOptions.properties.splice(1, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
                },);
            HuksOptions.inData = new Uint8Array(encryptedResult);
            await publicInitFunc(srcKeyAlias, HuksOptions);
            await update(handle, HuksOptions)
            HuksOptions.inData = stringToUint8Array(new Array());
            await finish(HuksOptions, false);

            //check
            expect(arrayEqual(plainData, decryptedResult)).assertTrue();

            //delete
            await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions);
            await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_SM2_002
         * @tc.number Security_HUKS_Cipher_API8_SM2_002
         * @tc.desc   Security_HUKS_Cipher_API8_SM2_002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_SM2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            //init update finish
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_SM2_002A';
            const newSrcKeyAlias = 'Security_HUKS_Cipher_API8_SM2_002B';

            let HuksOptions = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                        value: huks.HuksKeyAlg.HUKS_ALG_SM2
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                ),
                inData: gInData64Array,
            }

            //init
            encryptedResult = new Array();
            decryptedResult = new Array();
            plainData = HuksOptions.inData;

            await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlias, genHuksOptions);
            //public Key, purpose should change, cause there is only one key
            await publicImportKeyFunc(newSrcKeyAlias, HuksOptions); //这里修改了huksOptions的.indata

            //Encrypt
            await publicInitFunc(newSrcKeyAlias, HuksOptions);
            await finish(HuksOptions, true);

            //Decrypt
            HuksOptions.properties.splice(1, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
                },);
            HuksOptions.inData = new Uint8Array(encryptedResult);
            await publicInitFunc(srcKeyAlias, HuksOptions);
            await finish(HuksOptions, false);

            //check
            expect(arrayEqual(plainData, decryptedResult)).assertTrue();

            //delete
            await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions);
            await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions);
            done();
        });

    });
}
