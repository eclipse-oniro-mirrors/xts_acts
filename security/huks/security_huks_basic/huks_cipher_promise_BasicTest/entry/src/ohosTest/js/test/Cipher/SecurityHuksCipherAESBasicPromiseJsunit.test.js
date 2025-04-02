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
import { HuksCipherAES } from '../../../../../../../utils/param/cipher/publicCipherParam';
import { HksTag } from '../../../../../../../utils/param/publicParam';
import { stringToUint8Array, uint8ArrayToString } from '../../../../../../../utils/param/publicFunc';
let IV = '0000000000000000';

let srcData63 = 'Hks_AES_Cipher_Test_000000000000000000000_string';
let srcData63Kb = stringToUint8Array(srcData63);
let updateResult = new Array();
let encryptedData;
var handle;

let genHuksOptions = {
  properties: new Array(HuksCipherAES.HuksKeyAlgAES, HuksCipherAES.HuksKeyPurpose),
  inData: new Uint8Array(new Array()),
};

async function publicGenerateKeyFunc(srcKeyAlies, genHuksOptionsNONECBC) {
  await huks
    .generateKey(srcKeyAlies, genHuksOptionsNONECBC)
    .then((data) => {
      console.log(`test generateKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test generateKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicInitFunc(srcKeyAlies, HuksOptions) {
  await huks
    .init(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test init data: ${JSON.stringify(data)}`);
      handle = data.handle;
      expect(data.errorCode == 0).assertTrue();
      expect(data.token == null).assertTrue();
    })
    .catch((err) => {
      console.log('test init err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicUpdateFunc(HuksOptions, thirdInderfaceName, isEncrypt) {
  let dateSize = 64;
  let huksOptionsInData = HuksOptions.inData;
  let inDataArray = HuksOptions.inData;
  if (Array.from(inDataArray).length < dateSize) {
    await update(handle, HuksOptions);
    HuksOptions.inData = new Uint8Array(new Array());
    await publicFinishAbortFunc(HuksOptions, thirdInderfaceName, isEncrypt, 0);
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
    await publicFinishAbortFunc(HuksOptions, thirdInderfaceName, isEncrypt);
  }
}

async function update(handle, HuksOptions) {
  await huks
    .update(handle, HuksOptions)
    .then(async (data) => {
      console.log(`test update data ${JSON.stringify(data)}`);
      if (updateResult.length !== 0) {
        console.log(`test update outDatalength ${updateResult.length}`);
        updateResult = updateResult.concat(Array.from(data.outData));
      } else {
        console.log(`test update outDatalength ${updateResult.length}`);
        updateResult = Array.from(data.outData);
      }
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test update err information: ' + err);
      expect(null).assertFail();
    });
}

async function publicFinishAbortFunc(HuksOptions, thirdInderfaceName, isEncrypt) {
  if (thirdInderfaceName == 'finish') {
    await finish(HuksOptions, isEncrypt);
  } else if (thirdInderfaceName == 'abort') {
    await abort(HuksOptions);
  }
}

async function finish(HuksOptions, isEncrypt) {
  await huks
    .finish(handle, HuksOptions)
    .then((data) => {
      console.log(`test finish data: ${JSON.stringify(data)}`);
      let finishData;
      if (encryptedData.length > 64) {
        finishData = uint8ArrayToString(updateResult.concat(Array.from(data.outData)));
        updateResult = updateResult.concat(Array.from(data.outData));
      } else {
        finishData = uint8ArrayToString(updateResult);
      }
      if (isEncrypt) {
        if (finishData === uint8ArrayToString(encryptedData)) {
          expect(null).assertFail();
        } else {
          expect(data.errorCode == 0).assertTrue();
        }
      }
      if (!isEncrypt) {
        if (finishData === uint8ArrayToString(encryptedData)) {
          expect(data.errorCode == 0).assertTrue();
        } else {
          expect(null).assertFail();
        }
      }
    })
    .catch((err) => {
      console.log('test finish err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
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

async function publicDeleteKeyFunc(srcKeyAlies, genHuksOptionsNONECBC) {
  await huks
    .deleteKey(srcKeyAlies, genHuksOptionsNONECBC)
    .then((data) => {
      console.log(`test deleteKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test deleteKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicCipherFunc(srcKeyAlies, genHuksOptionsNONECBC, HuksOptions, thirdInderfaceName, isEncrypt) {
  try {
    updateResult = new Array();
    if (isEncrypt) {
      await publicGenerateKeyFunc(srcKeyAlies, genHuksOptionsNONECBC);
      encryptedData = HuksOptions.inData;
    }
    await publicInitFunc(srcKeyAlies, HuksOptions);
    await publicUpdateFunc(HuksOptions, thirdInderfaceName, isEncrypt);
    if (!isEncrypt || (isEncrypt && thirdInderfaceName == 'abort')) {
      await publicDeleteKeyFunc(srcKeyAlies, genHuksOptionsNONECBC);
    }
  } catch (e) {
    expect(null).assertFail();
  }
}

export default function SecurityHuksCipherAESBasicPromiseJsunit() {
describe('SecurityHuksCipherAESBasicPromiseJsunit', function () {
  it('Security_HUKS_Cipher_API8_AES_101', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias101';
    genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize128);
    genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODE);
    genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);
    let HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODE,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
      ),
      inData: srcData63Kb,
    };
    await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
    HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeDECRYPT,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODE,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
      ),
      inData: new Uint8Array(updateResult),
    };
    await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
    done();
  });

  it('Security_HUKS_Cipher_API8_AES_102', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias102';
    let HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODE,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
      ),
      inData: new Uint8Array(updateResult),
    };
    await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'abort', true);
    done();
  });

  it('Security_HUKS_Cipher_API8_AES_103', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias103';
    let HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODE,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
      ),
      inData: srcData63Kb,
    };
    await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
    HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeDECRYPT,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODE,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
      ),
      inData: new Uint8Array(updateResult),
    };
    await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
    done();
  });

  it('Security_HUKS_Cipher_API8_AES_104', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias104';
    let HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODE,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
      ),
      inData: new Uint8Array(updateResult),
    };
    await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'abort', true);
    done();
  });
});
}

export {publicCipherFunc, IV, updateResult};