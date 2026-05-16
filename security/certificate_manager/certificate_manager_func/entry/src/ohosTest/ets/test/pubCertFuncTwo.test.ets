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
export default function certManagerPubCertJsAPIFunctionTestUnitTwo() {
  describe('certManagerPubCertJsAPIFunctionTestUnitTwo', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
    });
    afterEach(() => {
    });
    afterAll(async () => {
    });

    /**
     * @tc.name   SUB_Security_CertManager_PriCertJsApi_Func_0100
     * @tc.number SUB_Security_CertManager_PriCertJsApi_Func_0100
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_PriCertJsApi_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let keystore: Uint8Array = commonParameter.priRsaCredData;
      let keystoreNull: Uint8Array = new Uint8Array([]);
      let keystorePwd: string = '123456';
      let certAlias: string = 'appCertAliasDemoRsa';
      let keyUri: string | undefined;
      try {
        certManager.installPrivateCertificate(keystoreNull, keystorePwd, certAlias).then((cmResult) => {
          let uri: string = (cmResult?.uri == undefined) ? '' : cmResult.uri;
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0100 Failed to install private certificate. Code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
        })
      } catch (error) {
        console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0100 Failed to install private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      try {
        certManager.installPrivateCertificate(undefined, keystorePwd, certAlias).then((cmResult) => {
          let uri: string = (cmResult?.uri == undefined) ? '' : cmResult.uri;
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0100 Failed to install private certificate. Code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
        })
      } catch (error) {
        console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0100 Failed to install private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      try {
        certManager.installPrivateCertificate(keystore, "", certAlias).then((cmResult) => {
          let uri: string = (cmResult?.uri == undefined) ? '' : cmResult.uri;
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0100 Failed to install private certificate. Code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
        })
      } catch (error) {
        console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0100 Failed to install private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      try {
        certManager.installPrivateCertificate(keystore, null, certAlias).then((cmResult) => {
          let uri: string = (cmResult?.uri == undefined) ? '' : cmResult.uri;
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0100 Failed to install private certificate. Code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
        })
      } catch (error) {
        console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0100 Failed to install private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      try {
        certManager.installPrivateCertificate(keystore, undefined, certAlias).then((cmResult) => {
          let uri: string = (cmResult?.uri == undefined) ? '' : cmResult.uri;
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0100 Failed to install private certificate. Code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
        })
      } catch (error) {
        console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0100 Failed to install private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      try {
        certManager.installPrivateCertificate(keystore, keystorePwd, "").then((cmResult) => {
          let uri: string = (cmResult?.uri == undefined) ? '' : cmResult.uri;
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0100 Failed to install private certificate. Code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
        })
      } catch (error) {
        console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0100 Failed to install private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      try {
        certManager.installPrivateCertificate(keystore, keystorePwd, null).then((cmResult) => {
          let uri: string = (cmResult?.uri == undefined) ? '' : cmResult.uri;
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0100 Failed to install private certificate. Code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
        })
      } catch (error) {
        console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0100 Failed to install private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      try {
        certManager.installPrivateCertificate(keystore, keystorePwd, undefined).then((cmResult) => {
          let uri: string = (cmResult?.uri == undefined) ? '' : cmResult.uri;
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0100 Failed to install private certificate. Code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
        })
      } catch (error) {
        console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0100 Failed to install private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });
    
    /**
     * @tc.name   SUB_Security_CertManager_PriCertJsApi_Func_0101
     * @tc.number SUB_Security_CertManager_PriCertJsApi_Func_0101
     * @tc.desc   use callback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_PriCertJsApi_Func_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let keystore: Uint8Array = new Uint8Array([]);
      let keystorePwd: string = '123456';
      let certAlias: string = 'appCertAliasDemoRsa';
      let keyUri: string | undefined;
      try {
        certManager.installPrivateCertificate(keystore, keystorePwd, certAlias, (err, cmResult) => {
          if (err != null) {
            console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0101 Failed to install private certificate. Code: ${err.code}, message: ${err.message}`);
            expect(null).assertFail();
          } else {
            let uri: string = (cmResult?.uri == undefined) ? '' : cmResult.uri;
            console.info('SUB_Security_CertManager_PriCertJsApi_Func_0101 Succeeded in installing private certificate.');
            expect(null).assertFail();
          }
        });
      } catch (error) {
        console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0101 Failed to install private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_ImportUkeyCertificate_Func_0800
     * @tc.number SUB_Security_CertManager_ImportUkeyCertificate_Func_0800
     * @tc.desc   keyUri is null, return error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_ImportUkeyCertificate_Func_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_0800 start');
      let certData: Uint8Array = new Uint8Array([0x30, 0x82, 0x0b, 0xc1, 0x02, 0x01]);
      let ukeyInfo: certManager.UkeyInfo = {
        certPurpose: certManager.CertificatePurpose.PURPOSE_SIGN,
      };
      try {
        await certManager.importUkeyCertificate(null, certData, ukeyInfo);
        expect(null).assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.error(`SUB_Security_CertManager_ImportUkeyCertificate_Func_0800 failed. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_0800 end');
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_ImportUkeyCertificate_Func_0900
     * @tc.number SUB_Security_CertManager_ImportUkeyCertificate_Func_0900
     * @tc.desc   keyUri is undefined, return error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_ImportUkeyCertificate_Func_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_0900 start');
      let certData: Uint8Array = new Uint8Array([0x30, 0x82, 0x0b, 0xc1, 0x02, 0x01]);
      let ukeyInfo: certManager.UkeyInfo = {
        certPurpose: certManager.CertificatePurpose.PURPOSE_SIGN,
      };
      try {
        await certManager.importUkeyCertificate(undefined, certData, ukeyInfo);
        expect(null).assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.error(`SUB_Security_CertManager_ImportUkeyCertificate_Func_0900 failed. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_0900 end');
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_ImportUkeyCertificate_Func_1000
     * @tc.number SUB_Security_CertManager_ImportUkeyCertificate_Func_1000
     * @tc.desc   cert is null, return error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_ImportUkeyCertificate_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_1000 start');
      let keyUri: string = 'test';
      let ukeyInfo: certManager.UkeyInfo = {
        certPurpose: certManager.CertificatePurpose.PURPOSE_SIGN,
      };
      try {
        await certManager.importUkeyCertificate(keyUri, null, ukeyInfo);
        expect(null).assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.error(`SUB_Security_CertManager_ImportUkeyCertificate_Func_1000 failed. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_1000 end');
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_ImportUkeyCertificate_Func_1100
     * @tc.number SUB_Security_CertManager_ImportUkeyCertificate_Func_1100
     * @tc.desc   cert is undefined, return error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_ImportUkeyCertificate_Func_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_1100 start');
      let keyUri: string = 'test';
      let ukeyInfo: certManager.UkeyInfo = {
        certPurpose: certManager.CertificatePurpose.PURPOSE_SIGN,
      };
      try {
        await certManager.importUkeyCertificate(keyUri, undefined, ukeyInfo);
        expect(null).assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.error(`SUB_Security_CertManager_ImportUkeyCertificate_Func_1100 failed. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_1100 end');
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_ImportUkeyCertificate_Func_1200
     * @tc.number SUB_Security_CertManager_ImportUkeyCertificate_Func_1200
     * @tc.desc   ukeyInfo is null, return error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_ImportUkeyCertificate_Func_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_1200 start');
      let keyUri: string = 'test';
      let certData: Uint8Array = new Uint8Array([0x30, 0x82, 0x0b, 0xc1, 0x02, 0x01]);
      try {
        await certManager.importUkeyCertificate(keyUri, certData, null);
        expect(null).assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.error(`SUB_Security_CertManager_ImportUkeyCertificate_Func_1200 failed. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_1200 end');
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_ImportUkeyCertificate_Func_1300
     * @tc.number SUB_Security_CertManager_ImportUkeyCertificate_Func_1300
     * @tc.desc   ukeyInfo is undefined, return error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_ImportUkeyCertificate_Func_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_1300 start');
      let keyUri: string = 'test';
      let certData: Uint8Array = new Uint8Array([0x30, 0x82, 0x0b, 0xc1, 0x02, 0x01]);
      try {
        await certManager.importUkeyCertificate(keyUri, certData, undefined);
        expect(null).assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.error(`SUB_Security_CertManager_ImportUkeyCertificate_Func_1300 failed. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_1300 end');
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_PriCertJsApi_Func_0102
     * @tc.number SUB_Security_CertManager_PriCertJsApi_Func_0102
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_PriCertJsApi_Func_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let keystore: Uint8Array = commonParameter.priRsaCredData;
      let keystorePwd: string = '777777';
      let certAlias: string = 'appCertAliasDemoRsa';
      let keyUri: string | undefined;
      certManager.installPrivateCertificate(keystore, keystorePwd, certAlias).then((cmResult) => {
        let uri: string = (cmResult?.uri == undefined) ? '' : cmResult.uri;
        console.info('SUB_Security_CertManager_PriCertJsApi_Func_0102 Succeeded in installing private certificate.');
      }).catch((err: BusinessError) => {
        console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0102 Failed to install private certificate. Code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(17500003);
      })
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_PriCertJsApi_Func_0103
     * @tc.number SUB_Security_CertManager_PriCertJsApi_Func_0103
     * @tc.desc   use callback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_PriCertJsApi_Func_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let keystore: Uint8Array = commonParameter.priRsaCredData;
      let keystorePwd: string = '777777';
      let certAlias: string = 'appCertAliasDemoRsa';
      let keyUri: string | undefined;
      let CMResult: certManager.CMResult;
      try {
        certManager.installPrivateCertificate(keystore, keystorePwd, certAlias, (err, cmResult) => {
          if (err != null) {
            console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0103 Failed to install private certificate. Code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(17500003);
          } else {
            let uri: string = (cmResult?.uri == undefined) ? '' : cmResult.uri;
            console.info('SUB_Security_CertManager_PriCertJsApi_Func_0103 Succeeded in installing private certificate.');
            expect(null).assertFail();
          }
        });
      } catch (error) {
        console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0103 333 Failed to install private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_PriCertJsApi_Func_0104
     * @tc.number SUB_Security_CertManager_PriCertJsApi_Func_0104
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_PriCertJsApi_Func_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let keyUri: string | undefined = "";
      try {
        certManager.uninstallPrivateCertificate(keyUri).then((cmResult) => {
          console.info('SUB_Security_CertManager_PriCertJsApi_Func_0104 Succeeded in uninstalling private certificate.');
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0104 Failed to uninstall private certificate. Code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
        })
      } catch (error) {
        console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0104 Failed to uninstall private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_PriCertJsApi_Func_0105
     * @tc.number SUB_Security_CertManager_PriCertJsApi_Func_0105
     * @tc.desc   use callback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_PriCertJsApi_Func_0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let keyUri: string | undefined = "";
      try {
        certManager.uninstallPrivateCertificate(keyUri, (err, result) => {
          if (err != null) {
            console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0105 Failed to uninstall private certificate. Code: ${err.code}, message: ${err.message}`);
            expect(null).assertFail();
          } else {
            console.info('SUB_Security_CertManager_PriCertJsApi_Func_0105 Succeeded in uninstalling private certificate.');
            expect(null).assertFail();
          }
        });
      } catch (error) {
        console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0105 Failed to uninstall private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      try {
        certManager.uninstallPrivateCertificate(null, (err, result) => {
          if (err != null) {
            console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0105 Failed to uninstall private certificate. Code: ${err.code}, message: ${err.message}`);
            expect(null).assertFail();
          } else {
            console.info('SUB_Security_CertManager_PriCertJsApi_Func_0105 Succeeded in uninstalling private certificate.');
            expect(null).assertFail();
          }
        });
      } catch (error) {
        console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0105 Failed to uninstall private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      try {
        certManager.uninstallPrivateCertificate(undefined, (err, result) => {
          if (err != null) {
            console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0105 Failed to uninstall private certificate. Code: ${err.code}, message: ${err.message}`);
            expect(null).assertFail();
          } else {
            console.info('SUB_Security_CertManager_PriCertJsApi_Func_0105 Succeeded in uninstalling private certificate.');
            expect(null).assertFail();
          }
        });
      } catch (error) {
        console.error(`SUB_Security_CertManager_PriCertJsApi_Func_0105 Failed to uninstall private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_SignThree_Func_0100
     * @tc.number SUB_Security_CertManager_SignThree_Func_0100
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_SignThree_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let cmHandle: Uint8Array = new Uint8Array([
        0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08
      ]);
      let cmHandleNull: Uint8Array = new Uint8Array([]);
      let srcData: Uint8Array = new Uint8Array([
        0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08
      ]);
      let srcDataNull: Uint8Array = new Uint8Array([]);
      try {
        certManager.update(cmHandleNull, srcData).then((result) => {
          console.info('SUB_Security_CertManager_SignThree_Func_0100 Succeeded in updating.');
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          console.error(`SUB_Security_CertManager_SignThree_Func_0100 Failed to update. Code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
        })
      } catch (err) {
        console.error(`SUB_Security_CertManager_SignThree_Func_0100 Failed to update. Code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      try {
        certManager.update(undefined, srcData).then((result) => {
          console.info('SUB_Security_CertManager_SignThree_Func_0100 Succeeded in updating.');
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          console.error(`SUB_Security_CertManager_SignThree_Func_0100 Failed to update. Code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
        })
      } catch (err) {
        console.error(`SUB_Security_CertManager_SignThree_Func_0100 Failed to update. Code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      try {
        certManager.update(cmHandle, srcDataNull).then((result) => {
          console.info('SUB_Security_CertManager_SignThree_Func_0100 Succeeded in updating.');
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          console.error(`SUB_Security_CertManager_SignThree_Func_0100 Failed to update. Code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
        })
      } catch (err) {
        console.error(`SUB_Security_CertManager_SignThree_Func_0100 Failed to update. Code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      try {
        certManager.update(cmHandle, undefined).then((result) => {
          console.info('SUB_Security_CertManager_SignThree_Func_0100 Succeeded in updating.');
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          console.error(`SUB_Security_CertManager_SignThree_Func_0100 Failed to update. Code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
        })
      } catch (err) {
        console.error(`SUB_Security_CertManager_SignThree_Func_0100 Failed to update. Code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_SignThree_Func_0101
     * @tc.number SUB_Security_CertManager_SignThree_Func_0101
     * @tc.desc   use callback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_SignThree_Func_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let cmHandle: Uint8Array = new Uint8Array([
        0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08
      ]);
      let srcData: Uint8Array = new Uint8Array([
        0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08
      ]);
      let cmHandleNull: Uint8Array = new Uint8Array([]);
      let srcDataNull: Uint8Array = new Uint8Array([]);
      try {
        certManager.update(cmHandleNull, srcData, (err, result) => {
          if (err != null) {
            console.error(`SUB_Security_CertManager_SignThree_Func_0101 Failed to update. Code: ${err.code}, message: ${err.message}`);
            expect(null).assertFail();
          } else {
            console.info('SUB_Security_CertManager_SignThree_Func_0101 Succeeded in updating.');
            expect(null).assertFail();
          }
        });
      } catch (error) {
        console.error(`SUB_Security_CertManager_SignThree_Func_0101 Failed to update. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      try {
        certManager.update(undefined, srcData, (err, result) => {
          if (err != null) {
            console.error(`SUB_Security_CertManager_SignThree_Func_0101 Failed to update. Code: ${err.code}, message: ${err.message}`);
            expect(null).assertFail();
          } else {
            console.info('SUB_Security_CertManager_SignThree_Func_0101 Succeeded in updating.');
            expect(null).assertFail();
          }
        });
      } catch (error) {
        console.error(`SUB_Security_CertManager_SignThree_Func_0101 Failed to update. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      try {
        certManager.update(cmHandle, srcDataNull, (err, result) => {
          if (err != null) {
            console.error(`SUB_Security_CertManager_SignThree_Func_0101 Failed to update. Code: ${err.code}, message: ${err.message}`);
            expect(null).assertFail();
          } else {
            console.info('SUB_Security_CertManager_SignThree_Func_0101 Succeeded in updating.');
            expect(null).assertFail();
          }
        });
      } catch (error) {
        console.error(`SUB_Security_CertManager_SignThree_Func_0101 Failed to update. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      try {
        certManager.update(cmHandle, undefined, (err, result) => {
          if (err != null) {
            console.error(`SUB_Security_CertManager_SignThree_Func_0101 Failed to update. Code: ${err.code}, message: ${err.message}`);
            expect(null).assertFail();
          } else {
            console.info('SUB_Security_CertManager_SignThree_Func_0101 Succeeded in updating.');
            expect(null).assertFail();
          }
        });
      } catch (error) {
        console.error(`SUB_Security_CertManager_SignThree_Func_0101 Failed to update. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_SignThree_Func_0102
     * @tc.number SUB_Security_CertManager_SignThree_Func_0102
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_SignThree_Func_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let cmHandle: Uint8Array = new Uint8Array([
        0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08
      ]);
      let cmHandleNull: Uint8Array = new Uint8Array([]);
      let signRes: Uint8Array = new Uint8Array([
        0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08
      ]);
      let signResNull: Uint8Array = new Uint8Array([]);
      try {
        certManager.finish(cmHandleNull, signRes).then((cmResult) => {
          console.info('SUB_Security_CertManager_SignThree_Func_0102 Succeeded in finishing verification.');
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          console.error(`SUB_Security_CertManager_SignThree_Func_0102 Failed to finish verification. Code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
        })
      } catch(error) {
        console.error(`SUB_Security_CertManager_SignThree_Func_0102 Failed to finish. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      try {
        certManager.finish(undefined, signRes).then((cmResult) => {
          console.info('SUB_Security_CertManager_SignThree_Func_0102 Succeeded in finishing verification.');
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          console.error(`SUB_Security_CertManager_SignThree_Func_0102 Failed to finish verification. Code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
        })
      } catch(error) {
        console.error(`SUB_Security_CertManager_SignThree_Func_0102 Failed to finish. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      try {
        certManager.finish(cmHandle, signResNull).then((cmResult) => {
          console.info('SUB_Security_CertManager_SignThree_Func_0102 Succeeded in finishing verification.');
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          console.error(`SUB_Security_CertManager_SignThree_Func_0102 Failed to finish verification. Code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
        })
      } catch(error) {
        console.error(`SUB_Security_CertManager_SignThree_Func_0102 Failed to finish. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_SignThree_Func_0103
     * @tc.number SUB_Security_CertManager_SignThree_Func_0103
     * @tc.desc   use callback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_SignThree_Func_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let cmHandle: Uint8Array = new Uint8Array([
        0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08
      ]);
      let signRes: Uint8Array = new Uint8Array([
        0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08
      ]);
      let cmHandleNull: Uint8Array = new Uint8Array([]);
      let signResNull: Uint8Array = new Uint8Array([]);
      try {
        certManager.finish(cmHandleNull, signRes, (err, cmResult) => {
          if (err != null) {
            console.error(`SUB_Security_CertManager_SignThree_Func_0103 Failed to finish. Code: ${err.code}, message: ${err.message}`);
            expect(null).assertFail();
          } else {
            console.info('SUB_Security_CertManager_SignThree_Func_0103 Succeeded in finishing.');
            expect(null).assertFail();
          }
        });
      } catch(error) {
        console.error(`SUB_Security_CertManager_SignThree_Func_0103 Failed to finish. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      try {
        certManager.finish(undefined, signRes, (err, cmResult) => {
          if (err != null) {
            console.error(`SUB_Security_CertManager_SignThree_Func_0103 Failed to finish. Code: ${err.code}, message: ${err.message}`);
            expect(null).assertFail();
          } else {
            console.info('SUB_Security_CertManager_SignThree_Func_0103 Succeeded in finishing.');
            expect(null).assertFail();
          }
        });
      } catch(error) {
        console.error(`SUB_Security_CertManager_SignThree_Func_0103 Failed to finish. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      try {
        certManager.finish(cmHandle, signResNull, (err, cmResult) => {
          if (err != null) {
            console.error(`SUB_Security_CertManager_SignThree_Func_0103 Failed to finish. Code: ${err.code}, message: ${err.message}`);
            expect(null).assertFail();
          } else {
            console.info('SUB_Security_CertManager_SignThree_Func_0103 Succeeded in finishing.');
            expect(null).assertFail();
          }
        });
      } catch(error) {
        console.error(`SUB_Security_CertManager_SignThree_Func_0103 Failed to finish. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      try {
        certManager.finish(cmHandle, undefined, (err, cmResult) => {
          if (err != null) {
            console.error(`SUB_Security_CertManager_SignThree_Func_0103 Failed to finish. Code: ${err.code}, message: ${err.message}`);
            expect(null).assertFail();
          } else {
            console.info('SUB_Security_CertManager_SignThree_Func_0103 Succeeded in finishing.');
            expect(null).assertFail();
          }
        });
      } catch(error) {
        console.error(`SUB_Security_CertManager_SignThree_Func_0103 Failed to finish. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_SignThree_Func_0104
     * @tc.number SUB_Security_CertManager_SignThree_Func_0104
     * @tc.desc   use callback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_SignThree_Func_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let cmHandle: Uint8Array = new Uint8Array([]);
      try {
        certManager.finish(cmHandle, (err, cmResult) => {
          if (err != null) {
            console.error(`SUB_Security_CertManager_SignThree_Func_0104 Failed to finish. Code: ${err.code}, message: ${err.message}`);
          } else {
            if (cmResult?.outData != undefined) {
              let signRes: Uint8Array = cmResult.outData;
              console.info('SUB_Security_CertManager_SignThree_Func_0104 Succeeded in finishing.');
            } else {
              console.info('SUB_Security_CertManager_SignThree_Func_0104 The result of finishing is undefined.');
            }
          }
        });
        expect(null).assertFail();
      } catch(error) {
        console.error(`SUB_Security_CertManager_SignThree_Func_0104 Failed to finish. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }

      try {
        certManager.finish(null, (err, cmResult) => {
        });
        expect(null).assertFail();
      } catch(error) {
        console.error(`SUB_Security_CertManager_SignThree_Func_0104 Failed to null finish. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      
      try {
        certManager.finish(undefined, (err, cmResult) => {
        });
        expect(null).assertFail();
      } catch(error) {
        console.error(`SUB_Security_CertManager_SignThree_Func_0104 Failed to undefined finish. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_SignThree_Func_0105
     * @tc.number SUB_Security_CertManager_SignThree_Func_0105
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_SignThree_Func_0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let cmHandle: Uint8Array = new Uint8Array([]);
      try {
        certManager.abort(cmHandle).then((result) => {
          console.info('SUB_Security_CertManager_SignThree_Func_0105 Succeeded in aborting.');
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          console.error(`SUB_Security_CertManager_SignThree_Func_0105 Failed to abort. Code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
        })
      } catch (error) {
        console.error(`SUB_Security_CertManager_SignThree_Func_0105 Failed to abort. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      try {
        certManager.abort(undefined).then((result) => {
          console.info('SUB_Security_CertManager_SignThree_Func_0105 Succeeded in aborting.');
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          console.error(`SUB_Security_CertManager_SignThree_Func_0105 Failed to abort. Code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
        })
      } catch (error) {
        console.error(`SUB_Security_CertManager_SignThree_Func_0105 Failed to abort. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_SignThree_Func_0106
     * @tc.number SUB_Security_CertManager_SignThree_Func_0106
     * @tc.desc   use callback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_SignThree_Func_0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let cmHandle: Uint8Array = new Uint8Array([]);
      try {
        certManager.abort(cmHandle, (err, cmResult) => {
          if (err != null) {
            console.error(`SUB_Security_CertManager_SignThree_Func_0106 Failed to abort. Code: ${err.code}, message: ${err.message}`);
            expect(null).assertFail();
          } else {
            console.info('SUB_Security_CertManager_SignThree_Func_0106 Succeeded in aborting.');
            expect(null).assertFail();
          }
        });
      } catch(error) {
        console.error(`SUB_Security_CertManager_SignThree_Func_0106 Failed to abort. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      try {
        certManager.abort(undefined, (err, cmResult) => {
          if (err != null) {
            console.error(`SUB_Security_CertManager_SignThree_Func_0106 Failed to abort. Code: ${err.code}, message: ${err.message}`);
            expect(null).assertFail();
          } else {
            console.info('SUB_Security_CertManager_SignThree_Func_0106 Succeeded in aborting.');
            expect(null).assertFail();
          }
        });
      } catch(error) {
        console.error(`SUB_Security_CertManager_SignThree_Func_0106 Failed to abort. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

  })
}