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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import { HuksCipherRSA } from '../../../../../../../utils/param/cipher/publicCipherParam';
import { stringToUint8Array, checkSoftware } from '../../../../../../../utils/param/publicFunc';
import huks from '@ohos.security.huks'
import { HuksKeyAlgX25519, HuksAgreeECDH } from '../../../../../../../utils/param/agree/publicAgreeParam';
import {
  HuksSignVerifySM2,
  HuksSignVerifyED25519,
  HuksSignVerifyRSA,
  HuksSignVerifyDSA
} from '../../../../../../../utils/param/signverify/publicSignverifyParam';
let gInData64 = 'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt';
let gInData64Array = stringToUint8Array(gInData64);
let useSoftware = true;

async function publicGenerateKeyFunc(srcKeyAlies, HuksOptions) {
  await generateKey(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test generateKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test generateKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

function generateKey(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.generateKey(srcKeyAlies, HuksOptions, function (err, data) {
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

async function publicExportKeyFunc(srcKeyAlies, HuksOptions) {
  await exportkey(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test ExportKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test ImportKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

function exportkey(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.exportKey(srcKeyAlies, HuksOptions, function (err, data) {
      console.log(`test exportKey data: ${JSON.stringify(data)}`);
      if (err.code !== 0) {
        console.log('test exportKey err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

async function publicDeleteKeyFunc(srcKeyAlies, HuksOptions) {
  await deleteKey(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test deleteKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test deleteKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

function deleteKey(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.deleteKey(srcKeyAlies, HuksOptions, function (err, data) {
      if (err.code !== 0) {
        console.log('test deleteKey err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

export default function securityHuksExportSupportJsunit() {
  describe('securityHuksExportSupportJsunit', function () {
    beforeAll(async function (done) {
      useSoftware = await checkSoftware();
      done();
    })
    // HKS_SUPPORT_SM4_CBC_NOPADDING
    it('Security_HUKS_Export_API8_0100', 0, async function (done) {
      let srcKeyAlies = "Security_HUKS_Export_API8_0100";
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSASize512,
          HuksCipherRSA.HuksKeyPurposeDECRYPT,
          HuksCipherRSA.HuksKeyRSAPADDINGNONE,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256
        ),
        inData: gInData64Array,
      };
      if (useSoftware) {
        await publicGenerateKeyFunc(srcKeyAlies, HuksOptions);
        await publicExportKeyFunc(srcKeyAlies, HuksOptions);
        await publicDeleteKeyFunc(srcKeyAlies, HuksOptions);
      }
      done();
    });

    it('Security_HUKS_Export_API8_0200', 0, async function (done) {
      let srcKeyAlies = "Security_HUKS_Export_API8_0200";
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSASize768,
          HuksCipherRSA.HuksKeyPurposeDECRYPT,
          HuksCipherRSA.HuksKeyRSAPADDINGNONE,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256
        ),
        inData: gInData64Array,
      };
      if (useSoftware) {
        await publicGenerateKeyFunc(srcKeyAlies, HuksOptions);
        await publicExportKeyFunc(srcKeyAlies, HuksOptions);
        await publicDeleteKeyFunc(srcKeyAlies, HuksOptions);
      }
      done();
    });

    it('Security_HUKS_Export_API8_0300', 0, async function (done) {
      let srcKeyAlies = "Security_HUKS_Export_API8_0300";
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSASize1024,
          HuksCipherRSA.HuksKeyPurposeDECRYPT,
          HuksCipherRSA.HuksKeyRSAPADDINGNONE,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256
        ),
        inData: gInData64Array,
      };
      if (useSoftware) {
        await publicGenerateKeyFunc(srcKeyAlies, HuksOptions);
        await publicExportKeyFunc(srcKeyAlies, HuksOptions);
        await publicDeleteKeyFunc(srcKeyAlies, HuksOptions);
      }
      done();
    });

    it('Security_HUKS_Export_API8_0400', 0, async function (done) {
      let srcKeyAlies = "Security_HUKS_Export_API8_0400";
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSASize2048,
          HuksCipherRSA.HuksKeyPurposeDECRYPT,
          HuksCipherRSA.HuksKeyRSAPADDINGNONE,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256
        ),
        inData: gInData64Array,
      };
      await publicGenerateKeyFunc(srcKeyAlies, HuksOptions);
      await publicExportKeyFunc(srcKeyAlies, HuksOptions);
      await publicDeleteKeyFunc(srcKeyAlies, HuksOptions)
      done();
    });

    it('Security_HUKS_Export_API8_0500', 0, async function (done) {
      let srcKeyAlies = "Security_HUKS_Export_API8_0500";
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSASize3072,
          HuksCipherRSA.HuksKeyPurposeDECRYPT,
          HuksCipherRSA.HuksKeyRSAPADDINGNONE,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256
        ),
        inData: gInData64Array,
      };
      await publicGenerateKeyFunc(srcKeyAlies, HuksOptions);
      await publicExportKeyFunc(srcKeyAlies, HuksOptions);
      await publicDeleteKeyFunc(srcKeyAlies, HuksOptions)
      done();
    });

    it('Security_HUKS_Export_API8_0600', 0, async function (done) {
      let srcKeyAlies = "Security_HUKS_Export_API8_0600";
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSASize4096,
          HuksCipherRSA.HuksKeyPurposeDECRYPT,
          HuksCipherRSA.HuksKeyRSAPADDINGNONE,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256
        ),
        inData: gInData64Array,
      };
      await publicGenerateKeyFunc(srcKeyAlies, HuksOptions);
      await publicExportKeyFunc(srcKeyAlies, HuksOptions);
      await publicDeleteKeyFunc(srcKeyAlies, HuksOptions)
      done();
    });

    it('Security_HUKS_Export_API8_0700', 0, async function (done) {
      let srcKeyAlies = "Security_HUKS_Export_API8_0700";
      let HuksOptions = {
        properties: new Array(
          HuksAgreeECDH.HuksKeyAlgECC,
          HuksAgreeECDH.HuksKeyECCSize224,
          HuksAgreeECDH.HuksKeyPurposeECDH,
          HuksAgreeECDH.HuksKeyECCDIGEST
        ),
        inData: gInData64Array,
      };
      if (useSoftware) {
        await publicGenerateKeyFunc(srcKeyAlies, HuksOptions);
        await publicExportKeyFunc(srcKeyAlies, HuksOptions);
        await publicDeleteKeyFunc(srcKeyAlies, HuksOptions);
      }
      done();
    });

    it('Security_HUKS_Export_API8_0800', 0, async function (done) {
      let srcKeyAlies = "Security_HUKS_Export_API8_0800";
      let HuksOptions = {
        properties: new Array(
          HuksAgreeECDH.HuksKeyAlgECC,
          HuksAgreeECDH.HuksKeyECCSize256,
          HuksAgreeECDH.HuksKeyPurposeECDH,
          HuksAgreeECDH.HuksKeyECCDIGEST
        ),
        inData: gInData64Array,
      };
      await publicGenerateKeyFunc(srcKeyAlies, HuksOptions);
      await publicExportKeyFunc(srcKeyAlies, HuksOptions);
      await publicDeleteKeyFunc(srcKeyAlies, HuksOptions)
      done();
    });

    it('Security_HUKS_Export_API8_0900', 0, async function (done) {
      let srcKeyAlies = "Security_HUKS_Export_API8_0900";
      let HuksOptions = {
        properties: new Array(
          HuksAgreeECDH.HuksKeyAlgECC,
          HuksAgreeECDH.HuksKeyECCSize384,
          HuksAgreeECDH.HuksKeyPurposeECDH,
          HuksAgreeECDH.HuksKeyECCDIGEST
        ),
        inData: gInData64Array,
      };
      await publicGenerateKeyFunc(srcKeyAlies, HuksOptions);
      await publicExportKeyFunc(srcKeyAlies, HuksOptions);
      await publicDeleteKeyFunc(srcKeyAlies, HuksOptions)
      done();
    });

    it('Security_HUKS_Export_API8_1000', 0, async function (done) {
      let srcKeyAlies = "Security_HUKS_Export_API8_1000";
      let HuksOptions = {
        properties: new Array(
          HuksAgreeECDH.HuksKeyAlgECC,
          HuksAgreeECDH.HuksKeyECCSize521,
          HuksAgreeECDH.HuksKeyPurposeECDH,
          HuksAgreeECDH.HuksKeyECCDIGEST
        ),
        inData: gInData64Array,
      };
      await publicGenerateKeyFunc(srcKeyAlies, HuksOptions);
      await publicExportKeyFunc(srcKeyAlies, HuksOptions);
      await publicDeleteKeyFunc(srcKeyAlies, HuksOptions)
      done();
    });

    it('Security_HUKS_Export_API8_1100', 0, async function (done) {
      let srcKeyAlies = "Security_HUKS_Export_API8_1100";
      let HuksOptions = {
        properties: new Array(
          HuksAgreeECDH.HuksKeyAlgECC,
          HuksAgreeECDH.HuksKeyPurposeECDH,
          HuksAgreeECDH.HuksKeyECCSize224,
          HuksAgreeECDH.HuksKeyECCDIGEST,
          HuksAgreeECDH.HuksKeyECCPADDING,
          HuksAgreeECDH.HuksKeyECCBLOCKMODE,
        ),
        inData: gInData64Array,
      };
      if (useSoftware) {
        await publicGenerateKeyFunc(srcKeyAlies, HuksOptions);
        await publicExportKeyFunc(srcKeyAlies, HuksOptions);
        await publicDeleteKeyFunc(srcKeyAlies, HuksOptions);
      }
      done();
    });

    it('Security_HUKS_Export_API8_1200', 0, async function (done) {
      let srcKeyAlies = "Security_HUKS_Export_API8_1200";
      let HuksOptions = {
        properties: new Array(
          HuksAgreeECDH.HuksKeyAlgECC,
          HuksAgreeECDH.HuksKeyPurposeECDH,
          HuksAgreeECDH.HuksKeyECCSize256,
          HuksAgreeECDH.HuksKeyECCDIGEST,
          HuksAgreeECDH.HuksKeyECCPADDING,
          HuksAgreeECDH.HuksKeyECCBLOCKMODE
        ),
        inData: gInData64Array,
      };
      await publicGenerateKeyFunc(srcKeyAlies, HuksOptions);
      await publicExportKeyFunc(srcKeyAlies, HuksOptions);
      await publicDeleteKeyFunc(srcKeyAlies, HuksOptions)
      done();
    });

    it('Security_HUKS_Export_API8_1300', 0, async function (done) {
      let srcKeyAlies = "Security_HUKS_Export_API8_1300";
      let HuksOptions = {
        properties: new Array(
          HuksAgreeECDH.HuksKeyAlgECC,
          HuksAgreeECDH.HuksKeyPurposeECDH,
          HuksAgreeECDH.HuksKeyECCSize384,
          HuksAgreeECDH.HuksKeyECCDIGEST,
          HuksAgreeECDH.HuksKeyECCPADDING,
          HuksAgreeECDH.HuksKeyECCBLOCKMODE
        ),
        inData: gInData64Array,
      };
      await publicGenerateKeyFunc(srcKeyAlies, HuksOptions);
      await publicExportKeyFunc(srcKeyAlies, HuksOptions);
      await publicDeleteKeyFunc(srcKeyAlies, HuksOptions)
      done();
    });

    it('Security_HUKS_Export_API8_1400', 0, async function (done) {
      let srcKeyAlies = "Security_HUKS_Export_API8_1400";
      let HuksOptions = {
        properties: new Array(
          HuksAgreeECDH.HuksKeyAlgECC,
          HuksAgreeECDH.HuksKeyPurposeECDH,
          HuksAgreeECDH.HuksKeyECCSize521,
          HuksAgreeECDH.HuksKeyECCDIGEST,
          HuksAgreeECDH.HuksKeyECCPADDING,
          HuksAgreeECDH.HuksKeyECCBLOCKMODE
        ),
        inData: gInData64Array,
      };
      await publicGenerateKeyFunc(srcKeyAlies, HuksOptions);
      await publicExportKeyFunc(srcKeyAlies, HuksOptions);
      await publicDeleteKeyFunc(srcKeyAlies, HuksOptions)
      done();
    });

    it('Security_HUKS_Export_API8_1500', 0, async function (done) {
      let srcKeyAlies = "Security_HUKS_Export_API8_1500";
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyED25519.HuksKeyAlgED25519,
          HuksSignVerifyED25519.HuksKeyRSAPurposeSINGVERIFY,
          HuksSignVerifyED25519.HuksKeyED25519Size256,
          HuksSignVerifyED25519.HuksTagDigestSHA256
        ),
        inData: gInData64Array,
      };
      await publicGenerateKeyFunc(srcKeyAlies, HuksOptions);
      await publicExportKeyFunc(srcKeyAlies, HuksOptions);
      await publicDeleteKeyFunc(srcKeyAlies, HuksOptions)
      done();
    });

    it('Security_HUKS_Export_API8_1600', 0, async function (done) {
      let srcKeyAlies = "Security_HUKS_Export_API8_1600";
      let HuksOptions = {
        properties: new Array(
          HuksKeyAlgX25519.HuksKeyAlgX25519,
          HuksKeyAlgX25519.HuksKeyCURVE25519Size256,
          HuksKeyAlgX25519.HuksKeyDIGEST,
          HuksKeyAlgX25519.HuksKeyPADDING,
          HuksKeyAlgX25519.HuksKeyPurposeAGREE,
          HuksKeyAlgX25519.HuksKeyBLOCKMODE
        ),
        inData: gInData64Array,
      };
      await publicGenerateKeyFunc(srcKeyAlies, HuksOptions);
      await publicExportKeyFunc(srcKeyAlies, HuksOptions);
      await publicDeleteKeyFunc(srcKeyAlies, HuksOptions)
      done();
    });

    it('Security_HUKS_Export_API8_1700', 0, async function (done) {
      let srcKeyAlies = "Security_HUKS_Export_API8_1700";
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyDSA.HuksKeyAlgDSA,
          HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
          HuksSignVerifyDSA.HuksTagDSADigestSHA1,
          HuksSignVerifyDSA.HuksKeySIZE1024
        ),
        inData: gInData64Array,
      };
      if (useSoftware) {
        await publicGenerateKeyFunc(srcKeyAlies, HuksOptions);
        await publicExportKeyFunc(srcKeyAlies, HuksOptions);
        await publicDeleteKeyFunc(srcKeyAlies, HuksOptions);
      }
      done();
    });

    it('Security_HUKS_Export_API8_1800', 0, async function (done) {
      let srcKeyAlies = "Security_HUKS_Export_API8_1800";
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifySM2.HuksKeyAlgSM2,
          HuksSignVerifySM2.HuksKeySM2PurposeSIGN,
          HuksSignVerifySM2.HuksKeySize256,
          HuksSignVerifySM2.HuksTagSM2DigestSM3,
        ),
        inData: gInData64Array,
      };
      await publicGenerateKeyFunc(srcKeyAlies, HuksOptions);
      await publicExportKeyFunc(srcKeyAlies, HuksOptions);
      await publicDeleteKeyFunc(srcKeyAlies, HuksOptions)
      done();
    });

    it('Security_HUKS_Export_API8_2000', 0, async function (done) {
      const srcKeyAlies = '****'
      let HuksOptions = {
        properties: new Array(
          HuksCipherRSA.HuksKeyAlgRSA,
          HuksCipherRSA.HuksKeyPurposeENCRYPT,
          HuksCipherRSA.HuksKeyRSASize4096,
          HuksCipherRSA.HuksKeyRSAPADDINGNONE,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256,
        ),
        inData: gInData64Array,
      };
      await exportkey(srcKeyAlies, HuksOptions)
        .then((data) => {
          console.log(`test ExportKey data: ${JSON.stringify(data)}`);
          expect(null).assertFail();
        })
        .catch((err) => {
          console.log('test ImportKey err information: ' + JSON.stringify(err));
          expect(err.code == -13).assertTrue();
        });
      done();
    });
  });
}
