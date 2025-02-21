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

let defaultData = '0';

let srcData63 = 'Hks_AES_Cipher_Test_000000000000000000000_string';
let srcData63Kb = stringToUint8Array(srcData63);
let updateResult = new Array();
let encryptedData;
var handle;

let genHuksOptions = {
  properties: new Array(HuksCipherAES.HuksKeyAlgAES, HuksCipherAES.HuksKeyPurpose),
  inData: new Uint8Array(defaultData),
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
  let dateSize = 64;
  let huksOptionsInData = HuksOptions.inData;
  let inDataArray = HuksOptions.inData;
  if (Array.from(inDataArray).length < dateSize) {
    await publicUpdateSession(handle, HuksOptions);
    await publicFinishAbortFunc(HuksOptions, thirdInderfaceName, isEncrypt, 0);
  } else {
    let count = Math.floor(Array.from(inDataArray).length / dateSize);
    let remainder = Array.from(inDataArray).length % dateSize;
    for (let i = 0; i < count; i++) {
      HuksOptions.inData = new Uint8Array(Array.from(huksOptionsInData).slice(dateSize * i, dateSize * (i + 1)));
      await publicUpdateSession(handle, HuksOptions);
    }
    HuksOptions.inData = huksOptionsInData;
    if (remainder !== 0) {
      HuksOptions.inData = new Uint8Array(
        Array.from(huksOptionsInData).slice(dateSize * count, uint8ArrayToString(inDataArray).length)
      );
    }
    await publicFinishAbortFunc(HuksOptions, thirdInderfaceName, isEncrypt);
  }
}

