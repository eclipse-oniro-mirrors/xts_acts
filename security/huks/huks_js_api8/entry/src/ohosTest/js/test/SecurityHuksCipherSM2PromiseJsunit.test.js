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
let decryptedResult = new Array();
let exportKey;
let plainData;


async function publicGenerateKeyFunc(srcKeyAlias, genHuksOptionsNONC) {
    await huks
        .generateKey(srcKeyAlias, genHuksOptionsNONC)
        .then((data) => {
            logger.log(`test generateKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test generateKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicExportKeyFunc(srcKeyAlias, genHuksOptionsNONC) {
    await huks
        .exportKey(srcKeyAlias, genHuksOptionsNONC)
        .then((data) => {
            logger.log(`test ExportKey data: ${JSON.stringify(data)}`);
            exportKey = data.outData;
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test ImportKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicImportKeyFunc(srcKeyAlias, HuksOptions) {
    let temp;
    if (HuksOptions.hasOwnProperty('inData')) {
        temp = HuksOptions.inData;
    }
    HuksOptions.inData = exportKey;
    await huks
        .importKey(srcKeyAlias, HuksOptions)
        .then((data) => {
            if (HuksOptions.hasOwnProperty('inData')) {
                HuksOptions.inData = temp;
            }
            logger.log(`test ImportKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test ImportKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicInitFunc(srcKeyAlias, HuksOptions) {
    logger.log(`test init HuksOptions: ${JSON.stringify(HuksOptions)}`);
    await huks
        .init(srcKeyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test init data: ${JSON.stringify(data)}`);
            handle = data.handle;
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test init err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}


async function update(handle, HuksOptions) {
    await huks.update(handle, HuksOptions)
        .then(async (data) => {
            logger.log(`test update data ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test update err information: ' + err);
            expect(null).assertFail();
        });
}

async function finish(HuksOptions, isEncrypt) {
    try {
        await huks
            .finish(handle, HuksOptions)
            .then((data) => {
                logger.log(`test finish data: ${JSON.stringify(data)}`);
                if (isEncrypt) {
                    encryptedResult = Array.from(data.outData);
                    logger.info(`promise: doFinish success, data2 = ` + encryptedResult);
                } else {
                    decryptedResult = Array.from(data.outData);
                }
            })
            .catch(error => {
                logger.error(`promise: doFinish failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        logger.error(`promise: doFinish input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

async function publicDeleteKeyFunc(srcKeyAlias, genHuksOptionsNONC) {
    await huks
        .deleteKey(srcKeyAlias, genHuksOptionsNONC)
        .then((data) => {
            logger.log(`test deleteKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test deleteKey err information: ' + JSON.stringify(err));
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

export default function SecurityHuksCipherSM2PromiseJsunit() {
    describe('SecurityHuksCipherSM2PromiseJsunit', function () {

        /**
         * @tc.name   Security_HUKS_Cipher_API8_SM2_101
         * @tc.number Security_HUKS_Cipher_API8_SM2_101
         * @tc.desc   Security_HUKS_Cipher_API8_SM2_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_SM2_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_SM2_101A';
            const newSrcKeyAlias = 'Security_HUKS_Cipher_API8_SM2_101B';

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
         * @tc.name   Security_HUKS_Cipher_API8_SM2_102
         * @tc.number Security_HUKS_Cipher_API8_SM2_102
         * @tc.desc   Security_HUKS_Cipher_API8_SM2_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_SM2_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_SM2_102A';
            const newSrcKeyAlias = 'Security_HUKS_Cipher_API8_SM2_102B';

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

        /**
         * @tc.name   SUB_Security_HUKS_Cipher_API8_SM2_0100
         * @tc.number SUB_Security_HUKS_Cipher_API8_SM2_0100
         * @tc.desc   SUB_Security_HUKS_Cipher_API8_SM2_0100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Security_HUKS_Cipher_API8_SM2_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'SUB_Security_HUKS_Cipher_API8_SM2_0100';

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
                        value: 128
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                )
            }
            try {
                await huks.generateKeyItem(srcKeyAlias, HuksOptions);
                logger.error(srcKeyAlias + `: generateKeyItem success, expect fail`);
                expect(null).assertFail();
            } catch (err) {
                logger.error(srcKeyAlias + `: catch error ${JSON.stringify(err)}`);
                expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
            }
            logger.log(srcKeyAlias + `: success.`);
            done();
        });
    }
    );
}
