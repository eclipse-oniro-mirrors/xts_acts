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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import certManager from '@ohos.security.certManager';
import type common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import certManagerDialog from '@ohos.security.certManagerDialog';
import * as commonParameter from './utils/common/common_parameter';

export default function certManagerPubCertJsAPIFunctionTestUnitThree() {
  describe('certManagerPubCertJsAPIFunctionTestUnitThree', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
    });
    afterEach(() => {
    });
    afterAll(async () => {
    });

    /**
     * @tc.name   SUB_Security_CertManager_GetPriCertJsApi_Func_0100
     * @tc.number SUB_Security_CertManager_GetPriCertJsApi_Func_0100
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_GetPriCertJsApi_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0100: started ");
      let uri: string = 'test'; /* 业务安装凭据，返回唯一标识符，此处省略 */
      try {
        await certManager.getPrivateCertificate(uri);
        console.error(`SUB_Security_CertManager_GetPriCertJsApi_Func_0100 private certificate success. `);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CertManager_GetPriCertJsApi_Func_0100 Failed to get private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_GetPriCertJsApi_Func_0101
     * @tc.number SUB_Security_CertManager_GetPriCertJsApi_Func_0101
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_GetPriCertJsApi_Func_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0101: started ");
      let uri: string = 'test';
      let cmResult2: certManager.CMResult;
      try {
        cmResult2 = await new Promise<certManager.CMResult>((resolve, reject) => {
          certManager.getPrivateCertificate(uri, (err: Error, CMResult: certManager.CMResult) => {
            if (err) {
              reject(err);
            } else {
              resolve(CMResult);
            }
          });
        });
        console.error(`SUB_Security_CertManager_GetPriCertJsApi_Func_0101 private certificate success. `);
        expect(cmResult2 != undefined && cmResult2 != null).assertFail();
      } catch (err) {
        console.error(`SUB_Security_CertManager_GetPriCertJsApi_Func_0101 Failed to get private certificate. Code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_GetPriCertJsApi_Func_0102
     * @tc.number SUB_Security_CertManager_GetPriCertJsApi_Func_0102
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_GetPriCertJsApi_Func_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0102: started ");
      let uri: string = 'oh:t=ak;o=appCertAliasDemoRsa;u=100;a=20010045';
      try {
        await certManager.getPrivateCertificate(uri);
        console.error(`SUB_Security_CertManager_GetPriCertJsApi_Func_0102 private certificate success. `);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CertManager_GetPriCertJsApi_Func_0102 Failed to get private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(17500002);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_GetPriCertJsApi_Func_0103
     * @tc.number SUB_Security_CertManager_GetPriCertJsApi_Func_0103
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_GetPriCertJsApi_Func_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0103: started ");
      let cmResult2: certManager.CMResult;
      let uri: string = 'oh:t=ak;o=appCertAliasDemoRsa;u=100;a=20010045';
      try {
        cmResult2 = await new Promise<certManager.CMResult>((resolve, reject) => {
          certManager.getPrivateCertificate(uri, (err: Error, CMResult: certManager.CMResult) => {
            if (err) {
              reject(err);
            } else {
              resolve(CMResult);
            }
          });
        });
        console.error(`SUB_Security_CertManager_GetPriCertJsApi_Func_0103 private certificate success. `);
        expect(cmResult2 != undefined && cmResult2 != null).assertFail();
      } catch (err) {
        console.error("SUB_Security_CertManager_GetPriCertJsApi_Func_0103 getPrivateCertificate err: " + err.code);
        expect(err.code).assertEqual(17500002);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_GetPriCertJsApi_Func_0105
     * @tc.number SUB_Security_CertManager_GetPriCertJsApi_Func_0105
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_GetPriCertJsApi_Func_0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0105: started ");
      let CMHandle1: certManager.CMHandle;
      let uri: string = 'oh:t=ak;o=appCertAliasDemoRsa;u=100;a=20010045';
      const req: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN,
        padding: certManager.CmKeyPadding.CM_PADDING_PSS,
        digest: certManager.CmKeyDigest.CM_DIGEST_SHA256
      }
      try {
        CMHandle1 = await new Promise<certManager.CMHandle>((resolve, reject) => {
          certManager.init(null, req, (err: Error, CMHandle: certManager.CMHandle) => {
            if (err) {
              reject(err);
            } else {
              resolve(CMHandle);
            }
          });
        });
        console.error(`SUB_Security_CertManager_GetPriCertJsApi_Func_0105 init success. `);
        expect(CMHandle1 != undefined && CMHandle1 != null).assertFail();
      } catch (err) {
        console.error("SUB_Security_CertManager_GetPriCertJsApi_Func_0105 init err: " + err.code);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_GetPriCertJsApi_Func_0106
     * @tc.number SUB_Security_CertManager_GetPriCertJsApi_Func_0106
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_GetPriCertJsApi_Func_0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0106: started ");
      let CMHandle1: certManager.CMHandle;
      let uri: string = 'oh:t=ak;o=appCertAliasDemoRsa;u=100;a=20010045';
      const req: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN,
        padding: certManager.CmKeyPadding.CM_PADDING_PSS,
        digest: certManager.CmKeyDigest.CM_DIGEST_SHA256
      }
      try {
        await certManager.init(null, req);
        console.error(`SUB_Security_CertManager_GetPriCertJsApi_Func_0106 init success. `);
        expect(null).assertFail();
      } catch (err) {
        console.error("SUB_Security_CertManager_GetPriCertJsApi_Func_0106 init err: " + err.code);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_GetPriCertJsApi_Func_0109
     * @tc.number SUB_Security_CertManager_GetPriCertJsApi_Func_0109
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_GetPriCertJsApi_Func_0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0109: started ");
      try {
        await certManager.getUserTrustedCertificate(null);
        console.error(`SUB_Security_CertManager_GetPriCertJsApi_Func_0109 init success. `);
        expect(null).assertFail();
      } catch (err) {
        console.error("SUB_Security_CertManager_GetPriCertJsApi_Func_0109 init err: " + err.code);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_GetPriCertJsApi_Func_0110
     * @tc.number SUB_Security_CertManager_GetPriCertJsApi_Func_0110
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_GetPriCertJsApi_Func_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0110: started ");
      let uri: string = 'oh:t=c;o=vBBPFaSL5wncpUKn4dS5328FRSfoAuqpLVlURCWK_nEA;u=0;a=20010044';
      try {
        await certManager.getUserTrustedCertificate(uri);
        console.error(`SUB_Security_CertManager_GetPriCertJsApi_Func_0110 init success. `);
        expect(null).assertFail();
      } catch (err) {
        console.error("SUB_Security_CertManager_GetPriCertJsApi_Func_0110 init err: " + err.code);
        expect(err.code).assertEqual(17500002);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_InstallPrivateCertificate_Func_0200
     * @tc.number SUB_Security_CertManager_InstallPrivateCertificate_Func_0200
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_InstallPrivateCertificate_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_InstallPrivateCertificate_Func_0200: started ");
      let keystore: Uint8Array = commonParameter.priRsaCredData;
      let keystorePwd: string = '111111';
      let certAlias: string = 'appCertAliasDemoRsa';
      let keyUri: string | undefined;
      try {
        await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias);
        expect(null).assertFail();
      } catch (err) {
        console.error(`SUB_Security_CertManager_InstallPrivateCertificate_Func_0200 Failed to install private certificate. Code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(17500003);
      }
      done();
    });

  })
}