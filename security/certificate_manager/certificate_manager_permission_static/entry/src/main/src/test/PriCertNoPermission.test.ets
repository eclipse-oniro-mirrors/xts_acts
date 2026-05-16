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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import certManager from '@ohos.security.certManager';
import { priEccCredData, priRsaCredData } from './utils/common/common_parameter';
import { BusinessError } from '@ohos.base';

export default function priCertJsAPINoPermissionTestUnit() {
  describe('priCertJsAPINoPermissionTestUnit', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_NoPermission_Func_static_0100
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_static_0100
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keystore: Uint8Array = priRsaCredData;
      let keystorePwd: string = '123456';
      let certAlias: string = 'appCertAliasDemoRsa';
      try {
        await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_NoPermission_Func_static_0200
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_static_0200
     * @tc.desc   use asynccallback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keystore: Uint8Array = priEccCredData;
      let keystorePwd: string = '123456';
      let certAlias: string = 'appCertAliasDemoEcc';
      try {
        await new Promise<certManager.CMResult>((resolve, reject) => {
          certManager.installPrivateCertificate(keystore, keystorePwd, certAlias, (err, cmResult) => {
            if (err?.code !== 0) {
              reject(err as Error);
            } else {
              resolve(cmResult ?? {} as certManager.CMResult);
            }
          })
        });
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_NoPermission_Func_static_0300
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_static_0300
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        await certManager.getPrivateCertificate("11111");
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_NoPermission_Func_static_0400
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_static_0400
     * @tc.desc   use asynccallback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        await new Promise<certManager.CMResult>((resolve, reject) => {
          certManager.getPrivateCertificate("11111", (err, CMResult) => {
            if (err?.code !== 0) {
              reject(err as Error);
            } else {
              resolve(CMResult ?? {} as certManager.CMResult);
            }
          })
        });
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_NoPermission_Func_static_0500
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_static_0500
     * @tc.desc   use asynccallback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let signSpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN
      };
      try {
        await new Promise<certManager.CMHandle>((resolve, reject) => {
          certManager.init("11111", signSpec, (err, cmResult) => {
            if (err?.code !== 0) {
              reject(err as Error);
            } else {
              resolve(cmResult ?? { handle: new Uint8Array() } as certManager.CMHandle);
            }
          })
        });
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_NoPermission_Func_static_0600
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_static_0600
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let signSpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN
      };
      try {
        await certManager.init("111111", signSpec);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_NoPermission_Func_static_0700
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_static_0700
     * @tc.desc   use asynccallback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keyStore: Uint8Array = priEccCredData;
      let handle: Uint8Array = new Uint8Array([0X00]);
      try {
        await new Promise<void>((resolve, reject) => {
          certManager.update(handle, keyStore, (err) => {
            if (err?.code !== 0) {
              reject(err as Error);
            } else {
              resolve(undefined);
            }
          })
        });
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_NoPermission_Func_static_0800
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_static_0800
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keyStore: Uint8Array = priEccCredData;
      let handle: Uint8Array = new Uint8Array([0X00]);
      try {
        await certManager.update(handle, keyStore);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_NoPermission_Func_static_0900
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_static_0900
     * @tc.desc   use asynccallback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keyStore: Uint8Array = priEccCredData;
      let handle: Uint8Array = new Uint8Array([0X00]);
      try {
        await new Promise<certManager.CMResult>((resolve, reject) => {
          certManager.finish(handle, keyStore, (err, cmResult) => {
            if (err?.code !== 0) {
              reject(err as Error);
            } else {
              resolve(cmResult ?? {} as certManager.CMResult);
            }
          })
        });
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(201);
      }
      try {
        await new Promise<certManager.CMResult>((resolve, reject) => {
          certManager.finish(handle, (err, cmResult) => {
            if (err?.code !== 0) {
              reject(err as Error);
            } else {
              resolve(cmResult ?? {} as certManager.CMResult);
            }
          })
        });
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_NoPermission_Func_static_1000
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_static_1000
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keyStore: Uint8Array = priEccCredData;
      let handle: Uint8Array = new Uint8Array([0X00]);
      try {
        await certManager.finish(handle, keyStore);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_NoPermission_Func_static_1100
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_static_1100
     * @tc.desc   use asynccallback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let handle: Uint8Array = new Uint8Array([0X00]);
      try {
        await new Promise<void>((resolve, reject) => {
          certManager.abort(handle, (err) => {
            if (err?.code !== 0) {
              reject(err as Error);
            } else {
              resolve(undefined);
            }
          })
        });
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_NoPermission_Func_static_1200
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_static_1200
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let handle: Uint8Array = new Uint8Array([0X00]);
      try {
        await certManager.abort(handle);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_NoPermission_Func_static_1300
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_static_1300
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        await certManager.uninstallPrivateCertificate("111111");
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_NoPermission_Func_static_1400
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_static_1400
     * @tc.desc   use asynccallback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        await new Promise<void>((resolve, reject) => {
          certManager.uninstallPrivateCertificate("1111111", (err) => {
            if (err?.code !== 0) {
              reject(err as Error);
            } else {
              resolve(undefined);
            }
          })
        });
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_NoPermission_Func_static_1500
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_static_1500
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        await certManager.getAllAppPrivateCertificates();
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.name   Security_CertManager_PriCertJsApi_NoPermission_Func_static_1600
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_static_1600
     * @tc.desc   use asynccallback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        await new Promise<certManager.CMResult>((resolve, reject) => {
          certManager.getAllAppPrivateCertificates((err, status) => {
            if (err?.code !== 0) {
              reject(err as Error);
            } else {
              resolve(status ?? {} as certManager.CMResult);
            }
          })
        });
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(201);
      }
      done();
    })
  })
}

