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
  await generateKey(srcKeyAlias, genHuksOptionsNONECBC)
    .then((data) => {
      console.log(`test generateKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test generateKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

function generateKey(srcKeyAlias, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.generateKey(srcKeyAlias, HuksOptions, function (err, data) {
      console.log(`test generateKey data: ${JSON.stringify(data)}`);
      if (err.code !== 0) {
        console.log('test generateKey err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

async function publicInitFunc(srcKeyAlias, HuksOptions) {
  await init(srcKeyAlias, HuksOptions)
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

function init(srcKeyAlias, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.init(srcKeyAlias, HuksOptions, function (err, data) {
      if (err.code !== 0) {
        console.log('test init err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
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
    await updateCallback(handle, HuksOptions)
      .then((data) => {
        console.log(`test update data ${JSON.stringify(data)}`);
        outData = outData.concat(Array.from(data.outData));
        expect(data.errorCode === 0).assertTrue();
      })
      .catch((err) => {
        console.log('test update err information: ' + err);
        expect(null).assertFail();
      });
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
    await finishCallback(handle, HuksOptions)
      .then((data) => {
        console.log(`test finish data: ${JSON.stringify(data)}`);
        outData = outData.concat(Array.from(data.outData));
        expect(data.errorCode === 0).assertTrue();
        if (isEncrypt) {
          encryptedResult = outData;
          console.log(`encrypted data: ${encryptedResult}`);
        } else {
          console.log(`decrypted data: ${outData}`);
          expect(arrayEqual(outData, plainData)).assertTrue();
        }
      })
      .catch((err) => {
        console.log('test finish err information: ' + JSON.stringify(err));
        expect(null).assertFail();
      });
  } else if (thirdInderfaceName == 'abort') {
    await abortCallback(handle, HuksOptions)
      .then((data) => {
        console.log(`test abort data: ${JSON.stringify(data)}`);
        expect(data.errorCode === 0).assertTrue();
      })
      .catch((err) => {
        console.log('test abort err information: ' + JSON.stringify(err));
        expect(null).assertFail();
      });
  }
}

function updateCallback(handle, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.update(handle, HuksOptions, function (err, data) {
      if (err.code !== 0) {
        console.log('test update err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

function finishCallback(handle, huksOptionsFinish) {
  return new Promise((resolve, reject) => {
    huks.finish(handle, huksOptionsFinish, function (err, data) {
      if (err.code !== 0) {
        console.log('test generateKey err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

function abortCallback(handle, huksOptionsAbort) {
  return new Promise((resolve, reject) => {
    huks.abort(handle, huksOptionsAbort, function (err, data) {
      if (err.code !== 0) {
        console.log('test abort err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

async function publicDeleteKeyFunc(srcKeyAlias, genHuksOptionsNONECBC) {
  await deleteKey(srcKeyAlias, genHuksOptionsNONECBC)
    .then((data) => {
      console.log(`test deleteKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test deleteKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

function deleteKey(srcKeyAlias, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.deleteKey(srcKeyAlias, HuksOptions, function (err, data) {
      if (err.code !== 0) {
        console.log('test deleteKey err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
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

export default function SecurityHuksSM4BasicCallbackJsunit() {
  describe('SecurityHuksSM4BasicCallbackJsunit', function () {
    beforeAll(async function (done) {
      useSoftware = await checkSoftware();
      done();
    })
    // HKS_SUPPORT_SM4_CBC_NOPADDING
    it('Security_HUKS_Cipher_API8_SM4_00148', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODECBCKeyAlias001';
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

    it('Security_HUKS_Cipher_API8_SM4_001240', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODECBCKeyAlias001';
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

    it('Security_HUKS_Cipher_API8_SM4_00248', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODECBCKeyAlias002';
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

    it('Security_HUKS_Cipher_API8_SM4_002240', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODECBCKeyAlias002';
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
    it('Security_HUKS_Cipher_API8_SM4_00348', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGPKCS7MODECBCKeyAlias003';
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
        await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true
        );
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

    it('Security_HUKS_Cipher_API8_SM4_003240', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGPKCS7MODECBCKeyAlias003';
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

    it('Security_HUKS_Cipher_API8_SM4_00448', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGPKCS7MODECBCKeyAlias004';
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

    it('Security_HUKS_Cipher_API8_SM4_004240', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGPKCS7MODECBCKeyAlias004';
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
    it('Security_HUKS_Cipher_API8_SM4_00548', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODECTRKeyAlias005';
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

    it('Security_HUKS_Cipher_API8_SM4_005240', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODECTRKeyAlias005';
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

    it('Security_HUKS_Cipher_API8_SM4_00648', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODECTRKeyAlias006';
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

    it('Security_HUKS_Cipher_API8_SM4_006240', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODECTRKeyAlias006';
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
    it('Security_HUKS_Cipher_API8_SM4_00748', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODEECBKeyAlias007';
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

    it('Security_HUKS_Cipher_API8_SM4_007240', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODEECBKeyAlias007';
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

    it('Security_HUKS_Cipher_API8_SM4_00848', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODEECBKeyAlias008';
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

    it('Security_HUKS_Cipher_API8_SM4_008240', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODEECBKeyAlias008';
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
    it('Security_HUKS_Cipher_API8_SM4_00948', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGPKCS7MODEECBKeyAlias009';
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

    it('Security_HUKS_Cipher_API8_SM4_009240', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGPKCS7MODEECBKeyAlias009';
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

    it('Security_HUKS_Cipher_API8_SM4_01048', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGPKCS7MODEECBKeyAlias010';
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

    it('Security_HUKS_Cipher_API8_SM4_010240', 0, async function (done) {
      const srcKeyAlias = 'testCipherSM4Size128PADDINGPKCS7MODEECBKeyAlias010';
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
