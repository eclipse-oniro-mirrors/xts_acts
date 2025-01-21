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

import { describe, it, expect } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import { HuksCipherRSA } from '../../../../../../../utils/param/cipher/publicCipherParam';
import { stringToUint8Array, uint8ArrayToString, arrayEqual } from '../../../../../../../utils/param/publicFunc';

let gInData64 =
    'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
    'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
    'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
    'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
    'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
    'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
    'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
    'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt';

let defaultData = '0';

let gInData64Array = stringToUint8Array(gInData64);

let encryptedData;
let inputInData;
var handle;
let encryptedResult = new Array();
let decryptedResult = new Array();
let exportKey;
let plainData;


async function publicGenerateKeyFunc(srcKeyAlies, genHuksOptionsNONC) {
    await huks
        .generateKey(srcKeyAlies, genHuksOptionsNONC)
        .then((data) => {
            console.log(`test generateKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            console.log('test generateKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicExportKeyFunc(srcKeyAlies, genHuksOptionsNONC) {
    await huks
        .exportKey(srcKeyAlies, genHuksOptionsNONC)
        .then((data) => {
            console.log(`test ExportKey data: ${JSON.stringify(data)}`);
            exportKey = data.outData;
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            console.log('test ImportKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicImportKeyFunc(srcKeyAlies, HuksOptions) {
    let temp;
    if (HuksOptions.hasOwnProperty('inData')) {
        temp = HuksOptions.inData;
    }
    HuksOptions.inData = exportKey;
    await huks
        .importKey(srcKeyAlies, HuksOptions)
        .then((data) => {
            if (HuksOptions.hasOwnProperty('inData')) {
                HuksOptions.inData = temp;
            }
            console.log(`test ImportKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            console.log('test ImportKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicInitFunc(srcKeyAlies, HuksOptions) {
    console.log(`test init HuksOptions: ${JSON.stringify(HuksOptions)}`);
    await huks
        .init(srcKeyAlies, HuksOptions)
        .then((data) => {
            console.log(`test init data: ${JSON.stringify(data)}`);
            handle = data.handle;
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            console.log('test init err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicUpdateFunc(HuksOptions) {
    let dateSize = 64;
    let huksOptionsInData = HuksOptions.inData;
    let inDataArray = HuksOptions.inData;
    if (Array.from(inDataArray).length < dateSize) {
        await update(handle, HuksOptions);
        HuksOptions.inData = stringToUint8Array('0');
    } else {
        let count = Math.floor(Array.from(inDataArray).length / dateSize);
        let remainder = Array.from(inDataArray).length % dateSize;
        for (let i = 0; i < count; i++) {
            HuksOptions.inData = new Uint8Array(Array.from(huksOptionsInData).slice(dateSize * i, dateSize * (i + 1)));
            await update(handle, HuksOptions);
            HuksOptions.inData = huksOptionsInData;
        }
        if (remainder !== 0) {
            HuksOptions.inData = new Uint8Array(
                Array.from(huksOptionsInData).slice(dateSize * count, uint8ArrayToString(inDataArray).length)
            );
            await update(handle, HuksOptions);
        }
    }
}

async function update(handle, HuksOptions) {
    await huks
        .update(handle, HuksOptions)
        .then(async (data) => {
            console.log(`test update data ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            console.log('test update err information: ' + err);
            expect(null).assertFail();
        });
}

async function publicFinishAbortFunc(HuksOptions, thirdInderfaceName, isEncrypt) {
    if (thirdInderfaceName == 'finish') {
        HuksOptions.inData = new Uint8Array(new Array());
        await finish(HuksOptions, isEncrypt);
    } else if (thirdInderfaceName == 'abort') {
        await abort(HuksOptions);
    }
}

async function finish(HuksOptions, isEncrypt) {
    try {
        await huks
            .finish(handle, HuksOptions)
            .then((data) => {
                console.log(`test finish data: ${JSON.stringify(data)}`);
                if (isEncrypt) {
                    encryptedResult = Array.from(data.outData);
                    console.info(`promise: doFinish success, data2 = ` + encryptedResult);
                } else {
                    decryptedResult = Array.from(data.outData);
                }
            })
            .catch(error => {
                console.error(`promise: doFinish failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        console.error(`promise: doFinish input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

async function abort(HuksOptions) {
    await huks
        .abort(handle, HuksOptions)
        .then((data) => {
            console.log(`test abort data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            console.log('test abort err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicDeleteKeyFunc(srcKeyAlies, genHuksOptionsNONC) {
    await huks
        .deleteKey(srcKeyAlies, genHuksOptionsNONC)
        .then((data) => {
            console.log(`test deleteKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            console.log('test deleteKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicCipherFunc(
    srcKeyAlies,
    newSrcKeyAlies,
    genHuksOptionsNONC,
    HuksOptions,
    thirdInderfaceName,
    isEncrypt
) {
    inputInData = HuksOptions.inData;
    try {
        encryptedResult = new Array();
        let KeyAlias = srcKeyAlies;
        if (isEncrypt) {
            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptionsNONC);
            encryptedData = HuksOptions.inData;
            await publicExportKeyFunc(srcKeyAlies, genHuksOptionsNONC);
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions);
            KeyAlias = newSrcKeyAlies;
        }
        HuksOptions.inData = inputInData;
        await publicInitFunc(KeyAlias, HuksOptions);
        await publicUpdateFunc(HuksOptions);
        await publicFinishAbortFunc(HuksOptions, thirdInderfaceName, isEncrypt);
        if (!isEncrypt || (isEncrypt && thirdInderfaceName == 'abort')) {
            await publicDeleteKeyFunc(srcKeyAlies, genHuksOptionsNONC);
            await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptionsNONC);
        }
    } catch (e) {
        expect(null).assertFail();
    }
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

export default function SecurityHuksCipherRSABasicPromiseJsunit() {
    describe('SecurityHuksCipherSM2BasicPromiseJsunit', function () {

        it('Security_HUKS_Cipher_API8_SM2_101', 0, async function (done) {
            const srcKeyAlies = 'Security_HUKS_Cipher_API8_SM2_101A';
            const newSrcKeyAlies = 'Security_HUKS_Cipher_API8_SM2_101B';

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

            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlies, genHuksOptions);
            //public Key, purpose should change, cause there is noly one key
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions); //这里修改了huksOptions的.indata

            //Encrypt
            await publicInitFunc(newSrcKeyAlies, HuksOptions);
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
            await publicInitFunc(srcKeyAlies, HuksOptions);
            await update(handle, HuksOptions)
            HuksOptions.inData = stringToUint8Array(new Array());
            await finish(HuksOptions, false);

            //check
            expect(arrayEqual(plainData, decryptedResult)).assertTrue();

            //delete
            publicDeleteKeyFunc(srcKeyAlies, genHuksOptions);
            publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions);
            done();

        });

        it('Security_HUKS_Cipher_API8_SM2_102', 0, async function (done) {
            const srcKeyAlies = 'Security_HUKS_Cipher_API8_SM2_101A';
            const newSrcKeyAlies = 'Security_HUKS_Cipher_API8_SM2_101B';

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

            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlies, genHuksOptions);
            //public Key, purpose should change, cause there is noly one key
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions); //这里修改了huksOptions的.indata

            //Encrypt
            await publicInitFunc(newSrcKeyAlies, HuksOptions);
            await finish(HuksOptions, true);

            //Decrypt
            HuksOptions.properties.splice(1, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
                },);
            HuksOptions.inData = new Uint8Array(encryptedResult);
            await publicInitFunc(srcKeyAlies, HuksOptions);
            await finish(HuksOptions, false);

            //check
            expect(arrayEqual(plainData, decryptedResult)).assertTrue();

            //delete
            publicDeleteKeyFunc(srcKeyAlies, genHuksOptions);
            publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions);
            done();
        });

        /**
         * @tc.number SUB_Security_HUKS_Cipher_API8_SM2_0100
         * @tc.name generate sm2 with error key size 128
         * @tc.size Medium
         * @tc.type Func
         * @tc.level Level2
         */
        it('SUB_Security_HUKS_Cipher_API8_SM2_0100', 0, async function (done) {
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
                console.error(srcKeyAlias + `: generateKeyItem success, expect fail`);
                expect(null).assertFail();
            } catch (err) {
                console.log(srcKeyAlias + `: catch error ${JSON.stringify(err)}`);
                expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
            }
            console.log(srcKeyAlias + `: success.`);
            done();
        });
    }
    );
}
