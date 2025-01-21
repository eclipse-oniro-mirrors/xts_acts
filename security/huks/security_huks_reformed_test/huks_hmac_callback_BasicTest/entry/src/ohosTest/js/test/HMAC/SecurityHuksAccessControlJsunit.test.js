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
import { describe, it, expect, beforeAll } from "@ohos/hypium";
import huks from "@ohos.security.huks";
import Data from "../../../../../../../utils/data.json";
import { stringToUint8Array, checkSoftware } from "../../../../../../../utils/param/publicFunc";
import { HuksSignVerifyDSA, HuksSignVerifyRSA, HuksSignVerifyECC }
  from "../../../../../../../utils/param/signverify/publicSignverifyParam";
import { HuksAgreeDH, HuksAgreeECDH }
  from "../../../../../../../utils/param/agree/publicAgreeParam";
import { HuksCipherAES, HuksCipherRSA }
  from "../../../../../../../utils/param/cipher/publicCipherParam";
import { HuksHmac } from "../../../../../../../utils/param/hmac/publicHmacParam";

let srcData63 = Data.Data63b;
let srcData63Kb = stringToUint8Array(srcData63);
let exportKey;
let useSoftware = true;

async function generateKeyFunc(srcKeyAlies, HuksOptions) {
  console.info(`enter promise generateKeyItem`);
  try {
    await huks.generateKeyItem(srcKeyAlies, HuksOptions)
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

async function deleteKeyFunc(srcKeyAlies, HuksOptions) {
  console.info(`enter promise deleteKeyItem`);
  try {
    await huks.deleteKeyItem(srcKeyAlies, HuksOptions)
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

async function exportKeyFunc(srcKeyAlias, HuksOptions) {
  console.info(`enter promise export`);
  try {
    await huks.exportKeyItem(srcKeyAlias, HuksOptions)
      .then((data) => {
        console.info(`promise: exportKeyItem success, data = ${JSON.stringify(data)}`);
        exportKey = data.outData;
      })
      .catch(error => {
        console.error(`promise: exportKeyItem failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: exportKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

async function publicIsKeyItemExist(srcKeyAlies, HuksOptions) {
  console.info(`enter callback isKeyItemExist`);
  try {
    await isKeyItemExist(srcKeyAlies, HuksOptions)
      .then((data) => {
        console.info(`callback: isKeyItemExist success, data = ${JSON.stringify(data)}`);
        expect(data == true).assertTrue();
      })
      .catch(error => {
        console.error(`callback: isKeyItemExist failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`callback: isKeyItemExist input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

function isKeyItemExist(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    try {
      huks.isKeyItemExist(srcKeyAlies, HuksOptions, function (error, data) {
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

export function SecurityHuksAccessControlJsunit() {
  describe("SecurityHuksAccessControlJsunit", function () {
    beforeAll(async function (done) {
      useSoftware = await checkSoftware();
      done();
    })
    it("Security_HUKS_AccessControll_API9_0100", 0, async function (done) {
      let srcKeyAlias = "Security_HUKS_AccessControll_API9_0100";
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyDSA.HuksKeyAlgDSA,
          HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY,
          HuksSignVerifyDSA.HuksKeySIZE1024,
          HuksSignVerifyDSA.HuksTagDSADigestSHA1
        ),
        inData: srcData63Kb,
      };
      if (useSoftware) {
        await generateKeyFunc(srcKeyAlias, HuksOptions);
        await publicIsKeyItemExist(srcKeyAlias, HuksOptions);
        await exportKeyFunc(srcKeyAlias, HuksOptions);

        HuksOptions.properties.splice(1, 1, HuksAgreeDH.HuksKeyPurposeDH);
        HuksOptions.properties.splice(3, 1);
        console.info(`enter promise doInit`);
        try {
          await huks.initSession(srcKeyAlias, HuksOptions)
            .then((data) => {
              console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
            })
            .catch(error => {
              console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
              expect(error.code == 12000003).assertTrue();
            });
        } catch (error) {
          console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
          expect(null).assertFail();
        }
        await deleteKeyFunc(srcKeyAlias, HuksOptions);
      }
      done();
    });

    it("Security_HUKS_AccessControll_API9_0200", 0, async function (done) {
      let srcKeyAlias = "Security_HUKS_AccessControll_API9_0200";
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeSINGVERIFY,
          HuksSignVerifyECC.HuksKeyECCSize384,
          HuksSignVerifyECC.HuksTagECCDigestNONE
        ),
        inData: srcData63Kb,
      };
      await generateKeyFunc(srcKeyAlias, HuksOptions);
      await exportKeyFunc(srcKeyAlias, HuksOptions);
      console.info(`enter promise isKeyItemExist`);
      try {
        await huks.isKeyItemExist(srcKeyAlias, HuksOptions)
          .then((data) => {
            console.info(`promise: isKeyItemExist success, data = ${JSON.stringify(data)}`);
            expect(data == true).assertTrue();
          })
          .catch(error => {
            console.error(`promise: isKeyItemExist failed, code: ${error.code}, msg: ${error.message}`);
            expect(null).assertFail();
          });
      } catch (error) {
        console.error(`promise: isKeyItemExist input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      }

      HuksOptions.properties.splice(0, 1, HuksAgreeECDH.HuksKeyAlgECDH);
      HuksOptions.properties.splice(1, 1, HuksAgreeECDH.HuksKeyPurposeECDH);
      console.info(`enter promise doInit`);
      try {
        await huks.initSession(srcKeyAlias, HuksOptions)
          .then((data) => {
            console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
          })
          .catch(error => {
            console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
            expect(error.code == 401).assertTrue();
          });
      } catch (error) {
        console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      }
      await deleteKeyFunc(srcKeyAlias, HuksOptions);
      done();
    });

    it("Security_HUKS_AccessControll_API9_0300", 0, async function (done) {
      let srcKeyAlias = "Security_HUKS_AccessControll_API9_0300";
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyDSA.HuksKeyAlgDSA,
          HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY,
          HuksSignVerifyDSA.HuksKeySIZE1024,
          HuksSignVerifyDSA.HuksTagDSADigestSHA1
        ),
        inData: srcData63Kb,
      };
      if (useSoftware) {
        await generateKeyFunc(srcKeyAlias, HuksOptions);
        await exportKeyFunc(srcKeyAlias, HuksOptions);

        HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyPurposeENCRYPT);
        console.info(`enter promise doInit`);
        try {
          await huks.initSession(srcKeyAlias, HuksOptions)
            .then((data) => {
              console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
            })
            .catch(error => {
              console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
              expect(error.code == 12000003).assertTrue();
            });
        } catch (error) {
          console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
          expect(null).assertFail();
        }

        HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyPurposeDECRYPT);
        console.info(`enter promise doInit`);
        try {
          await huks.initSession(srcKeyAlias, HuksOptions)
            .then((data) => {
              console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
            })
            .catch(error => {
              console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
              expect(error.code == 12000003).assertTrue();
            });
        } catch (error) {
          console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
          expect(null).assertFail();
        }

        await deleteKeyFunc(srcKeyAlias, HuksOptions);
      }
      done();
    });

    it("Security_HUKS_AccessControll_API9_0400", 0, async function (done) {
      let srcKeyAlias = "Security_HUKS_AccessControll_API9_0400";
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
          HuksSignVerifyRSA.HuksKeyRSASize3072
        ),
        inData: srcData63Kb,
      };
      await generateKeyFunc(srcKeyAlias, HuksOptions);
      await exportKeyFunc(srcKeyAlias, HuksOptions);

      HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeENCRYPT);
      console.info(`enter promise doInit`);
      try {
        await huks.initSession(srcKeyAlias, HuksOptions)
          .then((data) => {
            console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
          })
          .catch(error => {
            console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
            expect(error.code == 401).assertTrue();
          });
      } catch (error) {
        console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      }

      HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
      console.info(`enter promise doInit`);
      try {
        await huks.initSession(srcKeyAlias, HuksOptions)
          .then((data) => {
            console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
          })
          .catch(error => {
            console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
            expect(error.code == 401).assertTrue();
          });
      } catch (error) {
        console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      }

      HuksOptions.properties.splice(1, 1, HuksHmac.HuksKeyPurpose);
      console.info(`enter promise doInit`);
      try {
        await huks.initSession(srcKeyAlias, HuksOptions)
          .then((data) => {
            console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
          })
          .catch(error => {
            console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
            expect(error.code == 12000003).assertTrue();
          });
      } catch (error) {
        console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      }

      await deleteKeyFunc(srcKeyAlias, HuksOptions);
      done();
    });

    it("Security_HUKS_AccessControll_API9_0500", 0, async function (done) {
      let srcKeyAlias = "Security_HUKS_AccessControll_API9_0500";
      let HuksOptions = {
        properties: new Array(
          HuksCipherAES.HuksKeyAlgAES,
          HuksCipherAES.HuksKeyPurpose,
          HuksCipherAES.HuksKeyAESSize128,
          HuksCipherAES.HuksKeyAESBLOCKMODE,
          HuksCipherAES.HuksKeyAESPADDINGNONE
        ),
      };
      await generateKeyFunc(srcKeyAlias, HuksOptions);
      HuksOptions.properties.splice(1, 1, HuksHmac.HuksKeyPurpose);
      console.info(`enter promise doInit`);
      try {
        await huks.initSession(srcKeyAlias, HuksOptions)
          .then((data) => {
            console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
          })
          .catch(error => {
            console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
            expect(error.code == 12000003).assertTrue();
          });
      } catch (error) {
        console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      }

      await deleteKeyFunc(srcKeyAlias, HuksOptions);
      done();
    });

    it("Security_HUKS_AccessControll_API9_0600", 0, async function (done) {
      let srcKeyAlias = "Security_HUKS_AccessControll_API9_0600";
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyDSA.HuksKeyAlgDSA,
          HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY,
          HuksSignVerifyDSA.HuksKeySIZE1024,
          HuksSignVerifyDSA.HuksTagDSADigestSHA1
        ),
        inData: srcData63Kb,
      };
      if (useSoftware) {
        await generateKeyFunc(srcKeyAlias, HuksOptions);
        await exportKeyFunc(srcKeyAlias, HuksOptions);

        HuksOptions.properties.splice(1, 1, HuksHmac.HuksKeyPurpose);
        console.info(`enter promise doInit`);
        try {
          await huks.initSession(srcKeyAlias, HuksOptions)
            .then((data) => {
              console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
            })
            .catch(error => {
              console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
              expect(error.code == 12000003).assertTrue();
            });
        } catch (error) {
          console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
          expect(null).assertFail();
        }

        await deleteKeyFunc(srcKeyAlias, HuksOptions);
      }
      done();
    });

    it("Security_HUKS_AccessControll_API9_0700", 0, async function (done) {
      let srcKeyAlias = "Security_HUKS_AccessControll_API9_0700";
      let HuksOptions = {
        properties: new Array(
          HuksCipherAES.HuksKeyAlgAES,
          HuksCipherAES.HuksKeyPurpose,
          HuksCipherAES.HuksKeyAESSize128,
          HuksCipherAES.HuksKeyAESBLOCKMODE,
          HuksCipherAES.HuksKeyAESPADDINGNONE
        ),
      };
      await generateKeyFunc(srcKeyAlias, HuksOptions);

      HuksOptions.properties.splice(1, 1, HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN);
      HuksOptions.properties.splice(5, 1, HuksSignVerifyRSA.HuksTagPKCS1DigestNONE);
      console.info(`enter promise doInit`);
      try {
        await huks.initSession(srcKeyAlias, HuksOptions)
          .then((data) => {
            console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
          })
          .catch(error => {
            console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
            expect(error.code == 12000003).assertTrue();
          });
      } catch (error) {
        console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      }

      HuksOptions.properties.splice(1, 1, HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY);
      console.info(`enter promise doInit`);
      try {
        await huks.initSession(srcKeyAlias, HuksOptions)
          .then((data) => {
            console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
          })
          .catch(error => {
            console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
            expect(error.code == 12000003).assertTrue();
          });
      } catch (error) {
        console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      }

      await deleteKeyFunc(srcKeyAlias, HuksOptions);
      done();
    });

    it("Security_HUKS_AccessControll_API9_0800", 0, async function (done) {
      let srcKeyAlias = "Security_HUKS_AccessControll_API9_0800";
      let HuksOptions = {
        properties: new Array(
          HuksAgreeECDH.HuksKeyAlgECC,
          HuksAgreeECDH.HuksKeyPurposeECDH,
          HuksAgreeECDH.HuksKeyECCSize384,
          HuksAgreeECDH.HuksKeyECCDIGEST,
          HuksAgreeECDH.HuksKeyECCPADDING,
          HuksAgreeECDH.HuksKeyECCBLOCKMODE
        ),
        inData: srcData63Kb,
      };
      await generateKeyFunc(srcKeyAlias, HuksOptions);
      await exportKeyFunc(srcKeyAlias, HuksOptions);

      HuksOptions.properties.splice(0, 1, HuksSignVerifyECC.HuksKeyECCPurposeSIGN);
      HuksOptions.properties.splice(4, 2);
      console.info(`enter promise doInit`);
      try {
        await huks.initSession(srcKeyAlias, HuksOptions)
          .then((data) => {
            console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
          })
          .catch(error => {
            console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
            expect(error.code == 401).assertTrue();
          });
      } catch (error) {
        console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      }

      HuksOptions.properties.splice(0, 1, HuksSignVerifyECC.HuksKeyECCPurposeVERIFY);
      HuksOptions.properties.splice(4, 2);
      console.info(`enter promise doInit`);
      try {
        await huks.initSession(srcKeyAlias, HuksOptions)
          .then((data) => {
            console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
          })
          .catch(error => {
            console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
            expect(error.code == 401).assertTrue();
          });
      } catch (error) {
        console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      }
      done();
    });

    it("Security_HUKS_AccessControll_API9_0900", 0, async function (done) {
      let srcKeyAlias = "Security_HUKS_AccessControll_API9_0900";
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyDSA.HuksKeyAlgDSA,
          HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY,
          HuksSignVerifyDSA.HuksKeySIZE1024,
          HuksSignVerifyDSA.HuksTagDSADigestSHA1
        ),
        inData: srcData63Kb,
      };
      if (useSoftware) {
        await generateKeyFunc(srcKeyAlias, HuksOptions);
        await exportKeyFunc(srcKeyAlias, HuksOptions);

        HuksOptions.properties.splice(1, 1, HuksAgreeDH.HuksKeyPurposeDH);
        HuksOptions.properties.splice(3, 1);
        console.info(`enter promise doInit`);
        try {
          await huks.initSession(srcKeyAlias, HuksOptions)
            .then((data) => {
              console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
            })
            .catch(error => {
              console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
              expect(error.code == 12000003).assertTrue();
            });
        } catch (error) {
          console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
          expect(null).assertFail();
        }

        await deleteKeyFunc(srcKeyAlias, HuksOptions);
      }
      done();
    });

    it("Security_HUKS_AccessControll_API9_1000", 0, async function (done) {
      let srcKeyAlias = "Security_HUKS_AccessControll_API9_1000";
      let HuksOptions = {
        properties: new Array(
          HuksCipherAES.HuksKeyAlgAES,
          HuksCipherAES.HuksKeyPurposeENCRYPT,
          HuksCipherAES.HuksKeyAESSize128,
          HuksCipherAES.HuksKeyAESBLOCKMODE,
          HuksCipherAES.HuksKeyAESPADDINGNONE
        ),
      };
      await generateKeyFunc(srcKeyAlias, HuksOptions);
      HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyPurposeDECRYPT);
      console.info(`enter promise doInit`);
      try {
        await huks.initSession(srcKeyAlias, HuksOptions)
          .then((data) => {
            console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
          })
          .catch(error => {
            console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
            expect(error.code == 401).assertTrue();
          });
      } catch (error) {
        console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      }

      await deleteKeyFunc(srcKeyAlias, HuksOptions);
      done();
    });

    it("Security_HUKS_AccessControll_API9_9000", 0, async function (done) {
      expect(1).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      expect(2).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
      expect(4).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN);
      expect(8).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      expect(16).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      expect(32).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_WRAP);
      expect(64).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      expect(128).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_MAC);
      expect(256).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
      expect(0).assertEqual(huks.HuksKeyDigest.HUKS_DIGEST_NONE);
      expect(1).assertEqual(huks.HuksKeyDigest.HUKS_DIGEST_MD5);
      expect(2).assertEqual(huks.HuksKeyDigest.HUKS_DIGEST_SM3);
      expect(10).assertEqual(huks.HuksKeyDigest.HUKS_DIGEST_SHA1);
      expect(11).assertEqual(huks.HuksKeyDigest.HUKS_DIGEST_SHA224);
      expect(12).assertEqual(huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      expect(13).assertEqual(huks.HuksKeyDigest.HUKS_DIGEST_SHA384);
      expect(14).assertEqual(huks.HuksKeyDigest.HUKS_DIGEST_SHA512);
      expect(0).assertEqual(huks.HuksKeyPadding.HUKS_PADDING_NONE);
      expect(1).assertEqual(huks.HuksKeyPadding.HUKS_PADDING_OAEP);
      expect(2).assertEqual(huks.HuksKeyPadding.HUKS_PADDING_PSS);
      expect(3).assertEqual(huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5);
      expect(4).assertEqual(huks.HuksKeyPadding.HUKS_PADDING_PKCS5);
      expect(5).assertEqual(huks.HuksKeyPadding.HUKS_PADDING_PKCS7);
      expect(1).assertEqual(huks.HuksCipherMode.HUKS_MODE_ECB);
      expect(2).assertEqual(huks.HuksCipherMode.HUKS_MODE_CBC);
      expect(3).assertEqual(huks.HuksCipherMode.HUKS_MODE_CTR);
      expect(4).assertEqual(huks.HuksCipherMode.HUKS_MODE_OFB);
      expect(31).assertEqual(huks.HuksCipherMode.HUKS_MODE_CCM);
      expect(32).assertEqual(huks.HuksCipherMode.HUKS_MODE_GCM);
      expect(512).assertEqual(huks.HuksKeySize.HUKS_RSA_KEY_SIZE_512);
      expect(768).assertEqual(huks.HuksKeySize.HUKS_RSA_KEY_SIZE_768);
      expect(1024).assertEqual(huks.HuksKeySize.HUKS_RSA_KEY_SIZE_1024);
      expect(2048).assertEqual(huks.HuksKeySize.HUKS_RSA_KEY_SIZE_2048);
      expect(3072).assertEqual(huks.HuksKeySize.HUKS_RSA_KEY_SIZE_3072);
      expect(4096).assertEqual(huks.HuksKeySize.HUKS_RSA_KEY_SIZE_4096);
      expect(224).assertEqual(huks.HuksKeySize.HUKS_ECC_KEY_SIZE_224);
      expect(256).assertEqual(huks.HuksKeySize.HUKS_ECC_KEY_SIZE_256);
      expect(384).assertEqual(huks.HuksKeySize.HUKS_ECC_KEY_SIZE_384);
      expect(521).assertEqual(huks.HuksKeySize.HUKS_ECC_KEY_SIZE_521);
      expect(128).assertEqual(huks.HuksKeySize.HUKS_AES_KEY_SIZE_128);
      expect(192).assertEqual(huks.HuksKeySize.HUKS_AES_KEY_SIZE_192);
      expect(256).assertEqual(huks.HuksKeySize.HUKS_AES_KEY_SIZE_256);
      expect(512).assertEqual(huks.HuksKeySize.HUKS_AES_KEY_SIZE_512);
      expect(256).assertEqual(huks.HuksKeySize.HUKS_CURVE25519_KEY_SIZE_256);
      expect(2048).assertEqual(huks.HuksKeySize.HUKS_DH_KEY_SIZE_2048);
      expect(3072).assertEqual(huks.HuksKeySize.HUKS_DH_KEY_SIZE_3072);
      expect(4096).assertEqual(huks.HuksKeySize.HUKS_DH_KEY_SIZE_4096);
      expect(256).assertEqual(huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256);
      expect(128).assertEqual(huks.HuksKeySize.HUKS_SM4_KEY_SIZE_128);
      expect(1).assertEqual(huks.HuksKeyAlg.HUKS_ALG_RSA);
      expect(2).assertEqual(huks.HuksKeyAlg.HUKS_ALG_ECC);
      expect(3).assertEqual(huks.HuksKeyAlg.HUKS_ALG_DSA);
      expect(20).assertEqual(huks.HuksKeyAlg.HUKS_ALG_AES);
      expect(50).assertEqual(huks.HuksKeyAlg.HUKS_ALG_HMAC);
      expect(51).assertEqual(huks.HuksKeyAlg.HUKS_ALG_HKDF);
      expect(52).assertEqual(huks.HuksKeyAlg.HUKS_ALG_PBKDF2);
      expect(100).assertEqual(huks.HuksKeyAlg.HUKS_ALG_ECDH);
      expect(101).assertEqual(huks.HuksKeyAlg.HUKS_ALG_X25519);
      expect(102).assertEqual(huks.HuksKeyAlg.HUKS_ALG_ED25519);
      expect(103).assertEqual(huks.HuksKeyAlg.HUKS_ALG_DH);
      expect(150).assertEqual(huks.HuksKeyAlg.HUKS_ALG_SM2);
      expect(151).assertEqual(huks.HuksKeyAlg.HUKS_ALG_SM3);
      expect(152).assertEqual(huks.HuksKeyAlg.HUKS_ALG_SM4);
      expect(0).assertEqual(
        huks.HuksKeyGenerateType.HUKS_KEY_GENERATE_TYPE_DEFAULT
      );
      expect(1).assertEqual(
        huks.HuksKeyGenerateType.HUKS_KEY_GENERATE_TYPE_DERIVE
      );
      expect(2).assertEqual(
        huks.HuksKeyGenerateType.HUKS_KEY_GENERATE_TYPE_AGREE
      );
      expect(1).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_IMPORT_KEY);
      expect(2).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_GENERATE_KEY);
      expect(3).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_AGREE_KEY);
      expect(4).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_DERIVE_KEY);
      expect(0).assertEqual(huks.HuksSendType.HUKS_SEND_TYPE_ASYNC);
      expect(1).assertEqual(huks.HuksSendType.HUKS_SEND_TYPE_SYNC);
      expect(1).assertEqual(
        huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_X25519_AES_256_GCM_NOPADDING
      );
      expect(2).assertEqual(
        huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING
      );
      expect(0).assertEqual(huks.HuksImportKeyType.HUKS_KEY_TYPE_PUBLIC_KEY);
      expect(1).assertEqual(huks.HuksImportKeyType.HUKS_KEY_TYPE_PRIVATE_KEY);
      expect(2).assertEqual(huks.HuksImportKeyType.HUKS_KEY_TYPE_KEY_PAIR);
      expect(1).assertEqual(
        huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FINGERPRINT
      );
      expect(2).assertEqual(huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FACE);
      expect(4).assertEqual(huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_PIN);
      expect(1).assertEqual(
        huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD
      );
      expect(2).assertEqual(
        huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL
      );
      expect(0).assertEqual(huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NORMAL);
      expect(1).assertEqual(huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_CUSTOM);
      expect(2).assertEqual(huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NONE);
      expect(0).assertEqual(huks.HuksChallengePosition.HUKS_CHALLENGE_POS_0);
      expect(1).assertEqual(huks.HuksChallengePosition.HUKS_CHALLENGE_POS_1);
      expect(2).assertEqual(huks.HuksChallengePosition.HUKS_CHALLENGE_POS_2);
      expect(3).assertEqual(huks.HuksChallengePosition.HUKS_CHALLENGE_POS_3);
      expect(1).assertEqual(
        huks.HuksSecureSignType.HUKS_SECURE_SIGN_WITH_AUTHINFO
      );
      expect(0).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_INVALID);
      expect(268435456).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_INT);
      expect(536870912).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT);
      expect(805306368).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_ULONG);
      expect(1073741824).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BOOL);
      expect(1342177280).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES);
      expect(0).assertEqual(huks.HuksTag.HUKS_TAG_INVALID);
      expect(536870913).assertEqual(huks.HuksTag.HUKS_TAG_ALGORITHM);
      expect(536870914).assertEqual(huks.HuksTag.HUKS_TAG_PURPOSE);
      expect(536870915).assertEqual(huks.HuksTag.HUKS_TAG_KEY_SIZE);
      expect(536870916).assertEqual(huks.HuksTag.HUKS_TAG_DIGEST);
      expect(536870917).assertEqual(huks.HuksTag.HUKS_TAG_PADDING);
      expect(536870918).assertEqual(huks.HuksTag.HUKS_TAG_BLOCK_MODE);
      expect(536870919).assertEqual(huks.HuksTag.HUKS_TAG_KEY_TYPE);
      expect(1342177288).assertEqual(huks.HuksTag.HUKS_TAG_ASSOCIATED_DATA);
      expect(1342177289).assertEqual(huks.HuksTag.HUKS_TAG_NONCE);
      expect(1342177290).assertEqual(huks.HuksTag.HUKS_TAG_IV);
      expect(1342177291).assertEqual(huks.HuksTag.HUKS_TAG_INFO);
      expect(1342177292).assertEqual(huks.HuksTag.HUKS_TAG_SALT);
      expect(1342177293).assertEqual(huks.HuksTag.HUKS_TAG_PWD);
      expect(536870926).assertEqual(huks.HuksTag.HUKS_TAG_ITERATION);
      expect(536870927).assertEqual(huks.HuksTag.HUKS_TAG_KEY_GENERATE_TYPE);
      expect(1342177296).assertEqual(huks.HuksTag.HUKS_TAG_DERIVE_MAIN_KEY);
      expect(1342177297).assertEqual(huks.HuksTag.HUKS_TAG_DERIVE_FACTOR);
      expect(536870930).assertEqual(huks.HuksTag.HUKS_TAG_DERIVE_ALG);
      expect(536870931).assertEqual(huks.HuksTag.HUKS_TAG_AGREE_ALG);
      expect(1073741844).assertEqual(
        huks.HuksTag.HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS
      );
      expect(1342177301).assertEqual(
        huks.HuksTag.HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS
      );
      expect(1342177302).assertEqual(huks.HuksTag.HUKS_TAG_AGREE_PUBLIC_KEY);
      expect(1342177303).assertEqual(huks.HuksTag.HUKS_TAG_KEY_ALIAS);
      expect(536870936).assertEqual(huks.HuksTag.HUKS_TAG_DERIVE_KEY_SIZE);
      expect(536870937).assertEqual(huks.HuksTag.HUKS_TAG_IMPORT_KEY_TYPE);
      expect(536870938).assertEqual(
        huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE
      );
      expect(805306569).assertEqual(huks.HuksTag.HUKS_TAG_ACTIVE_DATETIME);
      expect(805306570).assertEqual(
        huks.HuksTag.HUKS_TAG_ORIGINATION_EXPIRE_DATETIME
      );
      expect(805306571).assertEqual(
        huks.HuksTag.HUKS_TAG_USAGE_EXPIRE_DATETIME
      );
      expect(805306572).assertEqual(huks.HuksTag.HUKS_TAG_CREATION_DATETIME);
      expect(1073742125).assertEqual(huks.HuksTag.HUKS_TAG_ALL_USERS);
      expect(536871214).assertEqual(huks.HuksTag.HUKS_TAG_USER_ID);
      expect(1073742127).assertEqual(huks.HuksTag.HUKS_TAG_NO_AUTH_REQUIRED);
      expect(536871216).assertEqual(huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE);
      expect(536871217).assertEqual(huks.HuksTag.HUKS_TAG_AUTH_TIMEOUT);
      expect(1342177586).assertEqual(huks.HuksTag.HUKS_TAG_AUTH_TOKEN);
      expect(536871219).assertEqual(huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE);
      expect(536871220).assertEqual(huks.HuksTag.HUKS_TAG_KEY_SECURE_SIGN_TYPE);
      expect(536871221).assertEqual(huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE);
      expect(536871222).assertEqual(huks.HuksTag.HUKS_TAG_CHALLENGE_POS);
      expect(1342177781).assertEqual(
        huks.HuksTag.HUKS_TAG_ATTESTATION_CHALLENGE
      );
      expect(1342177782).assertEqual(
        huks.HuksTag.HUKS_TAG_ATTESTATION_APPLICATION_ID
      );
      expect(1342177783).assertEqual(
        huks.HuksTag.HUKS_TAG_ATTESTATION_ID_BRAND
      );
      expect(1342177784).assertEqual(
        huks.HuksTag.HUKS_TAG_ATTESTATION_ID_DEVICE
      );
      expect(1342177785).assertEqual(
        huks.HuksTag.HUKS_TAG_ATTESTATION_ID_PRODUCT
      );
      expect(1342177786).assertEqual(
        huks.HuksTag.HUKS_TAG_ATTESTATION_ID_SERIAL
      );
      expect(1342177787).assertEqual(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_IMEI);
      expect(1342177788).assertEqual(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_MEID);
      expect(1342177789).assertEqual(
        huks.HuksTag.HUKS_TAG_ATTESTATION_ID_MANUFACTURER
      );
      expect(1342177790).assertEqual(
        huks.HuksTag.HUKS_TAG_ATTESTATION_ID_MODEL
      );
      expect(1342177791).assertEqual(
        huks.HuksTag.HUKS_TAG_ATTESTATION_ID_ALIAS
      );
      expect(1342177792).assertEqual(
        huks.HuksTag.HUKS_TAG_ATTESTATION_ID_SOCID
      );
      expect(1342177793).assertEqual(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_UDID);
      expect(1342177794).assertEqual(
        huks.HuksTag.HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO
      );
      expect(1342177795).assertEqual(
        huks.HuksTag.HUKS_TAG_ATTESTATION_ID_VERSION_INFO
      );
      expect(1073742825).assertEqual(huks.HuksTag.HUKS_TAG_IS_KEY_ALIAS);
      expect(536871914).assertEqual(huks.HuksTag.HUKS_TAG_KEY_STORAGE_FLAG);
      expect(1073742827).assertEqual(huks.HuksTag.HUKS_TAG_IS_ALLOWED_WRAP);
      expect(536871916).assertEqual(huks.HuksTag.HUKS_TAG_KEY_WRAP_TYPE);
      expect(1342178285).assertEqual(huks.HuksTag.HUKS_TAG_KEY_AUTH_ID);
      expect(536871918).assertEqual(huks.HuksTag.HUKS_TAG_KEY_ROLE);
      expect(536871919).assertEqual(huks.HuksTag.HUKS_TAG_KEY_FLAG);
      expect(536871920).assertEqual(huks.HuksTag.HUKS_TAG_IS_ASYNCHRONIZED);
      expect(1073742833).assertEqual(huks.HuksTag.HUKS_TAG_SECURE_KEY_ALIAS);
      expect(1342178290).assertEqual(huks.HuksTag.HUKS_TAG_SECURE_KEY_UUID);
      expect(536871923).assertEqual(huks.HuksTag.HUKS_TAG_KEY_DOMAIN);
      expect(1342187281).assertEqual(huks.HuksTag.HUKS_TAG_PROCESS_NAME);
      expect(1342187282).assertEqual(huks.HuksTag.HUKS_TAG_PACKAGE_NAME);
      expect(536880915).assertEqual(huks.HuksTag.HUKS_TAG_ACCESS_TIME);
      expect(536880916).assertEqual(huks.HuksTag.HUKS_TAG_USES_TIME);
      expect(805316373).assertEqual(huks.HuksTag.HUKS_TAG_CRYPTO_CTX);
      expect(1342187286).assertEqual(huks.HuksTag.HUKS_TAG_KEY);
      expect(536880919).assertEqual(huks.HuksTag.HUKS_TAG_KEY_VERSION);
      expect(536880920).assertEqual(huks.HuksTag.HUKS_TAG_PAYLOAD_LEN);
      expect(1342187289).assertEqual(huks.HuksTag.HUKS_TAG_AE_TAG);
      expect(805316378).assertEqual(huks.HuksTag.HUKS_TAG_IS_KEY_HANDLE);
      expect(536881013).assertEqual(huks.HuksTag.HUKS_TAG_OS_VERSION);
      expect(536881014).assertEqual(huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL);
      expect(1342197281).assertEqual(huks.HuksTag.HUKS_TAG_SYMMETRIC_KEY_DATA);
      expect(1342197282).assertEqual(
        huks.HuksTag.HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA
      );
      expect(1342197283).assertEqual(
        huks.HuksTag.HUKS_TAG_ASYMMETRIC_PRIVATE_KEY_DATA
      );
      expect(0).assertEqual(huks.HuksKeyStorageType.HUKS_STORAGE_TEMP);
      expect(1).assertEqual(huks.HuksKeyStorageType.HUKS_STORAGE_PERSISTENT);

      expect(201).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_PERMISSION_FAIL);
      expect(401).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      expect(801).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_NOT_SUPPORTED_API);
      expect(12000001).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED);
      expect(12000002).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT);
      expect(12000003).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      expect(12000004).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_FILE_OPERATION_FAIL);
      expect(12000005).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_COMMUNICATION_FAIL);
      expect(12000006).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CRYPTO_FAIL);
      expect(12000007).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_PERMANENTLY_INVALIDATED);
      expect(12000008).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED);
      expect(12000009).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_TIME_OUT);
      expect(12000010).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_SESSION_LIMIT);
      expect(12000011).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
      expect(12000012).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_EXTERNAL_ERROR);
      expect(12000013).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST);
      expect(12000014).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INSUFFICIENT_MEMORY);
      expect(12000015).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CALL_SERVICE_FAILED);

      expect(2).assertEqual(huks.HuksKeyStorageType.HUKS_STORAGE_ONLY_USED_IN_HUKS);
      expect(3).assertEqual(huks.HuksKeyStorageType.HUKS_STORAGE_KEY_EXPORT_ALLOWED);
      expect(0).assertEqual(huks.HuksRsaPssSaltLenType.HUKS_RSA_PSS_SALT_LEN_DIGEST);
      expect(1).assertEqual(huks.HuksRsaPssSaltLenType.HUKS_RSA_PSS_SALT_LEN_MAX);

      expect(536870941).assertEqual(huks.HuksTag.HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG);
      expect(536870942).assertEqual(huks.HuksTag.HUKS_TAG_RSA_PSS_SALT_LEN_TYPE);
      expect(536871223).assertEqual(huks.HuksTag.HUKS_TAG_KEY_AUTH_PURPOSE);

      done();
    });
  });
}
