/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import cert from '@ohos.security.cert';
import cryptoFramework from '@ohos.security.cryptoFramework';
import {
  caCert, caCert1, caCrl, caInterCert,
  caInterCert1, caSubCert, caSubCert1, certCheckCA,
  certEntryMaxObject, certEntryObject, certErrorOid, certExtension,
  certExtensionsPath_2147483648, certIssuerDisName, certKeyUsage,
  certNoCRLPoint, certNoExtension, certNoKeyUsage, certNoPubKey,
  certNoSubjectAltName, certNotAfterTime, certNotBeforeTime,
  certNotEffect, certNotSignAlgName, certNotSignature, certNotSignatureOid,
  certSignParams, chainPem, createCertExtension, createCertWithXts,
  crlBadData, crlBadSerial, crlCert, crlErrorIssuer,
  crlErrorSignAlg, crlErrorSignOid, crlIsRevokedMax, crlLastNextMaxLen,
  crlMaxIssuerNameLen, crlNoLastDataNoNextData,
  crlNoSignature, crlPem, crlRevokedCert, crlSignPubKey, crlVerify,
  crlVerifyPubKeyFalse, crlVerifyPubKeyTrue, extData,
  getCRLRevokedCerts, pkcs12Cert,
  revokedCertPem, rsaPem4096, rsaPem4096_other,
  selectCRLs, verify, x509CertErrorPubkey } from "./utils/certificate/certX509Pem";
import { stringTouInt8Array } from "./utils/common/commonFunction";
import { certUft8WithChineseSubject } from "./utils/certificate/publicCertificatePromise";
import { stringToUint8Array } from "./utils/certificate/p12";
import { rsa_p8_enc_pem, rsa_p8_enc_pem_cert } from "./utils/cms/cms";
import {
  unstructuredName,
  challengePassword,
  keyUsage, rsa_pkcs1_enc_pem, subj, } from "./utils/csr/csr";