async function publicUpdateSession(handle, HuksOptions) {
  console.info(`enter callback doUpdate`);
  try {
    await updateSession(handle, HuksOptions)
      .then ((data) => {
        console.info(`callback: doUpdate success, data = ${JSON.stringify(data)}`);
        if (updateResult.length !== 0) {
          updateResult = updateResult.concat(Array.from(data.outData));
        } else {
          updateResult = Array.from(data.outData);
        }
      })
      .catch(error => {
        console.error(`callback: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`callback: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
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

async function publicFinishAbortFunc(HuksOptions, thirdInderfaceName, isEncrypt) {
  if (thirdInderfaceName == 'finish') {
    await finish(HuksOptions, isEncrypt);
  } else if (thirdInderfaceName == 'abort') {
    await publicAbortSession(HuksOptions);
  }
}

async function finish(HuksOptions, isEncrypt) {
  await finishSession(handle, HuksOptions)
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
          expect(finishData !== uint8ArrayToString(encryptedData)).assertTrue();
      } else {
          expect(finishData === uint8ArrayToString(encryptedData)).assertTrue();
      }
    })
    .catch((err) => {
      console.log('test finish err information: ' + JSON.stringify(err));
      expect(null).assertFail();
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

async function publicAbortSession(HuksOptionsAbort) {
  console.info(`enter callback doAbort`);
  try {
    await abortSession(handle, HuksOptionsAbort)
      .then ((data) => {
        console.info(`callback: doAbort success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`callback: doAbort failed, code: ${error.code}, msg: ${error.message}`);
      });
  } catch (error) {
    console.error(`callback: doAbort input arg invalid, code: ${error.code}, msg: ${error.message}`);
  }
}

async function publicDeleteKeyItem(KeyAlias, HuksOptions) {
  console.info(`enter callback deleteKeyItem`);
  try {
    await deleteKeyItem(KeyAlias, HuksOptions)
      .then ((data) => {
        console.info(`callback: deleteKeyItem key success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`callback: deleteKeyItem failed, code: ${error.code}, msg: ${error.message}`);
      });
  } catch (error) {
    console.error(`callback: deleteKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
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

async function publicCipherFunc(srcKeyAlies, genHuksOptionsNONECBC, HuksOptions, thirdInderfaceName, isEncrypt) {
  try {
    updateResult = new Array();
    if (isEncrypt) {
      await publicGenerateKeyItemFunc(srcKeyAlies, genHuksOptionsNONECBC);
      encryptedData = HuksOptions.inData;
    }
    await publicInitSession(srcKeyAlies, HuksOptions);
    await publicUpdateFunc(HuksOptions, thirdInderfaceName, isEncrypt);
    if (!isEncrypt || (isEncrypt && thirdInderfaceName == 'abort')) {
      await publicDeleteKeyItem(srcKeyAlies, genHuksOptionsNONECBC);
    }
  } catch (e) {
    expect(null).assertFail();
  }
}

export default function SecurityHuksCipherAESCallbackJsunit() {
describe('SecurityHuksCipherAESCallbackJsunit', function () {
  it('Security_HUKS_Cipher_API9_AES_001', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias001';
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

  it('Security_HUKS_Cipher_API9_AES_002', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias002';
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

  it('Security_HUKS_Cipher_API9_AES_003', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias003';
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

  it('Security_HUKS_Cipher_API9_AES_004', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias002';
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

        /**
         * @tc.number SUB_Security_HUKS_isPwdSet_0060
         * @tc.name Test generate key when password tag is true and password is not set;
         * @tc.desc HuksOptions with AlgName AES
         * @tc.desc Test generate key with Callback. Test fail
         * @tc.size Medium
         * @tc.type Func
         * @tc.level Level2
         */
        it('SUB_Security_HUKS_isPwdSet_0060', 0, async function (done) {
          const srcKeyAlies = 'SUB_Security_HUKS_isPwdSet_0060';
          let huksProperties = new Array();
          let index = 0;
          huksProperties[index++] = {
              tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
              value: huks.HuksKeyAlg.HUKS_ALG_AES
          };
          huksProperties[index++] = {
              tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
              value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_128
          };
          huksProperties[index++] = {
              tag: huks.HuksTag.HUKS_TAG_PURPOSE,
              value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
          };
          huksProperties[index++] = {
              tag: huks.HuksTag.HUKS_TAG_PADDING,
              value: huks.HuksKeyPadding.HUKS_PADDING_PKCS7
          };
          huksProperties[index++] = {
              tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
              value: huks.HuksCipherMode.HUKS_MODE_CBC
          };
          huksProperties[index++] = {
              tag: huks.HuksTag.HUKS_TAG_IS_DEVICE_PASSWORD_SET,
              value: true
          };
          let huksOptions = {
              properties: huksProperties
          };
          huks.generateKeyItem(srcKeyAlies, huksOptions, (err, data) => {
              if (err) {
                  console.log("SUB_Security_HUKS_isPwdSet_0020: success");
                  done();
              } else {
                  console.error("SUB_Security_HUKS_isPwdSet_0020: fail");
                  expect(null).assertFail();
              }
          });
      });

        /**
         * @tc.number SUB_Security_HUKS_hasKeyItem_0020
         * @tc.name test has key by alias, Callback style, test success;
         * @tc.desc HuksOptions with AlgName AES
         * @tc.size Medium
         * @tc.type Func
         * @tc.level Level2
         */
        it('SUB_Security_HUKS_hasKeyItem_0020', 0, async function (done) {
          const srcKeyAlias = 'SUB_Security_HUKS_hasKeyItem_0020';
          let huksProperties = new Array();
          let index = 0;
          huksProperties[index++] = {
              tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
              value: huks.HuksKeyAlg.HUKS_ALG_AES
          };
          huksProperties[index++] = {
              tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
              value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_128
          };
          huksProperties[index++] = {
              tag: huks.HuksTag.HUKS_TAG_PURPOSE,
              value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
          };
          huksProperties[index++] = {
              tag: huks.HuksTag.HUKS_TAG_PADDING,
              value: huks.HuksKeyPadding.HUKS_PADDING_PKCS7
          };
          huksProperties[index++] = {
              tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
              value: huks.HuksCipherMode.HUKS_MODE_CBC
          };
          let huksOptions = {
              properties: huksProperties
          };
          try {
              await publicGenerateKeyItemFunc(srcKeyAlias, huksOptions);
              huks.hasKeyItem(srcKeyAlias, huksOptions, async (err, res1) => {
                  expect(res1).assertTrue();
                  await publicDeleteKeyItem(srcKeyAlias, huksOptions);
                  huks.hasKeyItem(srcKeyAlias, huksOptions, (err, res2) => {
                      expect(!res2).assertTrue();
                  })
              });
          } catch (err) {
              console.error(srcKeyAlias + `: fail, code: ${err.code}, msg: ${err.message}`);
              expect(null).assertFail();
          }
          console.log(srcKeyAlias + ": success");
          done();
      });
        
});
}
export {publicCipherFunc, IV, updateResult};

