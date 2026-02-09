/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { createCertChain, createX509Cert, certChainPem, caTrustCert, noCertCrl } from "./utils/crl/crl";

export default function certFrameworkCertReinforcementOfStringTestUnit() {
  describe("certFrameworkCertReinforcementOfStringTestUnit", (): void => {
    
    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_0100
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_0100
     * @tc.desc   Test X509Cert.checkValidityWithDate with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          x509Cert.checkValidityWithDate("");
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_0100 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_0200
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_0200
     * @tc.desc   Test createCertChainValidator with empty algorithm string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          cert.createCertChainValidator("");
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_0200 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.NOT_SUPPORT);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_0300
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_0300
     * @tc.desc   Test parsePkcs12 with empty password string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const pkcs12Data = new Uint8Array([0x30, 0x82, 0x01, 0x01]);
          await cert.parsePkcs12(pkcs12Data, "");
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_0300 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_0400
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_0400
     * @tc.desc   Test createTrustAnchorsWithKeyStore with empty password string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const keystore = new Uint8Array([0x30, 0x82, 0x01, 0x01]);
          await cert.createTrustAnchorsWithKeyStore(keystore, "");
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_0400 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_0500
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_0500
     * @tc.desc   Test createX500DistinguishedName with empty nameStr string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          await cert.createX500DistinguishedName("");
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_0500 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_0600
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_0600
     * @tc.desc   Test X509Cert.match with empty validDate string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const matchParams: cert.X509CertMatchParameters = {
            validDate: ""
          };
          x509Cert.match(matchParams);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_0600 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_0700
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_0700
     * @tc.desc   Test X509Cert.match with empty privateKeyValid string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const matchParams: cert.X509CertMatchParameters = {
            privateKeyValid: ""
          };
          x509Cert.match(matchParams);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_0700 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_0800
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_0800
     * @tc.desc   Test X509Cert.match with empty publicKeyAlgID string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const matchParams: cert.X509CertMatchParameters = {
            publicKeyAlgID: ""
          };
          x509Cert.match(matchParams);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_0800 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_0900
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_0900
     * @tc.desc   Test X509Cert.match with empty extendedKeyUsage array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const matchParams: cert.X509CertMatchParameters = {
            extendedKeyUsage: [""]
          };
          x509Cert.match(matchParams);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_0900 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_1000
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_1000
     * @tc.desc   Test X509CRL.match with empty updateDateTime string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const crlEncodingBlob: cert.EncodingBlob = {
            data: new Uint8Array(noCertCrl.length),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          for (let i = 0; i < noCertCrl.length; i++) {
            crlEncodingBlob.data[i] = noCertCrl.charCodeAt(i);
          }
          const x509CRL: cert.X509CRL = await cert.createX509CRL(crlEncodingBlob);
          const matchParams: cert.X509CRLMatchParameters = {
            updateDateTime: ""
          };
          x509CRL.match(matchParams);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_1000 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_1100
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_1100
     * @tc.desc   Test X509CertChain.validate with empty ocspResponderURI string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x509CertChain: cert.X509CertChain = await createCertChain(certChainPem);
          const x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{
              CACert: x509Cert
            }],
            revocationCheckParam: {
              ocspResponderURI: ""
            }
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_1100 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_1200
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_1200
     * @tc.desc   Test X509CertChain.validate with empty crlDownloadURI string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x509CertChain: cert.X509CertChain = await createCertChain(certChainPem);
          const x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{
              CACert: x509Cert
            }],
            revocationCheckParam: {
              crlDownloadURI: ""
            }
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_1200 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_1300
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_1300
     * @tc.desc   Test X509CertChain.validate with empty ocspDigest string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x509CertChain: cert.X509CertChain = await createCertChain(certChainPem);
          const x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{
              CACert: x509Cert
            }],
            revocationCheckParam: {
              ocspDigest: ""
            }
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_1300 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_1400
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_1400
     * @tc.desc   Test X509CertChain.validate with empty date string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x509CertChain: cert.X509CertChain = await createCertChain(certChainPem);
          const x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const param: cert.CertChainValidationParameters = {
            date: "",
            trustAnchors: [{
              CACert: x509Cert
            }]
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_1400 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_1500
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_1500
     * @tc.desc   Test X509CertChain.validate with empty sslHostname string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x509CertChain: cert.X509CertChain = await createCertChain(certChainPem);
          const x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const param: cert.CertChainValidationParameters = {
            sslHostname: "",
            trustAnchors: [{
              CACert: x509Cert
            }]
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_1500 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_1600
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_1600
     * @tc.desc   Test CmsGenerator.addSigner with empty key string in PrivateKeyInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
          const signerConfig: cert.CmsSignerConfig = {
            mdName: "SHA256"
          };
          const keyInfo: cert.PrivateKeyInfo = {
            key: ""
          };
          cms.addSigner(x509Cert, keyInfo, signerConfig);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_1600 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_1700
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_1700
     * @tc.desc   Test CmsGenerator.addSigner with empty password string in PrivateKeyInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
          const signerConfig: cert.CmsSignerConfig = {
            mdName: "SHA256"
          };
          const key: string = "-----BEGIN EC PRIVATE KEY-----\n" +
            "MHcCAQEEINATTsTZ0suYpbg/SyWbUCF8RPrX0ZhINn4T75fh7QU8oAoGCCqGSM49\n" +
            "AwEHoUQDQgAEJgdrEUKaVA8ZPzYD/kLwsn4cUgkrCkTtMZEtG6l5iGTvpZT4qPTh\n" +
            "8h5ILrui9bC+DLPRkEo3YsfHb62EanXqew==\n" +
            "-----END EC PRIVATE KEY-----";
          const keyInfo: cert.PrivateKeyInfo = {
            key: key,
            password: ""
          };
          cms.addSigner(x509Cert, keyInfo, signerConfig);
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_1700 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_1800
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_1800
     * @tc.desc   Test CmsGenerator.addSigner with empty mdName string in CmsSignerConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_1800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
          const signerConfig: cert.CmsSignerConfig = {
            mdName: ""
          };
          const key: string = "-----BEGIN EC PRIVATE KEY-----\n" +
            "MHcCAQEEINATTsTZ0suYpbg/SyWbUCF8RPrX0ZhINn4T75fh7QU8oAoGCCqGSM49\n" +
            "AwEHoUQDQgAEJgdrEUKaVA8ZPzYD/kLwsn4cUgkrCkTtMZEtG6l5iGTvpZT4qPTh\n" +
            "8h5ILrui9bC+DLPRkEo3YsfHb62EanXqew==\n" +
            "-----END EC PRIVATE KEY-----";
          const keyInfo: cert.PrivateKeyInfo = {
            key: key
          };
          cms.addSigner(x509Cert, keyInfo, signerConfig);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_1800 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_1900
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_1900
     * @tc.desc   Test generateCsr with empty type string in CsrAttribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_1900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x500Name = await cert.createX500DistinguishedName("/O=Test");
          const key: string = "-----BEGIN EC PRIVATE KEY-----\n" +
            "MHcCAQEEINATTsTZ0suYpbg/SyWbUCF8RPrX0ZhINn4T75fh7QU8oAoGCCqGSM49\n" +
            "AwEHoUQDQgAEJgdrEUKaVA8ZPzYD/kLwsn4cUgkrCkTtMZEtG6l5iGTvpZT4qPTh\n" +
            "8h5ILrui9bC+DLPRkEo3YsfHb62EanXqew==\n" +
            "-----END EC PRIVATE KEY-----";
          const keyInfo: cert.PrivateKeyInfo = {
            key: key
          };
          const csrConfig: cert.CsrGenerationConfig = {
            subject: x500Name,
            mdName: "SHA256",
            attributes: [{
              type: "",
              value: "test"
            }]
          };
          cert.generateCsr(keyInfo, csrConfig);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_1900 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_2000
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_2000
     * @tc.desc   Test generateCsr with empty value string in CsrAttribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x500Name = await cert.createX500DistinguishedName("/O=Test");
          const key: string = "-----BEGIN EC PRIVATE KEY-----\n" +
            "MHcCAQEEINATTsTZ0suYpbg/SyWbUCF8RPrX0ZhINn4T75fh7QU8oAoGCCqGSM49\n" +
            "AwEHoUQDQgAEJgdrEUKaVA8ZPzYD/kLwsn4cUgkrCkTtMZEtG6l5iGTvpZT4qPTh\n" +
            "8h5ILrui9bC+DLPRkEo3YsfHb62EanXqew==\n" +
            "-----END EC PRIVATE KEY-----";
          const keyInfo: cert.PrivateKeyInfo = {
            key: key
          };
          const csrConfig: cert.CsrGenerationConfig = {
            subject: x500Name,
            mdName: "SHA256",
            attributes: [{
              type: "test",
              value: ""
            }]
          };
          cert.generateCsr(keyInfo, csrConfig);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_2000 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_2100
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_2100
     * @tc.desc   Test generateCsr with empty mdName string in CsrGenerationConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_2100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x500Name = await cert.createX500DistinguishedName("/O=Test");
          const key: string = "-----BEGIN EC PRIVATE KEY-----\n" +
            "MHcCAQEEINATTsTZ0suYpbg/SyWbUCF8RPrX0ZhINn4T75fh7QU8oAoGCCqGSM49\n" +
            "AwEHoUQDQgAEJgdrEUKaVA8ZPzYD/kLwsn4cUgkrCkTtMZEtG6l5iGTvpZT4qPTh\n" +
            "8h5ILrui9bC+DLPRkEo3YsfHb62EanXqew==\n" +
            "-----END EC PRIVATE KEY-----";
          const keyInfo: cert.PrivateKeyInfo = {
            key: key
          };
          const csrConfig: cert.CsrGenerationConfig = {
            subject: x500Name,
            mdName: ""
          };
          cert.generateCsr(keyInfo, csrConfig);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_2100 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_2200
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_2200
     * @tc.desc   Test createPkcs12 with empty privateKey string in Pkcs12Data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_2200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const pkcs12Data: cert.Pkcs12Data = {
            privateKey: ""
          };
          const creationConfig: cert.Pkcs12CreationConfig = {
            password: "test1234"
          };
          await cert.createPkcs12(pkcs12Data, creationConfig);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_2200 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_2300
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_2300
     * @tc.desc   Test parsePkcs12 with empty password string in Pkcs12ParsingConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_2300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const parsingConfig: cert.Pkcs12ParsingConfig = {
            password: ""
          };
          const pkcs12Data = new Uint8Array([0x30, 0x82, 0x01, 0x01]);
          cert.parsePkcs12(pkcs12Data, parsingConfig);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_2300 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_2400
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_2400
     * @tc.desc   Test createPkcs12 with empty password string in Pkcs12CreationConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_2400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const creationConfig: cert.Pkcs12CreationConfig = {
            password: ""
          };
          const x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const pkcs12Data: cert.Pkcs12Data = {
            privateKey: new Uint8Array([0x30, 0x82, 0x01, 0x01]),
            cert: x509Cert
          };
          await cert.createPkcs12(pkcs12Data, creationConfig);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_2400 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_2500
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_2500
     * @tc.desc   Test X500DistinguishedName.getName with empty type string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_2500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x500Name = await cert.createX500DistinguishedName("CN=Test");
          x500Name.getName("");
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_2500 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_2600
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_2600
     * @tc.desc   Test X509Cert.match with empty certPolicy array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_2600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const matchParams: cert.X509CertMatchParameters = {
            certPolicy: [""]
          };
          x509Cert.match(matchParams);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_2600 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_2700
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_2700
     * @tc.desc   Test CertCRLCollection.selectCerts with empty validDate string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_2700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const collection: cert.CertCRLCollection = cert.createCertCRLCollection([x509Cert], []);
          const matchParams: cert.X509CertMatchParameters = {
            validDate: ""
          };
          await collection.selectCerts(matchParams);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_2700 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_2800
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_2800
     * @tc.desc   Test CertCRLCollection.selectCRLs with empty updateDateTime string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_2800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const crlEncodingBlob: cert.EncodingBlob = {
            data: new Uint8Array(noCertCrl.length),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          for (let i = 0; i < noCertCrl.length; i++) {
            crlEncodingBlob.data[i] = noCertCrl.charCodeAt(i);
          }
          const x509CRL: cert.X509CRL = await cert.createX509CRL(crlEncodingBlob);
          const collection: cert.CertCRLCollection = cert.createCertCRLCollection([], [x509CRL]);
          const matchParams: cert.X509CRLMatchParameters = {
            updateDateTime: ""
          };
          await collection.selectCRLs(matchParams);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_2800 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_2900
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_2900
     * @tc.desc   Test buildX509CertChain with empty date string in CertChainValidationParameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_2900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const buildParam: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              date: "",
              trustAnchors: [{
                CACert: x509Cert
              }]
            }
          };
          await cert.buildX509CertChain(buildParam);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_2900 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_3000
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_3000
     * @tc.desc   Test buildX509CertChain with empty sslHostname string in CertChainValidationParameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_3000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const buildParam: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              sslHostname: "",
              trustAnchors: [{
                CACert: x509Cert
              }]
            }
          };
          await cert.buildX509CertChain(buildParam);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_3000 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_3100
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_3100
     * @tc.desc   Test buildX509CertChain with empty ocspResponderURI string in RevocationCheckParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_3100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const buildParam: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              trustAnchors: [{
                CACert: x509Cert
              }],
              revocationCheckParam: {
                ocspResponderURI: ""
              }
            }
          };
          await cert.buildX509CertChain(buildParam);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_3100 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_3200
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_3200
     * @tc.desc   Test buildX509CertChain with empty crlDownloadURI string in RevocationCheckParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_3200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const buildParam: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              trustAnchors: [{
                CACert: x509Cert
              }],
              revocationCheckParam: {
                crlDownloadURI: ""
              }
            }
          };
          await cert.buildX509CertChain(buildParam);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_3200 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_3300
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_3300
     * @tc.desc   Test buildX509CertChain with empty ocspDigest string in RevocationCheckParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_3300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const buildParam: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              trustAnchors: [{
                CACert: x509Cert
              }],
              revocationCheckParam: {
                ocspDigest: ""
              }
            }
          };
          await cert.buildX509CertChain(buildParam);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_3300 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_3400
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_3400
     * @tc.desc   Test buildX509CertChain with empty publicKeyAlgID string in X509CertMatchParameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_3400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const buildParam: cert.CertChainBuildParameters = {
            certMatchParameters: {
              publicKeyAlgID: ""
            },
            validationParameters: {
              trustAnchors: [{
                CACert: x509Cert
              }]
            }
          };
          await cert.buildX509CertChain(buildParam);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_3400 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_3500
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_3500
     * @tc.desc   Test buildX509CertChain with empty privateKeyValid string in X509CertMatchParameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_3500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const buildParam: cert.CertChainBuildParameters = {
            certMatchParameters: {
              privateKeyValid: ""
            },
            validationParameters: {
              trustAnchors: [{
                CACert: x509Cert
              }]
            }
          };
          await cert.buildX509CertChain(buildParam);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_3500 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Reinforcement_Func_3600
     * @tc.number SUB_Security_Cert_Framework_Reinforcement_Func_3600
     * @tc.desc   Test CmsParser.decryptEnvelopedData with empty password string in PrivateKeyInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Reinforcement_Func_3600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const cmsParser: cert.CmsParser = cert.createCmsParser();
          const cmsData: string =
            "-----BEGIN CMS-----\n" +
            "MIIBSwYLKoZIhvcNAQkQARegggE6MIIBNgIBADGB8aGB7gIBA6BRoU8wCQYHKoZI\n" +
            "zj0CAQNCAASzqVn7O2zw/oxLiKyTPROjekfsStvKnIprrS86sAnvWs/1RfoE87cY\n" +
            "s+7uUcgG1U55n0jyp1mTwKUKRGXvPiKvMBUGBiuBBAELATALBglghkgBZQMEAQUw\n" +
            "fzB9MGEwVzELMAkGA1UEBhMCQ04xDzANBgNVBAgMBumZleilvzEPMA0GA1UEBwwG\n" +
            "6KW/5a6JMQ8wDQYDVQQKDAbmtYvor5UxFTATBgNVBAMMDOS4reaWh+a1i+ivlQIG\n" +
            "AXKnJjrABBiGOFvlfkb4OKegab4fZToY88UjwiTpXN4wKwYJKoZIhvcNAQcBMB4G\n" +
            "CWCGSAFlAwQBBjARBAzNut4BFBrKgPmOsioCARAEEE/W87JLt45l7wbPRPH9oaU=\n" +
            "-----END CMS-----";
          const key: string =
            '-----BEGIN ENCRYPTED PRIVATE KEY-----\n'                            +
            'MIICxDBOBgkqhkiG9w0BBQ0wQTApBgkqhkiG9w0BBQwwHAQIsy4Q/sv+GU4CAggA\n' +
            'MAwGCCqGSIb3DQIJBQAwFAYIKoZIhvcNAwcECFnyarnEl31vBIICcLppvcGXx/eY\n' +
            '4cbvV0h0FD62p0Zv8PlIdmfIZ3KVNJntt1LC3p8++Ba7TzglNujAbkMwROQ3mp9Z\n' +
            'WIDzz7tzHWAVl+akwMEOMnf8upf30noZ2TVr8Van5uDeao29Inx5zk8mH34NoMJl\n' +
            'eudORik9fcLTyXEbMBTVzi5kGikzvCK7UtCt7XhqpCril8/sh1b/QJkopr8VALn0\n' +
            'p9G2BzvUP8Pm9b45v0iv5Of4VJE+sMor8iWpFBVxnt5j6Gq6Y4kXHa9QFExf4Cnd\n' +
            'wBxAd6EHkn+9M0/gsaSyJ6qcVDLy5YP6nxUwjsyVefqMtk+Sc8PJK17dR+yUK6kT\n' +
            'S3HL5RpIAZbFOKm/fhAyyKED9cam80OcYfIeUuh0v+vCTOzdR5xoiy59CAmD/1gn\n' +
            '0kTf66tTO6+VBOUXhY2m2x3ZNbpAAQ+UJb4D9E7IGjQHJR/IqoLspPMAYkU2Q06G\n' +
            'OMxrKiUPGqtLkhLDApVbRnUvHi9rHl5svJ/Z8ptcKSGBXkthqdQoubTb6/YKNIfG\n' +
            'C8SQa7eDQvgE3G90Uu7BIEAtKi2kkoh49LGYKyouGlgo3WVlCqttXnHoOuHPS6w0\n' +
            'zrqfpvSHjWJGUaA8Omb72AHZCa3lXdU/xJwDFjw+bUksU/aD7dDrpzw1wJ86TRjv\n' +
            'IL9rS821xUWkd47AjbSwY0Znr7+Y29KSV4zTIn8nacZVTCMDJYk6rYhAMY800G2p\n' +
            'X/OdID5b8P9Gpfs2Fy6OAvNjV3NINJB0M54FjKp+D4NupFFpuEDRL/azlWXmkV1C\n' +
            'ESn0rTdtg+ebGu08yb28kL3hW10sQWUc8IxsUlPA8H2YT1c7Ai2skQ==\n'         +
            '-----END ENCRYPTED PRIVATE KEY-----';
          await cmsParser.setRawData(cmsData, cert.CmsFormat.PEM);
          const decryptConfig: cert.CmsEnvelopedDecryptionConfig = {
            keyInfo: {
              key: key,
              password: ""
            }
          };
          await cmsParser.decryptEnvelopedData(decryptConfig);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Reinforcement_Func_3600 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

  });
}