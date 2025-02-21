/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import { HuksCipherSM4 } from '../../../../../../utils/param/cipher/publicCipherParam';
import { HksTag } from '../../../../../../utils/param/publicParam';
import { stringToUint8Array, arrayEqual, checkSoftware } from '../../../../../../utils/param/publicFunc';
import huks from '@ohos.security.huks';

let IV = '0000000000000000';
let plainData;
let encryptedResult;
let handle;
let useSoftware = true;

const plainString48Bytes = 'Hks_SM4_Cipher_Test_000000000000000000000_string';
const plainData48Bytes = stringToUint8Array(plainString48Bytes);
const plainString240Bytes =
  'Hks_SM4_Cipher_Test_00000000000000000000000000000000000000000000' +
  '0000000000000000000000000000000000000000000000000000000000000000' +
  '0000000000000000000000000000000000000000000000000000000000000000' +
  '00000000000000000000000000000000000000000_string';
const plainData240Bytes = stringToUint8Array(plainString240Bytes);

let genHuksOptions = {
  properties: new Array(
    HuksCipherSM4.HuksKeyAlgSM4,
    HuksCipherSM4.HuksKeyPurpose
  ),
  inData: new Uint8Array(new Array()),
};

async function publicGenerateKeyFunc(srcKeyAlias, genHuksOptionsNONECBC) {
  console.info(`enter promise generateKeyItem`);
  try {
    await huks.generateKeyItem(srcKeyAlias, genHuksOptionsNONECBC)
      .then((data) => {
        console.info(`promise: generateKeyItem success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`promise: generateKeyItem failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: generateKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

async function publicInitFunc(srcKeyAlias, HuksOptions) {
  console.info(`enter promise doInit`);
  try {
    await huks.initSession(srcKeyAlias, HuksOptions)
      .then((data) => {
        console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
        handle = data.handle;
      })
      .catch(error => {
        console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

async function publicUpdateFunc(HuksOptions, thirdInderfaceName, isEncrypt) {
  const maxUpdateSize = 64;
  const inData = HuksOptions.inData;
  const lastInDataPosition = inData.length - 1;
  let inDataSegSize = maxUpdateSize;
  let inDataSegPosition = 0;
  let isFinished = false;
  let outData = [];

  while (inDataSegPosition <= lastInDataPosition) {
    if (inDataSegPosition + maxUpdateSize > lastInDataPosition) {
      isFinished = true;
      inDataSegSize = lastInDataPosition - inDataSegPosition + 1;
      break;
    }
    HuksOptions.inData = new Uint8Array(
      Array.from(inData).slice(inDataSegPosition, inDataSegPosition + inDataSegSize)
    );
    console.info(`enter promise doUpdate`);
    try {
      await huks.updateSession(handle, HuksOptions)
        .then((data) => {
          console.info(`promise: doUpdate success, data = ${JSON.stringify(data)}`);
          outData = outData.concat(Array.from(data.outData));
        })
        .catch(error => {
          console.error(`promise: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
          expect(null).assertFail();
        });
    } catch (error) {
      console.error(`promise: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
      expect(null).assertFail();
    }
    if ((!isFinished) && (inDataSegPosition + maxUpdateSize > lastInDataPosition)) {
      console.log(`update size invalid isFinished = ${isFinished}`);
      console.log(`inDataSegPosition = ${inDataSegPosition}`);
      console.log(`lastInDataPosition = ${lastInDataPosition}`);
      expect(null).assertFail();
      return;
    }
    inDataSegPosition += maxUpdateSize;
  }
  if (thirdInderfaceName == 'finish') {
    HuksOptions.inData = new Uint8Array(
      Array.from(inData).slice(inDataSegPosition, inDataSegPosition + inDataSegSize)
    );
    console.info(`enter promise doFinish`);
    try {
      await huks.finishSession(handle, HuksOptions)
        .then((data) => {
          console.info(`promise: doFinish success, data = ${JSON.stringify(data)}`);
          outData = outData.concat(Array.from(data.outData));
          if (isEncrypt) {
            encryptedResult = outData;
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
  } else if (thirdInderfaceName == 'abort') {
    console.info(`enter promise doAbort`);
    try {
      await huks.abortSession(handle, HuksOptions)
        .then((data) => {
          console.info(`promise: doAbort success, data = ${JSON.stringify(data)}`);
        })
        .catch(error => {
          console.error(`promise: doAbort failed, code: ${error.code}, msg: ${error.message}`);
          expect(null).assertFail();
        });
    } catch (error) {
      console.error(`promise: doAbort input arg invalid, code: ${error.code}, msg: ${error.message}`);
      expect(null).assertFail();
    }
  }
}

async function publicDeleteKeyFunc(srcKeyAlias, genHuksOptionsNONECBC) {
  console.info(`enter promise deleteKeyItem`);
  try {
    await huks.deleteKeyItem(srcKeyAlias, genHuksOptionsNONECBC)
      .then((data) => {
        console.info(`promise: deleteKeyItem key success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`promise: deleteKeyItem failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: deleteKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

async function publicCipherFunc(
  srcKeyAlias,
  genHuksOptions,
  HuksOptions,
  thirdInderfaceName,
  isEncrypt
) {
  try {
    if (isEncrypt) {
      plainData = HuksOptions.inData;
      await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
    }
    await publicInitFunc(srcKeyAlias, HuksOptions);
    await publicUpdateFunc(HuksOptions, thirdInderfaceName, isEncrypt);
    if (!isEncrypt || (isEncrypt && thirdInderfaceName == 'abort')) {
      await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions);
    }
  } catch (e) {
    expect(null).assertFail();
  }
}

export default function SecurityHuksCipherSM4BasicPromiseJsunit() {
  describe('SecurityHuksCipherSM4BasicPromiseJsunit', function () {
    beforeAll(async function (done) {
      useSoftware = await checkSoftware();
      done();
    })
    // HKS_SUPPORT_SM4_CBC_NOPADDING
    it('testReformedCipherSM4101_48', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODECBCKeyAlias101';
      genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
      genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODECBC);
      genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGNONE);
      let HuksOptions = {
        properties: new Array(
          HuksCipherSM4.HuksKeyAlgSM4,
          HuksCipherSM4.HuksKeyPurposeENCRYPT,
          HuksCipherSM4.HuksKeySM4Size128,
          HuksCipherSM4.HuksKeySM4PADDINGNONE,
          HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: plainData48Bytes,
      };
      await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
      HuksOptions = {
        properties: new Array(
          HuksCipherSM4.HuksKeyAlgSM4,
          HuksCipherSM4.HuksKeyPurposeDECRYPT,
          HuksCipherSM4.HuksKeySM4Size128,
          HuksCipherSM4.HuksKeySM4PADDINGNONE,
          HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: new Uint8Array(encryptedResult),
      };
      await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
      done();
    });

    it('testReformedCipherSM4101_240', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODECBCKeyAlias101';
      genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
      genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODECBC);
      genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGNONE);
      let HuksOptions = {
        properties: new Array(
          HuksCipherSM4.HuksKeyAlgSM4,
          HuksCipherSM4.HuksKeyPurposeENCRYPT,
          HuksCipherSM4.HuksKeySM4Size128,
          HuksCipherSM4.HuksKeySM4PADDINGNONE,
          HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: plainData240Bytes,
      };
      await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
      HuksOptions = {
        properties: new Array(
          HuksCipherSM4.HuksKeyAlgSM4,
          HuksCipherSM4.HuksKeyPurposeDECRYPT,
          HuksCipherSM4.HuksKeySM4Size128,
          HuksCipherSM4.HuksKeySM4PADDINGNONE,
          HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: new Uint8Array(encryptedResult),
      };
      await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
      done();
    });

    it('testReformedCipherSM4102_48', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODECBCKeyAlias102';
      genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
      genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODECBC);
      genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGNONE);
      let HuksOptions = {
        properties: new Array(
          HuksCipherSM4.HuksKeyAlgSM4,
          HuksCipherSM4.HuksKeyPurposeENCRYPT,
          HuksCipherSM4.HuksKeySM4Size128,
          HuksCipherSM4.HuksKeySM4PADDINGNONE,
          HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: new Uint8Array(plainData48Bytes),
      };
      await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
      done();
    });

    it('testReformedCipherSM4102_240', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODECBCKeyAlias102';
      genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
      genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODECBC);
      genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGNONE);
      let HuksOptions = {
        properties: new Array(
          HuksCipherSM4.HuksKeyAlgSM4,
          HuksCipherSM4.HuksKeyPurposeENCRYPT,
          HuksCipherSM4.HuksKeySM4Size128,
          HuksCipherSM4.HuksKeySM4PADDINGNONE,
          HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: new Uint8Array(plainData240Bytes),
      };
      await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
      done();
    });

    // HKS_SUPPORT_SM4_CBC_PKCS7
    it('testReformedCipherSM4103_48', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGPKCS7MODECBCKeyAlias103';
      genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
      genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODECBC);
      genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGPKCS7);
      let HuksOptions = {
        properties: new Array(
          HuksCipherSM4.HuksKeyAlgSM4,
          HuksCipherSM4.HuksKeyPurposeENCRYPT,
          HuksCipherSM4.HuksKeySM4Size128,
          HuksCipherSM4.HuksKeySM4PADDINGPKCS7,
          HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: plainData48Bytes,
      };
      if (useSoftware) {
        await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
        HuksOptions = {
          properties: new Array(
            HuksCipherSM4.HuksKeyAlgSM4,
            HuksCipherSM4.HuksKeyPurposeDECRYPT,
            HuksCipherSM4.HuksKeySM4Size128,
            HuksCipherSM4.HuksKeySM4PADDINGPKCS7,
            HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
            { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
          ),
          inData: new Uint8Array(encryptedResult),
        };
        await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
      }
      done();
    });

    it('testReformedCipherSM4103_240', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGPKCS7MODECBCKeyAlias103';
      genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
      genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODECBC);
      genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGPKCS7);
      let HuksOptions = {
        properties: new Array(
          HuksCipherSM4.HuksKeyAlgSM4,
          HuksCipherSM4.HuksKeyPurposeENCRYPT,
          HuksCipherSM4.HuksKeySM4Size128,
          HuksCipherSM4.HuksKeySM4PADDINGPKCS7,
          HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: plainData240Bytes,
      };
      if (useSoftware) {
        await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
        HuksOptions = {
          properties: new Array(
            HuksCipherSM4.HuksKeyAlgSM4,
            HuksCipherSM4.HuksKeyPurposeDECRYPT,
            HuksCipherSM4.HuksKeySM4Size128,
            HuksCipherSM4.HuksKeySM4PADDINGPKCS7,
            HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
            { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
          ),
          inData: new Uint8Array(encryptedResult),
        };
        await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
      }
      done();
    });

    it('testReformedCipherSM4104_48', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGPKCS7MODECBCKeyAlias104';
      genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
      genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODECBC);
      genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGPKCS7);
      let HuksOptions = {
        properties: new Array(
          HuksCipherSM4.HuksKeyAlgSM4,
          HuksCipherSM4.HuksKeyPurposeENCRYPT,
          HuksCipherSM4.HuksKeySM4Size128,
          HuksCipherSM4.HuksKeySM4PADDINGPKCS7,
          HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: new Uint8Array(plainData48Bytes),
      };
      if (useSoftware) {
        await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
      }
      done();
    });

    it('testReformedCipherSM4104_240', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGPKCS7MODECBCKeyAlias104';
      genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
      genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODECBC);
      genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGPKCS7);
      let HuksOptions = {
        properties: new Array(
          HuksCipherSM4.HuksKeyAlgSM4,
          HuksCipherSM4.HuksKeyPurposeENCRYPT,
          HuksCipherSM4.HuksKeySM4Size128,
          HuksCipherSM4.HuksKeySM4PADDINGPKCS7,
          HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: new Uint8Array(plainData240Bytes),
      };
      if (useSoftware) {
        await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
      }
      done();
    });

    // HKS_SUPPORT_SM4_CTR_NOPADDING
    it('testReformedCipherSM4105_48', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODECTRKeyAlias105';
      genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
      genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODECTR);
      genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGNONE);
      let HuksOptions = {
        properties: new Array(
          HuksCipherSM4.HuksKeyAlgSM4,
          HuksCipherSM4.HuksKeyPurposeENCRYPT,
          HuksCipherSM4.HuksKeySM4Size128,
          HuksCipherSM4.HuksKeySM4PADDINGNONE,
          HuksCipherSM4.HuksKeySM4BLOCKMODECTR,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: plainData48Bytes,
      };
      await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
      HuksOptions = {
        properties: new Array(
          HuksCipherSM4.HuksKeyAlgSM4,
          HuksCipherSM4.HuksKeyPurposeDECRYPT,
          HuksCipherSM4.HuksKeySM4Size128,
          HuksCipherSM4.HuksKeySM4PADDINGNONE,
          HuksCipherSM4.HuksKeySM4BLOCKMODECTR,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: new Uint8Array(encryptedResult),
      };
      await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
      done();
    });

    it('testReformedCipherSM4105_240', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODECTRKeyAlias105';
      genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
      genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODECTR);
      genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGNONE);
      let HuksOptions = {
        properties: new Array(
          HuksCipherSM4.HuksKeyAlgSM4,
          HuksCipherSM4.HuksKeyPurposeENCRYPT,
          HuksCipherSM4.HuksKeySM4Size128,
          HuksCipherSM4.HuksKeySM4PADDINGNONE,
          HuksCipherSM4.HuksKeySM4BLOCKMODECTR,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: plainData240Bytes,
      };
      await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
      HuksOptions = {
        properties: new Array(
          HuksCipherSM4.HuksKeyAlgSM4,
          HuksCipherSM4.HuksKeyPurposeDECRYPT,
          HuksCipherSM4.HuksKeySM4Size128,
          HuksCipherSM4.HuksKeySM4PADDINGNONE,
          HuksCipherSM4.HuksKeySM4BLOCKMODECTR,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: new Uint8Array(encryptedResult),
      };
      await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
      done();
    });

    it('testReformedCipherSM4106_48', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODECTRKeyAlias106';
      genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
      genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODECTR);
      genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGNONE);
      let HuksOptions = {
        properties: new Array(
          HuksCipherSM4.HuksKeyAlgSM4,
          HuksCipherSM4.HuksKeyPurposeENCRYPT,
          HuksCipherSM4.HuksKeySM4Size128,
          HuksCipherSM4.HuksKeySM4PADDINGNONE,
          HuksCipherSM4.HuksKeySM4BLOCKMODECTR,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: new Uint8Array(plainData48Bytes),
      };
      await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
      done();
    });

    it('testReformedCipherSM4106_240', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODECTRKeyAlias106';
      genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
      genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODECTR);
      genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGNONE);
      let HuksOptions = {
        properties: new Array(
          HuksCipherSM4.HuksKeyAlgSM4,
          HuksCipherSM4.HuksKeyPurposeENCRYPT,
          HuksCipherSM4.HuksKeySM4Size128,
          HuksCipherSM4.HuksKeySM4PADDINGNONE,
          HuksCipherSM4.HuksKeySM4BLOCKMODECTR,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: new Uint8Array(plainData240Bytes),
      };
      await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
      done();
    });

    // HKS_SUPPORT_SM4_ECB_NOPADDING
    it('testReformedCipherSM4107_48', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODEECBKeyAlias107';
      genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
      genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODEECB);
      genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGNONE);
      let HuksOptions = {
        properties: new Array(
          HuksCipherSM4.HuksKeyAlgSM4,
          HuksCipherSM4.HuksKeyPurposeENCRYPT,
          HuksCipherSM4.HuksKeySM4Size128,
          HuksCipherSM4.HuksKeySM4PADDINGNONE,
          HuksCipherSM4.HuksKeySM4BLOCKMODEECB,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: plainData48Bytes,
      };
      if (useSoftware) {
        await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
        HuksOptions = {
          properties: new Array(
            HuksCipherSM4.HuksKeyAlgSM4,
            HuksCipherSM4.HuksKeyPurposeDECRYPT,
            HuksCipherSM4.HuksKeySM4Size128,
            HuksCipherSM4.HuksKeySM4PADDINGNONE,
            HuksCipherSM4.HuksKeySM4BLOCKMODEECB,
            { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
          ),
          inData: new Uint8Array(encryptedResult),
        };
        await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
      }
      done();
    });

    it('testReformedCipherSM4107_240', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODEECBKeyAlias107';
      genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
      genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODEECB);
      genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGNONE);
      let HuksOptions = {
        properties: new Array(
          HuksCipherSM4.HuksKeyAlgSM4,
          HuksCipherSM4.HuksKeyPurposeENCRYPT,
          HuksCipherSM4.HuksKeySM4Size128,
          HuksCipherSM4.HuksKeySM4PADDINGNONE,
          HuksCipherSM4.HuksKeySM4BLOCKMODEECB,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: plainData240Bytes,
      };
      if (useSoftware) {
        await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
        HuksOptions = {
          properties: new Array(
            HuksCipherSM4.HuksKeyAlgSM4,
            HuksCipherSM4.HuksKeyPurposeDECRYPT,
            HuksCipherSM4.HuksKeySM4Size128,
            HuksCipherSM4.HuksKeySM4PADDINGNONE,
            HuksCipherSM4.HuksKeySM4BLOCKMODEECB,
            { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
          ),
          inData: new Uint8Array(encryptedResult),
        };
        await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
      }
      done();
    });

    it('testReformedCipherSM4108_48', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODEECBKeyAlias108';
      genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
      genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODEECB);
      genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGNONE);
      let HuksOptions = {
        properties: new Array(
          HuksCipherSM4.HuksKeyAlgSM4,
          HuksCipherSM4.HuksKeyPurposeENCRYPT,
          HuksCipherSM4.HuksKeySM4Size128,
          HuksCipherSM4.HuksKeySM4PADDINGNONE,
          HuksCipherSM4.HuksKeySM4BLOCKMODEECB,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: new Uint8Array(plainData48Bytes),
      };
      if (useSoftware) {
        await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
      }
      done();
    });

    it('testReformedCipherSM4108_240', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODEECBKeyAlias108';
      genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
      genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODEECB);
      genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGNONE);
      let HuksOptions = {
        properties: new Array(
          HuksCipherSM4.HuksKeyAlgSM4,
          HuksCipherSM4.HuksKeyPurposeENCRYPT,
          HuksCipherSM4.HuksKeySM4Size128,
          HuksCipherSM4.HuksKeySM4PADDINGNONE,
          HuksCipherSM4.HuksKeySM4BLOCKMODEECB,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: new Uint8Array(plainData240Bytes),
      };
      if (useSoftware) {
        await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
      }
      done();
    });

    // HKS_SUPPORT_SM4_ECB_PKCS7
    it('testReformedCipherSM4109_48', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGPKCS7MODEECBKeyAlias109';
      genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
      genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODEECB);
      genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGPKCS7);
      let HuksOptions = {
        properties: new Array(
          HuksCipherSM4.HuksKeyAlgSM4,
          HuksCipherSM4.HuksKeyPurposeENCRYPT,
          HuksCipherSM4.HuksKeySM4Size128,
          HuksCipherSM4.HuksKeySM4PADDINGPKCS7,
          HuksCipherSM4.HuksKeySM4BLOCKMODEECB,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: plainData48Bytes,
      };
      if (useSoftware) {
        await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
        HuksOptions = {
          properties: new Array(
            HuksCipherSM4.HuksKeyAlgSM4,
            HuksCipherSM4.HuksKeyPurposeDECRYPT,
            HuksCipherSM4.HuksKeySM4Size128,
            HuksCipherSM4.HuksKeySM4PADDINGPKCS7,
            HuksCipherSM4.HuksKeySM4BLOCKMODEECB,
            { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
          ),
          inData: new Uint8Array(encryptedResult),
        };
        await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
      }
      done();
    });

    it('testReformedCipherSM4109_240', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGPKCS7MODEECBKeyAlias109';
      genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
      genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODEECB);
      genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGPKCS7);
      let HuksOptions = {
        properties: new Array(
          HuksCipherSM4.HuksKeyAlgSM4,
          HuksCipherSM4.HuksKeyPurposeENCRYPT,
          HuksCipherSM4.HuksKeySM4Size128,
          HuksCipherSM4.HuksKeySM4PADDINGPKCS7,
          HuksCipherSM4.HuksKeySM4BLOCKMODEECB,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: plainData240Bytes,
      };
      if (useSoftware) {
        await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
        HuksOptions = {
          properties: new Array(
            HuksCipherSM4.HuksKeyAlgSM4,
            HuksCipherSM4.HuksKeyPurposeDECRYPT,
            HuksCipherSM4.HuksKeySM4Size128,
            HuksCipherSM4.HuksKeySM4PADDINGPKCS7,
            HuksCipherSM4.HuksKeySM4BLOCKMODEECB,
            { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
          ),
          inData: new Uint8Array(encryptedResult),
        };
        await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
      }
      done();
    });

    it('testReformedCipherSM4110_48', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGPKCS7MODEECBKeyAlias110';
      genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
      genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODEECB);
      genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGPKCS7);
      let HuksOptions = {
        properties: new Array(
          HuksCipherSM4.HuksKeyAlgSM4,
          HuksCipherSM4.HuksKeyPurposeENCRYPT,
          HuksCipherSM4.HuksKeySM4Size128,
          HuksCipherSM4.HuksKeySM4PADDINGPKCS7,
          HuksCipherSM4.HuksKeySM4BLOCKMODEECB,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: new Uint8Array(plainData48Bytes),
      };
      if (useSoftware) {
        await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
      }
      done();
    });

    it('testReformedCipherSM4110_240', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGPKCS7MODEECBKeyAlias110';
      genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
      genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODEECB);
      genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGPKCS7);
      let HuksOptions = {
        properties: new Array(
          HuksCipherSM4.HuksKeyAlgSM4,
          HuksCipherSM4.HuksKeyPurposeENCRYPT,
          HuksCipherSM4.HuksKeySM4Size128,
          HuksCipherSM4.HuksKeySM4PADDINGPKCS7,
          HuksCipherSM4.HuksKeySM4BLOCKMODEECB,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: new Uint8Array(plainData240Bytes),
      };
      if (useSoftware) {
        await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
      }
      done();
    });
  });
}
