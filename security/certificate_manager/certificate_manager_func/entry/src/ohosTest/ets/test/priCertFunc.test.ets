/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import certManager from '@ohos.security.certManager';
import crypt from '@ohos.security.cryptoFramework';
import * as commonParameter from './utils/common/common_parameter';
import * as commonFunction from './utils/common/common_function';
import * as signVerifyCallback from './utils/signAndVerify/signVerifyCallback';
import * as signVerifyPromise from './utils/signAndVerify/signVerifyPromise';
import { BusinessError } from '@ohos.base';

export default function certManagerPriCertJsAPIFunctionTestUnit() {
  describe('certManagerPriCertJsAPIFunctionTestUnit', () => {
    let global_cmResult: certManager.CMResult | undefined;
    let isOpenHarmonyDevice: Boolean;
    let gAppKeyUri1: string = "";
    let gAppKeyUri2: string = "";
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      try {
        isOpenHarmonyDevice = commonFunction.isOpenHarmonyDevice();
        console.warn(`isOpenHarmonyDevice is: ${isOpenHarmonyDevice}`);
        await commonFunction.installPrivateCertificates();
        global_cmResult = await certManager.getAllAppPrivateCertificates();
      } catch (err) {
        console.error(`beforeAll get error1 is: ${err}`);
      }
      if (global_cmResult != undefined && global_cmResult.credentialList != undefined) {
        for (let i = 0; i < global_cmResult.credentialList.length; i++) {
          if (global_cmResult.credentialList[i].keyUri.includes("testPriCredential001")) {
            gAppKeyUri1 = global_cmResult.credentialList[i].keyUri;
          }
          if (global_cmResult.credentialList[i].keyUri.includes("testPriCredential002")) {
            gAppKeyUri2 = global_cmResult.credentialList[i].keyUri;
          }
        }
      }

      if (global_cmResult != undefined && global_cmResult.certInfo != undefined) {
        try {
          console.warn(`${global_cmResult.certInfo.uri}`);
          console.warn(`${global_cmResult.certInfo.certAlias}`);
          console.warn(`${global_cmResult.certInfo.state}`);
          console.warn(`${global_cmResult.certInfo.issuerName}`);
          console.warn(`${global_cmResult.certInfo.subjectName}`);
          console.warn(`${global_cmResult.certInfo.serial}`);
          console.warn(`${global_cmResult.certInfo.notBefore}`);
          console.warn(`${global_cmResult.certInfo.notAfter}`);
          console.warn(`${global_cmResult.certInfo.fingerprintSha256}`);
          console.warn(`${global_cmResult.certInfo.cert}`);
          console.warn(`${global_cmResult.appUidList}`);
          console.warn(`${global_cmResult.uri}`);
          console.warn(`${global_cmResult.outData}`);
        } catch (err) {
          console.error(`beforeAll get error2 is ${err}`);
          console.warn("beforeAll waiting for opensource interface！");
        }
      }
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(async () => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
      try {
        let cmResult: certManager.CMResult = await certManager.getAllAppPrivateCertificates();
        if (cmResult != undefined && cmResult.credentialList != undefined) {
          for (let i = 0; i < cmResult.credentialList.length; i++) {
            await certManager.uninstallPrivateCertificate(cmResult.credentialList[i].keyUri);
          }
        }
      } catch (err) {
        console.error(`afterAll get error is: ${err}`);
      }
    })

    /**
     * @tc.number Security_CertManager_PriCertJsApi_Func_0100
     * @tc.name test enumerated value
     * @tc.desc test enumerated value
     * @tc.size SmallTest
     * @tc.level Level0
     * @tc.type Function
     */
    it('Security_CertManager_PriCertJsApi_Func_0100', 0, (done: Function) => {
      expect(certManager.CMErrorCode.CM_ERROR_NO_PERMISSION).assertEqual(201);
      expect(certManager.CMErrorCode.CM_ERROR_NOT_SYSTEM_APP).assertEqual(202);
      expect(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS).assertEqual(401);
      expect(certManager.CMErrorCode.CM_ERROR_GENERIC).assertEqual(17500001);
      expect(certManager.CMErrorCode.CM_ERROR_NO_FOUND).assertEqual(17500002);
      expect(certManager.CMErrorCode.CM_ERROR_INCORRECT_FORMAT).assertEqual(17500003);
      expect(certManager.CMErrorCode.CM_ERROR_MAX_CERT_COUNT_REACHED).assertEqual(17500004);
      expect(certManager.CMErrorCode.CM_ERROR_NO_AUTHORIZATION).assertEqual(17500005);
      expect(certManager.CMErrorCode.CM_ERROR_DEVICE_ENTER_ADVSECMODE).assertEqual(17500007);
      expect(certManager.CmKeyPadding.CM_PADDING_NONE).assertEqual(0);
      expect(certManager.CmKeyPadding.CM_PADDING_PSS).assertEqual(1);
      expect(certManager.CmKeyPadding.CM_PADDING_PKCS1_V1_5).assertEqual(2);
      expect(certManager.CmKeyDigest.CM_DIGEST_NONE).assertEqual(0);
      expect(certManager.CmKeyDigest.CM_DIGEST_MD5).assertEqual(1);
      expect(certManager.CmKeyDigest.CM_DIGEST_SHA1).assertEqual(2);
      expect(certManager.CmKeyDigest.CM_DIGEST_SHA224).assertEqual(3);
      expect(certManager.CmKeyDigest.CM_DIGEST_SHA256).assertEqual(4);
      expect(certManager.CmKeyDigest.CM_DIGEST_SHA384).assertEqual(5);
      expect(certManager.CmKeyDigest.CM_DIGEST_SHA512).assertEqual(6);
      expect(certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN).assertEqual(4);
      expect(certManager.CmKeyPurpose.CM_KEY_PURPOSE_VERIFY).assertEqual(8);
      expect(certManager.AuthStorageLevel.EL1).assertEqual(1);
      expect(certManager.AuthStorageLevel.EL2).assertEqual(2);
      expect(certManager.AuthStorageLevel.EL4).assertEqual(4);
      done();
    });

    /**
     * @tc.number Security_CertManager_PriCertJsApi_Func_0200
     * @tc.name test installPrivateCertificate and uninstallPrivateCertificate with normal parameters one
     * @tc.desc use promise type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it('Security_CertManager_PriCertJsApi_Func_0200', 0, async (done: Function) => {
      let keystore: Uint8Array = commonParameter.priRsaCredData;
      let keystorePwd: string = '123456';
      let certAlias: string = 'appCertAliasDemoRsa';
      let keyUri: string | undefined;
      await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias).then((cmResult: certManager.CMResult) => {
        expect(cmResult != null).assertTrue();
        console.warn("[Promise] cmResult.uri: " + cmResult.uri);
        console.warn("[Promise] cmResult.certList: " + cmResult.certList);
        console.warn("[Promise] cmResult.certInfo: " + cmResult.certInfo);
        console.warn("[Promise] cmResult.credentialList: " + cmResult.credentialList);
        console.warn("[Promise] cmResult.credential: " + cmResult.credential);
        console.warn("[Promise] cmResult.appUidList: " + cmResult.appUidList);
        console.warn("[Promise] cmResult.outData: " + cmResult.outData);
        keyUri = cmResult.uri;
      }).catch((err: BusinessError) => {
        console.error("[Promise] installPrivateCertificate err: " + err.code);
        expect(null).assertFail();
      });
      if (keyUri != undefined) {
        await certManager.uninstallPrivateCertificate(keyUri);
      } else {
        console.error("Security_CertManager_PriCertJsApi_Func_0200 keyUri is undefined!");
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CertManager_PriCertJsApi_Func_0300
     * @tc.name test installPrivateCertificate and uninstallPrivateCertificate with normal parameters two
     * @tc.desc use asyncCallback type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it('Security_CertManager_PriCertJsApi_Func_0300', 0, async (done: Function) => {
      let keystore: Uint8Array = commonParameter.priEccCredData;
      let keystorePwd: string = '123456';
      let certAlias: string = 'appCertAliasDemoEcc';
      let cmResult: certManager.CMResult | undefined;
      let cmUri: string | undefined;
      try {
        cmResult = await new Promise<certManager.CMResult>((resolve, reject) => {
          certManager.installPrivateCertificate(keystore, keystorePwd, certAlias, (err: Error, cmResult: certManager.CMResult) => {
            if (err) {
              reject(err);
            } else {
              resolve(cmResult);
            }
          });
        });
        expect(cmResult != undefined).assertTrue();
      } catch (err) {
        console.error("Security_CertManager_PriCertJsApi_Func_0300 get err1: " + err.code);
        expect(null).assertFail();
      }
      if (cmResult != undefined) {
        cmUri = cmResult.uri;
      }
      try {
        await new Promise<void>((resolve, reject) => {
          certManager.uninstallPrivateCertificate(cmUri, (err: Error,) => {
            if (err) {
              reject(err);
            } else {
              resolve();
            }
          });
        });
      } catch (err) {
        console.error("Security_CertManager_PriCertJsApi_Func_0300 get err2: " + err.code);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CertManager_PriCertJsApi_Func_0400
     * @tc.name test getPrivateCertificate with normal parameters one
     * @tc.desc use promise type
     * @tc.size SmallTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('Security_CertManager_PriCertJsApi_Func_0400', 0, async (done: Function) => {
      await certManager.getPrivateCertificate(gAppKeyUri1).then((CMResult: certManager.CMResult) => {
        expect(CMResult.credential != null && CMResult.credential != undefined).assertTrue();
        if (CMResult != undefined && CMResult.credential != undefined) {
          console.warn("[Promise] type: " + CMResult.credential.type);
          console.warn("[Promise] alias: " + CMResult.credential.alias);
          console.warn("[Promise] keyUri: " + CMResult.credential.keyUri);
          console.warn("[Promise] certNum: " + CMResult.credential.certNum);
          console.warn("[Promise] keyNum: " + CMResult.credential.keyNum);
          console.warn("[Promise] credData: " + CMResult.credential.credentialData);
        }
      }).catch((err: BusinessError) => {
        console.error("Security_CertManager_PriCertJsApi_Func_0400 getPrivateCertificate err: " + err.code);
        expect(null).assertFail();
      });
      done();
    });

    /**
     * @tc.number Security_CertManager_PriCertJsApi_Func_0500
     * @tc.name test getPrivateCertificate with normal parameters two
     * @tc.desc use asyncCallback type
     * @tc.size SmallTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('Security_CertManager_PriCertJsApi_Func_0500', 0, async (done: Function) => {
      let cmResult2: certManager.CMResult;
      console.error(`gAppKeyUri2 is: ${gAppKeyUri2}`);
      try {
        cmResult2 = await new Promise<certManager.CMResult>((resolve, reject) => {
          certManager.getPrivateCertificate(gAppKeyUri2, (err: Error, CMResult: certManager.CMResult) => {
            if (err) {
              reject(err);
            } else {
              resolve(CMResult);
            }
          });
        });
        expect(cmResult2.credential != undefined && cmResult2.credential != null).assertTrue();
        if (cmResult2.certList != undefined) {
          for (let i = 0; i < cmResult2.certList.length; i++) {
            console.warn(`[Callback] cmResult2.certList[${i}] uri: ${cmResult2.certList[i].uri} `);
            console.warn(`[Callback] cmResult2.certList[${i}] certAlias: ${cmResult2.certList[i].certAlias} `);
            console.warn(`[Callback] cmResult2.certList[${i}] state: ${cmResult2.certList[i].state} `);
            console.warn(`[Callback] cmResult2.certList[${i}] subjectName: ${cmResult2.certList[i].subjectName} `);
          }
        }
      } catch (err) {
        console.error("Security_CertManager_PriCertJsApi_Func_0500 getPrivateCertificate err: " + err.code);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CertManager_PriCertJsApi_Func_0600
     * @tc.name test init->update->finish interface with normal parameters one
     * @tc.desc use asyncCallback type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it('Security_CertManager_PriCertJsApi_Func_0600', 0, async (done: Function) => {
      let keyStore: Uint8Array = commonParameter.priRsaCredData;
      let signSpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN
      };
      let verifySpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_VERIFY
      };
      await signVerifyCallback.signVerifyNormalProcess(gAppKeyUri1, keyStore, signSpec, verifySpec).then(result => {
        expect(result.outData == null).assertTrue();
      }).catch((err: BusinessError) => {
        console.error("Security_CertManager_PriCertJsApi_Func_0600 get err: " + err);
        expect(null).assertFail();
      });
      done();
    });

    /**
     * @tc.number Security_CertManager_PriCertJsApi_Func_0700
     * @tc.name test init->update->finish interface with normal parameters two
     * @tc.desc use promise type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it('Security_CertManager_PriCertJsApi_Func_0700', 0, async (done: Function) => {
      let keyStore: Uint8Array = commonParameter.priEccCredData;
      let signSpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN
      };
      let verifySpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_VERIFY
      };
      await signVerifyPromise.signVerifyNormalProcess(gAppKeyUri2, keyStore, signSpec, verifySpec).then(result => {
        expect(result.outData == null).assertTrue();
      }).catch((err: BusinessError) => {
        console.error("Security_CertManager_PriCertJsApi_Func_0700 get err: " + err);
        expect(null).assertFail();
      });
      done();
    });

    /**
     * @tc.number Security_CertManager_PriCertJsApi_Func_0800
     * @tc.name test abort interface with normal parameters one
     * @tc.desc use promise type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it('Security_CertManager_PriCertJsApi_Func_0800', 0, async (done: Function) => {
      let keyStore: Uint8Array = commonParameter.priEccCredData;
      try {
        await signVerifyPromise.signAbortProcess(gAppKeyUri2, keyStore, "after_init");
        await signVerifyPromise.signAbortProcess(gAppKeyUri2, keyStore, "after_update");
        await signVerifyPromise.signAbortProcess(gAppKeyUri2, keyStore, "after_finish");
      } catch (err) {
        console.error("Security_CertManager_PriCertJsApi_Func_0800 get err: " + err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CertManager_PriCertJsApi_Func_0900
     * @tc.name test abort interface with normal parameters two
     * @tc.desc use asyncCallback type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it('Security_CertManager_PriCertJsApi_Func_0900', 0, async (done: Function) => {
      let keyStore: Uint8Array = commonParameter.priRsaCredData;
      try {
        await signVerifyCallback.signAbortProcess(gAppKeyUri1, keyStore, "after_init");
        await signVerifyCallback.signAbortProcess(gAppKeyUri1, keyStore, "after_update");
        await signVerifyCallback.signAbortProcess(gAppKeyUri1, keyStore, "after_finish");
      } catch (err) {
        console.error("Security_CertManager_PriCertJsApi_Func_0900 get err: " + err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CertManager_PriCertJsApi_Func_1000
     * @tc.name test abort interface with normal parameters three
     * @tc.desc use promise type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it('Security_CertManager_PriCertJsApi_Func_1000', 0, async (done: Function) => {
      let keyStore: Uint8Array = commonParameter.priEccCredData;
      try {
        await signVerifyPromise.verifyAbortProcess(gAppKeyUri2, keyStore, "after_verify_init");
        await signVerifyPromise.verifyAbortProcess(gAppKeyUri2, keyStore, "after_verify_update");
        await signVerifyPromise.verifyAbortProcess(gAppKeyUri2, keyStore, "after_verify_finish");
      } catch (err) {
        console.error("Security_CertManager_PriCertJsApi_Func_1000 get err: " + err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CertManager_PriCertJsApi_Func_1100
     * @tc.name test abort interface with normal parameters four
     * @tc.desc use asyncCallback type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it('Security_CertManager_PriCertJsApi_Func_1100', 0, async (done: Function) => {
      let keyStore: Uint8Array = commonParameter.priRsaCredData;
      try {
        await signVerifyCallback.verifyAbortProcess(gAppKeyUri1, keyStore, "after_verify_init");
        await signVerifyCallback.verifyAbortProcess(gAppKeyUri1, keyStore, "after_verify_update");
        await signVerifyCallback.verifyAbortProcess(gAppKeyUri1, keyStore, "after_verify_finish");
      } catch (err) {
        console.error("Security_CertManager_PriCertJsApi_Func_1100 get err: " + err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CertManager_PriCertJsApi_Func_1200
     * @tc.name test max length of privateCredential list
     * @tc.desc test max length of privateCredential list
     * @tc.size SmallTest
     * @tc.level Level4
     * @tc.type Function
     */
    it('Security_CertManager_PriCertJsApi_Func_1200', 0, async (done: Function) => {
      try {
        for (let i = 2; i < 257; i++) {
          let alias_temp: string = "privateCredential" + i.toString();
          await certManager.installPrivateCertificate(commonParameter.priEccCredData, '123456', alias_temp);
        }
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(17500004);
      }
      done();
    });

    /**
     * @tc.number Security_CertManager_PriCertJsApi_Func_1300
     * @tc.name test getAllAppPrivateCertificates interface with normal parameters one
     * @tc.desc use promise type
     * @tc.size SmallTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('Security_CertManager_PriCertJsApi_Func_1300', 0, async (done: Function) => {
      try {
        let cmResult: certManager.CMResult = await certManager.getAllAppPrivateCertificates();
        if (cmResult.credentialList != undefined) {
          expect(cmResult.credentialList.length).assertLessOrEqual(256);
          for (let i = 0; i < cmResult.credentialList.length; i++) {
            console.warn(`CMResult.credentialList[${i}].type is: ${cmResult.credentialList[i].type}`);
            console.warn(`CMResult.credentialList[${i}].alias is: ${cmResult.credentialList[i].alias}`);
            console.warn(`CMResult.credentialList[${i}].keyUri is: ${cmResult.credentialList[i].keyUri}`);
          }
        } else {
          console.error("Security_CertManager_PriCertJsApi_Func_1300 cmResult.credentialList is undefined!");
          expect(null).assertFail();
        }
      } catch (err) {
        console.error("Security_CertManager_PriCertJsApi_Func_1300 get err: " + err.code);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CertManager_PriCertJsApi_Func_1400
     * @tc.name test getAllAppPrivateCertificates interface with normal parameters two
     * @tc.desc use asyncCallback type
     * @tc.size SmallTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('Security_CertManager_PriCertJsApi_Func_1400', 0, async (done: Function) => {
      try {
        let cmResult: certManager.CMResult = await new Promise<certManager.CMResult>((resolve, reject) => {
          certManager.getAllAppPrivateCertificates((err: BusinessError, cmResult: certManager.CMResult) => {
            if (err) {
              console.error("[Callback]getAllAppPrivateCertificates err: " + err.code);
              reject(err);
            } else {
              resolve(cmResult);
            }
          });
        });
        if (cmResult != undefined && cmResult.credentialList != undefined) {
          expect(cmResult.credentialList.length).assertLessOrEqual(256);
          for (let i = 0; i < cmResult.credentialList.length; i++) {
            console.warn(`CMResult.credentialList[${i}].type is: ${cmResult.credentialList[i].type}`);
            console.warn(`CMResult.credentialList[${i}].alias is: ${cmResult.credentialList[i].alias}`);
            console.warn(`CMResult.credentialList[${i}].keyUri is: ${cmResult.credentialList[i].keyUri}`);
          }
        } else {
          console.error("Security_CertManager_PriCertJsApi_Func_1400 cmResult is undefined " +
            "or cmResult.credentialList is undefined!");
          expect(null).assertFail();
        }
      } catch (err) {
        console.error("Security_CertManager_PriCertJsApi_Func_1400 get err: " + err.code);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CertManager_PriCertJsApi_Func_1500
     * @tc.name test init->update->finish interface with padding and digest one
     * @tc.desc use asyncCallback type
     * @tc.size SmallTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('Security_CertManager_PriCertJsApi_Func_1500', 0, async (done: Function) => {
      let keyStore: Uint8Array = commonParameter.priRsaCredData;
      let input_digest: number;
      if (isOpenHarmonyDevice == true) {
        input_digest = certManager.CmKeyDigest.CM_DIGEST_MD5
      } else {
        input_digest = certManager.CmKeyDigest.CM_DIGEST_SHA256
      }
      let signSpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN,
        padding: certManager.CmKeyPadding.CM_PADDING_PSS,
        digest: input_digest
      };
      let verifySpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_VERIFY,
        padding: certManager.CmKeyPadding.CM_PADDING_PSS,
        digest: input_digest
      };
      await signVerifyCallback.signVerifyNormalProcess(gAppKeyUri1, keyStore, signSpec, verifySpec).then(result => {
        expect(result.outData == null).assertTrue();
      }).catch((err: BusinessError) => {
        console.error("Security_CertManager_PriCertJsApi_Func_1500 get err: " + err.code);
        expect(null).assertFail();
      });
      done();
    });

    /**
     * @tc.number Security_CertManager_PriCertJsApi_Func_1600
     * @tc.name test init->update->finish interface with padding and digest two
     * @tc.desc use promise type
     * @tc.size SmallTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('Security_CertManager_PriCertJsApi_Func_1600', 0, async (done: Function) => {
      let keyStore: Uint8Array = commonParameter.priEccCredData;
      let input_digest: number;
      if (isOpenHarmonyDevice == true) {
        input_digest = certManager.CmKeyDigest.CM_DIGEST_SHA1
      } else {
        input_digest = certManager.CmKeyDigest.CM_DIGEST_SHA256
      }
      let signSpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN,
        digest: input_digest
      };
      let verifySpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_VERIFY,
        digest: input_digest
      };
      await signVerifyPromise.signVerifyNormalProcess(gAppKeyUri2, keyStore, signSpec, verifySpec).then(result => {
        expect(result.outData == null).assertTrue();
      }).catch((err: BusinessError) => {
        console.error("Security_CertManager_PriCertJsApi_Func_1600 get err: " + err.code);
        expect(null).assertFail();
      });
      done();
    });

    /**
     * @tc.number Security_CertManager_PriCertJsApi_Func_1700
     * @tc.name test init->update->finish interface with padding and digest three
     * @tc.desc use asyncCallback type
     * @tc.size SmallTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('Security_CertManager_PriCertJsApi_Func_1700', 0, async (done: Function) => {
      let keyStore: Uint8Array = commonParameter.priRsaCredData;
      let input_digest: number;
      if (isOpenHarmonyDevice == true) {
        input_digest = certManager.CmKeyDigest.CM_DIGEST_SHA1
      } else {
        input_digest = certManager.CmKeyDigest.CM_DIGEST_SHA384
      }
      let signSpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN,
        padding: certManager.CmKeyPadding.CM_PADDING_PKCS1_V1_5,
        digest: input_digest
      };
      let verifySpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_VERIFY,
        padding: certManager.CmKeyPadding.CM_PADDING_PKCS1_V1_5,
        digest: input_digest
      };
      await signVerifyCallback.signVerifyNormalProcess(gAppKeyUri1, keyStore, signSpec, verifySpec).then(result => {
        expect(result.outData == null).assertTrue();
      }).catch((err: BusinessError) => {
        console.error("Security_CertManager_PriCertJsApi_Func_1700 get err: " + err.code);
        expect(null).assertFail();
      });
      done();
    });

    /**
     * @tc.number Security_CertManager_PriCertJsApi_Func_1800
     * @tc.name test init->update->finish interface with padding and digest four
     * @tc.desc use promise type
     * @tc.size SmallTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('Security_CertManager_PriCertJsApi_Func_1800', 0, async (done: Function) => {
      let keyStore: Uint8Array = commonParameter.priEccCredData;
      let input_digest: number;
      if (isOpenHarmonyDevice == true) {
        input_digest = certManager.CmKeyDigest.CM_DIGEST_SHA224
      } else {
        input_digest = certManager.CmKeyDigest.CM_DIGEST_SHA384
      }
      let signSpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN,
        digest: input_digest
      };
      let verifySpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_VERIFY,
        digest: input_digest
      };
      await signVerifyPromise.signVerifyNormalProcess(gAppKeyUri2, keyStore, signSpec, verifySpec).then(result => {
        expect(result.outData == null).assertTrue();
      }).catch((err: BusinessError) => {
        console.error("Security_CertManager_PriCertJsApi_Func_1800 get err: " + err.code);
        expect(null).assertFail();
      });
      done();
    });


    /**
     * @tc.number Security_CertManager_PriCertJsApi_Func_1900
     * @tc.name test init->update->finish interface with padding and digest five
     * @tc.desc use asyncCallback type
     * @tc.size SmallTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('Security_CertManager_PriCertJsApi_Func_1900', 0, async (done: Function) => {
      let keyStore: Uint8Array = commonParameter.priRsaCredData;
      let input_digest: number;
      if (isOpenHarmonyDevice == true) {
        input_digest = certManager.CmKeyDigest.CM_DIGEST_SHA224
      } else {
        input_digest = certManager.CmKeyDigest.CM_DIGEST_SHA512
      }
      let signSpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN,
        padding: certManager.CmKeyPadding.CM_PADDING_PKCS1_V1_5,
        digest: input_digest
      };
      let verifySpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_VERIFY,
        padding: certManager.CmKeyPadding.CM_PADDING_PKCS1_V1_5,
        digest: input_digest
      };
      await signVerifyCallback.signVerifyNormalProcess(gAppKeyUri1, keyStore, signSpec, verifySpec).then(result => {
        expect(result.outData == null).assertTrue();
      }).catch((err: BusinessError) => {
        console.error("Security_CertManager_PriCertJsApi_Func_1900 get err: " + err.code);
        expect(null).assertFail();
      });
      done();
    });

    /**
     * @tc.number Security_CertManager_PriCertJsApi_Func_2000
     * @tc.name test init->update->finish interface with padding and digest six
     * @tc.desc use promise type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it('Security_CertManager_PriCertJsApi_Func_2000', 0, async (done: Function) => {
      let keyStore: Uint8Array = commonParameter.priEccCredData;
      let signSpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN,
        padding: certManager.CmKeyPadding.CM_PADDING_NONE,
        digest: certManager.CmKeyDigest.CM_DIGEST_SHA512
      };
      let verifySpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_VERIFY,
        padding: certManager.CmKeyPadding.CM_PADDING_NONE,
        digest: certManager.CmKeyDigest.CM_DIGEST_SHA512
      };
      await signVerifyPromise.signVerifyNormalProcess(gAppKeyUri2, keyStore, signSpec, verifySpec).then(result => {
        expect(result.outData == null).assertTrue();
      }).catch((err: BusinessError) => {
        console.error("Security_CertManager_PriCertJsApi_Func_2000 get err: " + err.code);
        expect(null).assertFail();
      });
      done();
    });

    /**
     * @tc.number Security_CertManager_PriCertJsApi_Func_2100
     * @tc.name test init->update->finish interface with padding and digest seven
     * @tc.desc use promise type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it('Security_CertManager_PriCertJsApi_Func_2100', 0, async (done: Function) => {
      let keyStore: crypt.DataBlob;
      let srckeyStore: Uint8Array = commonParameter.priEccCredData;
      let signSpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN,
        digest: certManager.CmKeyDigest.CM_DIGEST_NONE
      };
      let verifySpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_VERIFY,
        digest: certManager.CmKeyDigest.CM_DIGEST_NONE
      };
      try {
        let MdObj: crypt.Md = crypt.createMd("SHA512");
        await MdObj.update({
          data: srckeyStore
        });
        keyStore = await MdObj.digest();
        if (keyStore != undefined && keyStore.data != undefined) {
          console.warn(`Security_CertManager_PriCertJsApi_Func_2100 keyStore data is: ${keyStore.data}}`);
          let result: certManager.CMResult = await signVerifyPromise.signVerifyNormalProcess(gAppKeyUri2, keyStore.data,
            signSpec, verifySpec);
          expect(result.outData == null).assertTrue();
        } else {
          console.error("Security_CertManager_PriCertJsApi_Func_2100 keyStore is undefined " +
            "or keyStore.data is undefined!");
          expect(null).assertFail();
        }
      } catch (err) {
        console.error("Security_CertManager_PriCertJsApi_Func_2100 get err: " + err);
        expect(null).assertFail();
      }
      done();
    });
  })
}
