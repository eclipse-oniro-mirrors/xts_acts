/*
 * Copyright (C) 2024-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import { cert } from "@kit.DeviceCertificateKit";
import {
  certPem,
  IS_PEM,
  IS_SYNC,
  NEED_CA,
  NEED_OTHER_CA,
  NEED_PRIV_KEY,
  OH_Pkcs12DataMap,
  ONLY_OTHER,
  otherCertPem1,
  otherCertPem2,
  priKeyPem,
  setMacParams,
  setPbesParams,
  stringToUint8Array
} from "./utils/certificate/certPem";


export default function certFrameworkCreateP12CertTestUnit() {
  describe("certFrameworkCreateP12CertTestUnit", (): void => {

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_0100
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_0100
     * @tc.desc   All Params, Format Is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig: cert.Pkcs12CreationConfig = {
          password: "123456"
        };
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, IS_SYNC);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        let ret: boolean = await map.checkPkcs12(algName, p12);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_0100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_0200
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_0200
     * @tc.desc   CaCert And OtherCert Params, Format Is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig: cert.Pkcs12CreationConfig = {
          password: "123456"
        };
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, IS_SYNC, !IS_PEM, !NEED_PRIV_KEY);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        /* 创建p12时，如果未添加私钥，只添加了公钥证书和其他证书，p12解析后该公钥证书存放在其他证书里面 */
        let ret: boolean = await map.checkPkcs12(algName, p12, IS_PEM, !ONLY_OTHER, !NEED_PRIV_KEY, !NEED_CA);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_0200 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_0300
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_0300
     * @tc.desc   PriKey And OtherCert Params, Format Is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig: cert.Pkcs12CreationConfig = {
          password: "123456"
        };
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, IS_SYNC, !IS_PEM, NEED_PRIV_KEY, !NEED_CA);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        /* 创建p12时，如果未添加公钥证书，只添加了私钥，和1本私钥签发的其他证书1本其他证书，p12解析后该私钥签发的其他证书存放在证书里面 */
        let ret: boolean = await map.checkPkcs12(algName, p12);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_0300 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_0400
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_0400
     * @tc.desc   PriKey And Cert Params, Format Is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig: cert.Pkcs12CreationConfig = {
          password: "123456"
        };
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, IS_SYNC, !IS_PEM, NEED_PRIV_KEY, NEED_CA, !NEED_OTHER_CA);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        let ret: boolean = await map.checkPkcs12(algName, p12, IS_PEM, !ONLY_OTHER, NEED_PRIV_KEY, NEED_CA, !NEED_OTHER_CA);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_0400 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_0500
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_0500
     * @tc.desc   Only PriKey Params, Format Is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig: cert.Pkcs12CreationConfig = {
          password: "123456"
        };
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, IS_SYNC, !IS_PEM, NEED_PRIV_KEY, !NEED_CA, !NEED_OTHER_CA);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        let ret: boolean = await map.checkPkcs12(algName, p12, IS_PEM, !ONLY_OTHER, NEED_PRIV_KEY, !NEED_CA, !NEED_OTHER_CA);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_0500 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_0600
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_0600
     * @tc.desc   Only Ca Cert Params, Format Is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig: cert.Pkcs12CreationConfig = {
          password: "123456"
        };
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA
        };
        let algName: string = "RSA";
        console.log("################ SUB_Security_Cert_Framework_CreateP12_Func_0600");
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, IS_SYNC, !IS_PEM, !NEED_PRIV_KEY, NEED_CA, !NEED_OTHER_CA);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        /* 创建p12时，只添加了公钥证书，p12解析后该证书存放在其他证书里面 */
        let ret: boolean = await map.checkPkcs12(algName, p12, IS_PEM, !ONLY_OTHER, !NEED_PRIV_KEY, !NEED_CA);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_0600 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_0700
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_0700
     * @tc.desc   Only Other Cert Params, Format Is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig: cert.Pkcs12CreationConfig = {
          password: "123456"
        };
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA
        };
        let algName: string = "RSA";
        console.log("################ SUB_Security_Cert_Framework_CreateP12_Func_0700");
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, IS_SYNC, IS_PEM, !NEED_PRIV_KEY, !NEED_CA);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        let ret: boolean = await map.checkPkcs12(algName, p12, IS_PEM, ONLY_OTHER, !NEED_PRIV_KEY, !NEED_CA);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_0700 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_0800
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_0800
     * @tc.desc   All Params, Format Is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig : cert.Pkcs12CreationConfig = {
          password : "123456",
          keyEncParams : map.setPbesParams(8, 16, cert.PbesEncryptionAlgorithm.AES_128_CBC),
          encryptCert : false,
          certEncParams : map.setPbesParams(13, 1024, cert.PbesEncryptionAlgorithm.AES_256_CBC),
          macSaltLen : 18,
          macIterations : 1000,
          macDigestAlgorithm : cert.Pkcs12MacDigestAlgorithm.SHA256
        }
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, IS_SYNC);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        let ret: boolean = await map.checkPkcs12(algName, p12);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_0800 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_0900
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_0900
     * @tc.desc   CaCert And OtherCert Params, Format Is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig : cert.Pkcs12CreationConfig = {
          password : "123456",
          keyEncParams : map.setPbesParams(11, 32, cert.PbesEncryptionAlgorithm.AES_192_CBC),
          encryptCert : false,
          certEncParams : map.setPbesParams(9, 16, cert.PbesEncryptionAlgorithm.AES_192_CBC),
          macSaltLen : 18,
          macIterations : 1000,
          macDigestAlgorithm : cert.Pkcs12MacDigestAlgorithm.SHA384
        }
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, IS_SYNC, IS_PEM, !NEED_PRIV_KEY);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        /* 创建p12时，如果未添加私钥，只添加了公钥证书和其他证书，p12解析后该公钥证书存放在其他证书里面 */
        let ret: boolean = await map.checkPkcs12(algName, p12, IS_PEM, !ONLY_OTHER, !NEED_PRIV_KEY, !NEED_CA);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_0900 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_1000
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_1000
     * @tc.desc   PriKey And OtherCert Params, Format Is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig : cert.Pkcs12CreationConfig = {
          password : "123456",
          keyEncParams : map.setPbesParams(15, 32, cert.PbesEncryptionAlgorithm.AES_256_CBC),
          encryptCert : true,
          certEncParams : map.setPbesParams(18, 64, cert.PbesEncryptionAlgorithm.AES_128_CBC),
          macSaltLen : 18,
          macIterations : 1000,
          macDigestAlgorithm : cert.Pkcs12MacDigestAlgorithm.SHA512
        }
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, IS_SYNC, IS_PEM, NEED_PRIV_KEY, !NEED_CA);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        /* 创建p12时，如果未添加公钥证书，只添加了私钥，和1本私钥签发的其他证书1本其他证书，p12解析后该私钥签发的其他证书存放在证书里面 */
        let ret: boolean = await map.checkPkcs12(algName, p12);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_1000 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_1100
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_1100
     * @tc.desc   PriKey And Cert Params, Format Is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig : cert.Pkcs12CreationConfig = {
          password : "123456",
          keyEncParams : map.setPbesParams(16, 32, cert.PbesEncryptionAlgorithm.AES_192_CBC),
          encryptCert : true,
          certEncParams : map.setPbesParams(8, 1024, cert.PbesEncryptionAlgorithm.AES_256_CBC),
          macSaltLen : 18,
          macIterations : 1000,
          macDigestAlgorithm : cert.Pkcs12MacDigestAlgorithm.SHA256
        }
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, IS_SYNC, IS_PEM, NEED_PRIV_KEY, NEED_CA, !NEED_OTHER_CA);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        let ret: boolean = await map.checkPkcs12(algName, p12, IS_PEM, !ONLY_OTHER, NEED_PRIV_KEY, NEED_CA, !NEED_OTHER_CA);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_1100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_1200
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_1200
     * @tc.desc   Only PriKey Params, Format Is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig : cert.Pkcs12CreationConfig = {
          password : "123456",
          keyEncParams : map.setPbesParams(16, 32, cert.PbesEncryptionAlgorithm.AES_256_CBC),
          encryptCert : true,
          certEncParams : map.setPbesParams(14, 1000, cert.PbesEncryptionAlgorithm.AES_256_CBC),
          macSaltLen : 18,
          macIterations : 1000,
          macDigestAlgorithm : cert.Pkcs12MacDigestAlgorithm.SHA384
        }
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, IS_SYNC, IS_PEM, NEED_PRIV_KEY, !NEED_CA, !NEED_OTHER_CA);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        let ret: boolean = await map.checkPkcs12(algName, p12, IS_PEM, !ONLY_OTHER, NEED_PRIV_KEY, !NEED_CA, !NEED_OTHER_CA);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_1200 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_1300
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_1300
     * @tc.desc   Only Ca Cert Params, Format Is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig : cert.Pkcs12CreationConfig = {
          password : "123456",
          keyEncParams : map.setPbesParams(16, 32, cert.PbesEncryptionAlgorithm.AES_256_CBC),
          encryptCert : true,
          certEncParams : map.setPbesParams(17, 1, cert.PbesEncryptionAlgorithm.AES_192_CBC),
          macSaltLen : 18,
          macIterations : 1000,
          macDigestAlgorithm : cert.Pkcs12MacDigestAlgorithm.SHA512
        }
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, IS_SYNC, IS_PEM, !NEED_PRIV_KEY, NEED_CA, !NEED_OTHER_CA);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        /* 创建p12时，只添加了公钥证书，p12解析后该证书存放在其他证书里面 */
        let ret: boolean = await map.checkPkcs12(algName, p12, IS_PEM, !ONLY_OTHER, !NEED_PRIV_KEY, !NEED_CA);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_1300 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_1400
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_1400
     * @tc.desc   Only Other Cert Params, Format Is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig : cert.Pkcs12CreationConfig = {
          password : "123456",
          keyEncParams : map.setPbesParams(16, 1, cert.PbesEncryptionAlgorithm.AES_192_CBC),
          encryptCert : true,
          certEncParams : map.setPbesParams(8, 10, cert.PbesEncryptionAlgorithm.AES_256_CBC),
          macSaltLen : 18,
          macIterations : 1000,
          macDigestAlgorithm : cert.Pkcs12MacDigestAlgorithm.SHA384
        }
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, IS_SYNC, IS_PEM, !NEED_PRIV_KEY, !NEED_CA);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        let ret: boolean = await map.checkPkcs12(algName, p12, IS_PEM, ONLY_OTHER, !NEED_PRIV_KEY, !NEED_CA);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_1400 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_1500
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_1500
     * @tc.desc   All Params, Format Is PEM, Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig: cert.Pkcs12CreationConfig = {
          password: "123456"
        };
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, !IS_SYNC);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        let ret: boolean = await map.checkPkcs12(algName, p12);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_1500 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_1600
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_1600
     * @tc.desc   CaCert And OtherCert Params, Format Is PEM, Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig: cert.Pkcs12CreationConfig = {
          password: "123456"
        };
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, !IS_SYNC, IS_PEM, !NEED_PRIV_KEY);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        /* 创建p12时，如果未添加私钥，只添加了公钥证书和其他证书，p12解析后该公钥证书存放在其他证书里面 */
        let ret: boolean = await map.checkPkcs12(algName, p12, IS_PEM, !ONLY_OTHER, !NEED_PRIV_KEY, !NEED_CA);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_1600 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_1700
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_1700
     * @tc.desc   PriKey And OtherCert Params, Format Is PEM, Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig: cert.Pkcs12CreationConfig = {
          password: "123456"
        };
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, !IS_SYNC, IS_PEM, NEED_PRIV_KEY, !NEED_CA);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        /* 创建p12时，如果未添加公钥证书，只添加了私钥，和1本私钥签发的其他证书1本其他证书，p12解析后该私钥签发的其他证书存放在证书里面 */
        let ret: boolean = await map.checkPkcs12(algName, p12);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_1700 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_1800
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_1800
     * @tc.desc   PriKey And Cert Params, Format Is PEM, Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig: cert.Pkcs12CreationConfig = {
          password: "123456"
        };
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, !IS_SYNC, IS_PEM, NEED_PRIV_KEY, NEED_CA, !NEED_OTHER_CA);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        let ret: boolean = await map.checkPkcs12(algName, p12, IS_PEM, !ONLY_OTHER, NEED_PRIV_KEY, NEED_CA, !NEED_OTHER_CA);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_1800 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_1900
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_1900
     * @tc.desc   Only PriKey Params, Format Is PEM, Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig: cert.Pkcs12CreationConfig = {
          password: "123456"
        };
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, !IS_SYNC, IS_PEM, NEED_PRIV_KEY, !NEED_CA, !NEED_OTHER_CA);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        let ret: boolean = await map.checkPkcs12(algName, p12, IS_PEM, !ONLY_OTHER, NEED_PRIV_KEY, !NEED_CA, !NEED_OTHER_CA);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_1900 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_2000
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_2000
     * @tc.desc   Only Ca Cert Params, Format Is PEM, Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig: cert.Pkcs12CreationConfig = {
          password: "123456"
        };
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, !IS_SYNC, IS_PEM, !NEED_PRIV_KEY, NEED_CA, !NEED_OTHER_CA);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        /* 创建p12时，只添加了公钥证书，p12解析后该证书存放在其他证书里面 */
        let ret: boolean = await map.checkPkcs12(algName, p12, IS_PEM, !ONLY_OTHER, !NEED_PRIV_KEY, !NEED_CA);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_2000 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_2100
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_2100
     * @tc.desc   Only Other Cert Params, Format Is PEM, Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig: cert.Pkcs12CreationConfig = {
          password: "123456"
        };
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, !IS_SYNC, IS_PEM, !NEED_PRIV_KEY, !NEED_CA);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        let ret: boolean = await map.checkPkcs12(algName, p12, IS_PEM, ONLY_OTHER, !NEED_PRIV_KEY, !NEED_CA);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_2100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_2200
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_2200
     * @tc.desc   All Params, Format Is PEM, Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig : cert.Pkcs12CreationConfig = {
          password : "123456",
          keyEncParams : map.setPbesParams(8, 16, cert.PbesEncryptionAlgorithm.AES_128_CBC),
          encryptCert : false,
          certEncParams : map.setPbesParams(13, 1024, cert.PbesEncryptionAlgorithm.AES_256_CBC),
          macSaltLen : 18,
          macIterations : 1000,
          macDigestAlgorithm : cert.Pkcs12MacDigestAlgorithm.SHA256
        }
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, !IS_SYNC);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        let ret: boolean = await map.checkPkcs12(algName, p12);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_2200 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_2300
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_2300
     * @tc.desc   CaCert And OtherCert Params, Format Is PEM, Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig : cert.Pkcs12CreationConfig = {
          password : "123456",
          keyEncParams : map.setPbesParams(11, 32, cert.PbesEncryptionAlgorithm.AES_192_CBC),
          encryptCert : false,
          certEncParams : map.setPbesParams(9, 16, cert.PbesEncryptionAlgorithm.AES_192_CBC),
          macSaltLen : 18,
          macIterations : 1000,
          macDigestAlgorithm : cert.Pkcs12MacDigestAlgorithm.SHA384
        }
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, !IS_SYNC, IS_PEM, !NEED_PRIV_KEY);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        /* 创建p12时，如果未添加私钥，只添加了公钥证书和其他证书，p12解析后该公钥证书存放在其他证书里面 */
        let ret: boolean = await map.checkPkcs12(algName, p12, IS_PEM, !ONLY_OTHER, !NEED_PRIV_KEY, !NEED_CA);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_2300 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_2400
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_2400
     * @tc.desc   PriKey And OtherCert Params, Format Is PEM, Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig : cert.Pkcs12CreationConfig = {
          password : "123456",
          keyEncParams : map.setPbesParams(15, 32, cert.PbesEncryptionAlgorithm.AES_256_CBC),
          encryptCert : true,
          certEncParams : map.setPbesParams(18, 64, cert.PbesEncryptionAlgorithm.AES_128_CBC),
          macSaltLen : 18,
          macIterations : 1000,
          macDigestAlgorithm : cert.Pkcs12MacDigestAlgorithm.SHA512
        }
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, !IS_SYNC, IS_PEM, NEED_PRIV_KEY, !NEED_CA);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        /* 创建p12时，如果未添加公钥证书，只添加了私钥，和1本私钥签发的其他证书1本其他证书，p12解析后该私钥签发的其他证书存放在证书里面 */
        let ret: boolean = await map.checkPkcs12(algName, p12);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_2400 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_2500
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_2500
     * @tc.desc   PriKey And Cert Params, Format Is PEM, Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig : cert.Pkcs12CreationConfig = {
          password : "123456",
          keyEncParams : map.setPbesParams(16, 32, cert.PbesEncryptionAlgorithm.AES_192_CBC),
          encryptCert : true,
          certEncParams : map.setPbesParams(8, 1024, cert.PbesEncryptionAlgorithm.AES_256_CBC),
          macSaltLen : 18,
          macIterations : 1000,
          macDigestAlgorithm : cert.Pkcs12MacDigestAlgorithm.SHA256
        }
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, !IS_SYNC, IS_PEM, NEED_PRIV_KEY, NEED_CA, !NEED_OTHER_CA);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        let ret: boolean = await map.checkPkcs12(algName, p12, IS_PEM, !ONLY_OTHER, NEED_PRIV_KEY, NEED_CA, !NEED_OTHER_CA);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_2500 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_2600
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_2600
     * @tc.desc   Only PriKey Params, Format Is PEM, Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig : cert.Pkcs12CreationConfig = {
          password : "123456",
          keyEncParams : map.setPbesParams(16, 32, cert.PbesEncryptionAlgorithm.AES_256_CBC),
          encryptCert : true,
          certEncParams : map.setPbesParams(14, 1000, cert.PbesEncryptionAlgorithm.AES_256_CBC),
          macSaltLen : 18,
          macIterations : 1000,
          macDigestAlgorithm : cert.Pkcs12MacDigestAlgorithm.SHA384
        }
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, !IS_SYNC, IS_PEM, NEED_PRIV_KEY, !NEED_CA, !NEED_OTHER_CA);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        let ret: boolean = await map.checkPkcs12(algName, p12, IS_PEM, !ONLY_OTHER, NEED_PRIV_KEY, !NEED_CA, !NEED_OTHER_CA);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_2600 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_2700
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_2700
     * @tc.desc   Only Ca Cert Params, Format Is PEM, Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig : cert.Pkcs12CreationConfig = {
          password : "123456",
          keyEncParams : map.setPbesParams(16, 32, cert.PbesEncryptionAlgorithm.AES_256_CBC),
          encryptCert : true,
          certEncParams : map.setPbesParams(17, 1, cert.PbesEncryptionAlgorithm.AES_192_CBC),
          macSaltLen : 18,
          macIterations : 1000,
          macDigestAlgorithm : cert.Pkcs12MacDigestAlgorithm.SHA512
        }
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, !IS_SYNC, IS_PEM, !NEED_PRIV_KEY, NEED_CA, !NEED_OTHER_CA);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        /* 创建p12时，只添加了公钥证书，p12解析后该证书存放在其他证书里面 */
        let ret: boolean = await map.checkPkcs12(algName, p12, IS_PEM, !ONLY_OTHER, !NEED_PRIV_KEY, !NEED_CA);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_2700 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_2800
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_2800
     * @tc.desc   Only Other Cert Params, Format Is PEM, Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig : cert.Pkcs12CreationConfig = {
          password : "123456",
          keyEncParams : map.setPbesParams(16, 0, cert.PbesEncryptionAlgorithm.AES_192_CBC),
          encryptCert : true,
          certEncParams : map.setPbesParams(8, 0, cert.PbesEncryptionAlgorithm.AES_256_CBC),
          macSaltLen : 18,
          macIterations : 0,
          macDigestAlgorithm : cert.Pkcs12MacDigestAlgorithm.SHA384
        }
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, !IS_SYNC, IS_PEM, !NEED_PRIV_KEY, !NEED_CA);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        let ret: boolean = await map.checkPkcs12(algName, p12, IS_PEM, ONLY_OTHER, !NEED_PRIV_KEY, !NEED_CA);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_2800 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_2900
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_2900
     * @tc.desc   Password Length Is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let createConfig : cert.Pkcs12CreationConfig = {
        password : "",
      }
      let pkcs12Data: cert.Pkcs12Data = {
        privateKey: priKeyPem
      };
      try {
        await cert.createPkcs12(pkcs12Data, createConfig)
        expect(null).assertFail();
      } catch (error) {
        console.error(`CreateP12_Func_2900 Promise ${error}, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      try {
        cert.createPkcs12Sync(pkcs12Data, createConfig)
        expect(null).assertFail();
      } catch (error) {
        console.error(`CreateP12_Func_2900 Sync ${error}, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_3000
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_3000
     * @tc.desc   keyEncParams PbesParams Is Invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let createConfig : cert.Pkcs12CreationConfig = {
        password : "123456",
      };
      let pkcs12Data: cert.Pkcs12Data = {
        privateKey: priKeyPem
      };
      try {
        /* 盐值长度异常，规格里最小值为8 */
        let pbesParams: cert.PbesParams = setPbesParams(7);
        createConfig.keyEncParams = pbesParams;
        await cert.createPkcs12(pkcs12Data, createConfig);
        expect(null).assertFail();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(19020003);
      }
      try {
        /* 盐值长度异常，规格里最小值为8 */
        let pbesParams: cert.PbesParams = setPbesParams(-1);
        createConfig.keyEncParams = pbesParams;
        await cert.createPkcs12(pkcs12Data, createConfig);
        expect(null).assertFail();
      } catch (error) {
        // cert.CertResult.ERR_PARAMETER_CHECK_FAILED
        expect((error as BusinessError).code).assertEqual(19020003);
      }
      try {
        /* 迭代次数异常，异常值-1 */
        let pbesParams: cert.PbesParams = setPbesParams(16, -1);
        createConfig.keyEncParams = pbesParams;
        await cert.createPkcs12(pkcs12Data, createConfig);
        expect(null).assertFail();
      } catch (error) {
        // cert.CertResult.ERR_PARAMETER_CHECK_FAILED
        expect((error as BusinessError).code).assertEqual(19020003);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_3100
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_3100
     * @tc.desc   certEncParams PbesParams Is Invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let createConfig : cert.Pkcs12CreationConfig = {
        password : "123456",
      };
      let caCert: cert.X509Cert | undefined = undefined;
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(certPem),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        caCert = await cert.createX509Cert(encodingBlob);
      } catch (error) {
        console.error(`createX509Cert ${error}, error code: ${error.code}`);
        throw error as Error;
      }
      let pkcs12Data: cert.Pkcs12Data = {
        cert: caCert
      };
      try {
        /* 盐值长度异常，规格里最小值为8 */
        let pbesParams: cert.PbesParams = setPbesParams(7);
        createConfig.certEncParams = pbesParams;
        await cert.createPkcs12(pkcs12Data, createConfig);
        expect(null).assertFail();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(19020003);
      }
      try {
        /* 盐值长度异常，规格里最小值为8 */
        let pbesParams: cert.PbesParams = setPbesParams(-1);
        createConfig.certEncParams = pbesParams;
        await cert.createPkcs12(pkcs12Data, createConfig);
        expect(null).assertFail();
      } catch (error) {
        // cert.CertResult.ERR_PARAMETER_CHECK_FAILED
        expect((error as BusinessError).code).assertEqual(19020003);
      }
      try {
        /* 迭代次数异常，异常值-1 */
        let pbesParams: cert.PbesParams = setPbesParams(16, -1);
        createConfig.certEncParams = pbesParams;
        await cert.createPkcs12(pkcs12Data, createConfig);
        expect(null).assertFail();
      } catch (error) {
        // cert.CertResult.ERR_PARAMETER_CHECK_FAILED
        expect((error as BusinessError).code).assertEqual(19020003);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_3200
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_3200
     * @tc.desc   Mac Params Is Invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let pkcs12Data: cert.Pkcs12Data = {
        privateKey: priKeyPem
      };
      try {
        /* 盐值长度异常，规格里最小值为8 */
        let createConfig : cert.Pkcs12CreationConfig = setMacParams(7);
        await cert.createPkcs12(pkcs12Data, createConfig);
        expect(null).assertFail();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(19020003);
      }
      try {
        /* 迭代次数异常，异常值-1 */
        let createConfig : cert.Pkcs12CreationConfig = setMacParams(16, -1);
        await cert.createPkcs12(pkcs12Data, createConfig);
        expect(null).assertFail();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(19020003);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_3300
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_3300
     * @tc.desc   Mac Params Is Invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let pkcs12Data: cert.Pkcs12Data = {
        privateKey: priKeyPem
      };
      let createConfig : cert.Pkcs12CreationConfig = {
        password : "123",
      }
      try {
        /* 原始口令长度异常，规格里最小长度为4 */
        await cert.createPkcs12(pkcs12Data, createConfig);
        expect(null).assertFail();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(19020003);
      }
      try {
        /* 原始口令长度异常，规格里最小长度为4 */
        cert.createPkcs12Sync(pkcs12Data, createConfig);
        expect(null).assertFail();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(19020003);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_3400
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_3400
     * @tc.desc   Mac Params Is Invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let createConfig : cert.Pkcs12CreationConfig = {
        password : "123456",
      }
      let caCert: cert.X509Cert | undefined = undefined;
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(otherCertPem2),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        caCert = await cert.createX509Cert(encodingBlob);
      } catch (error) {
        console.error(`createX509Cert ${error}, error code: ${error.code}`);
        throw error as Error;
      }
      let pkcs12Data: cert.Pkcs12Data = {
        privateKey: priKeyPem,
        cert: caCert
      };
      try {
        await cert.createPkcs12(pkcs12Data, createConfig);
        expect(null).assertFail();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      try {

        cert.createPkcs12Sync(pkcs12Data, createConfig);
        expect(null).assertFail();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_3500
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_3500
     * @tc.desc   All Params, PriKey OutFormat Is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig: cert.Pkcs12CreationConfig = {
          password: "123456"
        };
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA,
          privateKeyFormat: cert.EncodingBaseFormat.PEM
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, IS_SYNC, !IS_PEM);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        let ret: boolean = await map.checkPkcs12(algName, p12, IS_PEM);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_3500 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateP12_Func_3600
     * @tc.number SUB_Security_Cert_Framework_CreateP12_Func_3600
     * @tc.desc   All Params, PriKey OutFormat Is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CreateP12_Func_3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let map: OH_Pkcs12DataMap = new OH_Pkcs12DataMap(false);
        let createConfig: cert.Pkcs12CreationConfig = {
          password: "123456"
        };
        let parsingConfig: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: NEED_OTHER_CA,
          privateKeyFormat: cert.EncodingBaseFormat.DER
        };
        let algName: string = "RSA";
        let pkcs12Data: Uint8Array = await map.createPkcs12(algName, createConfig, IS_SYNC, IS_PEM);
        let p12: cert.Pkcs12Data = await map.parsePkcs12(pkcs12Data, parsingConfig);
        let ret: boolean = await map.checkPkcs12(algName, p12, !IS_PEM);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CreateP12_Func_3600 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

  });
}
