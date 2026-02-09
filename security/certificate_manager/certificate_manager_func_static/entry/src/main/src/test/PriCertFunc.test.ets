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

import certManager from '@ohos.security.certManager';
import crypt from '@ohos.security.cryptoFramework';
import { priEccCredData, priRsaCredData } from './utils/common/common_parameter';
import { installPrivateCertificates, isOpenHarmonyDevice } from './utils/common/common_function';
import signVerifyCallback from './utils/signAndVerify/signVerifyCallback';
import signVerifyPromise from './utils/signAndVerify/signVerifyPromise';
import type { BusinessError } from '@ohos.base';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import Utils from './Util.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function certManagerPriCertJsAPIFunctionTestUnit() {
  describe('certManagerPriCertJsAPIFunctionTestUnit', (): void => {
    let global_cmResult: certManager.CMResult | undefined;
    let isOpenHarmonyDeviceTag: Boolean;
    let gAppKeyUri1: string = "";
    let gAppKeyUri2: string = "";
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      try {
        isOpenHarmonyDeviceTag = isOpenHarmonyDevice();
        hilog.info(domain, tag, '%{public}s', `isOpenHarmonyDevice is: ${isOpenHarmonyDeviceTag}`);
        await installPrivateCertificates();
        global_cmResult = await certManager.getAllAppPrivateCertificates();
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', `beforeAll get error1 is: ${err}`);
      }
      let global_cmResult1 = global_cmResult ?? {} as certManager.CMResult;
      if (global_cmResult1 != undefined && global_cmResult1.credentialList != undefined) {
        let credentialList = global_cmResult1.credentialList ?? [] as Array<certManager.CredentialAbstract>;
        for (let i = 0; i < credentialList.length; i++) {
          if (credentialList[i].keyUri.includes("testPriCredential001")) {
            gAppKeyUri1 = credentialList[i].keyUri;
          }
          if (credentialList[i].keyUri.includes("testPriCredential002")) {
            gAppKeyUri2 = credentialList[i].keyUri;
          }
        }
      }

      if (global_cmResult1 != undefined && global_cmResult1.certInfo != undefined) {
        let certInfo = global_cmResult1.certInfo ?? {
          uri: '',
          certAlias: '',
          state: false,
          issuerName: '',
          subjectName: '',
          serial: '',
          notBefore: '',
          notAfter: '',
          fingerprintSha256: '',
          cert: new Uint8Array(),
        } as certManager.CertInfo;
        try {
          hilog.info(domain, tag, '%{public}s', `${certInfo.uri}`);
          hilog.info(domain, tag, '%{public}s', `${certInfo.certAlias}`);
          hilog.info(domain, tag, '%{public}s', `${certInfo.state}`);
          hilog.info(domain, tag, '%{public}s', `${certInfo.issuerName}`);
          hilog.info(domain, tag, '%{public}s', `${certInfo.subjectName}`);
          hilog.info(domain, tag, '%{public}s', `${certInfo.serial}`);
          hilog.info(domain, tag, '%{public}s', `${certInfo.notBefore}`);
          hilog.info(domain, tag, '%{public}s', `${certInfo.notAfter}`);
          hilog.info(domain, tag, '%{public}s', `${certInfo.fingerprintSha256}`);
          hilog.info(domain, tag, '%{public}s', `${certInfo.cert}`);
          hilog.info(domain, tag, '%{public}s', `${global_cmResult1.appUidList}`);
          hilog.info(domain, tag, '%{public}s', `${global_cmResult1.uri}`);
          hilog.info(domain, tag, '%{public}s', `${global_cmResult1.outData}`);
        } catch (err) {
          err = err as BusinessError;
          hilog.error(domain, tag, '%{public}s', `beforeAll get error2 is ${err}`);
          hilog.info(domain, tag, '%{public}s', "beforeAll waiting for opensource interface！");
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
        let cmResult1 = cmResult ?? {} as certManager.CMResult;
        if (cmResult1 != undefined && cmResult1.credentialList != undefined) {
          let credentialList = cmResult1.credentialList ?? [] as Array<certManager.CredentialAbstract>;
          for (let i = 0; i < credentialList.length; i++) {
            await certManager.uninstallPrivateCertificate(credentialList[i].keyUri);
          }
        }
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', `afterAll get error is: ${err}`);
      }
    })

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_Func_Static_0100
     * @tc.number Security_CertManager_PriCertJsApi_Func_Static_0100
     * @tc.desc   test enumerated value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Security_CertManager_PriCertJsApi_Func_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(certManager.CMErrorCode.CM_ERROR_NO_PERMISSION).assertEqual(201);
      expect(certManager.CMErrorCode.CM_ERROR_NOT_SYSTEM_APP).assertEqual(202);
      expect(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS).assertEqual(401);
      expect(certManager.CMErrorCode.CM_ERROR_GENERIC).assertEqual(17500001);
      expect(certManager.CMErrorCode.CM_ERROR_NO_FOUND).assertEqual(17500002);
      expect(certManager.CMErrorCode.CM_ERROR_INCORRECT_FORMAT).assertEqual(17500003);
      expect(certManager.CMErrorCode.CM_ERROR_MAX_CERT_COUNT_REACHED).assertEqual(17500004);
      expect(certManager.CMErrorCode.CM_ERROR_NO_AUTHORIZATION).assertEqual(17500005);
      expect(certManager.CMErrorCode.CM_ERROR_DEVICE_ENTER_ADVSECMODE).assertEqual(17500007);
      expect(certManager.CMErrorCode.CM_ERROR_STORE_PATH_NOT_SUPPORTED).assertEqual(17500009);
      expect(certManager.CMErrorCode.CM_ERROR_ACCESS_UKEY_SERVICE_FAILED).assertEqual(17500010);
      expect(certManager.CMErrorCode.CM_ERROR_PARAMETER_VALIDATION_FAILED).assertEqual(17500011);
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
      expect(certManager.CertificatePurpose.PURPOSE_DEFAULT).assertEqual(0);
      expect(certManager.CertificatePurpose.PURPOSE_ALL).assertEqual(1);
      expect(certManager.CertificatePurpose.PURPOSE_SIGN).assertEqual(2);
      expect(certManager.CertificatePurpose.PURPOSE_ENCRYPT).assertEqual(3);
      done();
    });

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_Func_Static_0200
     * @tc.number Security_CertManager_PriCertJsApi_Func_Static_0200
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Security_CertManager_PriCertJsApi_Func_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let keystore: Uint8Array = priRsaCredData;
      let keystorePwd: string = '123456';
      let certAlias: string = 'appCertAliasDemoRsa';
      let keyUri: string | undefined;
      await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias).then((cmResult: certManager.CMResult) => {
        expect(cmResult != null).assertTrue();
        hilog.info(domain, tag, '%{public}s', "[Promise] cmResult.uri: " + cmResult.uri);
        hilog.info(domain, tag, '%{public}s', "[Promise] cmResult.certList: " + cmResult.certList);
        hilog.info(domain, tag, '%{public}s', "[Promise] cmResult.certInfo: " + cmResult.certInfo);
        hilog.info(domain, tag, '%{public}s', "[Promise] cmResult.credentialList: " + cmResult.credentialList);
        hilog.info(domain, tag, '%{public}s', "[Promise] cmResult.credential: " + cmResult.credential);
        hilog.info(domain, tag, '%{public}s', "[Promise] cmResult.appUidList: " + cmResult.appUidList);
        hilog.info(domain, tag, '%{public}s', "[Promise] cmResult.outData: " + cmResult.outData);
        keyUri = cmResult.uri;
      }).catch((err: Error): void => {
        hilog.error(domain, tag, '%{public}s', "[Promise] installPrivateCertificate err: " + err.code);
        expect(null).assertFail();
      });
      if (keyUri != undefined) {
        await certManager.uninstallPrivateCertificate(keyUri ?? '');
      } else {
        hilog.error(domain, tag, '%{public}s', "Security_CertManager_PriCertJsApi_Func_Static_0200 keyUri is undefined!");
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_Func_Static_0300
     * @tc.number Security_CertManager_PriCertJsApi_Func_Static_0300
     * @tc.desc   use asyncCallback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Security_CertManager_PriCertJsApi_Func_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let keystore: Uint8Array = priEccCredData;
      let keystorePwd: string = '123456';
      let certAlias: string = 'appCertAliasDemoEcc';
      let cmResult: certManager.CMResult | undefined;
      let cmUri: string | undefined;
      try {
        cmResult = await new Promise<certManager.CMResult>((resolve, reject) => {
          certManager.installPrivateCertificate(keystore, keystorePwd, certAlias, (err: BusinessError<void> | null, cmResult: certManager.CMResult |undefined) => {
            if (err != null && err?.code != 0) {
              reject(err as Error);
            } else {
              resolve(cmResult ?? {} as certManager.CMResult);
            }
          });
        });
        expect(cmResult != undefined).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', "Security_CertManager_PriCertJsApi_Func_Static_0300 get err1: " + err.code);
        expect(null).assertFail();
      }
      if (cmResult != undefined) {
        cmUri = cmResult.uri;
      }
      try {
        await new Promise<void>((resolve, reject) => {
          certManager.uninstallPrivateCertificate(cmUri ?? "", (err: BusinessError<void>|null) => {
            if (err != null && err?.code != 0) {
              reject(err as Error);
            } else {
              resolve(undefined);
            }
          });
        });
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', "Security_CertManager_PriCertJsApi_Func_Static_0300 get err2: " + err.code);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_Func_Static_0400
     * @tc.number Security_CertManager_PriCertJsApi_Func_Static_0400
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_Func_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.error(domain, tag, '%{public}s', "Security_CertManager_PriCertJsApi_Func_Static_0400 start");
      await certManager.getPrivateCertificate(gAppKeyUri1).then((cmResult: certManager.CMResult) => {
        expect(cmResult.credential !== undefined).assertTrue();
        let credential: certManager.Credential = cmResult.credential ?? {
          type: '',
          alias: '',
          keyUri: '',
          certNum: 0,
          keyNum: 0,
          credentialData: new Uint8Array(0)
        } as certManager.Credential;
        if (cmResult !== undefined && cmResult.credential !== undefined) {
          hilog.info(domain, tag, '%{public}s', "[Promise] type: " + credential.type);
          hilog.info(domain, tag, '%{public}s', "[Promise] alias: " + credential.alias);
          hilog.info(domain, tag, '%{public}s', "[Promise] keyUri: " + credential.keyUri);
          hilog.info(domain, tag, '%{public}s', "[Promise] certNum: " + credential.certNum);
          hilog.info(domain, tag, '%{public}s', "[Promise] keyNum: " + credential.keyNum);
          hilog.info(domain, tag, '%{public}s', "[Promise] credData: " + credential.credentialData);
        }
      })
      .catch((err: Error): void => {
        hilog.error(domain, tag, '%{public}s', "Security_CertManager_PriCertJsApi_Func_Static_0400 getPrivateCertificate err: " + err.code);
        expect(null).assertFail();
      });
      done();
    });

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_Func_Static_0500
     * @tc.number Security_CertManager_PriCertJsApi_Func_Static_0500
     * @tc.desc   use asyncCallback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_Func_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cmResult2: certManager.CMResult;
      hilog.info(domain, tag, '%{public}s', `gAppKeyUri2 is: ${gAppKeyUri2}`);
      try {
        cmResult2 = await new Promise<certManager.CMResult>((resolve, reject) => {
          certManager.getPrivateCertificate(gAppKeyUri2, (err:  BusinessError<void> | null, CMResult: certManager.CMResult | undefined) => {
            if (err != null && err?.code != 0) {
              reject(err as Error);
            } else {
              resolve(CMResult ?? {} as certManager.CMResult);
            }
          });
        });
        expect(cmResult2.credential != undefined && cmResult2.credential != null).assertTrue();
        if (cmResult2.certList != undefined) {
          let certList = cmResult2.certList ?? [] as Array<certManager.CertAbstract>;
          for (let i = 0; i < certList.length; i++) {
            hilog.info(domain, tag, '%{public}s', `[Callback] cmResult2.certList[${i}] uri: ${certList[i].uri} `);
            hilog.info(domain, tag, '%{public}s', `[Callback] cmResult2.certList[${i}] certAlias: ${certList[i].certAlias} `);
            hilog.info(domain, tag, '%{public}s', `[Callback] cmResult2.certList[${i}] state: ${certList[i].state} `);
            hilog.info(domain, tag, '%{public}s', `[Callback] cmResult2.certList[${i}] subjectName: ${certList[i].subjectName} `);
          }
        }
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', "Security_CertManager_PriCertJsApi_Func_Static_0500 getPrivateCertificate err: " + err.code);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_Func_Static_0600
     * @tc.number Security_CertManager_PriCertJsApi_Func_Static_0600
     * @tc.desc   use asyncCallback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Security_CertManager_PriCertJsApi_Func_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let keyStore: Uint8Array = priRsaCredData;
      let signSpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN
      };
      let verifySpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_VERIFY
      };
      await signVerifyCallback.signVerifyNormalProcess(gAppKeyUri1, keyStore, signSpec, verifySpec).then((result: certManager.CMResult) => {
        expect(result.outData == null).assertTrue();
      }).catch((err: Error): void => {
        hilog.error(domain, tag, '%{public}s', "Security_CertManager_PriCertJsApi_Func_Static_0600 get err: " + err.code);
        expect(null).assertFail();
      });
      done();
    });

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_Func_Static_0700
     * @tc.number Security_CertManager_PriCertJsApi_Func_Static_0700
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Security_CertManager_PriCertJsApi_Func_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let keyStore: Uint8Array = priEccCredData;
      let signSpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN
      };
      let verifySpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_VERIFY
      };
      await signVerifyPromise.signVerifyNormalProcess(gAppKeyUri2, keyStore, signSpec, verifySpec).then((result: certManager.CMResult) => {
        expect(result.outData == null).assertTrue();
      }).catch((err: Error): void => {
        hilog.error(domain, tag, '%{public}s', "Security_CertManager_PriCertJsApi_Func_Static_0700 get err: " + err.code);
        expect(null).assertFail();
      });
      done();
    });

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_Func_Static_0800
     * @tc.number Security_CertManager_PriCertJsApi_Func_Static_0800
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_CertManager_PriCertJsApi_Func_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let keyStore: Uint8Array = priEccCredData;
      try {
        await signVerifyPromise.signAbortProcess(gAppKeyUri2, keyStore, "after_init");
        await signVerifyPromise.signAbortProcess(gAppKeyUri2, keyStore, "after_update");
        await signVerifyPromise.signAbortProcess(gAppKeyUri2, keyStore, "after_finish");
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', "Security_CertManager_PriCertJsApi_Func_Static_0800 get err: " + err.code);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_Func_Static_0900
     * @tc.number Security_CertManager_PriCertJsApi_Func_Static_0900
     * @tc.desc   use asyncCallback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_CertManager_PriCertJsApi_Func_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let keyStore: Uint8Array = priRsaCredData;
      try {
        await signVerifyCallback.signAbortProcess(gAppKeyUri1, keyStore, "after_init");
        await signVerifyCallback.signAbortProcess(gAppKeyUri1, keyStore, "after_update");
        await signVerifyCallback.signAbortProcess(gAppKeyUri1, keyStore, "after_finish");
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', "Security_CertManager_PriCertJsApi_Func_Static_0900 get err: " + err.code);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_Func_Static_1000
     * @tc.number Security_CertManager_PriCertJsApi_Func_Static_1000
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_CertManager_PriCertJsApi_Func_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let keyStore: Uint8Array = priEccCredData;
      try {
        await signVerifyPromise.verifyAbortProcess(gAppKeyUri2, keyStore, "after_verify_init");
        await signVerifyPromise.verifyAbortProcess(gAppKeyUri2, keyStore, "after_verify_update");
        await signVerifyPromise.verifyAbortProcess(gAppKeyUri2, keyStore, "after_verify_finish");
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', "Security_CertManager_PriCertJsApi_Func_Static_1000 get err: " + err.code);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_Func_Static_1100
     * @tc.number Security_CertManager_PriCertJsApi_Func_Static_1100
     * @tc.desc   use asyncCallback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_CertManager_PriCertJsApi_Func_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let keyStore: Uint8Array = priRsaCredData;
      try {
        await signVerifyCallback.verifyAbortProcess(gAppKeyUri1, keyStore, "after_verify_init");
        await signVerifyCallback.verifyAbortProcess(gAppKeyUri1, keyStore, "after_verify_update");
        await signVerifyCallback.verifyAbortProcess(gAppKeyUri1, keyStore, "after_verify_finish");
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', "Security_CertManager_PriCertJsApi_Func_Static_1100 get err: " + err.code);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_Func_Static_1300
     * @tc.number Security_CertManager_PriCertJsApi_Func_Static_1300
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_Func_Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let cmResult: certManager.CMResult = await certManager.getAllAppPrivateCertificates();
        let credentialList = cmResult.credentialList ?? [] as Array<certManager.CredentialAbstract>;
        if (credentialList != undefined) {
          expect(credentialList.length).assertLessOrEqual(256);
          for (let i = 0; i < credentialList.length; i++) {
            hilog.info(domain, tag, '%{public}s', `CMResult.credentialList[${i}].type is: ${credentialList[i].type}`);
            hilog.info(domain, tag, '%{public}s', `CMResult.credentialList[${i}].alias is: ${credentialList[i].alias}`);
            hilog.info(domain, tag, '%{public}s', `CMResult.credentialList[${i}].keyUri is: ${credentialList[i].keyUri}`);
          }
        } else {
          hilog.error(domain, tag, '%{public}s', "Security_CertManager_PriCertJsApi_Func_Static_1300 cmResult.credentialList is undefined!");
          expect(null).assertFail();
        }
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', "Security_CertManager_PriCertJsApi_Func_Static_1300 get err: " + err.code);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_Func_Static_1400
     * @tc.number Security_CertManager_PriCertJsApi_Func_Static_1400
     * @tc.desc   use asyncCallback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_Func_Static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let cmResult: certManager.CMResult = await new Promise<certManager.CMResult>((resolve, reject) => {
          certManager.getAllAppPrivateCertificates((err: BusinessError<void>|null, cmResult: certManager.CMResult|undefined) => {
            if (err != null && err?.code != 0) {
              hilog.error(domain, tag, '%{public}s', "[Callback]getAllAppPrivateCertificates err: " + err?.code);
              reject(err as Error);
            } else {
              resolve(cmResult ?? {} as certManager.CMResult);
            }
          });
        });
        let credentialList = cmResult.credentialList ?? [] as Array<certManager.CredentialAbstract>;
        if (cmResult != undefined && credentialList != undefined) {
          expect(credentialList.length).assertLessOrEqual(256);
          for (let i = 0; i < credentialList.length; i++) {
            hilog.info(domain, tag, '%{public}s', `CMResult.credentialList[${i}].type is: ${credentialList[i].type}`);
            hilog.info(domain, tag, '%{public}s', `CMResult.credentialList[${i}].alias is: ${credentialList[i].alias}`);
            hilog.info(domain, tag, '%{public}s', `CMResult.credentialList[${i}].keyUri is: ${credentialList[i].keyUri}`);
          }
        } else {
          hilog.error(domain, tag, '%{public}s', "Security_CertManager_PriCertJsApi_Func_Static_1400 cmResult is undefined " +
            "or cmResult.credentialList is undefined!");
          expect(null).assertFail();
        }
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', "Security_CertManager_PriCertJsApi_Func_Static_1400 get err: " + err.code);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_Func_Static_1500
     * @tc.number Security_CertManager_PriCertJsApi_Func_Static_1500
     * @tc.desc   use asyncCallback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_Func_Static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keyStore: Uint8Array = priRsaCredData;
      let input_digest: certManager.CmKeyDigest;
      if (isOpenHarmonyDeviceTag == true) {
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
      await signVerifyCallback.signVerifyNormalProcess(gAppKeyUri1, keyStore, signSpec, verifySpec).then((result: certManager.CMResult) => {
        expect(result.outData == null).assertTrue();
      }).catch((err: Error): void => {
        hilog.error(domain, tag, '%{public}s', "Security_CertManager_PriCertJsApi_Func_Static_1500 get err: " + err.code);
        expect(null).assertFail();
      });
      done();
    });

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_Func_Static_1600
     * @tc.number Security_CertManager_PriCertJsApi_Func_Static_1600
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_Func_Static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keyStore: Uint8Array = priEccCredData;
      let input_digest: certManager.CmKeyDigest;
      if (isOpenHarmonyDeviceTag == true) {
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
      await signVerifyPromise.signVerifyNormalProcess(gAppKeyUri2, keyStore, signSpec, verifySpec).then((result: certManager.CMResult) => {
        expect(result.outData == null).assertTrue();
      }).catch((err: Error): void => {
        hilog.error(domain, tag, '%{public}s', "Security_CertManager_PriCertJsApi_Func_Static_1600 get err: " + err.code);
        expect(null).assertFail();
      });
      done();
    });

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_Func_Static_1700
     * @tc.number Security_CertManager_PriCertJsApi_Func_Static_1700
     * @tc.desc   use asyncCallback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_Func_Static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keyStore: Uint8Array = priRsaCredData;
      let input_digest: certManager.CmKeyDigest;
      if (isOpenHarmonyDeviceTag == true) {
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
      await signVerifyCallback.signVerifyNormalProcess(gAppKeyUri1, keyStore, signSpec, verifySpec).then((result: certManager.CMResult) => {
        expect(result.outData == null).assertTrue();
      }).catch((err: Error): void => {
        hilog.error(domain, tag, '%{public}s', "Security_CertManager_PriCertJsApi_Func_Static_1700 get err: " + err.code);
        expect(null).assertFail();
      });
      done();
    });

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_Func_Static_1800
     * @tc.number Security_CertManager_PriCertJsApi_Func_Static_1800
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_Func_Static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keyStore: Uint8Array = priEccCredData;
      let input_digest: certManager.CmKeyDigest;
      if (isOpenHarmonyDeviceTag == true) {
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
      await signVerifyPromise.signVerifyNormalProcess(gAppKeyUri2, keyStore, signSpec, verifySpec).then((result: certManager.CMResult) => {
        expect(result.outData == null).assertTrue();
      }).catch((err: Error): void => {
        hilog.error(domain, tag, '%{public}s', "Security_CertManager_PriCertJsApi_Func_Static_1800 get err: " + err.code);
        expect(null).assertFail();
      });
      done();
    });


    /**
     * @tc.name   Security_CertManager_PriCertJsApi_Func_Static_1900
     * @tc.number Security_CertManager_PriCertJsApi_Func_Static_1900
     * @tc.desc   use asyncCallback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_Func_Static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keyStore: Uint8Array = priRsaCredData;
      let input_digest: certManager.CmKeyDigest;
      if (isOpenHarmonyDeviceTag == true) {
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
      await signVerifyCallback.signVerifyNormalProcess(gAppKeyUri1, keyStore, signSpec, verifySpec).then((result: certManager.CMResult) => {
        expect(result.outData == null).assertTrue();
      }).catch((err: Error): void => {
        hilog.error(domain, tag, '%{public}s', "Security_CertManager_PriCertJsApi_Func_Static_1900 get err: " + err.code);
        expect(null).assertFail();
      });
      done();
    });

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_Func_Static_2000
     * @tc.number Security_CertManager_PriCertJsApi_Func_Static_2000
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_CertManager_PriCertJsApi_Func_Static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let keyStore: Uint8Array = priEccCredData;
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
      await signVerifyPromise.signVerifyNormalProcess(gAppKeyUri2, keyStore, signSpec, verifySpec).then((result: certManager.CMResult) => {
        expect(result.outData == null).assertTrue();
      }).catch((err: Error): void => {
        hilog.error(domain, tag, '%{public}s', "Security_CertManager_PriCertJsApi_Func_Static_2000 get err: " + err.code);
        expect(null).assertFail();
      });
      done();
    });

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_Func_Static_2100
     * @tc.number Security_CertManager_PriCertJsApi_Func_Static_2100
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_CertManager_PriCertJsApi_Func_Static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let keyStore: crypt.DataBlob;
      let srckeyStore: Uint8Array = priEccCredData;
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
          hilog.info(domain, tag, '%{public}s', `Security_CertManager_PriCertJsApi_Func_2100 keyStore data is: ${keyStore.data}`);
          let result: certManager.CMResult = await signVerifyPromise.signVerifyNormalProcess(gAppKeyUri2, keyStore.data,
            signSpec, verifySpec);
          expect(result.outData == null).assertTrue();
        } else {
          hilog.error(domain, tag, '%{public}s', "Security_CertManager_PriCertJsApi_Func_2100 keyStore is undefined " +
            "or keyStore.data is undefined!");
          expect(null).assertFail();
        }
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', "Security_CertManager_PriCertJsApi_Func_2100 get err: " + err);
        expect(null).assertFail();
      }
      done();
    });
  })
}
