/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, it, TestType, Size, Level, expect } from "@ohos/hypium";
import cert from '@ohos.security.cert';
import { rsaPem4096 } from "./utils/certificate/certX509Pem";
import { stringTouInt8Array } from "./utils/common/commonFunction";
import { testCrlPem } from "./utils/common/commonParam";


export default function certX509CertCheckNullOrUndefinedTestUnit() {
  describe("certX509CertCheckNullOrUndefinedTestUnit", () => {

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateX509Cert_Null_001
     * @tc.number SUB_Security_Cert_Framework_CreateX509Cert_Null_001
     * @tc.desc   cert.createX509Cert with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateX509Cert_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await cert.createX509Cert(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateX509Cert_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateX509Cert_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_CreateX509Cert_Undefined_001
     * @tc.desc   cert.createX509Cert with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateX509Cert_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await cert.createX509Cert(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateX509Cert_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateX509Cert_Null_002
     * @tc.number SUB_Security_Cert_Framework_CreateX509Cert_Null_002
     * @tc.desc   cert.createX509Cert with null parameter using callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateX509Cert_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cert.createX509Cert(null, (err, data) => {
          if (err) {
            console.error(`[XTS] CreateX509Cert_Null_002 error code: ${err.code}`);
            expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] CreateX509Cert_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateX509Cert_Undefined_002
     * @tc.number SUB_Security_Cert_Framework_CreateX509Cert_Undefined_002
     * @tc.desc   cert.createX509Cert with undefined parameter using callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateX509Cert_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cert.createX509Cert(undefined, (err, data) => {
          if (err) {
            console.error(`[XTS] CreateX509Cert_Undefined_002 error code: ${err.code}`);
            expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] CreateX509Cert_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509Cert_Match_Null_0010
     * @tc.number SUB_Security_Cert_Framework_X509Cert_Match_Null_0010
     * @tc.desc   X509Cert.match with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509Cert_Match_Null_0010",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        x509Cert.match(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X509Cert_Match_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509Cert_Match_Undefined_0011
     * @tc.number SUB_Security_Cert_Framework_X509Cert_Match_Undefined_0011
     * @tc.desc   X509Cert.match with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509Cert_Match_Undefined_0011",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        x509Cert.match(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X509Cert_Match_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509Cert_GetItem_Null_006
     * @tc.number SUB_Security_Cert_Framework_X509Cert_GetItem_Null_006
     * @tc.desc   X509Cert.getItem with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509Cert_GetItem_Null_006",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        x509Cert.getItem(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X509Cert_GetItem_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509Cert_GetItem_Undefined_0011
     * @tc.number SUB_Security_Cert_Framework_X509Cert_GetItem_Undefined_0011
     * @tc.desc   X509Cert.getItem with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509Cert_GetItem_Undefined_0011",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        x509Cert.getItem(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X509Cert_GetItem_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509Cert_CheckValidityWithDate_Null_0010
     * @tc.number SUB_Security_Cert_Framework_X509Cert_CheckValidityWithDate_Null_0010
     * @tc.desc   X509Cert.checkValidityWithDate with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509Cert_CheckValidityWithDate_Null_0010",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        x509Cert.checkValidityWithDate(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X509Cert_CheckValidityWithDate_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509Cert_CheckValidityWithDate_Undefined_0012
     * @tc.number SUB_Security_Cert_Framework_X509Cert_CheckValidityWithDate_Undefined_0012
     * @tc.desc   X509Cert.checkValidityWithDate with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509Cert_CheckValidityWithDate_Undefined_0012",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        x509Cert.checkValidityWithDate(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X509Cert_CheckValidityWithDate_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509Cert_CheckValidityWithDate_Null_0022
     * @tc.number SUB_Security_Cert_Framework_X509Cert_CheckValidityWithDate_Null_0022
     * @tc.desc   X509Cert.checkValidityWithDate with null parameter using callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509Cert_CheckValidityWithDate_Null_0022",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        x509Cert.checkValidityWithDate(null);
      } catch (error) {
        console.error(`[XTS] X509Cert_CheckValidityWithDate_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509Cert_CheckValidityWithDate_Undefined_0022
     * @tc.number SUB_Security_Cert_Framework_X509Cert_CheckValidityWithDate_Undefined_0022
     * @tc.desc   X509Cert.checkValidityWithDate with undefined parameter using callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509Cert_CheckValidityWithDate_Undefined_0022",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        x509Cert.checkValidityWithDate(undefined);
      } catch (error) {
        console.error(`[XTS] X509Cert_CheckValidityWithDate_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509Cert_Verify_Null_0011
     * @tc.number SUB_Security_Cert_Framework_X509Cert_Verify_Null_0011
     * @tc.desc   X509Cert.verify with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509Cert_Verify_Null_0011",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        await x509Cert.verify(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X509Cert_Verify_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509Cert_Verify_Undefined_011
     * @tc.number SUB_Security_Cert_Framework_X509Cert_Verify_Undefined_011
     * @tc.desc   X509Cert.verify with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509Cert_Verify_Undefined_011",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        await x509Cert.verify(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X509Cert_Verify_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509Cert_Verify_Null_006
     * @tc.number SUB_Security_Cert_Framework_X509Cert_Verify_Null_006
     * @tc.desc   X509Cert.verify with null parameter using callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509Cert_Verify_Null_006",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        x509Cert.verify(null, (err) => {
          if (err) {
            console.error(`[XTS] X509Cert_Verify_Null_002 error code: ${err.code}`);
            expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] X509Cert_Verify_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509Cert_Verify_Undefined_006
     * @tc.number SUB_Security_Cert_Framework_X509Cert_Verify_Undefined_006
     * @tc.desc   X509Cert.verify with undefined parameter using callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509Cert_Verify_Undefined_006",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        x509Cert.verify(undefined, (err) => {
          if (err) {
            console.error(`[XTS] X509Cert_Verify_Undefined_002 error code: ${err.code}`);
            expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] X509Cert_Verify_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509Cert_GetSubjectName_Null_001
     * @tc.number SUB_Security_Cert_Framework_X509Cert_GetSubjectName_Null_001
     * @tc.desc   X509Cert.getSubjectName with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509Cert_GetSubjectName_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        x509Cert.getSubjectName(null);
      } catch (error) {
        console.error(`[XTS] X509Cert_GetSubjectName_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509Cert_GetSubjectName_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_X509Cert_GetSubjectName_Undefined_001
     * @tc.desc   X509Cert.getSubjectName with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509Cert_GetSubjectName_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        x509Cert.getSubjectName(undefined);
      } catch (error) {
        console.error(`[XTS] X509Cert_GetSubjectName_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateX509CRL_Null_001
     * @tc.number SUB_Security_Cert_Framework_CreateX509CRL_Null_001
     * @tc.desc   cert.createX509CRL with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateX509CRL_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await cert.createX509CRL(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateX509CRL_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateX509CRL_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_CreateX509CRL_Undefined_001
     * @tc.desc   cert.createX509CRL with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateX509CRL_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await cert.createX509CRL(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateX509CRL_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateX509CRL_Null_002
     * @tc.number SUB_Security_Cert_Framework_CreateX509CRL_Null_002
     * @tc.desc   cert.createX509CRL with null parameter using callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateX509CRL_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cert.createX509CRL(null, (err, data) => {
          if (err) {
            console.error(`[XTS] CreateX509CRL_Null_002 error code: ${err.code}`);
            expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] CreateX509CRL_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateX509CRL_Undefined_002
     * @tc.number SUB_Security_Cert_Framework_CreateX509CRL_Undefined_002
     * @tc.desc   cert.createX509CRL with undefined parameter using callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateX509CRL_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cert.createX509CRL(undefined, (err, data) => {
          if (err) {
            console.error(`[XTS] CreateX509CRL_Undefined_002 error code: ${err.code}`);
            expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] CreateX509CRL_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509CRL_Match_Null_001
     * @tc.number SUB_Security_Cert_Framework_X509CRL_Match_Null_001
     * @tc.desc   X509CRL.match with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509CRL_Match_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(testCrlPem),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509CRL: cert.X509CRL = await cert.createX509CRL(encodingBlob);
        x509CRL.match(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X509CRL_Match_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509CRL_Match_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_X509CRL_Match_Undefined_001
     * @tc.desc   X509CRL.match with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509CRL_Match_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(testCrlPem),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509CRL: cert.X509CRL = await cert.createX509CRL(encodingBlob);
        x509CRL.match(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X509CRL_Match_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509CRL_Verify_Null_001
     * @tc.number SUB_Security_Cert_Framework_X509CRL_Verify_Null_001
     * @tc.desc   X509CRL.verify with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509CRL_Verify_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(testCrlPem),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509CRL: cert.X509CRL = await cert.createX509CRL(encodingBlob);
        await x509CRL.verify(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X509CRL_Verify_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509CRL_Verify_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_X509CRL_Verify_Undefined_001
     * @tc.desc   X509CRL.verify with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509CRL_Verify_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(testCrlPem),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509CRL: cert.X509CRL = await cert.createX509CRL(encodingBlob);
        await x509CRL.verify(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X509CRL_Verify_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509CRL_Verify_Null_002
     * @tc.number SUB_Security_Cert_Framework_X509CRL_Verify_Null_002
     * @tc.desc   X509CRL.verify with null parameter using callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509CRL_Verify_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(testCrlPem),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509CRL: cert.X509CRL = await cert.createX509CRL(encodingBlob);
        x509CRL.verify(null, (err) => {
          if (err) {
            console.error(`[XTS] X509CRL_Verify_Null_002 error code: ${err.code}`);
            expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] X509CRL_Verify_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509CRL_Verify_Undefined_002
     * @tc.number SUB_Security_Cert_Framework_X509CRL_Verify_Undefined_002
     * @tc.desc   X509CRL.verify with undefined parameter using callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509CRL_Verify_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(testCrlPem),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509CRL: cert.X509CRL = await cert.createX509CRL(encodingBlob);
        x509CRL.verify(undefined, (err) => {
          if (err) {
            console.error(`[XTS] X509CRL_Verify_Undefined_002 error code: ${err.code}`);
            expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] X509CRL_Verify_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateX509CertChain_Null_001
     * @tc.number SUB_Security_Cert_Framework_CreateX509CertChain_Null_001
     * @tc.desc   cert.createX509CertChain with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateX509CertChain_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await cert.createX509CertChain(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateX509CertChain_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateX509CertChain_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_CreateX509CertChain_Undefined_001
     * @tc.desc   cert.createX509CertChain with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateX509CertChain_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await cert.createX509CertChain(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateX509CertChain_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateX509CertChain_Null_002
     * @tc.number SUB_Security_Cert_Framework_CreateX509CertChain_Null_002
     * @tc.desc   cert.createX509CertChain with null parameter using callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateX509CertChain_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cert.createX509CertChain(null, (err, data) => {
          if (err) {
            console.error(`[XTS] CreateX509CertChain_Null_002 error code: ${err.code}`);
            expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] CreateX509CertChain_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateX509CertChain_Undefined_002
     * @tc.number SUB_Security_Cert_Framework_CreateX509CertChain_Undefined_002
     * @tc.desc   cert.createX509CertChain with undefined parameter using callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateX509CertChain_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cert.createX509CertChain(undefined, (err, data) => {
          if (err) {
            console.error(`[XTS] CreateX509CertChain_Undefined_002 error code: ${err.code}`);
            expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] CreateX509CertChain_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509CertChain_Validate_Null_001
     * @tc.number SUB_Security_Cert_Framework_X509CertChain_Validate_Null_001
     * @tc.desc   X509CertChain.validate with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509CertChain_Validate_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let certChain: cert.X509CertChain = await cert.createX509CertChain(encodingBlob);
        await certChain.validate(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X509CertChain_Validate_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509CertChain_Validate_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_X509CertChain_Validate_Undefined_001
     * @tc.desc   X509CertChain.validate with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509CertChain_Validate_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let certChain: cert.X509CertChain = await cert.createX509CertChain(encodingBlob);
        await certChain.validate(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X509CertChain_Validate_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509CertChain_Validate_Null_002
     * @tc.number SUB_Security_Cert_Framework_X509CertChain_Validate_Null_002
     * @tc.desc   X509CertChain.validate with null parameter using callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509CertChain_Validate_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let certChain: cert.X509CertChain = await cert.createX509CertChain(encodingBlob);
        certChain.validate(null, (err, data) => {
          if (err) {
            console.error(`[XTS] X509CertChain_Validate_Null_002 error code: ${err.code}`);
            expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] X509CertChain_Validate_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509CertChain_Validate_Undefined_002
     * @tc.number SUB_Security_Cert_Framework_X509CertChain_Validate_Undefined_002
     * @tc.desc   X509CertChain.validate with undefined parameter using callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509CertChain_Validate_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let certChain: cert.X509CertChain = await cert.createX509CertChain(encodingBlob);
        certChain.validate(undefined, (err, data) => {
          if (err) {
            console.error(`[XTS] X509CertChain_Validate_Undefined_002 error code: ${err.code}`);
            expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] X509CertChain_Validate_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreatePkcs12_Null_001
     * @tc.number SUB_Security_Cert_Framework_CreatePkcs12_Null_001
     * @tc.desc   cert.createPkcs12 with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreatePkcs12_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await cert.createPkcs12(null, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreatePkcs12_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreatePkcs12_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_CreatePkcs12_Undefined_001
     * @tc.desc   cert.createPkcs12 with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreatePkcs12_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await cert.createPkcs12(undefined, undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreatePkcs12_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ParsePkcs12_Null_001
     * @tc.number SUB_Security_Cert_Framework_ParsePkcs12_Null_001
     * @tc.desc   cert.parsePkcs12 with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_ParsePkcs12_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cert.parsePkcs12(null, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] ParsePkcs12_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ParsePkcs12_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_ParsePkcs12_Undefined_001
     * @tc.desc   cert.parsePkcs12 with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_ParsePkcs12_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cert.parsePkcs12(undefined, undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] ParsePkcs12_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateCertCRLCollection_Null_001
     * @tc.number SUB_Security_Cert_Framework_CreateCertCRLCollection_Null_001
     * @tc.desc   cert.createCertCRLCollection with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateCertCRLCollection_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cert.createCertCRLCollection(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateCertCRLCollection_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateCertCRLCollection_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_CreateCertCRLCollection_Undefined_001
     * @tc.desc   cert.createCertCRLCollection with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateCertCRLCollection_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cert.createCertCRLCollection(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateCertCRLCollection_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateCmsGenerator_Null_001
     * @tc.number SUB_Security_Cert_Framework_CreateCmsGenerator_Null_001
     * @tc.desc   cert.createCmsGenerator with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateCmsGenerator_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cert.createCmsGenerator(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateCmsGenerator_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateCmsGenerator_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_CreateCmsGenerator_Undefined_001
     * @tc.desc   cert.createCmsGenerator with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateCmsGenerator_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cert.createCmsGenerator(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateCmsGenerator_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateCertChainValidator_Null_001
     * @tc.number SUB_Security_Cert_Framework_CreateCertChainValidator_Null_001
     * @tc.desc   cert.createCertChainValidator with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateCertChainValidator_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cert.createCertChainValidator(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateCertChainValidator_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateCertChainValidator_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_CreateCertChainValidator_Undefined_001
     * @tc.desc   cert.createCertChainValidator with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateCertChainValidator_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cert.createCertChainValidator(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateCertChainValidator_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateCertExtension_Null_001
     * @tc.number SUB_Security_Cert_Framework_CreateCertExtension_Null_001
     * @tc.desc   cert.createCertExtension with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateCertExtension_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await cert.createCertExtension(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateCertExtension_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateCertExtension_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_CreateCertExtension_Undefined_001
     * @tc.desc   cert.createCertExtension with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateCertExtension_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await cert.createCertExtension(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateCertExtension_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateCertExtension_Null_002
     * @tc.number SUB_Security_Cert_Framework_CreateCertExtension_Null_002
     * @tc.desc   cert.createCertExtension with null parameter using callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateCertExtension_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cert.createCertExtension(null, (err, data) => {
          if (err) {
            console.error(`[XTS] CreateCertExtension_Null_002 error code: ${err.code}`);
            expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] CreateCertExtension_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateCertExtension_Undefined_002
     * @tc.number SUB_Security_Cert_Framework_CreateCertExtension_Undefined_002
     * @tc.desc   cert.createCertExtension with undefined parameter using callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateCertExtension_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cert.createCertExtension(undefined, (err, data) => {
          if (err) {
            console.error(`[XTS] CreateCertExtension_Undefined_002 error code: ${err.code}`);
            expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] CreateCertExtension_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateTrustAnchorsWithKeyStore_Null_001
     * @tc.number SUB_Security_Cert_Framework_CreateTrustAnchorsWithKeyStore_Null_001
     * @tc.desc   cert.createTrustAnchorsWithKeyStore with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateTrustAnchorsWithKeyStore_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await cert.createTrustAnchorsWithKeyStore(null, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateTrustAnchorsWithKeyStore_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateTrustAnchorsWithKeyStore_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_CreateTrustAnchorsWithKeyStore_Undefined_001
     * @tc.desc   cert.createTrustAnchorsWithKeyStore with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateTrustAnchorsWithKeyStore_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await cert.createTrustAnchorsWithKeyStore(undefined, undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateTrustAnchorsWithKeyStore_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509Cert_GetIssuerName_Null_001
     * @tc.number SUB_Security_Cert_Framework_X509Cert_GetIssuerName_Null_001
     * @tc.desc   X509Cert.getIssuerName with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509Cert_GetIssuerName_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        x509Cert.getIssuerName(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X509Cert_GetIssuerName_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509Cert_GetIssuerName_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_X509Cert_GetIssuerName_Undefined_001
     * @tc.desc   X509Cert.getIssuerName with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509Cert_GetIssuerName_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        x509Cert.getIssuerName(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X509Cert_GetIssuerName_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509CRL_GetIssuerName_Null_001
     * @tc.number SUB_Security_Cert_Framework_X509CRL_GetIssuerName_Null_001
     * @tc.desc   X509CRL.getIssuerName with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509CRL_GetIssuerName_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(testCrlPem),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509CRL: cert.X509CRL = await cert.createX509CRL(encodingBlob);
        x509CRL.getIssuerName(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X509CRL_GetIssuerName_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509CRL_GetIssuerName_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_X509CRL_GetIssuerName_Undefined_001
     * @tc.desc   X509CRL.getIssuerName with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509CRL_GetIssuerName_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(testCrlPem),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509CRL: cert.X509CRL = await cert.createX509CRL(encodingBlob);
        x509CRL.getIssuerName(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X509CRL_GetIssuerName_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509Cert_ToString_Null_001
     * @tc.number SUB_Security_Cert_Framework_X509Cert_ToString_Null_001
     * @tc.desc   X509Cert.toString with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509Cert_ToString_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        await x509Cert.toString(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X509Cert_ToString_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509Cert_ToString_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_X509Cert_ToString_Undefined_001
     * @tc.desc   X509Cert.toString with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509Cert_ToString_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        await x509Cert.toString(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X509Cert_ToString_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509CRL_ToString_Null_001
     * @tc.number SUB_Security_Cert_Framework_X509CRL_ToString_Null_001
     * @tc.desc   X509CRL.toString with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509CRL_ToString_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(testCrlPem),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509CRL: cert.X509CRL = await cert.createX509CRL(encodingBlob);
        await x509CRL.toString(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X509CRL_ToString_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509CRL_ToString_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_X509CRL_ToString_Undefined_001
     * @tc.desc   X509CRL.toString with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509CRL_ToString_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(testCrlPem),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509CRL: cert.X509CRL = await cert.createX509CRL(encodingBlob);
        await x509CRL.toString(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X509CRL_ToString_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChainValidator_Validate_Null_001
     * @tc.number SUB_Security_Cert_Framework_CertChainValidator_Validate_Null_001
     * @tc.desc   CertChainValidator.validate with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertChainValidator_Validate_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let validator: cert.CertChainValidator = cert.createCertChainValidator("RSA");
        await validator.validate(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CertChainValidator_Validate_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.NOT_SUPPORT);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChainValidator_Validate_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_CertChainValidator_Validate_Undefined_001
     * @tc.desc   CertChainValidator.validate with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertChainValidator_Validate_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let validator: cert.CertChainValidator = cert.createCertChainValidator("RSA");
        await validator.validate(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CertChainValidator_Validate_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.NOT_SUPPORT);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChainValidator_Validate_Null_002
     * @tc.number SUB_Security_Cert_Framework_CertChainValidator_Validate_Null_002
     * @tc.desc   CertChainValidator.validate with null parameter using callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertChainValidator_Validate_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let validator: cert.CertChainValidator = cert.createCertChainValidator("RSA");
        validator.validate(null, (err, data) => {
          if (err) {
            console.error(`[XTS] CertChainValidator_Validate_Null_002 error code: ${err.code}`);
            expect(err.code).assertEqual(cert.CertResult.NOT_SUPPORT);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] CertChainValidator_Validate_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.NOT_SUPPORT);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChainValidator_Validate_Undefined_002
     * @tc.number SUB_Security_Cert_Framework_CertChainValidator_Validate_Undefined_002
     * @tc.desc   CertChainValidator.validate with undefined parameter using callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertChainValidator_Validate_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let validator: cert.CertChainValidator = cert.createCertChainValidator("RSA");
        validator.validate(undefined, (err, data) => {
          if (err) {
            console.error(`[XTS] CertChainValidator_Validate_Undefined_002 error code: ${err.code}`);
            expect(err.code).assertEqual(cert.CertResult.NOT_SUPPORT);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] CertChainValidator_Validate_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.NOT_SUPPORT);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreatePkcs12Sync_Null_001
     * @tc.number SUB_Security_Cert_Framework_CreatePkcs12Sync_Null_001
     * @tc.desc   cert.createPkcs12Sync with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreatePkcs12Sync_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cert.createPkcs12Sync(null, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreatePkcs12Sync_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreatePkcs12Sync_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_CreatePkcs12Sync_Undefined_001
     * @tc.desc   cert.createPkcs12Sync with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreatePkcs12Sync_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cert.createPkcs12Sync(undefined, undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreatePkcs12Sync_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateX509CertChain_Array_Null_001
     * @tc.number SUB_Security_Cert_Framework_CreateX509CertChain_Array_Null_001
     * @tc.desc   cert.createX509CertChain with null array parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateX509CertChain_Array_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cert.createX509CertChain(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateX509CertChain_Array_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CreateX509CertChain_Array_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_CreateX509CertChain_Array_Undefined_001
     * @tc.desc   cert.createX509CertChain with undefined array parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CreateX509CertChain_Array_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cert.createX509CertChain(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateX509CertChain_Array_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ParsePkcs12_Password_Null_001
     * @tc.number SUB_Security_Cert_Framework_ParsePkcs12_Password_Null_001
     * @tc.desc   cert.parsePkcs12 with null password parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_ParsePkcs12_Password_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await cert.parsePkcs12(null, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] ParsePkcs12_Password_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ParsePkcs12_Password_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_ParsePkcs12_Password_Undefined_001
     * @tc.desc   cert.parsePkcs12 with undefined password parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_ParsePkcs12_Password_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await cert.parsePkcs12(undefined, undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] ParsePkcs12_Password_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertExtension_GetOidList_Null_001
     * @tc.number SUB_Security_Cert_Framework_CertExtension_GetOidList_Null_001
     * @tc.desc   CertExtension.getOidList with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertExtension_GetOidList_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        let certExtension: cert.CertExtension = x509Cert.getExtensionsObject();
        certExtension.getOidList(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CertExtension_GetOidList_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertExtension_GetOidList_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_CertExtension_GetOidList_Undefined_001
     * @tc.desc   CertExtension.getOidList with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertExtension_GetOidList_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        let certExtension: cert.CertExtension = x509Cert.getExtensionsObject();
        certExtension.getOidList(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CertExtension_GetOidList_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCRLCollection_SelectCerts_Null_001
     * @tc.number SUB_Security_Cert_Framework_CertCRLCollection_SelectCerts_Null_001
     * @tc.desc   CertCRLCollection.selectCerts with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertCRLCollection_SelectCerts_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        let collection: cert.CertCRLCollection = cert.createCertCRLCollection([x509Cert]);
        await collection.selectCerts(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CertCRLCollection_SelectCerts_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCRLCollection_SelectCerts_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_CertCRLCollection_SelectCerts_Undefined_001
     * @tc.desc   CertCRLCollection.selectCerts with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertCRLCollection_SelectCerts_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        let collection: cert.CertCRLCollection = cert.createCertCRLCollection([x509Cert]);
        await collection.selectCerts(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CertCRLCollection_SelectCerts_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCRLCollection_SelectCerts_Null_002
     * @tc.number SUB_Security_Cert_Framework_CertCRLCollection_SelectCerts_Null_002
     * @tc.desc   CertCRLCollection.selectCerts with null parameter using callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertCRLCollection_SelectCerts_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        let collection: cert.CertCRLCollection = cert.createCertCRLCollection([x509Cert]);
        collection.selectCerts(null, (err, data) => {
          if (err) {
            console.error(`[XTS] CertCRLCollection_SelectCerts_Null_002 error code: ${err.code}`);
            expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] CertCRLCollection_SelectCerts_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCRLCollection_SelectCerts_Undefined_002
     * @tc.number SUB_Security_Cert_Framework_CertCRLCollection_SelectCerts_Undefined_002
     * @tc.desc   CertCRLCollection.selectCerts with undefined parameter using callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertCRLCollection_SelectCerts_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        let collection: cert.CertCRLCollection = cert.createCertCRLCollection([x509Cert]);
        collection.selectCerts(undefined, (err, data) => {
          if (err) {
            console.error(`[XTS] CertCRLCollection_SelectCerts_Undefined_002 error code: ${err.code}`);
            expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] CertCRLCollection_SelectCerts_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X500DistinguishedName_GetName_Null_001
     * @tc.number SUB_Security_Cert_Framework_X500DistinguishedName_GetName_Null_001
     * @tc.desc   X500DistinguishedName.getName with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X500DistinguishedName_GetName_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        let x500Name: cert.X500DistinguishedName = await x509Cert.getSubjectX500DistinguishedName();
        x500Name.getName(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X500DistinguishedName_GetName_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X500DistinguishedName_GetName_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_X500DistinguishedName_GetName_Undefined_001
     * @tc.desc   X500DistinguishedName.getName with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X500DistinguishedName_GetName_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        let x500Name: cert.X500DistinguishedName = await x509Cert.getSubjectX500DistinguishedName();
        x500Name.getName(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X500DistinguishedName_GetName_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X500DistinguishedName_GetName_String_Null_001
     * @tc.number SUB_Security_Cert_Framework_X500DistinguishedName_GetName_String_Null_001
     * @tc.desc   X500DistinguishedName.getName with null string parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X500DistinguishedName_GetName_String_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        let x500Name: cert.X500DistinguishedName = await x509Cert.getSubjectX500DistinguishedName();
        x500Name.getName(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X500DistinguishedName_GetName_String_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_X500DistinguishedName_GetName_String_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_X500DistinguishedName_GetName_String_Undefined_001
     * @tc.desc   X500DistinguishedName.getName with undefined string parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X500DistinguishedName_GetName_String_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        let x500Name: cert.X500DistinguishedName = await x509Cert.getSubjectX500DistinguishedName();
        x500Name.getName(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] X500DistinguishedName_GetName_String_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CmsGenerator_AddSigner_Null_001
     * @tc.number SUB_Security_Cert_Framework_CmsGenerator_AddSigner_Null_001
     * @tc.desc   CmsGenerator.addSigner with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CmsGenerator_AddSigner_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
        generator.addSigner(null, null, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CmsGenerator_AddSigner_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CmsGenerator_AddSigner_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_CmsGenerator_AddSigner_Undefined_001
     * @tc.desc   CmsGenerator.addSigner with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CmsGenerator_AddSigner_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
        generator.addSigner(undefined, undefined, undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CmsGenerator_AddSigner_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CmsGenerator_AddCert_Null_001
     * @tc.number SUB_Security_Cert_Framework_CmsGenerator_AddCert_Null_001
     * @tc.desc   CmsGenerator.addCert with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CmsGenerator_AddCert_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
        generator.addCert(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CmsGenerator_AddCert_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CmsGenerator_AddCert_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_CmsGenerator_AddCert_Undefined_001
     * @tc.desc   CmsGenerator.addCert with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CmsGenerator_AddCert_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
        generator.addCert(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CmsGenerator_AddCert_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CmsGenerator_AddRecipientInfo_Null_001
     * @tc.number SUB_Security_Cert_Framework_CmsGenerator_AddRecipientInfo_Null_001
     * @tc.desc   CmsGenerator.addRecipientInfo with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CmsGenerator_AddRecipientInfo_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
        await generator.addRecipientInfo(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CmsGenerator_AddRecipientInfo_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.ERR_RUNTIME_ERROR);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CmsGenerator_AddRecipientInfo_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_CmsGenerator_AddRecipientInfo_Undefined_001
     * @tc.desc   CmsGenerator.addRecipientInfo with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CmsGenerator_AddRecipientInfo_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
        await generator.addRecipientInfo(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CmsGenerator_AddRecipientInfo_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.ERR_RUNTIME_ERROR);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CmsGenerator_DoFinal_Null_001
     * @tc.number SUB_Security_Cert_Framework_CmsGenerator_DoFinal_Null_001
     * @tc.desc   CmsGenerator.doFinal with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CmsGenerator_DoFinal_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
        await generator.doFinal(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CmsGenerator_DoFinal_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CmsGenerator_DoFinal_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_CmsGenerator_DoFinal_Undefined_001
     * @tc.desc   CmsGenerator.doFinal with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CmsGenerator_DoFinal_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
        await generator.doFinal(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CmsGenerator_DoFinal_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CmsGenerator_DoFinalSync_Null_001
     * @tc.number SUB_Security_Cert_Framework_CmsGenerator_DoFinalSync_Null_001
     * @tc.desc   CmsGenerator.doFinalSync with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CmsGenerator_DoFinalSync_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
        generator.doFinalSync(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CmsGenerator_DoFinalSync_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CmsGenerator_DoFinalSync_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_CmsGenerator_DoFinalSync_Undefined_001
     * @tc.desc   CmsGenerator.doFinalSync with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CmsGenerator_DoFinalSync_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
        generator.doFinalSync(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CmsGenerator_DoFinalSync_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CmsParser_SetRawData_Null_001
     * @tc.number SUB_Security_Cert_Framework_CmsParser_SetRawData_Null_001
     * @tc.desc   CmsParser.setRawData with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CmsParser_SetRawData_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let parser: cert.CmsParser = cert.createCmsParser();
        await parser.setRawData(null, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CmsParser_SetRawData_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CmsParser_SetRawData_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_CmsParser_SetRawData_Undefined_001
     * @tc.desc   CmsParser.setRawData with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CmsParser_SetRawData_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let parser: cert.CmsParser = cert.createCmsParser();
        await parser.setRawData(undefined, undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CmsParser_SetRawData_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CmsParser_VerifySignedData_Null_001
     * @tc.number SUB_Security_Cert_Framework_CmsParser_VerifySignedData_Null_001
     * @tc.desc   CmsParser.verifySignedData with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CmsParser_VerifySignedData_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let parser: cert.CmsParser = cert.createCmsParser();
        await parser.verifySignedData(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CmsParser_VerifySignedData_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.ERR_RUNTIME_ERROR);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CmsParser_VerifySignedData_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_CmsParser_VerifySignedData_Undefined_001
     * @tc.desc   CmsParser.verifySignedData with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CmsParser_VerifySignedData_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let parser: cert.CmsParser = cert.createCmsParser();
        await parser.verifySignedData(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CmsParser_VerifySignedData_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.ERR_RUNTIME_ERROR);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CmsParser_DecryptEnvelopedData_Null_001
     * @tc.number SUB_Security_Cert_Framework_CmsParser_DecryptEnvelopedData_Null_001
     * @tc.desc   CmsParser.decryptEnvelopedData with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CmsParser_DecryptEnvelopedData_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let parser: cert.CmsParser = cert.createCmsParser();
        await parser.decryptEnvelopedData(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CmsParser_DecryptEnvelopedData_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CmsParser_DecryptEnvelopedData_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_CmsParser_DecryptEnvelopedData_Undefined_001
     * @tc.desc   CmsParser.decryptEnvelopedData with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CmsParser_DecryptEnvelopedData_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let parser: cert.CmsParser = cert.createCmsParser();
        await parser.decryptEnvelopedData(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CmsParser_DecryptEnvelopedData_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CmsParser_GetCerts_Null_001
     * @tc.number SUB_Security_Cert_Framework_CmsParser_GetCerts_Null_001
     * @tc.desc   CmsParser.getCerts with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CmsParser_GetCerts_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let parser: cert.CmsParser = cert.createCmsParser();
        await parser.getCerts(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CmsParser_GetCerts_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CmsParser_GetCerts_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_CmsParser_GetCerts_Undefined_001
     * @tc.desc   CmsParser.getCerts with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CmsParser_GetCerts_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let parser: cert.CmsParser = cert.createCmsParser();
        await parser.getCerts(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CmsParser_GetCerts_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_GenerateCsr_Null_001
     * @tc.number SUB_Security_Cert_Framework_GenerateCsr_Null_001
     * @tc.desc   cert.generateCsr with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_GenerateCsr_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cert.generateCsr(null, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] GenerateCsr_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_GenerateCsr_Undefined_001
     * @tc.number SUB_Security_Cert_Framework_GenerateCsr_Undefined_001
     * @tc.desc   cert.generateCsr with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_GenerateCsr_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cert.generateCsr(undefined, undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] GenerateCsr_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

  });
}
 