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
import { describe, it, beforeAll } from '@ohos/hypium';
import Data from '../../../../../../../utils/data.json';
import { HuksSignVerifyECC } from '../../../../../../../utils/param/signverify/publicSignverifyParam';
import { stringToUint8Array, checkSoftware } from '../../../../../../../utils/param/publicFunc';
import { publicSignVerifyFunc } from '../../../../../../../utils/param/signverify/publicSignverifyPromise.js';
let srcData65 = Data.Data65b;
let srcData65Kb = stringToUint8Array(srcData65);
let finishOutData;
let useSoftware = true;
const srcData65Sha256 = new Uint8Array([
  0x23, 0xF8, 0x94, 0xEA, 0xEE, 0x1C, 0x70, 0xA9, 0x33, 0x82, 0x6C, 0xCF, 0xEF, 0x2D, 0x41, 0x6F,
  0x64, 0xF6, 0x46, 0xD4, 0xCD, 0xD4, 0x5C, 0x33, 0x84, 0x4D, 0x53, 0x4A, 0x1D, 0xF0, 0xE7, 0xDF,
]);
export default function SecurityHuksECCBasicFinish65KBPromiseJsunit() {
  describe('SecurityHuksECCBasicFinish65KBPromiseJsunit', function () {
    beforeAll(async function (done) {
      useSoftware = await checkSoftware();
      done();
    })
    it('Security_HUKS_SignVerify_API9_ECC_103', 0, async function (done) {
      const srcKeyAlies = 'testSignVerifyECCSize256SIGNNONEKeyAlias103';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
          HuksSignVerifyECC.HuksTagECCDigestNONE,
          HuksSignVerifyECC.HuksKeyECCSize256
        ),
        inData: srcData65Sha256,
      };
      finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Sha256);
      HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
          HuksSignVerifyECC.HuksTagECCDigestNONE,
          HuksSignVerifyECC.HuksKeyECCSize256
        ),
        inData: finishOutData,
      };
      await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Sha256);
      done();
    });

    it('testSignVerifyECCSize384SIGNNONE103', 0, async function (done) {
      const srcKeyAlies = 'testSignVerifyECCSize384SIGNNONEKeyAlias103';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
          HuksSignVerifyECC.HuksTagECCDigestNONE,
          HuksSignVerifyECC.HuksKeyECCSize384
        ),
        inData: srcData65Sha256,
      };
      finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Sha256);
      HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
          HuksSignVerifyECC.HuksTagECCDigestNONE,
          HuksSignVerifyECC.HuksKeyECCSize384
        ),
        inData: finishOutData,
      };
      await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Sha256);
      done();
    });

    it('testSignVerifyECCSize521SIGNNONE103', 0, async function (done) {
      const srcKeyAlies = 'testSignVerifyECCSize521SIGNNONEKeyAlias103';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
          HuksSignVerifyECC.HuksTagECCDigestNONE,
          HuksSignVerifyECC.HuksKeyECCSize521
        ),
        inData: srcData65Sha256,
      };
      finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Sha256);
      HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
          HuksSignVerifyECC.HuksTagECCDigestNONE,
          HuksSignVerifyECC.HuksKeyECCSize521
        ),
        inData: finishOutData,
      };
      await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Sha256);
      done();
    });

    it('testSignVerifyECCSize256SIGNSHA1103', 0, async function (done) {
      const srcKeyAlies = 'testSignVerifyECCSize256SIGNSHA1KeyAlias103';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
          HuksSignVerifyECC.HuksTagECCDigestSHA1,
          HuksSignVerifyECC.HuksKeyECCSize256
        ),
        inData: srcData65Kb,
      };
      if (useSoftware) {
        finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
        HuksOptions = {
          properties: new Array(
            HuksSignVerifyECC.HuksKeyAlgECC,
            HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
            HuksSignVerifyECC.HuksTagECCDigestSHA1,
            HuksSignVerifyECC.HuksKeyECCSize256
          ),
          inData: finishOutData,
        };
        await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
      }
      done();
    });

    it('testSignVerifyECCSize384SIGNSHA1103', 0, async function (done) {
      const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA1KeyAlias103';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
          HuksSignVerifyECC.HuksTagECCDigestSHA1,
          HuksSignVerifyECC.HuksKeyECCSize384
        ),
        inData: srcData65Kb,
      };
      if (useSoftware) {
        finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
        HuksOptions = {
          properties: new Array(
            HuksSignVerifyECC.HuksKeyAlgECC,
            HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
            HuksSignVerifyECC.HuksTagECCDigestSHA1,
            HuksSignVerifyECC.HuksKeyECCSize384
          ),
          inData: finishOutData,
        };
        await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
      }
      done();
    });

    it('testSignVerifyECCSize521SIGNSHA1103', 0, async function (done) {
      const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA1KeyAlias103';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
          HuksSignVerifyECC.HuksTagECCDigestSHA1,
          HuksSignVerifyECC.HuksKeyECCSize521
        ),
        inData: srcData65Kb,
      };
      if (useSoftware) {
        finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
        HuksOptions = {
          properties: new Array(
            HuksSignVerifyECC.HuksKeyAlgECC,
            HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
            HuksSignVerifyECC.HuksTagECCDigestSHA1,
            HuksSignVerifyECC.HuksKeyECCSize521
          ),
          inData: finishOutData,
        };
        await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
      }
      done();
    });

    it('testSignVerifyECCSize256SIGNSHA224103', 0, async function (done) {
      const srcKeyAlies = 'testSignVerifyECCSize256SIGNSHA224KeyAlias103';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
          HuksSignVerifyECC.HuksTagECCDigestSHA224,
          HuksSignVerifyECC.HuksKeyECCSize256
        ),
        inData: srcData65Kb,
      };
      if (useSoftware) {
        finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
        HuksOptions = {
          properties: new Array(
            HuksSignVerifyECC.HuksKeyAlgECC,
            HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
            HuksSignVerifyECC.HuksTagECCDigestSHA224,
            HuksSignVerifyECC.HuksKeyECCSize256
          ),
          inData: finishOutData,
        };
        await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
      }
      done();
    });

    it('testSignVerifyECCSize384SIGNSHA224103', 0, async function (done) {
      const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA224KeyAlias103';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
          HuksSignVerifyECC.HuksTagECCDigestSHA224,
          HuksSignVerifyECC.HuksKeyECCSize384
        ),
        inData: srcData65Kb,
      };
      if (useSoftware) {
        finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
        HuksOptions = {
          properties: new Array(
            HuksSignVerifyECC.HuksKeyAlgECC,
            HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
            HuksSignVerifyECC.HuksTagECCDigestSHA224,
            HuksSignVerifyECC.HuksKeyECCSize384
          ),
          inData: finishOutData,
        };
        await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
      }
      done();
    });

    it('testSignVerifyECCSize521SIGNSHA224103', 0, async function (done) {
      const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA224KeyAlias103';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
          HuksSignVerifyECC.HuksTagECCDigestSHA224,
          HuksSignVerifyECC.HuksKeyECCSize521
        ),
        inData: srcData65Kb,
      };
      if (useSoftware) {
        finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
        HuksOptions = {
          properties: new Array(
            HuksSignVerifyECC.HuksKeyAlgECC,
            HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
            HuksSignVerifyECC.HuksTagECCDigestSHA224,
            HuksSignVerifyECC.HuksKeyECCSize521
          ),
          inData: finishOutData,
        };
        await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
      }
      done();
    });

    it('testSignVerifyECCSize256SIGNSHA256103', 0, async function (done) {
      const srcKeyAlies = 'testSignVerifyECCSize256SIGNSHA256KeyAlias103';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
          HuksSignVerifyECC.HuksTagECCDigestSHA256,
          HuksSignVerifyECC.HuksKeyECCSize256
        ),
        inData: srcData65Kb,
      };
      finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
      HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
          HuksSignVerifyECC.HuksTagECCDigestSHA256,
          HuksSignVerifyECC.HuksKeyECCSize256
        ),
        inData: finishOutData,
      };
      await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
      done();
    });

    it('testSignVerifyECCSize384SIGNSHA256103', 0, async function (done) {
      const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA256KeyAlias103';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
          HuksSignVerifyECC.HuksTagECCDigestSHA256,
          HuksSignVerifyECC.HuksKeyECCSize384
        ),
        inData: srcData65Kb,
      };
      finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
      HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
          HuksSignVerifyECC.HuksTagECCDigestSHA256,
          HuksSignVerifyECC.HuksKeyECCSize384
        ),
        inData: finishOutData,
      };
      await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
      done();
    });

    it('testSignVerifyECCSize521SIGNSHA256103', 0, async function (done) {
      const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA256KeyAlias103';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
          HuksSignVerifyECC.HuksTagECCDigestSHA256,
          HuksSignVerifyECC.HuksKeyECCSize521
        ),
        inData: srcData65Kb,
      };
      finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
      HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
          HuksSignVerifyECC.HuksTagECCDigestSHA256,
          HuksSignVerifyECC.HuksKeyECCSize521
        ),
        inData: finishOutData,
      };
      await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
      done();
    });

    it('testSignVerifyECCSize256SIGNSHA384103', 0, async function (done) {
      const srcKeyAlies = 'testSignVerifyECCSize256SIGNSHA384KeyAlias103';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
          HuksSignVerifyECC.HuksTagECCDigestSHA384,
          HuksSignVerifyECC.HuksKeyECCSize256
        ),
        inData: srcData65Kb,
      };
      finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
      HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
          HuksSignVerifyECC.HuksTagECCDigestSHA384,
          HuksSignVerifyECC.HuksKeyECCSize256
        ),
        inData: finishOutData,
      };
      await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
      done();
    });

    it('testSignVerifyECCSize384SIGNSHA384103', 0, async function (done) {
      const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA384KeyAlias103';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
          HuksSignVerifyECC.HuksTagECCDigestSHA384,
          HuksSignVerifyECC.HuksKeyECCSize384
        ),
        inData: srcData65Kb,
      };
      finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
      HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
          HuksSignVerifyECC.HuksTagECCDigestSHA384,
          HuksSignVerifyECC.HuksKeyECCSize384
        ),
        inData: finishOutData,
      };
      await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
      done();
    });

    it('testSignVerifyECCSize521SIGNSHA384103', 0, async function (done) {
      const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA384KeyAlias103';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
          HuksSignVerifyECC.HuksTagECCDigestSHA384,
          HuksSignVerifyECC.HuksKeyECCSize521
        ),
        inData: srcData65Kb,
      };
      finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
      HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
          HuksSignVerifyECC.HuksTagECCDigestSHA384,
          HuksSignVerifyECC.HuksKeyECCSize521
        ),
        inData: finishOutData,
      };
      await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
      done();
    });

    it('testSignVerifyECCSize256SIGNSHA512103', 0, async function (done) {
      const srcKeyAlies = 'testSignVerifyECCSize256SIGNSHA512KeyAlias103';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
          HuksSignVerifyECC.HuksTagECCDigestSHA512,
          HuksSignVerifyECC.HuksKeyECCSize256
        ),
        inData: srcData65Kb,
      };
      finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
      HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
          HuksSignVerifyECC.HuksTagECCDigestSHA512,
          HuksSignVerifyECC.HuksKeyECCSize256
        ),
        inData: finishOutData,
      };
      await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
      done();
    });

    it('testSignVerifyECCSize384SIGNSHA512103', 0, async function (done) {
      const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA512KeyAlias103';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
          HuksSignVerifyECC.HuksTagECCDigestSHA512,
          HuksSignVerifyECC.HuksKeyECCSize384
        ),
        inData: srcData65Kb,
      };
      finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
      HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
          HuksSignVerifyECC.HuksTagECCDigestSHA512,
          HuksSignVerifyECC.HuksKeyECCSize384
        ),
        inData: finishOutData,
      };
      await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
      done();
    });

    it('testSignVerifyECCSize521SIGNSHA512103', 0, async function (done) {
      const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA512KeyAlias103';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
          HuksSignVerifyECC.HuksTagECCDigestSHA512,
          HuksSignVerifyECC.HuksKeyECCSize521
        ),
        inData: srcData65Kb,
      };
      finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
      HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
          HuksSignVerifyECC.HuksTagECCDigestSHA512,
          HuksSignVerifyECC.HuksKeyECCSize521
        ),
        inData: finishOutData,
      };
      await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
      done();
    });
  });
}
