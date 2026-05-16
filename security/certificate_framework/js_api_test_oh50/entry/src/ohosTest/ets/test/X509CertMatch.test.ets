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

export default function certFrameworkX509CertMatchTestUnit() {
  describe("certFrameworkX509CertMatchTestUnit", () => {

    /**
     * @tc.name   SUB_Security_Cert_Framework_X509Cert_Match_Null_0012
     * @tc.number SUB_Security_Cert_Framework_X509Cert_Match_Null_0012
     * @tc.desc   X509Cert.match with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509Cert_Match_Null_0012",
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
     * @tc.name   SUB_Security_Cert_Framework_X509Cert_Match_Undefined_0012
     * @tc.number SUB_Security_Cert_Framework_X509Cert_Match_Undefined_0012
     * @tc.desc   X509Cert.match with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_X509Cert_Match_Undefined_0012",
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
  });
}
