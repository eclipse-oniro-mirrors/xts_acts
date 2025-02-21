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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import cert from '@ohos.security.cert';
import * as certChainFunc from "./utils/certchain/certChainFunc";
import * as certChainFunc3 from "./utils/certchain/certChainFunc3";
import { BusinessError } from '@ohos.base';

export default function certFrameworkCertNameJsAPIFunctionTestUnit() {
  describe("certFrameworkCertNameJsAPIFunctionTestUnit", () => {
    let certChain0: cert.X509CertChain = {} as cert.X509CertChain;
    let rootCaCert0: cert.X509Cert = {} as cert.X509Cert;
    let leafCert: cert.X509Cert = {} as cert.X509Cert;
    let parentCert0: cert.X509Cert = {} as cert.X509Cert;
    let otherCert: cert.X509Cert = {} as cert.X509Cert;
    console.info("##########start certFrameworkCertNameJsAPIFunctionTestUnit##########");
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      // Create X509 certChain0-certChain2
      try {
        certChain0 = await certChainFunc.createX509CertChainPromise("pem", 0);
        expect(certChain0 != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(inStream: EncodingBlob) error", err);
        expect(null).assertFail();
      }
      // Create Root X509 Cert, Leaf X509 Cert, Parent X509 Cert
      try {
        parentCert0 = await certChainFunc.createCustomizedX509CertPromise('pem', 3);
        rootCaCert0 = await certChainFunc.createCustomizedX509CertPromise('pem', 2);
        leafCert = await certChainFunc.createCustomizedX509CertPromise('pem', 0);
        otherCert = await certChainFunc.createCustomizedX509CertPromise('pem', 5);
        expect(parentCert0 != null).assertTrue();
        expect(rootCaCert0 != null).assertTrue();
        expect(leafCert != null).assertTrue();
        expect(otherCert != null).assertTrue();
      } catch (err) {
        console.error("createX509Cert error", err);
        expect(null).assertFail();
      }
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(async () => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_0100
     * @tc.name check createX500DistinguishedName with param nameStr normal
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_0100", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_0100';
      let nameStr = '/CN=John Doe/OU=IT Department/O=ACME Inc./L=San Francisco/ST=California/C=US/CN=ALN C/CN=XTS';
      try {
        cert.createX500DistinguishedName(nameStr)
          .then((data) => {
            console.log(`${caseName} createX500DistinguishedName sucess: ${JSON.stringify(data.getName())}`);
            expect(data.getName() == nameStr).assertTrue();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${caseName} createX500DistinguishedName failed,err: ${JSON.stringify(err)}`);
            expect(null).assertFail();
            done();
          })
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_0200
     * @tc.name check createX500DistinguishedName with param nameStr abnormal
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_0200", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_0200';
      let nameStr = 'CN=John Doe';
      try {
        cert.createX500DistinguishedName(nameStr)
          .then((data) => {
            console.log(`${caseName} createX500DistinguishedName sucess: ${JSON.stringify(data.getName())}`);
            expect(null).assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${caseName} createX500DistinguishedName failed,err: ${JSON.stringify(err)}`);
            expect(err.code == cert.CertResult.ERR_CRYPTO_OPERATION).assertTrue();
            done();
          })
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_0300
     * @tc.name check createX500DistinguishedName with param nameStr empty
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_0300", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_0300';
      let nameStr = '';
      try {
        cert.createX500DistinguishedName(nameStr)
          .then((data) => {
            expect(null).assertFail();
          })
          .catch((err: BusinessError) => {
            console.error(`${caseName} createX500DistinguishedName failed,err: ${JSON.stringify(err)}`);
            expect(null).assertFail();
          })
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(error.code == cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_0400
     * @tc.name check createX500DistinguishedName with param nameDer normal
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_0400", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_0400';
      let nameDer = certChainFunc3.nameDer;
      try {
        cert.createX500DistinguishedName(nameDer)
          .then((data) => {
            console.log(`${caseName} createX500DistinguishedName sucess: ${JSON.stringify(data.getEncoded().data)}`);
            expect(data.getEncoded().data != null).assertTrue();
            expect(data.getEncoded().data.length == 70).assertTrue();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${caseName} createX500DistinguishedName failed,err: ${JSON.stringify(err)}`);
            expect(null).assertFail();
            done();
          })
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_0500
     * @tc.name check createX500DistinguishedName with param nameDer abnormal
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_0500", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_0500';
      let nameDer = new Uint8Array([0x30, 0x82, 0x01]);
      try {
        cert.createX500DistinguishedName(nameDer)
          .then((data) => {
            console.log(`${caseName} createX500DistinguishedName sucess: ${JSON.stringify(data.getName())}`);
            expect(null).assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${caseName} createX500DistinguishedName failed,err: ${JSON.stringify(err)}`);
            expect(err.code == cert.CertResult.ERR_CRYPTO_OPERATION).assertTrue();
            done();
          })
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_0600
     * @tc.name check createX500DistinguishedName with param nameDer empty
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_0600", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_0600';
      let nameDer = new Uint8Array();
      try {
        cert.createX500DistinguishedName(nameDer)
          .then((data) => {
            console.log(`${caseName} createX500DistinguishedName sucess: ${JSON.stringify(data.getName())}`);
            expect(null).assertFail();
          })
          .catch((err: BusinessError) => {
            console.error(`${caseName} createX500DistinguishedName failed,err: ${JSON.stringify(err)}`);
            expect(null).assertFail();
          })
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(error.code == cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_0700
     * @tc.name check X500DistinguishedName.getName() result
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_0700", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_0700';
      let nameStr = '/CN=John Doe/OU=IT Department/O=ACME Inc./L=San Francisco/ST=California/C=US/CN=ALN C/CN=XTS';
      try {
        cert.createX500DistinguishedName(nameStr)
          .then((data) => {
            console.log(`${caseName} createX500DistinguishedName sucess: ${JSON.stringify(data.getName())}`);
            expect(data.getName() == nameStr).assertTrue();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${caseName} createX500DistinguishedName failed,err: ${JSON.stringify(err)}`);
            expect(null).assertFail();
            done();
          })
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_0800
     * @tc.name check X500DistinguishedName.getName() result transferred to createX500DistinguishedName
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_0800", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_0800';
      let nameStr = '/CN=John Doe/OU=IT Department/O=ACME Inc./L=San Francisco/ST=California/C=US/CN=ALN C/CN=XTS';
      try {
        cert.createX500DistinguishedName(nameStr)
          .then((data) => {
            console.log(`${caseName} createX500DistinguishedName1 sucess: ${JSON.stringify(data.getName())}`);
            cert.createX500DistinguishedName(data.getName())
              .then((data) => {
                console.log(`${caseName} createX500DistinguishedName2 sucess: ${JSON.stringify(data.getName())}`);
                expect(data.getName() == nameStr).assertTrue();
                done();
              })
              .catch((err: BusinessError) => {
                console.error(`${caseName} createX500DistinguishedName2 failed,err: ${JSON.stringify(err)}`);
                expect(null).assertFail();
                done();
              })
          })
          .catch((err: BusinessError) => {
            console.error(`${caseName} createX500DistinguishedName1 failed,err: ${JSON.stringify(err)}`);
            expect(null).assertFail();
            done();
          })
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_0900
     * @tc.name check X500DistinguishedName.getName(type) result
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_0900", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_0900';
      let nameStr = '/CN=John Doe/OU=IT Department/O=ACME Inc./L=San Francisco/ST=California/C=US/CN=ALN C/CN=XTS';
      let nameType = 'CN';
      try {
        cert.createX500DistinguishedName(nameStr)
          .then((data) => {
            console.log(`${caseName} createX500DistinguishedName sucess: ${JSON.stringify(data.getName(nameType))}`);
            expect(data.getName(nameType)[0] == 'John Doe').assertTrue();
            expect(data.getName(nameType)[1] == 'ALN C').assertTrue();
            expect(data.getName(nameType)[2] == 'XTS').assertTrue();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${caseName} createX500DistinguishedName failed,err: ${JSON.stringify(err)}`);
            expect(null).assertFail();
            done();
          })
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_1000
     * @tc.name check X500DistinguishedName.getName(type)result,param type abnormal
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_1000", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_1000';
      let nameStr = '/CN=John Doe/OU=IT Department/O=ACME Inc./L=San Francisco/ST=California/C=US/CN=ALN C/CN=XTS';
      let nameType = 'abc';
      try {
        cert.createX500DistinguishedName(nameStr)
          .then((data) => {
            console.log(`${caseName} createX500DistinguishedName sucess: ${JSON.stringify(data.getName(nameType))}`);
            expect(data.getName(nameType) == undefined).assertTrue();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${caseName} createX500DistinguishedName failed,err: ${JSON.stringify(err)}`);
            expect(null).assertFail();
            done();
          })
      } catch (error) {
        console.error(`${caseName} createX500DistinguishedName catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_1100
     * @tc.name check X500DistinguishedName.getName(type)result,param type empty
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_1100", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_1100';
      let nameStr = '/CN=John Doe/OU=IT Department/O=ACME Inc./L=San Francisco/ST=California/C=US/CN=ALN C/CN=XTS';
      let nameType = '';
      try {
        cert.createX500DistinguishedName(nameStr)
          .then((data) => {
            console.log(`${caseName} createX500DistinguishedName sucess: ${JSON.stringify(data.getName())}`);
            try {
              data.getName(nameType);
            } catch (err) {
              console.error(`${caseName} getName catch error: ${JSON.stringify(err)}`);
              expect(err.code == cert.CertResult.INVALID_PARAMS).assertTrue();
              done();
            }
          })
          .catch((err: BusinessError) => {
            console.error(`${caseName} createX500DistinguishedName failed,err: ${JSON.stringify(err)}`);
            expect(null).assertFail();
            done();
          })
      } catch (error) {
        console.error(`${caseName} createX500DistinguishedName catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_1200
     * @tc.name check X500DistinguishedName.getEncoded() result
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_1200", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_1200';
      let nameDer = certChainFunc3.nameDer;
      try {
        cert.createX500DistinguishedName(nameDer)
          .then((data) => {
            console.log(`${caseName} createX500DistinguishedName sucess: ${JSON.stringify(data.getEncoded().data)}`);
            expect(data.getEncoded().data != null).assertTrue();
            expect(data.getEncoded().data.length == 70).assertTrue();
            expect(data.getEncoded().encodingFormat == cert.EncodingFormat.FORMAT_DER);
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${caseName} createX500DistinguishedName failed,err: ${JSON.stringify(err)}`);
            expect(null).assertFail();
            done();
          })
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_1300
     * @tc.name check X500DistinguishedName.getEncoded() result transferred to createX500DistinguishedName
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_1300", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_1300';
      let nameDer = certChainFunc3.nameDer;
      try {
        cert.createX500DistinguishedName(nameDer)
          .then((data) => {
            console.log(`${caseName} createX500DistinguishedName1 sucess: ${JSON.stringify(data.getEncoded().data)}`);
            cert.createX500DistinguishedName(data.getEncoded().data)
              .then((data) => {
                console.log(`${caseName} createX500DistinguishedName2 sucess: ${JSON.stringify(data.getEncoded()
                  .data)}`);
                expect(data.getEncoded().data != null).assertTrue();
                expect(data.getEncoded().data.length == 70).assertTrue();
                expect(data.getEncoded().encodingFormat == cert.EncodingFormat.FORMAT_DER).assertTrue();
                done();
              })
              .catch((err: BusinessError) => {
                console.error(`${caseName} createX500DistinguishedName2 failed,err: ${JSON.stringify(err)}`);
                expect(null).assertFail();
                done();
              })
          })
          .catch((err: BusinessError) => {
            console.error(`${caseName} createX500DistinguishedName1 failed,err: ${JSON.stringify(err)}`);
            expect(null).assertFail();
            done();
          })
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_1400
     * @tc.name check X509Cert.getIssuerX500DistinguishedName result
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_1400", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_1400';
      let nameString = '/C=BE/O=GlobalSign nv-sa/CN=GlobalSign Extended Validation CA - G2';
      const x509Cert: cert.X509Cert = await certChainFunc3.createX509Cert();
      try {
        let x500DistinguishedName = await x509Cert.getIssuerX500DistinguishedName();
        console.log(`${caseName} getIssuerX500DistinguishedName sucess: ${JSON.stringify(x500DistinguishedName.getName())}`);
        expect(x500DistinguishedName.getName() == nameString).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_1500
     * @tc.name check X509Cert.getIssuerX500DistinguishedName result(getName() value) transferred to createX500DistinguishedName
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_1500", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_1500';
      let nameString = '/C=BE/O=GlobalSign nv-sa/CN=GlobalSign Extended Validation CA - G2';
      const x509Cert: cert.X509Cert = await certChainFunc3.createX509Cert();
      try {
        let x500DistinguishedName = await x509Cert.getIssuerX500DistinguishedName();
        console.log(`${caseName} getIssuerX500DistinguishedName sucess: ${JSON.stringify(x500DistinguishedName.getName())}`);
        cert.createX500DistinguishedName(x500DistinguishedName.getName())
          .then((data) => {
            console.log(`${caseName} createX500DistinguishedName sucess: ${JSON.stringify(data.getName())}`);
            expect(data.getName() == nameString).assertTrue();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${caseName} createX500DistinguishedName failed,err: ${JSON.stringify(err)}`);
            expect(null).assertFail();
            done();
          });
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_1600
     * @tc.name check X509Cert.getIssuerX500DistinguishedName result (getName(type) value)
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_1600", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_1600';
      const x509Cert: cert.X509Cert = await certChainFunc3.createX509Cert();
      try {
        let x500DistinguishedName = await x509Cert.getIssuerX500DistinguishedName();
        console.log(`${caseName} getIssuerX500DistinguishedName sucess: ${JSON.stringify(x500DistinguishedName.getName('CN'))}`);
        expect(x500DistinguishedName.getName('CN')[0] == 'GlobalSign Extended Validation CA - G2').assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_1700
     * @tc.name check X509Cert.getIssuerX500DistinguishedName result(getEncoded() value) transferred to createX500DistinguishedName
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_1700", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_1700';
      const x509Cert: cert.X509Cert = await certChainFunc3.createX509Cert();
      try {
        let x500DistinguishedName = await x509Cert.getIssuerX500DistinguishedName();
        console.log(`${caseName} getIssuerX500DistinguishedName sucess: ${JSON.stringify(x500DistinguishedName.getEncoded()
          .data)}`);
        cert.createX500DistinguishedName(x500DistinguishedName.getEncoded().data)
          .then((data) => {
            console.log(`${caseName} createX500DistinguishedName2 sucess: ${JSON.stringify(data.getEncoded().data)}`);
            expect(data.getEncoded().data != null).assertTrue();
            expect(data.getEncoded().data.length == 91).assertTrue();
            expect(data.getEncoded().encodingFormat == cert.EncodingFormat.FORMAT_DER).assertTrue();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${caseName} createX500DistinguishedName2 failed,err: ${JSON.stringify(err)}`);
            expect(null).assertFail();
            done();
          })
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_1800
     * @tc.name check X509Cert.getSubjectX500DistinguishedName result
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_1800", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_1800';
      const x509Cert: cert.X509Cert = await certChainFunc3.createX509Cert();
      let nameString = certChainFunc3.nameString;
      try {
        let x500DistinguishedName = await x509Cert.getSubjectX500DistinguishedName();
        console.log(`${caseName} getIssuerX500DistinguishedName sucess: ${JSON.stringify(x500DistinguishedName.getName())}`);
        expect(x500DistinguishedName.getName() == nameString).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_1900
     * @tc.name check X509Cert.getSubjectX500DistinguishedName result(getName() value) transferred to createX500DistinguishedName
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_1900", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_1900';
      let nameString = certChainFunc3.nameString;
      const x509Cert: cert.X509Cert = await certChainFunc3.createX509Cert();
      try {
        let x500DistinguishedName = await x509Cert.getSubjectX500DistinguishedName();
        console.log(`${caseName} getIssuerX500DistinguishedName sucess: ${JSON.stringify(x500DistinguishedName.getName())}`);
        cert.createX500DistinguishedName(x500DistinguishedName.getName())
          .then((data) => {
            console.log(`${caseName} createX500DistinguishedName sucess: ${JSON.stringify(data.getName())}`);
            expect(data.getName() == nameString).assertTrue();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${caseName} createX500DistinguishedName failed,err: ${JSON.stringify(err)}`);
            expect(null).assertFail();
            done();
          });
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_2000
     * @tc.name check X509Cert.getSubjectX500DistinguishedName result (getName(type) value)
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_2000", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_2000';
      const x509Cert: cert.X509Cert = await certChainFunc3.createX509Cert();
      try {
        let x500DistinguishedName = await x509Cert.getSubjectX500DistinguishedName();
        console.log(`${caseName} getIssuerX500DistinguishedName sucess: ${JSON.stringify(x500DistinguishedName.getName('CN'))}`);
        expect(x500DistinguishedName.getName('CN')[0] == 'www.globalsign.com').assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_2100
     * @tc.name check X509Cert.getSubjectX500DistinguishedName result(getEncoded() value) transferred to createX500DistinguishedName
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_2100", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_2100';
      const x509Cert: cert.X509Cert = await certChainFunc3.createX509Cert();
      try {
        let x500DistinguishedName = await x509Cert.getSubjectX500DistinguishedName();
        console.log(`${caseName} getIssuerX500DistinguishedName sucess: ${JSON.stringify(x500DistinguishedName.getEncoded()
          .data)}`);
        cert.createX500DistinguishedName(x500DistinguishedName.getEncoded().data)
          .then((data) => {
            console.log(`${caseName} createX500DistinguishedName sucess: ${JSON.stringify(data.getEncoded().data)}`);
            expect(data.getEncoded().data != null).assertTrue();
            expect(data.getEncoded().data.length == 270).assertTrue();
            expect(data.getEncoded().encodingFormat == cert.EncodingFormat.FORMAT_DER).assertTrue();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${caseName} createX500DistinguishedName failed,err: ${JSON.stringify(err)}`);
            expect(null).assertFail();
            done();
          });
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_2200
     * @tc.name check X509CRL.getIssuerX500DistinguishedName result
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_2200", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_2200';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509Crl();
      try {
        let x500DistinguishedName = await x509CRL.getIssuerX500DistinguishedName();
        console.log(`${caseName} getIssuerX500DistinguishedName sucess: ${JSON.stringify(x500DistinguishedName.getName())}`);
        expect(x500DistinguishedName.getName() == '/C=CN/ST=Jiangsu/L=Nanjing/O=ts/OU=ts/CN=ts').assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_2300
     * @tc.name check X509CRL.getIssuerX500DistinguishedName result(getName() value) transferred to createX500DistinguishedName
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_2300", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_2300';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509Crl();
      try {
        let x500DistinguishedName = await x509CRL.getIssuerX500DistinguishedName();
        console.log(`${caseName} getIssuerX500DistinguishedName sucess: ${JSON.stringify(x500DistinguishedName.getName())}`);
        cert.createX500DistinguishedName(x500DistinguishedName.getName())
          .then((data) => {
            console.log(`${caseName} createX500DistinguishedName sucess: ${JSON.stringify(data.getName())}`);
            expect(data.getName() == '/C=CN/ST=Jiangsu/L=Nanjing/O=ts/OU=ts/CN=ts').assertTrue();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${caseName} createX500DistinguishedName failed,err: ${JSON.stringify(err)}`);
            expect(null).assertFail();
            done();
          });
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_2400
     * @tc.name check X509CRL.getIssuerX500DistinguishedName result (getName(type) value)
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_2400", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_2400';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509Crl();
      try {
        let x500DistinguishedName = await x509CRL.getIssuerX500DistinguishedName();
        console.log(`${caseName} getIssuerX500DistinguishedName sucess: ${JSON.stringify(x500DistinguishedName.getName('ST'))}`);
        expect(x500DistinguishedName.getName('ST')[0] == 'Jiangsu').assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_2500
     * @tc.name check X509CRL.getIssuerX500DistinguishedName result(getEncoded() value) transferred to createX500DistinguishedName
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_2500", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_2500';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509Crl();
      try {
        let x500DistinguishedName = await x509CRL.getIssuerX500DistinguishedName();
        console.log(`${caseName} getIssuerX500DistinguishedName sucess: ${JSON.stringify(x500DistinguishedName.getEncoded()
          .data)}`);
        cert.createX500DistinguishedName(x500DistinguishedName.getEncoded().data)
          .then((data) => {
            console.log(`${caseName} createX500DistinguishedName sucess: ${JSON.stringify(data.getEncoded().data)}`);
            expect(data.getEncoded().data != null).assertTrue();
            expect(data.getEncoded().data.length == 90).assertTrue();
            expect(data.getEncoded().encodingFormat == cert.EncodingFormat.FORMAT_DER).assertTrue();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${caseName} createX500DistinguishedName failed,err: ${JSON.stringify(err)}`);
            expect(null).assertFail();
            done();
          });
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_2600
     * @tc.name check X509CRLEntry.getCertIssuerX500DistinguishedName result
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_2600", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_2600';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509CrlEntryTest1();
      try {
        let x500DistinguishedName = await x509CRL.getRevokedCert(BigInt(1000)).getCertIssuerX500DistinguishedName();
        console.log(`${caseName} getIssuerX500DistinguishedName sucess: ${JSON.stringify(x500DistinguishedName.getName())}`);
        expect(x500DistinguishedName.getName() == '/CN=CRL issuer').assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_2700
     * @tc.name check X509CRLEntry.getCertIssuerX500DistinguishedName result(getName() value) transferred to createX500DistinguishedName
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_2700", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_2700';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509CrlEntryTest1();
      try {
        let x500DistinguishedName = await x509CRL.getRevokedCert(BigInt(1000)).getCertIssuerX500DistinguishedName();
        console.log(`${caseName} getIssuerX500DistinguishedName sucess: ${JSON.stringify(x500DistinguishedName.getName())}`);
        cert.createX500DistinguishedName(x500DistinguishedName.getName())
          .then((data) => {
            console.log(`${caseName} createX500DistinguishedName sucess: ${JSON.stringify(data.getName())}`);
            expect(data.getName() == '/CN=CRL issuer').assertTrue();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${caseName} createX500DistinguishedName failed,err: ${JSON.stringify(err)}`);
            expect(null).assertFail();
            done();
          });
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_2800
     * @tc.name check X509CRLEntry.getCertIssuerX500DistinguishedName result (getName(type) value)
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_2800", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_2800';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509CrlEntryTest1();
      try {
        let x500DistinguishedName = await x509CRL.getRevokedCert(BigInt(1000)).getCertIssuerX500DistinguishedName();
        console.log(`${caseName} getIssuerX500DistinguishedName sucess: ${JSON.stringify(x500DistinguishedName.getName('CN'))}`);
        expect(x500DistinguishedName.getName('CN')[0] == 'CRL issuer').assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_2900
     * @tc.name check X509CRLEntry.getCertIssuerX500DistinguishedName result(getEncoded() value) transferred to createX500DistinguishedName
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertName_Func_2900", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_2900';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509CrlEntryTest1();
      try {
        let x500DistinguishedName = await x509CRL.getRevokedCert(BigInt(1000)).getCertIssuerX500DistinguishedName();
        console.log(`${caseName} getIssuerX500DistinguishedName sucess: ${JSON.stringify(x500DistinguishedName.getEncoded()
          .data)}`);
        cert.createX500DistinguishedName(x500DistinguishedName.getEncoded().data)
          .then((data) => {
            console.log(`${caseName} createX500DistinguishedName sucess: ${JSON.stringify(data.getEncoded()
              .data
              .length)}`);
            expect(data.getEncoded().data != null).assertTrue();
            expect(data.getEncoded().data.length == 23).assertTrue();
            expect(data.getEncoded().encodingFormat == cert.EncodingFormat.FORMAT_DER).assertTrue();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${caseName} createX500DistinguishedName failed,err: ${JSON.stringify(err)}`);
            expect(null).assertFail();
            done();
          });
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_X509_Func_0100
     * @tc.name check X509Cert.toString result
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_X509_Func_0100", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_X509_Func_0100';
      const x509Cert: cert.X509Cert = await certChainFunc3.createX509Cert();
      try {
        let toStringData = await x509Cert.toString();
        console.log(`${caseName} toString sucess: ${JSON.stringify(toStringData)}`);
        expect(toStringData != null).assertTrue();
        expect(toStringData.length == 4365).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_X509_Func_0200
     * @tc.name check X509CRL.toString result
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_X509_Func_0200", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_X509_Func_0200';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509Crl();
      try {
        let toStringData = await x509CRL.toString();
        console.log(`${caseName} toString sucess: ${JSON.stringify(toStringData)}`);
        expect(toStringData != null).assertTrue();
        expect(toStringData.length == 2086).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_X509_Func_0300
     * @tc.name check X509CRLEntry.toString result
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_X509_Func_0300", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_X509_Func_0300';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509CrlEntryTest1();
      try {
        let toStringData = await x509CRL.getRevokedCert(BigInt(1000)).toString();
        console.log(`${caseName} toString sucess: ${JSON.stringify(toStringData)}`);
        expect(toStringData != null).assertTrue();
        expect(toStringData.length == 74).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_X509_Func_0400
     * @tc.name check X509CertChain.toString result
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_X509_Func_0400", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_X509_Func_0400';
      const x509CertChain: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      try {
        let toStringData = await x509CertChain.toString();
        console.log(`${caseName} toString sucess: ${JSON.stringify(toStringData)}`);
        expect(toStringData != null).assertTrue();
        expect(toStringData.length == 10133).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_X509_Func_0500
     * @tc.name check X509Cert.hashCode result
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_X509_Func_0500", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_X509_Func_0500';
      const x509Cert: cert.X509Cert = await certChainFunc3.createX509Cert();
      try {
        let hashCodeData = await x509Cert.hashCode();
        console.log(`${caseName} hashCode sucess: ${JSON.stringify(hashCodeData)}`);
        expect(hashCodeData != null).assertTrue();
        expect(hashCodeData.length == 32).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_X509_Func_0600
     * @tc.name check X509CRL.hashCode result
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_X509_Func_0600", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_X509_Func_0600';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509Crl();
      try {
        let hashCodeData = await x509CRL.hashCode();
        console.log(`${caseName} hashCode sucess: ${JSON.stringify(hashCodeData)}`);
        expect(hashCodeData != null).assertTrue();
        expect(hashCodeData.length == 32).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_X509_Func_0700
     * @tc.name check X509CRLEntry.hashCode result
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_X509_Func_0700", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_X509_Func_0700';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509CrlEntryTest1();
      try {
        let hashCodeData = await x509CRL.getRevokedCert(BigInt(1000)).hashCode();
        console.log(`${caseName} hashCode sucess: ${JSON.stringify(hashCodeData)}`);
        expect(hashCodeData != null).assertTrue();
        expect(hashCodeData.length == 32).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_X509_Func_0800
     * @tc.name check X509CertChain.hashCode result
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_X509_Func_0800", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_X509_Func_0800';
      const x509CertChain: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      try {
        let hashCodeData = await x509CertChain.hashCode();
        console.log(`${caseName} hashCode sucess: ${JSON.stringify(hashCodeData)}`);
        expect(hashCodeData != null).assertTrue();
        expect(hashCodeData.length == 32).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_X509_Func_0900
     * @tc.name check X509Cert.getExtensionsObject result
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_X509_Func_0900", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_X509_Func_0900';
      const x509Cert: cert.X509Cert = await certChainFunc3.createX509Cert();
      try {
        let certExtension = await x509Cert.getExtensionsObject();
        console.log(`${caseName} getExtensionsObject sucess: ${JSON.stringify(certExtension.getEncoded())}`);
        expect(certExtension != null).assertTrue();
        expect(certExtension.getEncoded().data.length == 711).assertTrue();
        expect(certExtension.checkCA() == -1).assertTrue();
        expect(certExtension.hasUnsupportedCriticalExtension() == false).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_X509_Func_1000
     * @tc.name check X509CRL.getExtensionsObject result
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_X509_Func_1000", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_X509_Func_1000';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509Crl();
      try {
        let certExtension = await x509CRL.getExtensionsObject();
        console.log(`${caseName} getExtensionsObject sucess: ${JSON.stringify(certExtension.getEncoded())}`);
        expect(certExtension != null).assertTrue();
        expect(certExtension.getEncoded().data.length == 47).assertTrue();
        expect(certExtension.hasUnsupportedCriticalExtension() == false).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_X509_Func_1100
     * @tc.name check X509CRLEntry.getExtensionsObject result
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_X509_Func_1100", 0, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_X509_Func_1100';
      const x509CRLEntry: cert.X509CRL = await certChainFunc3.createX509CrlEntryTest3();
      let serialNumber = BigInt('14091103387070223745671018446433705560');
      try {
        let certExtension = await x509CRLEntry.getRevokedCert(serialNumber).getExtensionsObject();
        console.log(`${caseName} getExtensionsObject sucess: ${JSON.stringify(certExtension.getEncoded())}`);
        expect(certExtension != null).assertTrue();
        expect(certExtension.getEncoded().data.length == 14).assertTrue();
        expect(certExtension.hasUnsupportedCriticalExtension() == false).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });
  });
}