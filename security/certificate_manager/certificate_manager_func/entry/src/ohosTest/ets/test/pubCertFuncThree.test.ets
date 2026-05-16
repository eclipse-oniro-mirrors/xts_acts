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
function generateString(len: number){
  let str: string = 'a';
  return str.repeat(len);
}
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

      try {
        await certManager.getPrivateCertificate("");
        console.error(`SUB_Security_CertManager_GetPriCertJsApi_Func_0100 private certificate success. `);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CertManager_GetPriCertJsApi_Func_0100 Failed1 to get private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }

      try {
        await certManager.getPrivateCertificate(null);
        console.error(`SUB_Security_CertManager_GetPriCertJsApi_Func_0100 private certificate success. `);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CertManager_GetPriCertJsApi_Func_0100 Failed2 to get private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }

      try {
        await certManager.getPrivateCertificate(undefined);
        console.error(`SUB_Security_CertManager_GetPriCertJsApi_Func_0100 private certificate success. `);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CertManager_GetPriCertJsApi_Func_0100 Failed3 to get private certificate. Code: ${error.code}, message: ${error.message}`);
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

      try {
        cmResult2 = await new Promise<certManager.CMResult>((resolve, reject) => {
          certManager.getPrivateCertificate("", (err: Error, CMResult: certManager.CMResult) => {
            if (err) {
              reject(err);
            } else {
              resolve(CMResult);
            }
          });
        });
      } catch (err) {
        console.error(`SUB_Security_CertManager_GetPriCertJsApi_Func_0101 Failed to get null private certificate. Code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      }

      try {
        cmResult2 = await new Promise<certManager.CMResult>((resolve, reject) => {
          certManager.getPrivateCertificate(null, (err: Error, CMResult: certManager.CMResult) => {
            if (err) {
              reject(err);
            } else {
              resolve(CMResult);
            }
          });
        });
      } catch (err) {
        console.error(`SUB_Security_CertManager_GetPriCertJsApi_Func_0101 Failed to get null private certificate. Code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
  
      try {
        cmResult2 = await new Promise<certManager.CMResult>((resolve, reject) => {
          certManager.getPrivateCertificate(undefined, (err: Error, CMResult: certManager.CMResult) => {
            if (err) {
              reject(err);
            } else {
              resolve(CMResult);
            }
          });
        });
      } catch (err) {
        console.error(`SUB_Security_CertManager_GetPriCertJsApi_Func_0101 Failed to get undefined private certificate. Code: ${err.code}, message: ${err.message}`);
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
      const param1 = ["", null, undefined];
      for (let i = 0; i < param1.length; i++) {
        try {
          CMHandle1 = await new Promise<certManager.CMHandle>((resolve, reject) => {
            certManager.init(param1[i], req, (err: Error, CMHandle: certManager.CMHandle) => {
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
          expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
        }
      }
      const param2 = [null, undefined];
      for (let i = 0; i < param2.length; i++) {
        try {
          CMHandle1 = await new Promise<certManager.CMHandle>((resolve, reject) => {
            certManager.init(uri, param2[i], (err: Error, CMHandle: certManager.CMHandle) => {
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
          expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
        }
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
      const param1 = ["",null,undefined];
      for(let i=0;i<param1.length;i++){
        try {
          await certManager.init(param1[i], req);
          console.error(`SUB_Security_CertManager_GetPriCertJsApi_Func_0106 init success. `);
          expect(null).assertFail();
        } catch (err) {
          console.error("SUB_Security_CertManager_GetPriCertJsApi_Func_0106 init err: " + err.code);
          expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
        }
      }
      const param2 = [null,undefined];
      for(let i=0;i<param2.length;i++){
        try {
          await certManager.init(uri, param2[i]);
          console.error(`SUB_Security_CertManager_GetPriCertJsApi_Func_0106 init success. `);
          expect(null).assertFail();
        } catch (err) {
          console.error("SUB_Security_CertManager_GetPriCertJsApi_Func_0106 init err: " + err.code);
          expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
        }
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
    /**
     * @tc.name   SUB_Security_CertManager_getUkeyCertificateList_func_0020
     * @tc.number SUB_Security_CertManager_getUkeyCertificateList_func_0020
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_getUkeyCertificateList_func_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("SUB_Security_CertManager_getUkeyCertificateList_func_0020: started ");
      let ukeyProvider: string = 'testProvider'; 
      let ukeyInfo: certManager.UkeyInfo = { 
        certPurpose: certManager.CertificatePurpose.PURPOSE_ENCRYPT,
      }
      try {
        await certManager.getUkeyCertificateList("", ukeyInfo);
      } catch (error) {
        if(error.code !== 801){
        console.error(`SUB_Security_CertManager_getUkeyCertificateList_func_0020 failed. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(17500001);
        }
      }
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_getUkeyCertificateList_func_0021
     * @tc.number SUB_Security_CertManager_getUkeyCertificateList_func_0021
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_getUkeyCertificateList_func_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("SUB_Security_CertManager_getUkeyCertificateList_func_0021: started ");
      let ukeyProvider: string = 'testProvider'; 
      let ukeyInfo: certManager.UkeyInfo = { 
        certPurpose: certManager.CertificatePurpose.PURPOSE_ENCRYPT,
      }
      try {
        await certManager.getUkeyCertificateList(null, ukeyInfo);
      } catch (error) {
        if(error.code !== 801){
          console.error(`SUB_Security_CertManager_getUkeyCertificateList_func_0021 failed. Code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(401);
        }
      }
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_getUkeyCertificateList_func_0022
     * @tc.number SUB_Security_CertManager_getUkeyCertificateList_func_0022
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_getUkeyCertificateList_func_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("SUB_Security_CertManager_getUkeyCertificateList_func_0022: started ");
      let ukeyProvider: string = 'testProvider'; 
      let ukeyInfo: certManager.UkeyInfo = { 
        certPurpose: certManager.CertificatePurpose.PURPOSE_ENCRYPT,
      }
      try {
        await certManager.getUkeyCertificateList(undefined, ukeyInfo);
      } catch (error) {
        if(error.code !== 801){
          console.error(`SUB_Security_CertManager_getUkeyCertificateList_func_0022 failed. Code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(401);
        }
      }
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_getUkeyCertificateList_func_0023
     * @tc.number SUB_Security_CertManager_getUkeyCertificateList_func_0023
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_getUkeyCertificateList_func_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("SUB_Security_CertManager_getUkeyCertificateList_func_0023: started ");
      let ukeyProvider: string = 'testProvider'; 
      let ukeyInfo: certManager.UkeyInfo = { 
        certPurpose: certManager.CertificatePurpose.PURPOSE_ENCRYPT,
      }
      try {
        await certManager.getUkeyCertificateList(ukeyProvider, null);
      } catch (error) {
        if(error.code !== 801){
          console.error(`SUB_Security_CertManager_getUkeyCertificateList_func_0023 failed. Code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(401);
        }
      }
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_getUkeyCertificateList_func_0024
     * @tc.number SUB_Security_CertManager_getUkeyCertificateList_func_0024
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_getUkeyCertificateList_func_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("SUB_Security_CertManager_getUkeyCertificateList_func_0024: started ");
      let ukeyProvider: string = 'testProvider'; 
      let ukeyInfo: certManager.UkeyInfo = { 
        certPurpose: certManager.CertificatePurpose.PURPOSE_ENCRYPT,
      }
      try {
        await certManager.getUkeyCertificateList(ukeyProvider, undefined);
      } catch (error) {
        if(error.code !== 801){
          console.error(`SUB_Security_CertManager_getUkeyCertificateList_func_0024 failed. Code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(17500011);
        }
      }
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_getPrivateCertificate_Func_0100
     * @tc.number SUB_Security_CertManager_getPrivateCertificate_Func_0100
     * @tc.desc   Call getPrivateCertificate interface with length of keyUri is 256 return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_getPrivateCertificate_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_getPrivateCertificate_Func_0100: started ");
      let uri: string = 'oh:t=ak;o=object;u=100;a=20010045';
      let uriObject = generateString(256-27);
      try {
        await certManager.getPrivateCertificate(uri.replace("object", uriObject));
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CertManager_getPrivateCertificate_Func_0100 Failed to get private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      console.log("SUB_Security_CertManager_getPrivateCertificate_Func_0100: end ");
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_getPrivateCertificate_Func_0200
     * @tc.number SUB_Security_CertManager_getPrivateCertificate_Func_0200
     * @tc.desc   Call getPrivateCertificate interface with length of keyUri is 255 return 17500002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_getPrivateCertificate_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_getPrivateCertificate_Func_0200: started ");
      let uri: string = 'oh:t=ak;o=object;u=100;a=20010045';
      let uriObject = generateString(255-27);
      try {
          certManager.getPrivateCertificate(uri.replace("object", uriObject), (err, cmResult)=>{
          expect(err.code).assertEqual(17500002);
          console.log("SUB_Security_CertManager_getPrivateCertificate_Func_0200: end ");
          done();
        });
      } catch (error) {
        console.error(`SUB_Security_CertManager_getPrivateCertificate_Func_0200 Failed to get private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(17500002);
        console.log("SUB_Security_CertManager_getPrivateCertificate_Func_0200: end ");
        done();
      }
    });
    /**
     * @tc.name   SUB_Security_CertManager_getPrivateCertificate_Func_0300
     * @tc.number SUB_Security_CertManager_getPrivateCertificate_Func_0300
     * @tc.desc   Call getPrivateCertificate interface with length of keyUri is 257 return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_getPrivateCertificate_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_getPrivateCertificate_Func_0300: started ");
      let uri: string = 'oh:t=ak;o=object;u=100;a=20010045';
      let uriObject = generateString(257-27);
      try {
        await certManager.getPrivateCertificate(uri.replace("object", uriObject));
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CertManager_getPrivateCertificate_Func_0300 Failed to get private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      console.log("SUB_Security_CertManager_getPrivateCertificate_Func_0300: end ");
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_getPrivateCertificate_Func_0400
     * @tc.number SUB_Security_CertManager_getPrivateCertificate_Func_0400
     * @tc.desc   Call getPrivateCertificate interface with length of keyUri is 255 return 17500002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_getPrivateCertificate_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_getPrivateCertificate_Func_0400: started ");
      let uri: string = 'oh:t=ak;o=object;u=100;a=20010045';
      let uriObject = generateString(255-27);
      certManager.getPrivateCertificate(uri.replace("object", uriObject), (err, cmResult)=>{
        expect(err.code).assertEqual(17500002);
        console.error(`SUB_Security_CertManager_getPrivateCertificate_Func_0400 Failed to get private certificate. Code: ${err.code}, message: ${err.message}`);
        done();
      });

    });
    /**
     * @tc.name   SUB_Security_CertManager_InitJsApi_Func_0100
     * @tc.number SUB_Security_CertManager_InitJsApi_Func_0100
     * @tc.desc   Call init interface with length of keyUri is 255 return 17500001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_InitJsApi_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_InitJsApi_Func_0100: started ");
      let uri: string = 'oh:t=ak;o=object;u=100;a=20010045';
      let uriObject = generateString(255-27);
      const req: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN,
        padding: certManager.CmKeyPadding.CM_PADDING_PSS,
        digest: certManager.CmKeyDigest.CM_DIGEST_SHA256
      }
      try {
        await certManager.init(uri.replace("object", uriObject),req);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CertManager_InitJsApi_Func_0100 failed. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(17500001);
      }
      console.log("SUB_Security_CertManager_InitJsApi_Func_0100: end ");
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_InitJsApi_Func_0200
     * @tc.number SUB_Security_CertManager_InitJsApi_Func_0200
     * @tc.desc   Call init interface with length of keyUri is 256 return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_InitJsApi_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_InitJsApi_Func_0200: started ");
      let uri: string = 'oh:t=ak;o=object;u=100;a=20010045';
      let uriObject = generateString(256-27);
      const req: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN,
        padding: certManager.CmKeyPadding.CM_PADDING_PSS,
        digest: certManager.CmKeyDigest.CM_DIGEST_SHA256
      }
      try {
        await certManager.init(uri.replace("object", uriObject),req);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CertManager_InitJsApi_Func_0200 failed. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      console.log("SUB_Security_CertManager_InitJsApi_Func_0200: end ");
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_InitJsApi_Func_0300
     * @tc.number SUB_Security_CertManager_InitJsApi_Func_0300
     * @tc.desc   Call init interface with length of keyUri is 255 return 17500001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_InitJsApi_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_InitJsApi_Func_0300: started ");
      let uri: string = 'oh:t=ak;o=object;u=100;a=20010045';
      let uriObject = generateString(255-27);
      const req: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN,
        padding: certManager.CmKeyPadding.CM_PADDING_PSS,
        digest: certManager.CmKeyDigest.CM_DIGEST_SHA256
      }
      certManager.init(uri.replace("object", uriObject),req, (err, CMHandle)=>{
        expect(err.code).assertEqual(17500001);
        console.error(`SUB_Security_CertManager_InitJsApi_Func_0300 failed. Code: ${err.code}, message: ${err.message}`);
        done();
      });
    });
    /**
     * @tc.name   SUB_Security_CertManager_InitJsApi_Func_0400
     * @tc.number SUB_Security_CertManager_InitJsApi_Func_0400
     * @tc.desc   Call init interface with length of keyUri is 256 return 17500001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_InitJsApi_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_InitJsApi_Func_0400: started ");
      let uri: string = 'oh:t=ak;o=object;u=100;a=20010045';
      let uriObject = generateString(255-27);
      const req: certManager.CMSignatureSpec = {
        purpose: certManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN,
        padding: certManager.CmKeyPadding.CM_PADDING_PSS,
        digest: certManager.CmKeyDigest.CM_DIGEST_SHA256
      }
      certManager.init(uri.replace("object", uriObject),req, (err, CMHandle)=>{
        expect(err.code).assertEqual(17500001);
        console.error(`SUB_Security_CertManager_InitJsApi_Func_0400 failed. Code: ${err.code}, message: ${err.message}`);
        done();
      });
    });

    /**
     * @tc.name   SUB_Security_CertManager_ImportUkeyCertificate_Func_0300
     * @tc.number SUB_Security_CertManager_ImportUkeyCertificate_Func_0300
     * @tc.desc   keyUri is empty string, return error code 17500011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_ImportUkeyCertificate_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_0300 start');
      let keyUri: string = '';
      let certData: Uint8Array = new Uint8Array([0x30, 0x82, 0x0b, 0xc1, 0x02, 0x01]);
      let ukeyInfo: certManager.UkeyInfo = {
        certPurpose: certManager.CertificatePurpose.PURPOSE_SIGN,
      };
	  try {
          await certManager.importUkeyCertificate(keyUri, certData, ukeyInfo);
          expect(null).assertFail();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(`SUB_Security_CertManager_ImportUkeyCertificate_Func_0300 failed. Code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(17500011);
      }
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_0300 end');
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_ImportUkeyCertificate_Func_0600
     * @tc.number SUB_Security_CertManager_ImportUkeyCertificate_Func_0600
     * @tc.desc   cert is empty Uint8Array, return error code 17500011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_ImportUkeyCertificate_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_0600 start');
      let keyUri: string = 'test';
      let emptyCertData: Uint8Array = new Uint8Array([]);
      let ukeyInfo: certManager.UkeyInfo = {
        certPurpose: certManager.CertificatePurpose.PURPOSE_SIGN,
      };
	  try {
          await certManager.importUkeyCertificate(keyUri, emptyCertData, ukeyInfo);
          expect(null).assertFail();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(`SUB_Security_CertManager_ImportUkeyCertificate_Func_0600 failed. Code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(17500011);
      }
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_0600 end');
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_ImportUkeyCertificate_Func_1700
     * @tc.number SUB_Security_CertManager_ImportUkeyCertificate_Func_1700
     * @tc.desc   ukeyInfo without certPurpose, return error code 17500010 on PC device or 801 on non-PC device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_ImportUkeyCertificate_Func_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_1700 start');
      let keyUri: string = 'test';
      let certData: Uint8Array = new Uint8Array([0x30, 0x82, 0x0b, 0xc1, 0x02, 0x01]);
      let ukeyInfo: certManager.UkeyInfo = {};
      if (canIUse('SystemCapability.Security.Huks.CryptoExtension')) {
        try {
          await certManager.importUkeyCertificate(keyUri, certData, ukeyInfo);
          expect(null).assertFail();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(`SUB_Security_CertManager_ImportUkeyCertificate_Func_1700 failed. Code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(17500010);
        }
      } else {
        try {
          await certManager.importUkeyCertificate(keyUri, certData, ukeyInfo);
          expect(null).assertFail();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(`SUB_Security_CertManager_ImportUkeyCertificate_Func_1700 failed. Code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(801);
        }
      }
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_1700 end');
      done();
    });
  })
}