export default function certFrameworkResultCodeTestUnit() {
  describe("certFrameworkResultCodeTestUnit", () => {
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_0100
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_0100
     * @tc.desc   The X509 Cert Format is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringTouInt8Array(rsaPem4096),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          let pubKey: cryptoFramework.PubKey | undefined;
          await x509Cert.verify(pubKey!);
          expect(null).assertFail();
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_0100 ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_0200
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_0200
     * @tc.desc   The X509 Cert Format is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringTouInt8Array(rsaPem4096),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          let pubKey: cryptoFramework.PubKey | undefined;
          x509Cert.verify(pubKey!, (err) => {});
          expect(null).assertFail();
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_0200 ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_0300
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_0300
     * @tc.desc   The X509 Cert Format is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob1: cert.EncodingBlob = {
            data: stringTouInt8Array(rsaPem4096),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509Cert1: cert.X509Cert = await cert.createX509Cert(encodingBlob1);
          let encodingBlob2: cert.EncodingBlob = {
            data: stringTouInt8Array(rsaPem4096_other),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509Cert2: cert.X509Cert = await cert.createX509Cert(encodingBlob2);
          let pubKey: cryptoFramework.PubKey = x509Cert2.getPublicKey();
          x509Cert1.verify(pubKey, (err: BusinessError<void>|null) => {
            if (err) { // success: error is null, failed: data is undefined
              console.error('verify failed, errCode: ' + err?.code + ', errMsg: ' + err?.message);
              expect(err?.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
            } else {
              expect(null).assertFail();
            }
          });
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_0300 ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_0400
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_0400
     * @tc.desc   The X509 Cert Format is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob1: cert.EncodingBlob = {
            data: stringTouInt8Array(rsaPem4096),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509Cert1: cert.X509Cert = await cert.createX509Cert(encodingBlob1);

          let encodingBlob2: cert.EncodingBlob = {
            data: stringTouInt8Array(rsaPem4096_other),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509Cert2: cert.X509Cert = await cert.createX509Cert(encodingBlob2);
          let pubKey: cryptoFramework.PubKey = x509Cert2.getPublicKey();
          await x509Cert1.verify(pubKey);
          expect(null).assertFail();
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_0400 ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_0700
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_0700
     * @tc.desc   The X509 CRL Format is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringTouInt8Array(crlPem),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509Crl: cert.X509CRL = await cert.createX509CRL(encodingBlob);
          let serialNumber = BigInt('0x03e8');
          let crlEntry: cert.X509CRLEntry = x509Crl.getRevokedCert(serialNumber);
          let serialNumberRes = crlEntry.getSerialNumber();
          let issuer: cert.DataBlob = crlEntry.getCertIssuer(); // issuerLen比实际多1
          console.info("########### issuer:" + issuer.data);
          crlEntry.getEncoded( (err: BusinessError<void>|null, data: cert.EncodingBlob|undefined) => {
            console.info("########### data:" + data?.data);
            console.info("########### format:" + data?.encodingFormat);
          });
          expect(serialNumber).assertEqual(serialNumberRes);
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_0700 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_1300
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_1300
     * @tc.desc   The X509 Cert Format is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringTouInt8Array(x509CertErrorPubkey),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          x509Cert.getPublicKey();
          expect(null).assertFail();
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_1300 ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_1400
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_1400
     * @tc.desc   The X509 Cert Format is PEM, return ERR_CRYPTO_OPERATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringTouInt8Array(rsaPem4096),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          let date: string = "20360812124556+3600";
          x509Cert.checkValidityWithDate(date);
          expect(null).assertFail();
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_1400 ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_1600
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_1600
     * @tc.desc   The X509 Cert Format is PEM, return ERR_CRYPTO_OPERATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringTouInt8Array(certNotEffect),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          let date: string = "20250212124556+0800";
          x509Cert.checkValidityWithDate(date);
          expect(null).assertFail();
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_1600 ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CERT_NOT_YET_VALID);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_1800
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_1800
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_1800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(certNotBeforeTime),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        try {
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          x509Cert.getNotBeforeTime();
          expect(null).assertFail();
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_1800 ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_1900
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_1900
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_1900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(certNotAfterTime),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        try {
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          x509Cert.getNotAfterTime();
          expect(null).assertFail();
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_1900 ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_2000
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_2000
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(certNotSignature),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        try {
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          x509Cert.getSignature();
          expect(null).assertFail();
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_2000 ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_2100
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_2100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_2100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(certNotSignAlgName),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        try {
          x509Cert.getSignatureAlgName();
          expect(null).assertFail();
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_2100 ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        try {
          x509Cert.getSignatureAlgParams();
        } catch (error) {
          if (error.code == cert.CertResult.NOT_SUPPORT) {
            console.error(`Not Support ${error}, error code: ${error.code}`);
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_2200
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_2200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_2200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(certNotSignatureOid),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        try {
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          x509Cert.getSignatureAlgOid();
          expect(null).assertFail();
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_2200 ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_2300
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_2300
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_2300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(certErrorOid),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        try {
          await cert.createX509Cert(encodingBlob);
          expect(null).assertFail();
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_2300 ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_2400
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_2400
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_2400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(certSignParams),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        try {
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          x509Cert.getExtKeyUsage();
          expect(null).assertFail();
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_2400 ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_2500
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_2500
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_2500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(certNoKeyUsage),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        try {
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          x509Cert.getExtKeyUsage();
          expect(null).assertFail();
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_2500 ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_2600
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_2600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_2600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(certNoKeyUsage),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        try {
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          x509Cert.getKeyUsage();
          expect(null).assertFail();
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_2600 ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_2700
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_2700
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_2700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(certNoSubjectAltName),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        try {
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          x509Cert.getSubjectAltNames();
          expect(null).assertFail();
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_2700 ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_2800
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_2800
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_2800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(certNoSubjectAltName),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        try {
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          x509Cert.getSubjectAltNames();
          expect(null).assertFail();
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_2800 ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_3000
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_3000
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_3000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(certNoPubKey),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        try {
          x509Cert.getItem(cert.CertItemType.CERT_ITEM_TYPE_PUBLIC_KEY);
          expect(null).assertFail();
        } catch (error) {
          console.error(`x509Cert.getItem ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_3100
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_3100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_3100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(certNoPubKey),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        try {
          x509Cert.getCRLDistributionPoint();
          expect(null).assertFail();
        } catch (error) {
          console.error(`x509Cert.getCRLDistributionPoint ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_RUNTIME_ERROR);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_3200
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_3200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_3200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(certNoCRLPoint),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        try {
          x509Cert.getCRLDistributionPoint();
          expect(null).assertFail();
        } catch (error) {
          console.error(`x509Cert.getCRLDistributionPoint ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_3300
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_3300
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_3300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(certIssuerDisName),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        try {
          let data = x509Cert.getIssuerX500DistinguishedName();
          data.getName()
          expect(null).assertFail();
        } catch (error) {
          console.error(`x509Cert.getIssuerX500DistinguishedName ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_OUT_OF_MEMORY);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_3400
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_3400
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_3400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(certNoExtension),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        try {
          x509Cert.getExtensionsObject();
          expect(null).assertFail();
        } catch (error) {
          console.error(`x509Cert.getExtensionsObject ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_3500
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_3500
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_3500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(certExtension),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        try {
          let data = x509Cert.getExtensionsObject();
          data.getOidList(cert.ExtensionOidType.EXTENSION_OID_TYPE_UNCRITICAL)
          expect(null).assertFail();
        } catch (error) {
          console.error(`x509Cert.getOidList ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_3600
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_3600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_3600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(certEntryObject),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        let data = x509Cert.getExtensionsObject();
        try {
          data.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY, {data: new Uint8Array()})
          expect(null).assertFail();
        } catch (error) {
          console.error(`x509Cert.getEntry ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        try {
          data.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY,
            {data: new Uint8Array([50,46,53,46,50,57,46,49,53])})
          expect(null).assertFail();
        } catch (error) {
          console.error(`x509Cert.getEntry ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_RUNTIME_ERROR);
        }
        try {
          data.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY,
            {data: new Uint8Array([50,46,53,46,50,57,46,49,58])})
          expect(null).assertFail();
        } catch (error) {
          console.error(`x509Cert.getEntry ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_3700
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_3700
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_3700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(certEntryMaxObject),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        let data = x509Cert.getExtensionsObject();
        let oid: number[] = [50,46,53,46,50,57,46,49,52];
        try {
          data.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY, {data: new Uint8Array(oid)})
          // 输出日志不符合
          // FoundExtMatchedNid[361]: Failed to get extension numbers
          // CfOpensslGetEntry[482]: no found target nid
          expect(null).assertFail();
        } catch (error) {
          console.error(`x509Cert.getEntry ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        try {
          data.checkCA();
          expect(null).assertFail();
        } catch (error) {
          console.error(`data.checkCA() ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_3800
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_3800
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_3800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          cert.createCertCRLCollection([], [])
        } catch (error) {
          console.error(`x509Cert.createCertCRLCollection ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_3900
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_3900
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_3900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(certCheckCA),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        try {
          x509Cert.getExtensionsObject();
          expect(null).assertFail();
        } catch (error) {
          console.error(`x509Cert.getExtensionsObject ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_4000
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_4000
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_4000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(certExtensionsPath_2147483648),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        let data = x509Cert.getExtensionsObject();
        try {
          data.checkCA(); // CheckBasicConstraints[546]: this cert pathlen is invalid
          expect(null).assertFail();
        } catch (error) {
          console.error(`data.checkCA ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_4100
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_4100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_4100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(certEntryMaxObject),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        let data = x509Cert.getExtensionsObject();
        try {
          data.hasUnsupportedCriticalExtension();
          expect(null).assertFail();
        } catch (error) {
          console.error(`data.hasUnsupportedCriticalExtension ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_4200
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_4200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_4200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: extData,
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        try {
          await cert.createCertExtension(encodingBlob);
          expect(null).assertFail();
        } catch (error) {
          console.error(`createCertExtension Promise ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        try {
          await createCertExtension(encodingBlob);
          expect(null).assertFail();
        } catch (error) {
          console.error(`createCertExtension CallBack ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        try {
          await createCertExtension({data: new Uint8Array([45]), encodingFormat: cert.EncodingFormat.FORMAT_DER});
          expect(null).assertFail();
        } catch (error) {
          console.error(`createCertExtension CallBack ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        try {
          await cert.createCertExtension({data: new Uint8Array([45]), encodingFormat: cert.EncodingFormat.FORMAT_DER});
        } catch (error) {
          console.error(`createCertExtension Promise ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_5100
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_5100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_5100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(crlBadSerial),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Crl = await cert.createX509CRL(encodingBlob);
        try {
          let crlEntry = x509Crl.getRevokedCert(BigInt("0xDD15FE86AFFAD91249EF0EB713F39EBEAA987B6E6FD29FFFFFFFFFFFFFFFFFFF"));
          crlEntry.getSerialNumber();
          expect(null).assertFail();
        } catch (error) {
          console.error(`x509Crl.getSerialNumber Promise ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_5200
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_5200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_5200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(crlBadData),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Crl = await cert.createX509CRL(encodingBlob);
        try {
          let crlEntry = x509Crl.getRevokedCert(BigInt("0x03e8"));
          crlEntry.getRevocationDate();
          expect(null).assertFail();
        } catch (error) {
          console.error(`x509Crl.getRevocationDate ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_5500
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_5500
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_5500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(crlErrorIssuer),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Crl = await cert.createX509CRL(encodingBlob);
        try {
          x509Crl.getIssuerX500DistinguishedName();
          expect(null).assertNull();
        } catch (error) {
          console.error(`x509Crl.getIssuerX500DistinguishedName ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_5600
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_5600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_5600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(crlMaxIssuerNameLen),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Crl = await cert.createX509CRL(encodingBlob);
        try {
          x509Crl.getIssuerName();
          expect(null).assertFail();
        } catch (error) {
          console.error(`x509Crl.getIssuerName ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_5700
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_5700
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_5700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(crlErrorIssuer),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Crl = await cert.createX509CRL(encodingBlob);
        let crlEntry = x509Crl.getRevokedCert(BigInt("0x03e8"));
        try {
          crlEntry.getCertIssuerX500DistinguishedName()
          expect(null).assertNull();
        } catch (error) {
          console.error(`x509Crl.getRevocationDate ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_OUT_OF_MEMORY);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_5800
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_5800
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_5800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(crlErrorIssuer),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Crl = await cert.createX509CRL(encodingBlob);
        let crlEntry = x509Crl.getRevokedCert(BigInt("0x03e8"));
        try {
          crlEntry.getExtensionsObject();
          expect(null).assertFail();
        } catch (error) {
          console.error(`x509Crl.getExtensionsObject ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_6900
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_6900
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_6900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(crlLastNextMaxLen),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Crl = await cert.createX509CRL(encodingBlob);
        try {
          x509Crl.getLastUpdate();
          expect(null).assertFail();
        } catch (error) {
          console.error(`x509Crl.getLastUpdate ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_7000
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_7000
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_7000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(crlLastNextMaxLen),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Crl = await cert.createX509CRL(encodingBlob);
        try {
          x509Crl.getNextUpdate();
          expect(null).assertFail();
        } catch (error) {
          console.error(`x509Crl.getNextUpdate ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_7300
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_7300
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_7300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(crlVerify),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Crl = await cert.createX509CRL(encodingBlob);
        let x509Cert: cert.X509Cert | undefined;
        try {
          x509Crl.getRevokedCertWithCert(x509Cert!);
          expect(null).assertFail();
        } catch (error) {
          console.error(`x509Crl.isRevoked ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_7500
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_7500
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_7500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob1: cert.EncodingBlob = {
          data: stringToUint8Array(crlVerify),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Crl = await cert.createX509CRL(encodingBlob1);
        let encodingBlob2: cert.EncodingBlob = {
          data: stringToUint8Array(crlVerifyPubKeyFalse),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert = await cert.createX509Cert(encodingBlob2);
        try {
          x509Crl.getRevokedCertWithCert(x509Cert);
          expect(null).assertFail();
        } catch (error) {
          console.error(`x509Crl.getRevokedCertWithCert ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_7900
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_7900
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_7900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(crlNoSignature),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Crl = await cert.createX509CRL(encodingBlob);
        try {
          x509Crl.getSignature();
          expect(null).assertFail();
        } catch (error) {
          console.error(`x509Crl.getSignature ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_8200
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_8200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_8200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(crlErrorSignAlg),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Crl = await cert.createX509CRL(encodingBlob);
        try {
          x509Crl.getSignatureAlgName();
          expect(null).assertFail();
        } catch (error) {
          console.error(`x509Crl.getSignatureAlgName ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_8300
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_8300
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_8300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(crlErrorSignOid),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Crl = await cert.createX509CRL(encodingBlob);
        try {
          let data = x509Crl.getSignatureAlgOid(); // 代码中对oid的内存写死了是127，不合理,资料限制
          console.info("##################### data:" + data.length)
          expect(null).assertNull();
        } catch (error) {
          console.error(`x509Crl.getSignatureAlgOid ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_8600
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_8600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_8600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(crlErrorSignOid),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Crl = await cert.createX509CRL(encodingBlob);
        try {
          x509Crl.getExtensionsObject();
          expect(null).assertFail();
        } catch (error) {
          console.error(`getExtensionsObject ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_8700
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_8700
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_8700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          cert.createCertChainValidator("PKIX2")
          expect(null).assertFail();
        } catch (error) {
          console.error(`createCertChainValidator ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.NOT_SUPPORT);
        }
        let validator = cert.createCertChainValidator("PKIX");
        let data: cert.CertChainData | undefined;
        try {
          await validator.validate(data!);
        } catch (error) {
          console.error(`validator.validate Promise ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        try {
          validator.validate(data!, (err) => {});
        } catch (error) {
          console.error(`validator.validate Callback ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_8800
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_8800
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_8800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(crlPem),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Crl = await cert.createX509CRL(encodingBlob);
        let collection = cert.createCertCRLCollection([], [x509Crl]);
        let param: cert.X509CRLMatchParameters = {
          issuer: [new Uint8Array(1036)]
        }
        try {
          await collection.selectCRLs(param);
          expect(null).assertFail();
        } catch (error) {
          console.error(`collection.selectCRLs Promise ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        try {
          await selectCRLs(param, collection);
          expect(null).assertFail();
        } catch (error) {
          console.error(`collection.selectCRLs Callback ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_8900
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_8900
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_8900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(chainPem),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let param: cert.CertChainValidationParameters = {
          date: '20231212080000Z+3600',
          trustAnchors: [{
            CAPubKey: new Uint8Array([0x30, 0x2a, 0x30, 0x05, 0x06]),
            CASubject: new Uint8Array([0x30, 0x5a, 0x31, 0x0b, 0x30]),
          }]
        }
        let data = await cert.createX509CertChain(encodingBlob);
        try {
          let res = await data.validate(param);
          console.info("############# res:" + res.trustAnchor)
          expect(null).assertFail();
        } catch (error) {
          console.error(`createX509CertChain.validate ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_9000
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_9000
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_9000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let pkcs12: Uint8Array = new Uint8Array(pkcs12Cert);
          let conf: cert.Pkcs12ParsingConfig = {
            password: ""
          }
          cert.parsePkcs12(pkcs12, conf);
          expect(null).assertFail();
        } catch (error) {
          console.error(`parsePkcs12 ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_9100
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_9100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_9100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA1",
          addCert: false
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_enc_pem,
          password: "123456"
        };
        let key_cert: string = rsa_p8_enc_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.TEXT,
          outFormat: cert.CmsFormat.PEM
        }
        try {
          generator.doFinalSync(new Uint8Array(), options);
          expect(null).assertFail();
        } catch (error) {
          console.error(`p7 doFinalSync catch error: ${JSON.stringify(error)}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        try {
          await generator.doFinal(new Uint8Array(), options);
          expect(null).assertFail();
        } catch (error) {
          console.error(`p7 doFinal catch error: ${JSON.stringify(error)}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ErrorCode_Func_9200
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_9200
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_9200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyInfo: cert.PrivateKeyInfo = {
            key: rsa_pkcs1_enc_pem,
            password: "123abc"
          };
          let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
          let attributes: cert.CsrAttribute[] = [
            keyUsage, unstructuredName, challengePassword,
          ];
          let conf: cert.CsrGenerationConfig = {
            subject: subject,
            mdName: "SHA1",
            attributes: attributes,
            outFormat: cert.EncodingBaseFormat.DER
          }
          cert.generateCsr(keyInfo, conf)
        } catch (error) {
          console.error(`generateCsr ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_MAYBE_WRONG_PASSWORD);
        }
        done();
      });

  });
}