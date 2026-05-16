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
import { stringToUint8Array } from "./utils/certificate/p12";
import { endEntityCert, intermediateCert,
  otherEndEntityCert,
  otherIntermediateCert,
  otherRootCaCert,
  rootCaCert, rootChainPem } from "./utils/certchain/certChainPem";


export default function certFrameworkRootCaCertTestUnit() {
  describe("certFrameworkRootCaCertTestUnit", (): void => {
    
    /**
     * @tc.name   SUB_Security_Cert_Framework_RootCA_Func_0100
     * @tc.number SUB_Security_Cert_Framework_RootCA_Func_0100
     * @tc.desc   Use Promise Type, Test Old Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_RootCA_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let encodingBlob1: cert.EncodingBlob = {
          data: stringToUint8Array(rootChainPem),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let encodingBlob2: cert.EncodingBlob = {
          data: stringToUint8Array(rootCaCert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509CertChain: cert.X509CertChain = await cert.createX509CertChain(encodingBlob1);
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob2);
        const param: cert.CertChainValidationParameters = {
          trustAnchors: [
            {
              CACert: x509Cert
            }
          ],
        }
        const validationRes: cert.CertChainValidationResult = await x509CertChain.validate(param);
        expect(validationRes.trustAnchor.CACert).not().assertNull();
      } catch (error: BusinessError) {
        console.error(`RootCA_Func_0100 1.1 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_RootCA_Func_0200
     * @tc.number SUB_Security_Cert_Framework_RootCA_Func_0200
     * @tc.desc   Use Promise Type, TrustSystemCa Is False, Test New Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_RootCA_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob1: cert.EncodingBlob = {
            data: stringToUint8Array(rootChainPem),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlob2: cert.EncodingBlob = {
            data: stringToUint8Array(rootCaCert),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509CertChain: cert.X509CertChain = await cert.createX509CertChain(encodingBlob1);
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob2);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [
              {
                CACert: x509Cert
              }
            ],
            trustSystemCa: false
          }
          const validationRes: cert.CertChainValidationResult = await x509CertChain.validate(param);
          expect(validationRes.trustAnchor.CACert).not().assertNull();
        } catch (error: BusinessError) {
          console.error(`RootCA_Func_0200 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_RootCA_Func_0300
     * @tc.number SUB_Security_Cert_Framework_RootCA_Func_0300
     * @tc.desc   Use Promise Type, TrustSystemCa Is True, Test New Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_RootCA_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringToUint8Array(rootChainPem),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509CertChain: cert.X509CertChain = await cert.createX509CertChain(encodingBlob);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [],
            trustSystemCa: true // rootCa: aefc3878.0
          }
          const validationRes: cert.CertChainValidationResult = await x509CertChain.validate(param);
          expect(validationRes.trustAnchor.CACert).not().assertNull();
        } catch (error: BusinessError) {
          console.error(`RootCA_Func_0300 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_RootCA_Func_0400
     * @tc.number SUB_Security_Cert_Framework_RootCA_Func_0400
     * @tc.desc   Use Promise Type, TrustSystemCa Is True, Test New Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_RootCA_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob1: cert.EncodingBlob = {
            data: stringToUint8Array(rootChainPem),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlob2: cert.EncodingBlob = {
            data: stringToUint8Array(intermediateCert),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlob3: cert.EncodingBlob = {
            data: stringToUint8Array(endEntityCert),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509CertChain: cert.X509CertChain = await cert.createX509CertChain(encodingBlob1);
          let x509Cert1: cert.X509Cert = await cert.createX509Cert(encodingBlob2);
          let x509Cert2: cert.X509Cert = await cert.createX509Cert(encodingBlob3);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [
              {
                CACert: x509Cert1
              },
              {
                CACert: x509Cert2
              }
            ],
            trustSystemCa: true // rootCa: aefc3878.0
          }
          const validationRes: cert.CertChainValidationResult = await x509CertChain.validate(param);
          expect(validationRes.trustAnchor.CACert).not().assertNull();
        } catch (error: BusinessError) {
          console.error(`RootCA_Func_0400 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_RootCA_Func_0500
     * @tc.number SUB_Security_Cert_Framework_RootCA_Func_0500
     * @tc.desc   Use Promise Type, TrustSystemCa Is True, Test New Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_RootCA_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob1: cert.EncodingBlob = {
            data: stringToUint8Array(rootChainPem),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlob2: cert.EncodingBlob = {
            data: stringToUint8Array(intermediateCert),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlob3: cert.EncodingBlob = {
            data: stringToUint8Array(endEntityCert),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlob4: cert.EncodingBlob = {
            data: stringToUint8Array(rootCaCert),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509CertChain: cert.X509CertChain = await cert.createX509CertChain(encodingBlob1);
          let x509Cert1: cert.X509Cert = await cert.createX509Cert(encodingBlob2);
          let x509Cert2: cert.X509Cert = await cert.createX509Cert(encodingBlob3);
          let x509Cert3: cert.X509Cert = await cert.createX509Cert(encodingBlob4);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [
              {
                CACert: x509Cert3,
                CAPubKey: new Uint8Array([
                  0x30, 0x59, 0x30, 0x13, 0x06, 0x07, 0x2a, 0x86, 0x48, 0xce, 0x3d, 0x02, 0x01, 0x06, 0x08, 0x2a,
                  0x86, 0x48, 0xce, 0x3d, 0x03, 0x01, 0x07, 0x03, 0x42, 0x00, 0x04, 0xc1, 0x18, 0x91, 0x7f, 0xd1,
                  0x0f, 0x76, 0x53, 0xf9, 0x4a, 0x93, 0x2e, 0x51, 0x10, 0x1c, 0x62, 0xe2, 0x07, 0xf3, 0x74, 0x24,
                  0x66, 0xbc, 0xcf, 0x6c, 0x95, 0x09, 0x65, 0x22, 0x70, 0xbb, 0xad, 0x24, 0xd9, 0xf3, 0x66, 0x87,
                  0x41, 0x2d, 0xc8, 0xf9, 0xa3, 0x3f, 0x00, 0x7c, 0x6e, 0x01, 0x21, 0xb4, 0xfe, 0x78, 0x09, 0xea,
                  0x00, 0xeb, 0x87, 0x4f, 0x1b, 0xaa, 0x24, 0xab, 0xad, 0xc5, 0x4c
                ])
              },
              {
                CACert: x509Cert1
              },
              {
                CACert: x509Cert2
              }
            ],
            trustSystemCa: true // rootCa: aefc3878.0
          }
          const validationRes: cert.CertChainValidationResult = await x509CertChain.validate(param);
          expect(validationRes.trustAnchor.CACert).not().assertNull();
        } catch (error: BusinessError) {
          console.error(`RootCA_Func_0500 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_RootCA_Func_0600
     * @tc.number SUB_Security_Cert_Framework_RootCA_Func_0600
     * @tc.desc   Use Callback Type, TrustSystemCa Is False, Test New Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_RootCA_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob1: cert.EncodingBlob = {
            data: stringToUint8Array(rootChainPem),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlob2: cert.EncodingBlob = {
            data: stringToUint8Array(rootCaCert),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509CertChain: cert.X509CertChain = await cert.createX509CertChain(encodingBlob1);
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob2);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [
              {
                CACert: x509Cert
              }
            ],
            trustSystemCa: false
          }
          const validationRes: cert.CertChainValidationResult =
            await new Promise<cert.CertChainValidationResult>((resolve, reject) => {
            x509CertChain.validate(param, (err, data) => {
              if (err || data === undefined) {
                reject(err as Error);
              } else {
                resolve(data);
              }
            });
          });
          expect(validationRes.trustAnchor.CACert).not().assertNull();
        } catch (error: BusinessError) {
          console.error(`RootCA_Func_0600 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_RootCA_Func_0700
     * @tc.number SUB_Security_Cert_Framework_RootCA_Func_0700
     * @tc.desc   Use Callback Type, TrustSystemCa Is True, Test New Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_RootCA_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringToUint8Array(rootChainPem),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509CertChain: cert.X509CertChain = await cert.createX509CertChain(encodingBlob);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [],
            trustSystemCa: true // rootCa: aefc3878.0
          }
          const validationRes: cert.CertChainValidationResult =
            await new Promise<cert.CertChainValidationResult>((resolve, reject) => {
              x509CertChain.validate(param, (err, data) => {
                if (err || data === undefined) {
                  reject(err as Error);
                } else {
                  resolve(data);
                }
              });
            });
          expect(validationRes.trustAnchor.CACert).not().assertNull();
        } catch (error: BusinessError) {
          console.error(`RootCA_Func_0700 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_RootCA_Func_0800
     * @tc.number SUB_Security_Cert_Framework_RootCA_Func_0800
     * @tc.desc   Use Promise Type, TrustSystemCa Is True, Test New Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_RootCA_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob1: cert.EncodingBlob = {
            data: stringToUint8Array(rootChainPem),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlob2: cert.EncodingBlob = {
            data: stringToUint8Array(intermediateCert),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlob3: cert.EncodingBlob = {
            data: stringToUint8Array(endEntityCert),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509CertChain: cert.X509CertChain = await cert.createX509CertChain(encodingBlob1);
          let x509Cert1: cert.X509Cert = await cert.createX509Cert(encodingBlob2);
          let x509Cert2: cert.X509Cert = await cert.createX509Cert(encodingBlob3);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [
              {
                CACert: x509Cert1
              },
              {
                CACert: x509Cert2
              }
            ],
            trustSystemCa: true // rootCa: aefc3878.0
          }
          const validationRes: cert.CertChainValidationResult =
            await new Promise<cert.CertChainValidationResult>((resolve, reject) => {
              x509CertChain.validate(param, (err, data) => {
                if (err || data === undefined) {
                  reject(err as Error);
                } else {
                  resolve(data);
                }
              });
            });
          expect(validationRes.trustAnchor.CACert).not().assertNull();
        } catch (error: BusinessError) {
          console.error(`RootCA_Func_0800 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_RootCA_Func_0900
     * @tc.number SUB_Security_Cert_Framework_RootCA_Func_0900
     * @tc.desc   Use Callback Type, TrustSystemCa Is True, Test New Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_RootCA_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob1: cert.EncodingBlob = {
            data: stringToUint8Array(rootChainPem),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlob2: cert.EncodingBlob = {
            data: stringToUint8Array(intermediateCert),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlob3: cert.EncodingBlob = {
            data: stringToUint8Array(endEntityCert),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlob4: cert.EncodingBlob = {
            data: stringToUint8Array(rootCaCert),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509CertChain: cert.X509CertChain = await cert.createX509CertChain(encodingBlob1);
          let x509Cert1: cert.X509Cert = await cert.createX509Cert(encodingBlob2);
          let x509Cert2: cert.X509Cert = await cert.createX509Cert(encodingBlob3);
          let x509Cert3: cert.X509Cert = await cert.createX509Cert(encodingBlob4);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [
              {
                CACert: x509Cert3,
                CAPubKey: new Uint8Array([
                  0x30, 0x59, 0x30, 0x13, 0x06, 0x07, 0x2a, 0x86, 0x48, 0xce, 0x3d, 0x02, 0x01, 0x06, 0x08, 0x2a,
                  0x86, 0x48, 0xce, 0x3d, 0x03, 0x01, 0x07, 0x03, 0x42, 0x00, 0x04, 0xc1, 0x18, 0x91, 0x7f, 0xd1,
                  0x0f, 0x76, 0x53, 0xf9, 0x4a, 0x93, 0x2e, 0x51, 0x10, 0x1c, 0x62, 0xe2, 0x07, 0xf3, 0x74, 0x24,
                  0x66, 0xbc, 0xcf, 0x6c, 0x95, 0x09, 0x65, 0x22, 0x70, 0xbb, 0xad, 0x24, 0xd9, 0xf3, 0x66, 0x87,
                  0x41, 0x2d, 0xc8, 0xf9, 0xa3, 0x3f, 0x00, 0x7c, 0x6e, 0x01, 0x21, 0xb4, 0xfe, 0x78, 0x09, 0xea,
                  0x00, 0xeb, 0x87, 0x4f, 0x1b, 0xaa, 0x24, 0xab, 0xad, 0xc5, 0x4c
                ])
              },
              {
                CACert: x509Cert1
              },
              {
                CACert: x509Cert2
              }
            ],
            trustSystemCa: true // rootCa: aefc3878.0
          }
          const validationRes: cert.CertChainValidationResult =
            await new Promise<cert.CertChainValidationResult>((resolve, reject) => {
              x509CertChain.validate(param, (err, data) => {
                if (err || data === undefined) {
                  reject(err as Error);
                } else {
                  resolve(data);
                }
              });
            });
          expect(validationRes.trustAnchor.CACert).not().assertNull();
        } catch (error: BusinessError) {
          console.error(`RootCA_Func_0900 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_RootCA_Func_1000
     * @tc.number SUB_Security_Cert_Framework_RootCA_Func_1000
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_RootCA_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringToUint8Array(rootChainPem),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509CertChain: cert.X509CertChain = await cert.createX509CertChain(encodingBlob);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [],
            date: "250809115731Z"
          }
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`RootCA_Func_1000 1.1 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_RootCA_Func_1100
     * @tc.number SUB_Security_Cert_Framework_RootCA_Func_1100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_RootCA_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringToUint8Array(rootChainPem),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509CertChain: cert.X509CertChain = await cert.createX509CertChain(encodingBlob);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{}],
            date: "250809115731Z"
          }
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`RootCA_Func_1100 1.1 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_RootCA_Func_1200
     * @tc.number SUB_Security_Cert_Framework_RootCA_Func_1200
     * @tc.desc   Use Promise Type, TrustSystemCa Is True, Test New Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_RootCA_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob1: cert.EncodingBlob = {
            data: stringToUint8Array(rootChainPem),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlob2: cert.EncodingBlob = {
            data: stringToUint8Array(otherRootCaCert),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509CertChain: cert.X509CertChain = await cert.createX509CertChain(encodingBlob1);
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob2);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [
              {
                CACert: x509Cert,
              }
            ],
            trustSystemCa: true // rootCa: aefc3878.0
          }
          const validationRes: cert.CertChainValidationResult = await x509CertChain.validate(param);
          expect(validationRes.trustAnchor.CACert).not().assertNull();
        } catch (error: BusinessError) {
          console.error(`RootCA_Func_1200 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_RootCA_Func_1300
     * @tc.number SUB_Security_Cert_Framework_RootCA_Func_1300
     * @tc.desc   Use Promise Type, TrustSystemCa Is True, Test New Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_RootCA_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringToUint8Array(rootChainPem),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509CertChain: cert.X509CertChain = await cert.createX509CertChain(encodingBlob);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [
              {
                CAPubKey: new Uint8Array([
                  0x30, 0x59, 0x30, 0x13, 0x06, 0x37, 0x3a, 0x36, 0x38, 0x3e, 0x3d, 0x32, 0x31, 0x36, 0x08, 0x2a,
                  0x86, 0x48, 0xce, 0x3d, 0x03, 0x01, 0x07, 0x03, 0x42, 0x00, 0x04, 0xc1, 0x18, 0x91, 0x7f, 0xd1,
                  0x0f, 0x76, 0x53, 0xf9, 0x4a, 0x93, 0x2e, 0x51, 0x10, 0x1c, 0x62, 0xe2, 0x07, 0xf3, 0x74, 0x24,
                  0x66, 0xbc, 0xcf, 0x6c, 0x95, 0x09, 0x65, 0x22, 0x70, 0xbb, 0xad, 0x24, 0xd9, 0xf3, 0x66, 0x87,
                  0x41, 0x2d, 0xc8, 0xf9, 0xa3, 0x3f, 0x00, 0x7c, 0x6e, 0x01, 0x21, 0xb4, 0xfe, 0x78, 0x09, 0xea,
                  0x00, 0xeb, 0x87, 0x4f, 0x1b, 0xaa, 0x24, 0xab, 0xad, 0xc5, 0x4c
                ])
              }
            ],
            trustSystemCa: true // rootCa: aefc3878.0 is success, aefc3878.1 is failed
          }
          const validationRes: cert.CertChainValidationResult = await x509CertChain.validate(param);
          expect(validationRes.trustAnchor.CACert).not().assertNull();
        } catch (error: BusinessError) {
          console.error(`RootCA_Func_1300 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_RootCA_Func_1400
     * @tc.number SUB_Security_Cert_Framework_RootCA_Func_1400
     * @tc.desc   Use Callback Type, TrustSystemCa Is True, Test New Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_RootCA_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob1: cert.EncodingBlob = {
            data: stringToUint8Array(rootChainPem),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlob2: cert.EncodingBlob = {
            data: stringToUint8Array(intermediateCert),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlob3: cert.EncodingBlob = {
            data: stringToUint8Array(endEntityCert),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlob4: cert.EncodingBlob = {
            data: stringToUint8Array(rootCaCert),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509CertChain: cert.X509CertChain = await cert.createX509CertChain(encodingBlob1);
          let x509Cert1: cert.X509Cert = await cert.createX509Cert(encodingBlob2);
          let x509Cert2: cert.X509Cert = await cert.createX509Cert(encodingBlob3);
          let x509Cert3: cert.X509Cert = await cert.createX509Cert(encodingBlob4);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [
              {
                CACert: x509Cert1
              },
              {
                CACert: x509Cert3
              },
              {
                CACert: x509Cert2
              }
            ],
            trustSystemCa: true // rootCa: aefc3878.0
          }
          const validationRes: cert.CertChainValidationResult =
            await new Promise<cert.CertChainValidationResult>((resolve, reject) => {
              x509CertChain.validate(param, (err, data) => {
                if (err || data === undefined) {
                  reject(err as Error);
                } else {
                  resolve(data);
                }
              });
            });
          expect(validationRes.trustAnchor.CACert).not().assertNull();
        } catch (error: BusinessError) {
          console.error(`RootCA_Func_1400 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_RootCA_Func_1500
     * @tc.number SUB_Security_Cert_Framework_RootCA_Func_1500
     * @tc.desc   Use Promise Type, TrustSystemCa Is True, Test New Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_RootCA_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob1: cert.EncodingBlob = {
            data: stringToUint8Array(rootChainPem),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlob2: cert.EncodingBlob = {
            data: stringToUint8Array(otherIntermediateCert),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509CertChain: cert.X509CertChain = await cert.createX509CertChain(encodingBlob1);
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob2);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [
              {
                CACert: x509Cert,
              }
            ],
            trustSystemCa: true // rootCa: aefc3878.0
          }
          const validationRes: cert.CertChainValidationResult = await x509CertChain.validate(param);
          expect(validationRes.trustAnchor.CACert).not().assertNull();
        } catch (error: BusinessError) {
          console.error(`RootCA_Func_1500 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_RootCA_Func_1600
     * @tc.number SUB_Security_Cert_Framework_RootCA_Func_1600
     * @tc.desc   Use Promise Type, TrustSystemCa Is True, Test New Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_RootCA_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob1: cert.EncodingBlob = {
            data: stringToUint8Array(rootChainPem),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlob2: cert.EncodingBlob = {
            data: stringToUint8Array(otherEndEntityCert),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509CertChain: cert.X509CertChain = await cert.createX509CertChain(encodingBlob1);
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob2);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [
              {
                CACert: x509Cert,
              }
            ],
            trustSystemCa: true // rootCa: aefc3878.0
          }
          const validationRes: cert.CertChainValidationResult = await x509CertChain.validate(param);
          expect(validationRes.trustAnchor.CACert).not().assertNull();
        } catch (error: BusinessError) {
          console.error(`RootCA_Func_1600 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });
      
    /**
     * @tc.name   SUB_Security_Cert_Framework_RootCA_Func_1700
     * @tc.number SUB_Security_Cert_Framework_RootCA_Func_1700
     * @tc.desc   Use Promise Type, TrustSystemCa Is True, Test New Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_RootCA_Func_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob1: cert.EncodingBlob = {
            data: stringToUint8Array(intermediateCert),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlob2: cert.EncodingBlob = {
            data: stringToUint8Array(endEntityCert),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509CertChain: cert.X509CertChain = await cert.createX509CertChain(encodingBlob1);
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob2);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [
              {
                CACert: x509Cert
              }
            ],
            trustSystemCa: true // rootCa: aefc3878.0
          }
          const validationRes: cert.CertChainValidationResult = await x509CertChain.validate(param);
          expect(validationRes.trustAnchor.CACert).not().assertNull();
        } catch (error: BusinessError) {
          console.error(`RootCA_Func_1700 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_RootCA_Func_1800
     * @tc.number SUB_Security_Cert_Framework_RootCA_Func_1800
     * @tc.desc   Use Promise Type, TrustSystemCa Is True, Test New Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_RootCA_Func_1800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob1: cert.EncodingBlob = {
            data: stringToUint8Array(endEntityCert),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509CertChain: cert.X509CertChain = await cert.createX509CertChain(encodingBlob1);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [],
            trustSystemCa: true // rootCa: c4bcda47.0
          }
          const validationRes: cert.CertChainValidationResult = await x509CertChain.validate(param);
          expect(validationRes.trustAnchor.CACert).not().assertNull();
        } catch (error: BusinessError) {
          console.error(`RootCA_Func_1800 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

  })
}