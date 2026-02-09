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
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import cert from '@ohos.security.cert';
import * as certFunc from "./utils/collection/certFunc";
import * as certChainFunc from "./utils/certchain/certChainFunc";
import * as certChainFunc3 from "./utils/certchain/certChainFunc3";
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;

export default function certFrameworkCertNameJsAPIFunctionTestUnit() {
  describe("certFrameworkCertNameJsAPIFunctionTestUnit", () => {
    let certChain0: cert.X509CertChain;
    let rootCaCert0: cert.X509Cert;
    let leafCert: cert.X509Cert;
    let parentCert0: cert.X509Cert;
    let otherCert: cert.X509Cert;
    console.info("##########start certFrameworkCertNameJsAPIFunctionTestUnit##########");
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      // Create X509 certChain0-certChain2
      try {
        certChain0 = await certChainFunc.createX509CertChainPromise("pem", 0);
        expect(certChain0 != null).assertTrue();
      } catch (err: BusinessError) {
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
      } catch (err: BusinessError) {
        console.error("createX509Cert error", err);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_0100
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_0100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_0100';
      let nameStr = '/CN=John Doe/OU=IT Department/O=ACME Inc./L=San Francisco/ST=California/C=US/CN=ALN C/CN=XTS';
      try {
        let data = await cert.createX500DistinguishedName(nameStr)
          // .then((data) => {
            console.log(`[XtsTestLog] createX500DistinguishedName sucess: ${data.getName()}`);
            expect(data.getName() == nameStr).assertTrue();
          //   done();
          // })
          // .catch((err) => {
          //   console.error(`[XtsTestLog] createX500DistinguishedName failed,err: ${err}`);
          //   expect(null).assertFail();
          //   done();
          // })
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_0200
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_0200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_0200';
      let nameStr = 'CN=John Doe';
      try {
        let data = await cert.createX500DistinguishedName(nameStr)
          // .then((data) => {
            console.log(`[XtsTestLog] createX500DistinguishedName sucess: ${data.getName()}`);
            expect(null).assertFail();
            // done();
          // })
          // .catch((err) => {
          //   console.error(`[XtsTestLog] createX500DistinguishedName failed,err: ${err}`);
          //   expect(err.code == cert.CertResult.ERR_CRYPTO_OPERATION).assertTrue();
          //   done();
          // })
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        // expect(null).assertFail();
        expect(error.code == cert.CertResult.ERR_CRYPTO_OPERATION).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_0300
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_0300
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_0300';
      let nameStr = '';
      try {
        await cert.createX500DistinguishedName(nameStr)
          // .then((data) => {
          //   expect(null).assertFail();
          // })
          // .catch((err) => {
          //   console.error(`[XtsTestLog] createX500DistinguishedName failed,err: ${err}`);
          //   expect(null).assertFail();
          // })
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(error.code == cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_0400
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_0400
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_0400';
      let nameDer = certChainFunc3.nameDer;
      try {
        let data = await cert.createX500DistinguishedName(nameDer)
          // .then((data) => {
            expect(data.getEncoded().data != null).assertTrue();
            expect(data.getEncoded().data.length == 70).assertTrue();
            // done();
          // })
          // .catch((err) => {
          //   console.error(`[XtsTestLog] createX500DistinguishedName failed,err: ${err}`);
          //   expect(null).assertFail();
          //   done();
          // })
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_0500
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_0500
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_0500';
      let nameDer = new Uint8Array([0x30, 0x82, 0x01]);
      try {
        await cert.createX500DistinguishedName(nameDer)
          // .then((data) => {
          //   console.log(`[XtsTestLog] createX500DistinguishedName sucess: ${data.getName()}`);
          //   expect(null).assertFail();
          //   done();
          // })
          // .catch((err) => {
          //   console.error(`[XtsTestLog] createX500DistinguishedName failed,err: ${err}`);
          //   expect(err.code == cert.CertResult.ERR_CRYPTO_OPERATION).assertTrue();
          //   done();
          // })
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        // expect(null).assertFail();
        expect(error.code == cert.CertResult.ERR_CRYPTO_OPERATION).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_0600
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_0600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_0600';
      let nameDer = new Uint8Array();
      try {
        await cert.createX500DistinguishedName(nameDer)
          // .then((data) => {
          //   console.log(`[XtsTestLog] createX500DistinguishedName sucess: ${data.getName()}`);
          //   expect(null).assertFail();
          // })
          // .catch((err) => {
          //   console.error(`[XtsTestLog] createX500DistinguishedName failed,err: ${err}`);
          //   expect(null).assertFail();
          // })
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(error.code == cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_0700
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_0700
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_0700';
      let nameStr = '/CN=John Doe/OU=IT Department/O=ACME Inc./L=San Francisco/ST=California/C=US/CN=ALN C/CN=XTS';
      try {
        let data = await cert.createX500DistinguishedName(nameStr)
          // .then((data) => {
          //   console.log(`[XtsTestLog] createX500DistinguishedName sucess: ${data.getName()}`);
            expect(data.getName() == nameStr).assertTrue();
          //   done();
          // })
          // .catch((err) => {
          //   console.error(`[XtsTestLog] createX500DistinguishedName failed,err: ${err}`);
          //   expect(null).assertFail();
          //   done();
          // })
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_0800
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_0800
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_0800';
      let nameStr = '/CN=John Doe/OU=IT Department/O=ACME Inc./L=San Francisco/ST=California/C=US/CN=ALN C/CN=XTS';
      try {
        let data = await cert.createX500DistinguishedName(nameStr)
          // .then((data) => {
            console.log(`[XtsTestLog] createX500DistinguishedName1 sucess: ${data.getName()}`);
            let name: string = data.getName();
        let data1 = await cert.createX500DistinguishedName(name)
              // .then((data) => {
                console.log(`[XtsTestLog] createX500DistinguishedName2 sucess: ${data1.getName()}`);
                expect(data1.getName() == nameStr).assertTrue();
                // done();
              // })
              // .catch((err) => {
              //   console.error(`[XtsTestLog] createX500DistinguishedName2 failed,err: ${err}`);
              //   expect(null).assertFail();
              //   done();
              // })
          // })
          // .catch((err) => {
          //   console.error(`[XtsTestLog] createX500DistinguishedName1 failed,err: ${err}`);
          //   expect(null).assertFail();
          //   done();
          // })
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_0900
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_0900
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_0900';
      let nameStr = '/CN=John Doe/OU=IT Department/O=ACME Inc./L=San Francisco/ST=California/C=US/CN=ALN C/CN=XTS';
      let nameType = 'CN';
      try {
        let data = await cert.createX500DistinguishedName(nameStr)
          // .then((data) => {
            let type: string[] = data.getName(nameType);
            expect(type[0] == 'John Doe').assertTrue();
            expect(type[1] == 'ALN C').assertTrue();
            expect(type[2] == 'XTS').assertTrue();
            // done();
          // })
          // .catch((err) => {
          //   console.error(`[XtsTestLog] createX500DistinguishedName failed,err: ${err}`);
          //   expect(null).assertFail();
          //   done();
          // })
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_1000
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_1000
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_1000';
      let nameStr = '/CN=John Doe/OU=IT Department/O=ACME Inc./L=San Francisco/ST=California/C=US/CN=ALN C/CN=XTS';
      let nameType = 'abc';
      try {
        let data = await cert.createX500DistinguishedName(nameStr)
          // .then((data) => {
        let n  = data.getName(nameType);
        console.log("##################### obj:" + typeof n + ":" + n.length)
            expect(data.getName(nameType).length == 0).assertTrue(); // 待评审
            // done();
          // })
          // .catch((err) => {
          //   console.error(`[XtsTestLog] createX500DistinguishedName failed,err: ${err}`);
          //   expect(null).assertFail();
          //   done();
          // })
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] createX500DistinguishedName catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_1100
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_1100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_1100';
      let nameStr = '/CN=John Doe/OU=IT Department/O=ACME Inc./L=San Francisco/ST=California/C=US/CN=ALN C/CN=XTS';
      let nameType = '';
      try {
        let data = await cert.createX500DistinguishedName(nameStr)
          // .then((data) => {
          //   console.log(`[XtsTestLog] createX500DistinguishedName sucess: ${data.getName()}`);
            try {
              data.getName(nameType);
            } catch (err: BusinessError) {
              console.error(`[XtsTestLog] getName catch error: ${err}`);
              expect(err.code == cert.CertResult.INVALID_PARAMS).assertTrue();
              done();
            }
          // })
          // .catch((err) => {
          //   console.error(`[XtsTestLog] createX500DistinguishedName failed,err: ${err}`);
          //   expect(null).assertFail();
          //   done();
          // })
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] createX500DistinguishedName catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_1200
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_1200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_1200';
      let nameDer = certChainFunc3.nameDer;
      try {
        let data = await cert.createX500DistinguishedName(nameDer)
          // .then((data) => {
            expect(data.getEncoded().data != null).assertTrue();
            expect(data.getEncoded().data.length == 70).assertTrue();
            expect(data.getEncoded().encodingFormat == cert.EncodingFormat.FORMAT_DER);
            // done();
          // })
          // .catch((err) => {
          //   console.error(`[XtsTestLog] createX500DistinguishedName failed,err: ${err}`);
          //   expect(null).assertFail();
          //   done();
          // })
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_1300
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_1300
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_1300';
      let nameDer = certChainFunc3.nameDer;
      try {
        let data = await cert.createX500DistinguishedName(nameDer)
          // .then((data) => {
            let dataUint8Array: Uint8Array = data.getEncoded().data;
            let data1 = await cert.createX500DistinguishedName(dataUint8Array)
              // .then((data) => {
                expect(data1.getEncoded().data != null).assertTrue();
                expect(data1.getEncoded().data.length == 70).assertTrue();
                expect(data1.getEncoded().encodingFormat == cert.EncodingFormat.FORMAT_DER).assertTrue();
                // done();
              // })
              // .catch((err) => {
              //   console.error(`[XtsTestLog] createX500DistinguishedName2 failed,err: ${err}`);
              //   expect(null).assertFail();
              //   done();
              // })
          // })
          // .catch((err) => {
          //   console.error(`[XtsTestLog] createX500DistinguishedName1 failed,err: ${err}`);
          //   expect(null).assertFail();
          //   done();
          // })
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_1400
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_1400
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_1400';
      let nameString = '/C=BE/O=GlobalSign nv-sa/CN=GlobalSign Extended Validation CA - G2';
      const x509Cert: cert.X509Cert = await certChainFunc3.createX509Cert();
      try {
        let x500DistinguishedName = x509Cert.getIssuerX500DistinguishedName();
        expect(x500DistinguishedName.getName() == nameString).assertTrue();
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_1500
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_1500
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_1500';
      let nameString = '/C=BE/O=GlobalSign nv-sa/CN=GlobalSign Extended Validation CA - G2';
      const x509Cert: cert.X509Cert = await certChainFunc3.createX509Cert();
      try {
        let x500DistinguishedName = x509Cert.getIssuerX500DistinguishedName();
        let name: string = x500DistinguishedName.getName();
        let data = await cert.createX500DistinguishedName(name)
          // .then((data) => {
            console.log(`[XtsTestLog] createX500DistinguishedName sucess: ${data.getName()}`);
            expect(data.getName() == nameString).assertTrue();
            // done();
          // })
          // .catch((err) => {
          //   console.error(`[XtsTestLog] createX500DistinguishedName failed,err: ${err}`);
          //   expect(null).assertFail();
          //   done();
          // });
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_1600
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_1600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_1600';
      const x509Cert: cert.X509Cert = await certChainFunc3.createX509Cert();
      try {
        let x500DistinguishedName = x509Cert.getIssuerX500DistinguishedName();
        expect(x500DistinguishedName.getName('CN')[0] == 'GlobalSign Extended Validation CA - G2').assertTrue();
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_1700
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_1700
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_1700';
      const x509Cert: cert.X509Cert = await certChainFunc3.createX509Cert();
      try {
        let x500DistinguishedName = x509Cert.getIssuerX500DistinguishedName();
        let tmpData: Uint8Array = x500DistinguishedName.getEncoded().data;
        let data = await cert.createX500DistinguishedName(tmpData)
          // .then((data) => {
            expect(data.getEncoded().data != null).assertTrue();
            expect(data.getEncoded().data.length == 91).assertTrue();
            expect(data.getEncoded().encodingFormat == cert.EncodingFormat.FORMAT_DER).assertTrue();
            // done();
          // })
          // .catch((err) => {
          //   console.error(`[XtsTestLog] createX500DistinguishedName2 failed,err: ${err}`);
          //   expect(null).assertFail();
          //   done();
          // })
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_1800
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_1800
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_1800';
      const x509Cert: cert.X509Cert = await certChainFunc3.createX509Cert();
      let nameString = certChainFunc3.nameString;
      try {
        let x500DistinguishedName = x509Cert.getSubjectX500DistinguishedName();
        expect(x500DistinguishedName.getName() == nameString).assertTrue();
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_1900
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_1900
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_1900';
      let nameString = certChainFunc3.nameString;
      const x509Cert: cert.X509Cert = await certChainFunc3.createX509Cert();
      try {
        let x500DistinguishedName = x509Cert.getSubjectX500DistinguishedName();
        let name: string = x500DistinguishedName.getName();
        let data = await cert.createX500DistinguishedName(name)
          // .then((data) => {
            console.log(`[XtsTestLog] createX500DistinguishedName sucess: ${data.getName()}`);
            expect(data.getName() == nameString).assertTrue();
            // done();
          // })
          // .catch((err) => {
          //   console.error(`[XtsTestLog] createX500DistinguishedName failed,err: ${err}`);
          //   expect(null).assertFail();
          //   done();
          // });
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_2000
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_2000
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_2000';
      const x509Cert: cert.X509Cert = await certChainFunc3.createX509Cert();
      try {
        let x500DistinguishedName = x509Cert.getSubjectX500DistinguishedName();
        let type: string[] = x500DistinguishedName.getName('CN');
        expect(type[0] == 'www.globalsign.com').assertTrue();
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_2100
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_2100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_2100';
      const x509Cert: cert.X509Cert = await certChainFunc3.createX509Cert();
      try {
        let x500DistinguishedName = x509Cert.getSubjectX500DistinguishedName();
        let tmpData: Uint8Array = x500DistinguishedName.getEncoded().data
        let data = await cert.createX500DistinguishedName(tmpData)
          // .then((data) => {
            expect(data.getEncoded().data != null).assertTrue();
            expect(data.getEncoded().data.length == 270).assertTrue();
            expect(data.getEncoded().encodingFormat == cert.EncodingFormat.FORMAT_DER).assertTrue();
            // done();
          // })
          // .catch((err) => {
          //   console.error(`[XtsTestLog] createX500DistinguishedName failed,err: ${err}`);
          //   expect(null).assertFail();
          //   done();
          // });
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_2200
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_2200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_2200';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509Crl();
      try {
        let x500DistinguishedName = x509CRL.getIssuerX500DistinguishedName();
        expect(x500DistinguishedName.getName() == '/C=CN/ST=Jiangsu/L=Nanjing/O=ts/OU=ts/CN=ts').assertTrue();
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_2300
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_2300
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_2300';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509Crl();
      try {
        let x500DistinguishedName = x509CRL.getIssuerX500DistinguishedName();
        let name: string = x500DistinguishedName.getName();
        let data = await cert.createX500DistinguishedName(name)
          // .then((data) => {
            console.log(`[XtsTestLog] createX500DistinguishedName sucess: ${data.getName()}`);
            expect(data.getName() == '/C=CN/ST=Jiangsu/L=Nanjing/O=ts/OU=ts/CN=ts').assertTrue();
            // done();
          // })
          // .catch((err) => {
          //   console.error(`[XtsTestLog] createX500DistinguishedName failed,err: ${err}`);
          //   expect(null).assertFail();
          //   done();
          // });
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_2400
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_2400
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_2400';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509Crl();
      try {
        let x500DistinguishedName = x509CRL.getIssuerX500DistinguishedName();
        expect(x500DistinguishedName.getName('ST')[0] == 'Jiangsu').assertTrue();
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_2500
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_2500
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_2500';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509Crl();
      try {
        let x500DistinguishedName = x509CRL.getIssuerX500DistinguishedName();
        let tmpData: Uint8Array = x500DistinguishedName.getEncoded().data;
        let data = await cert.createX500DistinguishedName(tmpData)
          // .then((data) => {
            expect(data.getEncoded().data != null).assertTrue();
            expect(data.getEncoded().data.length == 90).assertTrue();
            expect(data.getEncoded().encodingFormat == cert.EncodingFormat.FORMAT_DER).assertTrue();
            // done();
          // })
          // .catch((err) => {
          //   console.error(`[XtsTestLog] createX500DistinguishedName failed,err: ${err}`);
          //   expect(null).assertFail();
          //   done();
          // });
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_2600
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_2600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_2600';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509CrlEntryTest1();
      try {
        let x500DistinguishedName = x509CRL.getRevokedCert(BigInt(1000)).getCertIssuerX500DistinguishedName();
        expect(x500DistinguishedName.getName() == '/CN=CRL issuer').assertTrue();
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_2700
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_2700
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_2700';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509CrlEntryTest1();
      try {
        let x500DistinguishedName = x509CRL.getRevokedCert(BigInt(1000)).getCertIssuerX500DistinguishedName();
        let name: string = x500DistinguishedName.getName();
        let data = await cert.createX500DistinguishedName(name)
          // .then((data) => {
            console.log(`[XtsTestLog] createX500DistinguishedName sucess: ${data.getName()}`);
            expect(data.getName() == '/CN=CRL issuer').assertTrue();
            // done();
          // })
          // .catch((err) => {
          //   console.error(`[XtsTestLog] createX500DistinguishedName failed,err: ${err}`);
          //   expect(null).assertFail();
          //   done();
          // });
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_2800
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_2800
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_2800';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509CrlEntryTest1();
      try {
        let x500DistinguishedName = x509CRL.getRevokedCert(BigInt(1000)).getCertIssuerX500DistinguishedName();
        expect(x500DistinguishedName.getName('CN')[0] == 'CRL issuer').assertTrue();
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertName_Func_2900
     * @tc.number SUB_Security_Cert_Framework_CertName_Func_2900
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertName_Func_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertName_Func_2900';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509CrlEntryTest1();
      try {
        let x500DistinguishedName = x509CRL.getRevokedCert(BigInt(1000)).getCertIssuerX500DistinguishedName();
        let tmpData: Uint8Array = x500DistinguishedName.getEncoded().data;
        let data = await cert.createX500DistinguishedName(tmpData)
          // .then((data) => {
            expect(data.getEncoded().data != null).assertTrue();
            expect(data.getEncoded().data.length == 23).assertTrue();
            expect(data.getEncoded().encodingFormat == cert.EncodingFormat.FORMAT_DER).assertTrue();
            // done();
          // })
          // .catch((err) => {
          //   console.error(`[XtsTestLog] createX500DistinguishedName failed,err: ${err}`);
          //   expect(null).assertFail();
          //   done();
          // });
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509_Func_0100
     * @tc.number SUB_Security_Cert_Framework_X509_Func_0100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_X509_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_X509_Func_0100';
      const x509Cert: cert.X509Cert = await certChainFunc3.createX509Cert();
      try {
        let toStringData = x509Cert.toString();
        expect(toStringData != null).assertTrue();
        expect(toStringData.length == 4365).assertTrue();
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509_Func_0200
     * @tc.number SUB_Security_Cert_Framework_X509_Func_0200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_X509_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_X509_Func_0200';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509Crl();
      try {
        let toStringData = x509CRL.toString();
        expect(toStringData != null).assertTrue();
        expect(toStringData.length == 2086).assertTrue();
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509_Func_0300
     * @tc.number SUB_Security_Cert_Framework_X509_Func_0300
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_X509_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_X509_Func_0300';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509CrlEntryTest1();
      try {
        let toStringData = x509CRL.getRevokedCert(BigInt(1000)).toString();
        expect(toStringData != null).assertTrue();
        expect(toStringData.length == 74).assertTrue();
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509_Func_0400
     * @tc.number SUB_Security_Cert_Framework_X509_Func_0400
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_X509_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_X509_Func_0400';
      const x509CertChain: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      try {
        let toStringData = x509CertChain.toString();
        expect(toStringData != null).assertTrue();
        expect(toStringData.length == 10133).assertTrue();
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509_Func_0500
     * @tc.number SUB_Security_Cert_Framework_X509_Func_0500
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_X509_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_X509_Func_0500';
      const x509Cert: cert.X509Cert = await certChainFunc3.createX509Cert();
      try {
        let hashCodeData = x509Cert.hashCode();
        console.log(`[XtsTestLog] hashCode sucess: ${hashCodeData}`);
        expect(hashCodeData != null).assertTrue();
        expect(hashCodeData.length == 32).assertTrue();
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509_Func_0600
     * @tc.number SUB_Security_Cert_Framework_X509_Func_0600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_X509_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_X509_Func_0600';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509Crl();
      try {
        let hashCodeData = x509CRL.hashCode();
        console.log(`[XtsTestLog] hashCode sucess: ${hashCodeData}`);
        expect(hashCodeData != null).assertTrue();
        expect(hashCodeData.length == 32).assertTrue();
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509_Func_0700
     * @tc.number SUB_Security_Cert_Framework_X509_Func_0700
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_X509_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_X509_Func_0700';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509CrlEntryTest1();
      try {
        let hashCodeData = x509CRL.getRevokedCert(BigInt(1000)).hashCode();
        console.log(`[XtsTestLog] hashCode sucess: ${hashCodeData}`);
        expect(hashCodeData != null).assertTrue();
        expect(hashCodeData.length == 32).assertTrue();
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509_Func_0800
     * @tc.number SUB_Security_Cert_Framework_X509_Func_0800
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_X509_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_X509_Func_0800';
      const x509CertChain: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      try {
        let hashCodeData = x509CertChain.hashCode();
        console.log(`[XtsTestLog] hashCode sucess: ${hashCodeData}`);
        expect(hashCodeData != null).assertTrue();
        expect(hashCodeData.length == 32).assertTrue();
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509_Func_0900
     * @tc.number SUB_Security_Cert_Framework_X509_Func_0900
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_X509_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_X509_Func_0900';
      const x509Cert: cert.X509Cert = await certChainFunc3.createX509Cert();
      try {
        let certExtension = x509Cert.getExtensionsObject();
        expect(certExtension != null).assertTrue();
        expect(certExtension.getEncoded().data.length == 711).assertTrue();
        expect(certExtension.checkCA() == -1).assertTrue();
        expect(certExtension.hasUnsupportedCriticalExtension() == false).assertTrue();
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509_Func_1000
     * @tc.number SUB_Security_Cert_Framework_X509_Func_1000
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_X509_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_X509_Func_1000';
      const x509CRL: cert.X509CRL = await certChainFunc3.createX509Crl();
      try {
        let certExtension = x509CRL.getExtensionsObject();
        expect(certExtension != null).assertTrue();
        expect(certExtension.getEncoded().data.length == 47).assertTrue();
        expect(certExtension.hasUnsupportedCriticalExtension() == false).assertTrue();
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509_Func_1100
     * @tc.number SUB_Security_Cert_Framework_X509_Func_1100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_X509_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_X509_Func_1100';
      const x509CRLEntry: cert.X509CRL = await certChainFunc3.createX509CrlEntryTest3();
      let serialNumber = BigInt('14091103387070223745671018446433705560');
      try {
        let certExtension = x509CRLEntry.getRevokedCert(serialNumber).getExtensionsObject();
        expect(certExtension != null).assertTrue();
        expect(certExtension.getEncoded().data.length == 14).assertTrue();
        expect(certExtension.hasUnsupportedCriticalExtension() == false).assertTrue();
      } catch (error: BusinessError) {
        console.error(`[XtsTestLog] catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

  });
}