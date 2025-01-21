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

async function publicGenerateKeyItemFunc(keyAlias, huksOptions) {
  console.info(`enter callback generateKeyItem`);
  try {
    await generateKeyItem(keyAlias, huksOptions)
      .then((data) => {
        console.info(`callback: generateKeyItem success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`callback: generateKeyItem failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`callback: generateKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

function generateKeyItem(keyAlias, huksOptions) {
  return new Promise((resolve, reject) => {
    try {
      huks.generateKeyItem(keyAlias, huksOptions, function (error, data) {
        if (error) {
          reject(error);
        } else {
          resolve(data);
        }
      });
    } catch (error) {
      expect(null).assertFail();
    }
  });
}

async function publicInitSession(srcKeyAlies, HuksOptions) {
  console.info(`enter callback doInit`);
  try {
    await initSession(srcKeyAlies, HuksOptions)
      .then((data) => {
        console.info(`callback1: doInit success, data = ${JSON.stringify(data)}`);
        handle = data.handle;
      })
      .catch((error) => {
        console.error(`callback1: doInit failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`callback: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

function initSession(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    try {
      huks.initSession(srcKeyAlies, HuksOptions, function (error, data) {
        if (error) {
          reject(error);
        } else {
          resolve(data);
        }
      });
    } catch (error) {
      expect(null).assertFail();
    }
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
    console.info(`enter callback doUpdate`);
    try {
      await updateSession(handle, HuksOptions)
        .then((data) => {
          console.info(`callback: doUpdate success, data = ${JSON.stringify(data)}`);
          outData = outData.concat(Array.from(data.outData));
        })
        .catch(error => {
          console.error(`callback: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
          expect(null).assertFail();
        });
    } catch (error) {
      console.error(`callback: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
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
    console.info(`enter callback doFinish`);
    try {
      await finishSession(handle, HuksOptions)
        .then((data) => {
          outData = outData.concat(Array.from(data.outData));
          if (isEncrypt) {
            encryptedResult = outData;
          }
          console.info(`callback: doFinish success, data = ${JSON.stringify(data)}`);
        })
        .catch(error => {
          console.error(`callback: doFinish failed, code: ${error.code}, msg: ${error.message}`);
          expect(null).assertFail();
        });
    } catch (error) {
      console.error(`callback: doFinish input arg invalid, code: ${error.code}, msg: ${error.message}`);
      expect(null).assertFail();
    }
  } else if (thirdInderfaceName == 'abort') {
    console.info(`enter callback doAbort`);
    try {
      await abortSession(handle, HuksOptions)
        .then((data) => {
          console.info(`callback: doAbort success, data = ${JSON.stringify(data)}`);
        })
        .catch(error => {
          console.error(`callback: doAbort failed, code: ${error.code}, msg: ${error.message}`);
          expect(null).assertFail();
        });
    } catch (error) {
      console.error(`callback: doAbort input arg invalid, code: ${error.code}, msg: ${error.message}`);
      expect(null).assertFail();
    }
  }
}

function updateSession(handle, HuksOptions) {
  return new Promise((resolve, reject) => {
    try {
      huks.updateSession(handle, HuksOptions, function (error, data) {
        if (error) {
          reject(error);
        } else {
          resolve(data);
        }
      });
    } catch (error) {
      expect(null).assertFail();
    }
  });
}

function finishSession(handle, HuksOptionsFinish) {
  return new Promise((resolve, reject) => {
    try {
      huks.finishSession(handle, HuksOptionsFinish, function (error, data) {
        if (error) {
          reject(error);
        } else {
          resolve(data);
        }
      });
    } catch (error) {
      expect(null).assertFail();
    }
  });
}

function abortSession(handle, HuksOptionsAbort) {
  return new Promise((resolve, reject) => {
    try {
      huks.abortSession(handle, HuksOptionsAbort, function (error, data) {
        if (error) {
          reject(error);
        } else {
          resolve(data);
        }
      });
    } catch (error) {
      expect(null).assertFail();
    }
  });
}

async function publicDeleteKeyFunc(srcKeyAlias, genHuksOptionsNONECBC) {
  console.info(`enter callback deleteKeyItem`);
  try {
    await deleteKeyItem(srcKeyAlias, genHuksOptionsNONECBC)
      .then((data) => {
        console.info(`callback: deleteKeyItem key success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`callback: deleteKeyItem failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`callback: deleteKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

function deleteKeyItem(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    try {
      huks.deleteKeyItem(srcKeyAlies, HuksOptions, function (error, data) {
        if (error) {
          reject(error);
        } else {
          resolve(data);
        }
      });
    } catch (error) {
      expect(null).assertFail();
    }
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
      await publicGenerateKeyItemFunc(srcKeyAlias, genHuksOptions);
    }
    await publicInitSession(srcKeyAlias, HuksOptions);
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
    it('Security_HUKS_Cipher_API9_SM4_00148', 0, async function (done) {
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

    it('Security_HUKS_Cipher_API9_SM4_001240', 0, async function (done) {
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

    it('Security_HUKS_Cipher_API9_SM4_00248', 0, async function (done) {
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

    it('Security_HUKS_Cipher_API9_SM4_002240', 0, async function (done) {
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
    it('Security_HUKS_Cipher_API9_SM4_00348', 0, async function (done) {
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

    it('Security_HUKS_Cipher_API9_SM4_003240', 0, async function (done) {
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

    it('Security_HUKS_Cipher_API9_SM4_00448', 0, async function (done) {
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

    it('Security_HUKS_Cipher_API9_SM4_004240', 0, async function (done) {
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
    it('Security_HUKS_Cipher_API9_SM4_00548', 0, async function (done) {
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

    it('Security_HUKS_Cipher_API9_SM4_005240', 0, async function (done) {
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

    it('Security_HUKS_Cipher_API9_SM4_00648', 0, async function (done) {
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

    it('testReformedCipherSM4006_240', 0, async function (done) {
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
    it('Security_HUKS_Cipher_API9_SM4_00748', 0, async function (done) {
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

    it('Security_HUKS_Cipher_API9_SM4_007240', 0, async function (done) {
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

    it('Security_HUKS_Cipher_API9_SM4_00848', 0, async function (done) {
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

    it('Security_HUKS_Cipher_API9_SM4_008240', 0, async function (done) {
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
    it('Security_HUKS_Cipher_API9_SM4_00948', 0, async function (done) {
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

    it('Security_HUKS_Cipher_API9_SM4_009240', 0, async function (done) {
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

    it('Security_HUKS_Cipher_API9_SM4_01048', 0, async function (done) {
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

    it('Security_HUKS_Cipher_API9_SM4_010240', 0, async function (done) {
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
