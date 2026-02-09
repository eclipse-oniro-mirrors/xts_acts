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
import hilog from '@ohos.hilog'
import Utils from './Util.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function certManagerPubCertJsAPIFunctionTestUnitTwo() {
  describe('certManagerPubCertJsAPIFunctionTestUnitTwo', (): void => {
    beforeAll(() => {
    });
    beforeEach(async () => {
    });
    afterEach(() => {
    });
    afterAll(async () => {
    });

    /**
     * @tc.name   SUB_Security_CertManager_PriCertJsApi_Func_Static_0100
     * @tc.number SUB_Security_CertManager_PriCertJsApi_Func_Static_0100
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_PriCertJsApi_Func_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keystore: Uint8Array = new Uint8Array();
      let keystorePwd: string = '123456';
      let certAlias: string = 'appCertAliasDemoRsa';
      let keyUri: string | undefined;
      try {
        await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias);
        expect(null).assertFail();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, '%{public}s', `SUB_Security_CertManager_PriCertJsApi_Func_Static_0100 Failed to install private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_PriCertJsApi_Func_Static_0101
     * @tc.number SUB_Security_CertManager_PriCertJsApi_Func_Static_0101
     * @tc.desc   use callback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_PriCertJsApi_Func_Static_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keystore: Uint8Array = new Uint8Array();
      let keystorePwd: string = '123456';
      let certAlias: string = 'appCertAliasDemoRsa';
      let keyUri: string | undefined;
      try {
        certManager.installPrivateCertificate(keystore, keystorePwd, certAlias, (err: BusinessError<void> | null, CMResult: certManager.CMResult | undefined) => {
          if (err != null) {
            hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_PriCertJsApi_Func_Static_0101 Failed to install private certificate. Code: ${err.code}, message: ${err.message}`);
            expect(null).assertFail();
          } else {
            let ret: certManager.CMResult = CMResult ?? {} as certManager.CMResult;
            let uri: string | undefined = (ret?.uri == undefined) ? '' : ret.uri;
            hilog.error(domain, tag, '%{public}s', 'SUB_Security_CertManager_PriCertJsApi_Func_Static_0101 Succeeded in installing private certificate.');
            expect(null).assertFail();
          }
	      done();
        });
      } catch (error) {
        error = error as BusinessError;
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_PriCertJsApi_Func_Static_0101 Failed to install private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
	    done();
      }
    });

    /**
     * @tc.name   SUB_Security_CertManager_PriCertJsApi_Func_Static_0102
     * @tc.number SUB_Security_CertManager_PriCertJsApi_Func_Static_0102
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_PriCertJsApi_Func_Static_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keystore: Uint8Array = priRsaCredData;
      let keystorePwd: string = '777777';
      let certAlias: string = 'appCertAliasDemoRsa';
      let keyUri: string | undefined;
      await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias).then((cmResult: certManager.CMResult) => {
        let uri: string = cmResult.uri ?? '';
        hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_PriCertJsApi_Func_Static_0102 Succeeded in installing private certificate.');
      }).catch((err: Error) : void => {
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_PriCertJsApi_Func_Static_0102 Failed to install private certificate. Code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(17500003);
      })
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_PriCertJsApi_Func_Static_0103
     * @tc.number SUB_Security_CertManager_PriCertJsApi_Func_Static_0103
     * @tc.desc   use callback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_PriCertJsApi_Func_Static_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keystore: Uint8Array = priRsaCredData;
      let keystorePwd: string = '777777';
      let certAlias: string = 'appCertAliasDemoRsa';
      let keyUri: string | undefined;
      let CMResult: certManager.CMResult;
      try {
        certManager.installPrivateCertificate(keystore, keystorePwd, certAlias, (err: BusinessError<void> | null, CMResult: certManager.CMResult | undefined) => {
          if (err != null) {
            hilog.info(domain, tag, '%{public}s', `SUB_Security_CertManager_PriCertJsApi_Func_Static_0103 Failed to install private certificate. Code: ${err.code}, message: ${err.message}`);
            expect(err?.code).assertEqual(17500003);
          } else {
            let ret: certManager.CMResult = CMResult ?? {} as certManager.CMResult;
            let uri: string | undefined = (ret?.uri == undefined) ? '' : ret.uri;
            hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_PriCertJsApi_Func_Static_0103 Succeeded in installing private certificate.');
            expect(null).assertFail();
          }
        });
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, '%{public}s', `SUB_Security_CertManager_PriCertJsApi_Func_Static_0103 333 Failed to install private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_PriCertJsApi_Func_Static_0104
     * @tc.number SUB_Security_CertManager_PriCertJsApi_Func_Static_0104
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_PriCertJsApi_Func_Static_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keyUri: string | undefined = "";
      try {
        await certManager.uninstallPrivateCertificate(keyUri).then((): void => {
          hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_PriCertJsApi_Func_Static_0104 Succeeded in uninstalling private certificate.');
          expect(null).assertFail();
        }).catch((err: Error): void => {
          hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_PriCertJsApi_Func_Static_0104 Failed to uninstall private certificate. Code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
        })
      } catch (error) {
        error = error as BusinessError;
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_PriCertJsApi_Func_Static_0104 Failed1 to uninstall private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_PriCertJsApi_Func_Static_0105
     * @tc.number SUB_Security_CertManager_PriCertJsApi_Func_Static_0105
     * @tc.desc   use callback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_PriCertJsApi_Func_Static_0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keyUri: string | undefined = "";
      try {
        certManager.uninstallPrivateCertificate(keyUri, (err: BusinessError<void> | null) => {
          if (err != null) {
            hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_PriCertJsApi_Func_Static_0105 Failed to uninstall private certificate. Code: ${err.code}, message: ${err.message}`);
            expect(null).assertFail();
          } else {
            hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_PriCertJsApi_Func_Static_0105 Succeeded in uninstalling private certificate.');
            expect(null).assertFail();
          }
        });
      } catch (error) {
        error = error as BusinessError;
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_PriCertJsApi_Func_Static_0105 Failed to uninstall private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_SignThree_Func_Static_0100
     * @tc.number SUB_Security_CertManager_SignThree_Func_Static_0100
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_SignThree_Func_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cmHandle: Uint8Array = new Uint8Array([
        0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08
      ]);
      let srcData: Uint8Array = new Uint8Array();
      try {
        certManager.update(cmHandle, srcData).then((): void => {
          hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_SignThree_Func_Static_0100 Succeeded in updating.');
          expect(null).assertFail();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, '%{public}s', `SUB_Security_CertManager_SignThree_Func_Static_0100 Failed to update. Code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
        })
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_SignThree_Func_Static_0100 Failed1 to update. Code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_SignThree_Func_Static_0101
     * @tc.number SUB_Security_CertManager_SignThree_Func_Static_0101
     * @tc.desc   use callback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_SignThree_Func_Static_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cmHandle: Uint8Array = new Uint8Array([
        0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08
      ]);
      let srcData: Uint8Array = new Uint8Array();
      try {
        certManager.update(cmHandle, srcData, (err: BusinessError<void> | null) => {
          if (err != null) {
            hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_SignThree_Func_Static_0101 Failed to update. Code: ${err.code}, message: ${err.message}`);
            expect(null).assertFail();
          } else {
            hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_SignThree_Func_Static_0101 Succeeded in updating.');
            expect(null).assertFail();
          }
        });
      } catch (error) {
        error = error as BusinessError;
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_SignThree_Func_Static_0101 Failed to update. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_SignThree_Func_Static_0102
     * @tc.number SUB_Security_CertManager_SignThree_Func_Static_0102
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_SignThree_Func_Static_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cmHandle: Uint8Array = new Uint8Array([
        0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08
      ]);
      let signRes: Uint8Array = new Uint8Array();
      try {
        certManager.finish(cmHandle, signRes).then((cmResult: certManager.CMResult) => {
          hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_SignThree_Func_Static_0102 Succeeded in finishing verification.');
          expect(null).assertFail();
        }).catch((err: Error): void => {
          hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_SignThree_Func_Static_0102 Failed to finish verification. Code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
        })
      } catch(error) {
        error = error as BusinessError;
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_SignThree_Func_Static_0102 Failed to finish. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_SignThree_Func_Static_0103
     * @tc.number SUB_Security_CertManager_SignThree_Func_Static_0103
     * @tc.desc   use callback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_SignThree_Func_Static_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cmHandle: Uint8Array = new Uint8Array([
        0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08
      ]);
      let signRes: Uint8Array = new Uint8Array();
      try {
        certManager.finish(cmHandle, signRes, (err: BusinessError<void> | null, CMResult: certManager.CMResult | undefined) => {
          if (err != null) {
            hilog.info(domain, tag, '%{public}s', `SUB_Security_CertManager_SignThree_Func_Static_0103 Failed to finish. Code: ${err.code}, message: ${err.message}`);
            expect(null).assertFail();
          } else {
            hilog.error(domain, tag, '%{public}s', 'SUB_Security_CertManager_SignThree_Func_Static_0103 Succeeded in finishing.');
            expect(null).assertFail();
          }
        });
      } catch(error) {
        error = error as BusinessError;
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_SignThree_Func_Static_0103 Failed to finish. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_SignThree_Func_Static_0104
     * @tc.number SUB_Security_CertManager_SignThree_Func_Static_0104
     * @tc.desc   use callback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_SignThree_Func_Static_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cmHandle: Uint8Array = new Uint8Array();
      try {
        certManager.finish(cmHandle, (err: BusinessError<void> | null, CMResult: certManager.CMResult | undefined) => {
          if (err != null) {
            hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_SignThree_Func_Static_0104 Failed to finish. Code: ${err.code}, message: ${err.message}`);
          } else {
            if (CMResult?.outData != undefined) {
              let ret: certManager.CMResult = CMResult ?? {} as certManager.CMResult;
              let signRes: Uint8Array|undefined = ret.outData;
              hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_SignThree_Func_Static_0104 Succeeded in finishing.');
            } else {
              hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_SignThree_Func_Static_0104 The result of finishing is undefined.');
            }
          }
        });
        expect(null).assertFail();
      } catch(error) {
        error = error as BusinessError;
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_SignThree_Func_Static_0104 Failed to finish. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_SignThree_Func_Static_0105
     * @tc.number SUB_Security_CertManager_SignThree_Func_Static_0105
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_SignThree_Func_Static_0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cmHandle: Uint8Array = new Uint8Array();
      try {
        certManager.abort(cmHandle).then((): void => {
          hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_SignThree_Func_Static_0105 Succeeded in aborting.');
          expect(null).assertFail();
        }).catch((err: Error): void => {
          hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_SignThree_Func_Static_0105 Failed to abort. Code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
        })
      } catch (error) {
        error = error as BusinessError;
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_SignThree_Func_Static_0105 Failed to abort. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_SignThree_Func_Static_0106
     * @tc.number SUB_Security_CertManager_SignThree_Func_Static_0106
     * @tc.desc   use callback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_SignThree_Func_Static_0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cmHandle: Uint8Array = new Uint8Array();
      try {
        certManager.abort(cmHandle, (err: BusinessError<void> | null) => {
          if (err != null) {
            hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_SignThree_Func_Static_0106 Failed to abort. Code: ${err.code}, message: ${err.message}`);
            expect(null).assertFail();
          } else {
            hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_SignThree_Func_Static_0106 Succeeded in aborting.');
            expect(null).assertFail();
          }
        });
      } catch(error) {
        error = error as BusinessError;
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_SignThree_Func_Static_0106 Failed to abort. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

  })
}