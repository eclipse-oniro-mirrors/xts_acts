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

import certManager from '@ohos.security.certManager';
import type common from '@ohos.app.ability.common';
import type { BusinessError } from '@ohos.base';
import certManagerDialog from '@ohos.security.certManagerDialog';
import { priRsaCredData } from './utils/common/common_parameter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function certManagerPubCertJsAPIFunctionTestUnitThree() {
  describe('certManagerPubCertJsAPIFunctionTestUnitThree', (): void => {
    beforeAll(() => {
    });
    beforeEach(async () => {
    });
    afterEach(() => {
    });
    afterAll(async () => {
    });

    /**
     * @tc.name   SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0100
     * @tc.number SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0100
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let uri: string = 'test'; /* 业务安装凭据，返回唯一标识符，此处省略 */
      try {
        await certManager.getPrivateCertificate(uri);
        hilog.info(domain, tag, '%{public}s', `SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0100 private certificate success. `);
        expect(null).assertFail();
      } catch (error) {
        error = error as BusinessError;
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0100 Failed to get private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0101
     * @tc.number SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0101
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let uri: string = 'test';
      let cmResult2: certManager.CMResult;
      try {
        cmResult2 = await new Promise<certManager.CMResult>((resolve, reject) => {
          certManager.getPrivateCertificate(uri, (err: BusinessError<void> | null, CMResult: certManager.CMResult | undefined) => {
            if (err != null && err?.code != 0) {
              reject(err as Error);
            } else {
              resolve(CMResult as certManager.CMResult);
            }
          });
        });
        hilog.info(domain, tag, '%{public}s', `SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0101 private certificate success. `);
        expect(cmResult2 != undefined && cmResult2 != null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0101 Failed to get private certificate. Code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0102
     * @tc.number SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0102
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let uri: string = 'oh:t=ak;o=appCertAliasDemoRsa;u=100;a=20010045';
      try {
        await certManager.getPrivateCertificate(uri);
        hilog.info(domain, tag, '%{public}s', `SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0102 private certificate success. `);
        expect(null).assertFail();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, '%{public}s', `SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0102 Failed to get private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(17500002);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0103
     * @tc.number SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0103
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cmResult2: certManager.CMResult;
      let uri: string = 'oh:t=ak;o=appCertAliasDemoRsa;u=100;a=20010045';
      try {
        cmResult2 = await new Promise<certManager.CMResult>((resolve, reject) => {
          certManager.getPrivateCertificate(uri, (err: BusinessError<void> | null, CMResult: certManager.CMResult | undefined) => {
            if (err != null && err?.code != 0) {
              reject(err as Error);
            } else {
              resolve(CMResult as certManager.CMResult);
            }
          });
        });
        hilog.info(domain, tag, '%{public}s', `SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0103 private certificate success. `);
        expect(cmResult2 != undefined && cmResult2 != null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', "SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0103 getPrivateCertificate err: " + err.code);
        expect(err.code).assertEqual(17500002);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0110
     * @tc.number SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0110
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let uri: string = 'oh:t=c;o=vBBPFaSL5wncpUKn4dS5328FRSfoAuqpLVlURCWK_nEA;u=0;a=20010044';
      try {
        await certManager.getUserTrustedCertificate(uri);
        hilog.info(domain, tag, '%{public}s', `SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0110 init success. `);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', "SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0110 init err: " + err.code);
        expect(err.code).assertEqual(17500002);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_InstallPrivateCertificate_Func_Static_0200
     * @tc.number SUB_Security_CertManager_InstallPrivateCertificate_Func_Static_0200
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_InstallPrivateCertificate_Func_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keystore: Uint8Array = priRsaCredData;
      let keystorePwd: string = '111111';
      let certAlias: string = 'appCertAliasDemoRsa';
      let keyUri: string | undefined;
      try {
        await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_InstallPrivateCertificate_Func_Static_0200 Failed to install private certificate. Code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(17500003);
      }
      done();
    });

  })
}