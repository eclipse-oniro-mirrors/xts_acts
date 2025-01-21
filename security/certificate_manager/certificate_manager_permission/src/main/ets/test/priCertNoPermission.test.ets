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
import * as commonParameter from './utils/common/common_parameter';

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
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_0100
     * @tc.name Test installPrivateCertificate with no ohos.permission.ACCESS_CERT_MANAGER permission
     * @tc.desc Use Promise Type
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_0100', 0, async (done: Function) => {
      let keystore: Uint8Array = commonParameter.priRsaCredData;
      let keystorePwd: string = '123456';
      let certAlias: string = 'appCertAliasDemoRsa';
      try {
        await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_0200
     * @tc.name Test installPrivateCertificate with no ohos.permission.ACCESS_CERT_MANAGER permission
     * @tc.desc Use AsyncCallback Type
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_0200', 0, async (done: Function) => {
      let keystore: Uint8Array = commonParameter.priEccCredData;
      let keystorePwd: string = '123456';
      let certAlias: string = 'appCertAliasDemoEcc';
      try {
        await new Promise((resolve, reject) => {
          certManager.installPrivateCertificate(keystore, keystorePwd, certAlias, (err, cmResult) => {
            if (err) {
              reject(err);
            } else {
              resolve(cmResult);
            }
          })
        });
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_0300
     * @tc.name Test getPrivateCertificate with no ohos.permission.ACCESS_CERT_MANAGER permission
     * @tc.desc Use Promise Type
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_0300', 0, async (done: Function) => {
      try {
        await certManager.getPrivateCertificate("11111");
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_0400
     * @tc.name Test getPrivateCertificate with no ohos.permission.ACCESS_CERT_MANAGER permission
     * @tc.desc Use AsyncCallback Type
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_0400', 0, async (done: Function) => {
      try {
        await new Promise((resolve, reject) => {
          certManager.getPrivateCertificate("11111", (err, CMResult) => {
            if (err) {
              reject(err);
            } else {
              resolve(CMResult);
            }
          })
        });
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_0500
     * @tc.name Test init interface with no ohos.permission.ACCESS_CERT_MANAGER permission
     * @tc.desc Use AsyncCallback Type
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_0500', 0, async (done: Function) => {
      let signSpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN
      };
      try {
        await new Promise((resolve, reject) => {
          certManager.init("11111", signSpec, (err, cmResult) => {
            if (err) {
              reject(err);
            } else {
              resolve(cmResult);
            }
          })
        });
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_0600
     * @tc.name Test init interface with no ohos.permission.ACCESS_CERT_MANAGER permission
     * @tc.desc Use Promise Type
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_0600', 0, async (done: Function) => {
      let signSpec: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN
      };
      try {
        await certManager.init("111111", signSpec);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_0700
     * @tc.name Test update interface with no ohos.permission.ACCESS_CERT_MANAGER permission
     * @tc.desc Use AsyncCallback Type
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_0700', 0, async (done: Function) => {
      let keyStore: Uint8Array = commonParameter.priEccCredData;
      let handle: Uint8Array = new Uint8Array([0X00]);
      try {
        await new Promise((resolve, reject) => {
          certManager.update(handle, keyStore, (err, cmResult) => {
            if (err) {
              reject(err);
            } else {
              resolve(cmResult);
            }
          })
        });
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_0800
     * @tc.name Test update interface with no ohos.permission.ACCESS_CERT_MANAGER permission
     * @tc.desc Use Promise Type
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_0800', 0, async (done: Function) => {
      let keyStore: Uint8Array = commonParameter.priEccCredData;
      let handle: Uint8Array = new Uint8Array([0X00]);
      try {
        await certManager.update(handle, keyStore);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_0900
     * @tc.name Test finish interface with no ohos.permission.ACCESS_CERT_MANAGER permission
     * @tc.desc Use AsyncCallback Type
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_0900', 0, async (done: Function) => {
      let keyStore: Uint8Array = commonParameter.priEccCredData;
      let handle: Uint8Array = new Uint8Array([0X00]);
      try {
        await new Promise((resolve, reject) => {
          certManager.finish(handle, keyStore, (err, cmResult) => {
            if (err) {
              reject(err);
            } else {
              resolve(cmResult);
            }
          })
        });
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(201);
      }
      try {
        await new Promise((resolve, reject) => {
          certManager.finish(handle, (err, cmResult) => {
            if (err) {
              reject(err);
            } else {
              resolve(cmResult);
            }
          })
        });
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_1000
     * @tc.name Test finish interface with no ohos.permission.ACCESS_CERT_MANAGER permission
     * @tc.desc Use Promise Type
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_1000', 0, async (done: Function) => {
      let keyStore: Uint8Array = commonParameter.priEccCredData;
      let handle: Uint8Array = new Uint8Array([0X00]);
      try {
        await certManager.finish(handle, keyStore);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_1100
     * @tc.name Test abort interface with no ohos.permission.ACCESS_CERT_MANAGER permission
     * @tc.desc Use AsyncCallback Type
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_1100', 0, async (done: Function) => {
      let handle: Uint8Array = new Uint8Array([0X00]);
      try {
        await new Promise((resolve, reject) => {
          certManager.abort(handle, (err, cmResult) => {
            if (err) {
              reject(err);
            } else {
              resolve(cmResult);
            }
          })
        });
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_1200
     * @tc.name Test abort interface with no ohos.permission.ACCESS_CERT_MANAGER permission
     * @tc.desc Use Promise Type
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_1200', 0, async (done: Function) => {
      let handle: Uint8Array = new Uint8Array([0X00]);
      try {
        await certManager.abort(handle);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_1300
     * @tc.name Test uninstallPrivateCertificate interface with no ohos.permission.ACCESS_CERT_MANAGER permission
     * @tc.desc Use Promise Type
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_1300', 0, async (done: Function) => {
      try {
        await certManager.uninstallPrivateCertificate("111111");
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_1400
     * @tc.name Test uninstallPrivateCertificate interface with no ohos.permission.ACCESS_CERT_MANAGER permission
     * @tc.desc Use AsyncCallback Type
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_1400', 0, async (done: Function) => {
      try {
        await new Promise((resolve, reject) => {
          certManager.uninstallPrivateCertificate("1111111", (err, status) => {
            if (err) {
              reject(err);
            } else {
              resolve(status);
            }
          })
        });
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_1500
     * @tc.name Test getAllAppPrivateCertificates interface with no  ohos.permission.ACCESS_CERT_MANAGER
     * @tc.name and ohos.permission.ACCESS_CERT_MANAGER_INTERNAL
     * @tc.desc Use Promise Type
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_1500', 0, async (done: Function) => {
      try {
        await certManager.getAllAppPrivateCertificates();
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.number Security_CertManager_PriCertJsApi_NoPermission_Func_1600
     * @tc.name Test getAllAppPrivateCertificates interface with no  ohos.permission.ACCESS_CERT_MANAGER
     * @tc.name and ohos.permission.ACCESS_CERT_MANAGER_INTERNAL
     * @tc.desc Use AsyncCallback Type
     */
    it('Security_CertManager_PriCertJsApi_NoPermission_Func_1600', 0, async (done: Function) => {
      try {
        await new Promise((resolve, reject) => {
          certManager.getAllAppPrivateCertificates((err, status) => {
            if (err) {
              reject(err);
            } else {
              resolve(status);
            }
          })
        });
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(201);
      }
      done();
    })
  })
}

