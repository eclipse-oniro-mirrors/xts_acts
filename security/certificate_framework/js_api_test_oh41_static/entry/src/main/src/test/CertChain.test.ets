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
import util from '@ohos.util';
import * as certChainFunc from "./utils/certchain/certChainFunc";
import { CERT_CHAIN_DATA_PEM_PARAMETERS, CERT_CHAIN_PEM_DATA0 } from './utils/common/commonParam';
import { stringTouInt8Array } from './utils/common/commonFunction';

export default function certFrameworkCertChainJsAPIFunctionTestUnit() {
  describe("certFrameworkCertChainJsAPIFunctionTestUnit", () => {
    let certChain0: cert.X509CertChain | undefined;
    let rootCaCert0: cert.X509Cert | undefined;
    let leafCert: cert.X509Cert | undefined;
    let parentCert0: cert.X509Cert | undefined;
    let otherCert: cert.X509Cert | undefined;
    console.info("##########start certFrameworkCertChainJsAPIFunctionTestUnit##########");
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

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_0100
     * @tc.number SUB_Security_Cert_Framework_CertChain_Func_0100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it("SUB_Security_Cert_Framework_CertChain_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   const param: cert.EncodingBlob = {} as cert.EncodingBlob;
    //
    //   try {
    //     await cert.createX509CertChain(param);
    //     expect(null).assertFail();
    //   } catch (err) {
    //     expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
    //   }
    //   done();
    // }); // arkts1.2 let undefined

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_0200
     * @tc.number SUB_Security_Cert_Framework_CertChain_Func_0200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const param: cert.EncodingBlob = {
        data: new Uint8Array(),
        encodingFormat: cert.EncodingFormat.FORMAT_PEM
      };

      try {
        await cert.createX509CertChain(param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_0400
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_0400
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const createdRes = await certChainFunc.createX509CertChainPromise("der", 0);
        expect(createdRes != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(inStream: EncodingBlob) error", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_0500
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_0500
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await certChainFunc.createX509CertChainPromise("der", 1);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_0600
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_0600
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const createdRes = await certChainFunc.createX509CertChainCallback("pem", 0);
        expect(createdRes != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(inStream: EncodingBlob) error", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_0700
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_0700
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await certChainFunc.createX509CertChainCallback("pem", 5);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_0800
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_0800
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const createdRes = await certChainFunc.createX509CertChainCallback("pkcs7", 0);
        expect(createdRes != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(inStream: EncodingBlob) error", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_0900
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_0900
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await certChainFunc.createX509CertChainCallback("pkcs7", 1);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_1100
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_1100
     * @tc.desc   createX509CertChain(certs: Array<X509Cert>)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let cert1: cert.X509Cert = await certChainFunc.createCustomizedX509CertPromise('PEM', 0);
      try {
        console.log("#################### cert:" + cert1.toString());
        const createdRes = cert.createX509CertChain([cert1] as Array<cert.X509Cert>);
        expect(createdRes != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(certs: Array<X509Cert>) error", err);
        expect(null).assertFail();
      }
      done();
    }); // crash

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_1200
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_1200
     * @tc.desc   createX509CertChain(certs: Array<X509Cert>)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const cert1 = await certChainFunc.createCustomizedX509CertPromise('PEM', 0);
      try {
        const createdRes = cert.createX509CertChain([cert1, cert1]);
        expect(createdRes != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(certs: Array<X509Cert>) error", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_1300
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_1300
     * @tc.desc   createX509CertChain(certs: Array<X509Cert>)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const cert1 = await certChainFunc.createCustomizedX509CertPromise('PEM', 0);
      const cert3 = await certChainFunc.createCustomizedX509CertPromise('PEM', 5);
      try {
        const createdRes = cert.createX509CertChain([cert1, cert3]);
        expect(createdRes != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(certs: Array<X509Cert>) error", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_1400
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_1400
     * @tc.desc   createX509CertChain(certs: Array<X509Cert>)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const cert1 = await certChainFunc.createCustomizedX509CertPromise('PEM', 0);
      let certs: cert.X509Cert[] = [];
      for (let i = 0; i < 257; i++) {
        certs.push(cert1);
      }
      try {
        cert.createX509CertChain(certs);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_1500
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_1500
     * @tc.desc   createX509CertChain(certs: Array<X509Cert>)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const cert1 = await certChainFunc.createCustomizedX509CertPromise('PEM', 0);
      const cert2 = await certChainFunc.createCustomizedX509CertPromise('PEM', 1);
      const cert3 = await certChainFunc.createCustomizedX509CertPromise('PEM', 2);
      try {
        const createdRes = cert.createX509CertChain([cert1, cert2, cert3]);
        expect(createdRes != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(certs: Array<X509Cert>) error", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_1600
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_1600
     * @tc.desc   X509CertChain.getCertList()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const cert1 = await certChainFunc.createCustomizedX509CertPromise('PEM', 0);
      const cert2 = await certChainFunc.createCustomizedX509CertPromise('PEM', 1);
      const cert3 = await certChainFunc.createCustomizedX509CertPromise('PEM', 2);
      const createdRes = cert.createX509CertChain([cert1, cert2, cert3]);
      expect(createdRes != null).assertTrue();

      try {
        const getListRes = createdRes.getCertList();
        expect(getListRes != null).assertTrue();
        expect(getListRes.length === 3).assertTrue();
      } catch (err) {
        console.error("X509CertChain.getCertList() error", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_1700
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_1700
     * @tc.desc   X509CertChain.getCertList()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const cert1 = await certChainFunc.createCustomizedX509CertPromise('PEM', 0);
      const createdRes = cert.createX509CertChain([cert1, cert1]);
      expect(createdRes != null).assertTrue();

      try {
        const getListRes = createdRes.getCertList();
        expect(getListRes != null).assertTrue();
        expect(getListRes.length === 2).assertTrue();
      } catch (err) {
        console.error("X509CertChain.getCertList() error", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_2000
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_2000
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        date: "abc",
        trustAnchors: [{
          CACert: rootCaCert0!
        }]
      };

      try {
        await certChain0!.validate(param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_2100
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_2100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        date: "20230101000000Z",
        trustAnchors: [{
          CACert: rootCaCert0!
        }]
      };

      try {
        await certChain0!.validate(param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.ERR_CERT_NOT_YET_VALID);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_2200
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_2200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        date: "20231223235959Z",
        trustAnchors: [{
          CACert: rootCaCert0!
        }]
      };

      try {
        await certChain0!.validate(param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.ERR_CERT_NOT_YET_VALID);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_2300
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_2300
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        date: "20231224000000Z",
        trustAnchors: [{
          CACert: rootCaCert0!
        }]
      };
      try {
        const validRes = await certChain0!.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert!.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0!.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_2400
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_2400
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        date: "20231224000001Z",
        trustAnchors: [{
          CACert: rootCaCert0!
        }]
      };
      try {
        const validRes = await certChain0!.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert!.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0!.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }

      param = {
        date: "20241223235958Z",
        trustAnchors: [{
          CACert: rootCaCert0!
        }]
      };
      try {
        const validRes = await certChain0!.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert!.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0!.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_2500
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_2500
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        date: "20241223235959Z",
        trustAnchors: [{
          CACert: rootCaCert0!
        }]
      };
      try {
        const validRes = await certChain0!.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert!.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0!.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_2600
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_2600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        date: "20241224000000Z",
        trustAnchors: [{
          CACert: rootCaCert0!
        }]
      };

      try {
        await certChain0!.validate(param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.ERR_CERT_HAS_EXPIRED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_2700
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_2700
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        date: "20300101000000Z",
        trustAnchors: [{
          CACert: rootCaCert0!
        }]
      };

      try {
        await certChain0!.validate(param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.ERR_CERT_HAS_EXPIRED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_2800
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_2800
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{}]
      };

      try {
        await certChain0!.validate(param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_2900
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_2900
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CASubject: CERT_CHAIN_DATA_PEM_PARAMETERS[2].subject
        }]
      };

      try {
        await certChain0!.validate(param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_3000
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_3000
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: rootCaCert0!
        }]
      };

      try {
        const validRes = await certChain0!.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert!.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0!.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_3100
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_3100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: parentCert0!
        }]
      };
      try {
        const validRes = await certChain0!.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert!.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == parentCert0!.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_3200
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_3200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let certChain2: cert.X509CertChain | undefined;
      try {
        certChain2 = await certChainFunc.createX509CertChainPromise("pem", 3);
        expect(certChain2 != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(inStream: EncodingBlob) error", err);
        expect(null).assertFail();
      }

      let parentCert2: cert.X509Cert | undefined;
      try {
        parentCert2 = await certChainFunc.createCustomizedX509CertPromise('pem', 4);
        expect(parentCert2 != null).assertTrue();
      } catch (err) {
        console.error("createX509Cert error", err);
        expect(null).assertFail();
      }

      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: parentCert2!
        }]
      };
      try {
        const validRes = await certChain2!.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert!.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == parentCert2!.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_3300
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_3300
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let grandparentCert: cert.X509Cert | undefined;
      try {
        grandparentCert = await certChainFunc.createCustomizedX509CertPromise('pem', 4);
        expect(grandparentCert != null).assertTrue();
      } catch (err) {
        console.error("createX509Cert error", err);
        expect(null).assertFail();
      }

      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: grandparentCert!
        }]
      };
      try {
        await certChain0!.validate(param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_3400
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_3400
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: leafCert!
        }]
      };
      try {
        await certChain0!.validate(param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_3500
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_3500
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: otherCert!
        }]
      };
      try {
        await certChain0!.validate(param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_3600
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_3600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let certChain3: cert.X509CertChain | undefined;
      try {
        certChain3 = await certChainFunc.createX509CertChainPromise("pem", 4);
        expect(certChain3 != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(inStream: EncodingBlob) error", err);
        expect(null).assertFail();
      }

      let rootCert3: cert.X509Cert | undefined;
      try {
        rootCert3 = await certChainFunc.createCustomizedX509CertPromise('pem', 4);
        expect(rootCert3 != null).assertTrue();
      } catch (err) {
        console.error("createX509Cert error", err);
        expect(null).assertFail();
      }

      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: rootCert3!
        }]
      };
      try {
        const validRes = await certChain3!.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert!.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCert3!.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_3700
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_3700
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let certChain3: cert.X509CertChain | undefined;
      try {
        certChain3 = await certChainFunc.createX509CertChainPromise("pem", 4);
        expect(certChain3 != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(inStream: EncodingBlob) error", err);
        expect(null).assertFail();
      }

      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: rootCaCert0!
        }]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain3!, param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_3800
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_3800
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let oneCert: cert.X509Cert | undefined;
      let certChainOne: cert.X509CertChain | undefined;
      try {
        oneCert = await certChainFunc.createCustomizedX509CertPromise('pem', 5);
        expect(oneCert != null).assertTrue();
      } catch (err) {
        console.error("createX509Cert error", err);
        expect(null).assertFail();
      }
      try {
        certChainOne = await certChainFunc.createX509CertChainPromise("pem", 1);
        expect(certChainOne != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(inStream: EncodingBlob) error", err);
        expect(null).assertFail();
      }

      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: oneCert!
        }]
      };
      try {
        const validRes = await certChainOne!.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == oneCert!.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == oneCert!.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_3900
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_3900
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [
          {
            CACert: rootCaCert0!,
            CAPubKey: new Uint8Array([0x30, 0x67, 0x31])
          }
        ]
      };
      try {
        const validRes = await certChain0!.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert != null).assertTrue();
        expect(validRes.trustAnchor != null).assertTrue();
        expect(validRes.trustAnchor.CACert != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert!.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0!.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_4000
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_4000
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_4000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[2].publicKey
        }]
      };
      try {
        const validRes = await certChain0!.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert != null).assertTrue();
        expect(validRes.trustAnchor != null).assertTrue();
        expect(validRes.trustAnchor.CAPubKey != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert!.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CAPubKey?.toString() == CERT_CHAIN_DATA_PEM_PARAMETERS[2].publicKey?.toString())
          .assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_4100
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_4100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_4100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[1].publicKey
        }]
      };
      try {
        const validRes = await certChainFunc.certChainValidateCallback(certChain0!, param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert != null).assertTrue();
        expect(validRes.trustAnchor != null).assertTrue();
        expect(validRes.trustAnchor.CAPubKey != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert!.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CAPubKey?.toString() == CERT_CHAIN_DATA_PEM_PARAMETERS[1].publicKey?.toString())
          .assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_4200
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_4200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[0].publicKey
        }]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0!, param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_4300
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_4300
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[3].publicKey
        }]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0!, param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_4400
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_4400
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_4400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[4].publicKey
        }]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0!, param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_4500
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_4500
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CAPubKey: new Uint8Array()
        }]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0!, param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_4600
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_4600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CASubject: CERT_CHAIN_DATA_PEM_PARAMETERS[2].subject
        }]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0!, param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_4700
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_4700
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_4700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [
          {
            CASubject: CERT_CHAIN_DATA_PEM_PARAMETERS[2].subject,
            CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[2].publicKey,
          }
        ]
      };
      try {
        const validRes = await certChainFunc.certChainValidateCallback(certChain0!, param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert != null).assertTrue();
        expect(validRes.trustAnchor != null).assertTrue();
        expect(validRes.trustAnchor.CAPubKey != null).assertTrue();
        expect(validRes.trustAnchor.CASubject != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert!.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CAPubKey?.toString() == CERT_CHAIN_DATA_PEM_PARAMETERS[2].publicKey?.toString())
          .assertTrue();
        expect(validRes.trustAnchor.CASubject?.toString() == CERT_CHAIN_DATA_PEM_PARAMETERS[2].subject?.toString())
          .assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_4800
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_4800
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_4800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [
          {
            CASubject: CERT_CHAIN_DATA_PEM_PARAMETERS[2].subject,
            CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[1].publicKey,
          }
        ]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0!, param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_4900
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_4900
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_4900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [
          {
            CASubject: CERT_CHAIN_DATA_PEM_PARAMETERS[1].subject,
            CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[1].publicKey,
          }
        ]
      };
      try {
        const validRes = await certChainFunc.certChainValidateCallback(certChain0!, param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert != null).assertTrue();
        expect(validRes.trustAnchor != null).assertTrue();
        expect(validRes.trustAnchor.CAPubKey != null).assertTrue();
        expect(validRes.trustAnchor.CASubject != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert!.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CAPubKey?.toString() == CERT_CHAIN_DATA_PEM_PARAMETERS[1].publicKey?.toString())
          .assertTrue();
        expect(validRes.trustAnchor.CASubject?.toString() == CERT_CHAIN_DATA_PEM_PARAMETERS[1].subject?.toString())
          .assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_5000
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_5000
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_5000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [
          {
            CASubject: CERT_CHAIN_DATA_PEM_PARAMETERS[0].subject,
            CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[2].publicKey,
          }
        ]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0!, param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_5100
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_5100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_5100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [
          {
            CASubject: CERT_CHAIN_DATA_PEM_PARAMETERS[3].subject,
            CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[2].publicKey,
          }
        ]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0!, param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_5200
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_5200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_5200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [
          {
            CASubject: new Uint8Array(),
            CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[2].publicKey,
          }
        ]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0!, param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_5300
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_5300
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_5300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [
          {
            CACert: rootCaCert0!,
          },
          {
            CACert: otherCert!
          }
        ]
      };
      try {
        const validRes = await certChainFunc.certChainValidateCallback(certChain0!, param);
        expect(validRes.entityCert != null).assertTrue();
        expect(validRes.trustAnchor != null).assertTrue();
        expect(validRes.trustAnchor.CACert != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert!.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0!.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_5400
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_5400
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_5400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [
          {
            CACert: rootCaCert0!,
          },
          {
            CACert: parentCert0!
          }
        ]
      };
      try {
        const validRes = await certChainFunc.certChainValidateCallback(certChain0!, param);
        expect(validRes.entityCert != null).assertTrue();
        expect(validRes.trustAnchor != null).assertTrue();
        expect(validRes.trustAnchor.CACert != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert!.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0!.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_5500
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_5500
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_5500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const crl = await certChainFunc.createX509CrlPromise(0);
      let certCrl = cert.createCertCRLCollection([], [crl]);
      let param: cert.CertChainValidationParameters = {
        certCRLs: [certCrl],
        trustAnchors: [{
          CACert: rootCaCert0!
        }]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0!, param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_5600
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_5600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_5600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const crl = await certChainFunc.createX509CrlPromise(1);
      let certCrl = cert.createCertCRLCollection([], [crl]);
      let param: cert.CertChainValidationParameters = {
        certCRLs: [certCrl],
        trustAnchors: [{
          CACert: rootCaCert0!
        }]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0!, param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_5700
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_5700
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_5700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const crl = await certChainFunc.createX509CrlPromise(2);
      let certCrl = cert.createCertCRLCollection([], [crl]);
      let param: cert.CertChainValidationParameters = {
        certCRLs: [certCrl],
        trustAnchors: [{
          CACert: rootCaCert0!
        }]
      };
      try {
        const validRes = await certChainFunc.certChainValidateCallback(certChain0!, param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert!.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0!.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_5800
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_5800
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_5800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const crl1 = await certChainFunc.createX509CrlPromise(1);
      const crl2 = await certChainFunc.createX509CrlPromise(2);
      let certCrl = cert.createCertCRLCollection([], [crl1, crl2]);
      let param: cert.CertChainValidationParameters = {
        certCRLs: [certCrl],
        trustAnchors: [{
          CACert: rootCaCert0!
        }]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0!, param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_5900
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_5900
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_5900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let param: cert.CertChainValidationParameters = {
        certCRLs: [],
        trustAnchors: [{
          CACert: rootCaCert0!
        }]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0!, param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_6000
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_6000
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_6000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let certCrl = cert.createCertCRLCollection([rootCaCert0!]);
      let param: cert.CertChainValidationParameters = {
        certCRLs: [certCrl],
        trustAnchors: [{
          CACert: rootCaCert0!
        }]
      };
      try {
        const validRes = await certChainFunc.certChainValidateCallback(certChain0!, param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert!.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0!.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_6100
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_6100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_6100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let certCrl = cert.createCertCRLCollection([rootCaCert0!], []);
      let param: cert.CertChainValidationParameters = {
        certCRLs: [certCrl],
        trustAnchors: [{
          CACert: rootCaCert0!
        }]
      };
      try {
        const validRes = await certChainFunc.certChainValidateCallback(certChain0!, param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert!.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0!.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_6200
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_6200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_6200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let certCrl = cert.createCertCRLCollection([rootCaCert0!], []);
      let param: cert.CertChainValidationParameters = {
        certCRLs: [certCrl],
        trustAnchors: [
          {
            CACert: rootCaCert0!,
            CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[2].publicKey,
            CASubject: CERT_CHAIN_DATA_PEM_PARAMETERS[2].subject,
          }
        ],
        date: '20231231000000Z'
      };
      try {
        const validRes = await certChainFunc.certChainValidateCallback(certChain0!, param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert != null).assertTrue();
        expect(validRes.trustAnchor != null).assertTrue();
        expect(validRes.trustAnchor.CACert != null).assertTrue();
        expect(validRes.trustAnchor.CAPubKey != null).assertTrue();
        expect(validRes.trustAnchor.CASubject != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert!.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0!.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CAPubKey?.toString() == CERT_CHAIN_DATA_PEM_PARAMETERS[2].publicKey?.toString())
          .assertTrue();
        expect(validRes.trustAnchor.CASubject?.toString() == CERT_CHAIN_DATA_PEM_PARAMETERS[2].subject?.toString())
          .assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_6300
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_6300
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_6300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let certCrl = cert.createCertCRLCollection([rootCaCert0!], []);
      let param: cert.CertChainValidationParameters = {
        certCRLs: [certCrl],
        trustAnchors: [
          {
            CACert: otherCert!,
            CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[2].publicKey,
            CASubject: CERT_CHAIN_DATA_PEM_PARAMETERS[2].subject,
          }
        ],
        date: '20231231000000Z'
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0!, param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Func_6400
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_6400
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_6400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let certChainInvalid: cert.X509CertChain | undefined;
      try {
        certChainInvalid = await certChainFunc.createX509CertChainPromise("pem", 2);
        expect(certChainInvalid != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(inStream: EncodingBlob) error", err);
        expect(null).assertFail();
      }

      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: rootCaCert0!
        }],
        date: '20231231000000Z'
      };
      try {
        await certChainFunc.certChainValidateCallback(certChainInvalid!, param);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

  });
}