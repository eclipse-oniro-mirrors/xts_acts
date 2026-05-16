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
import { expect } from "@ohos/hypium";
import cryptoFramework from "@ohos.security.cryptoFramework";
import cert from "@ohos.security.cert";

function testSecurityRandomEnumCommon() {
  expect(401).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
  expect(401).assertEqual(cert.CertResult.INVALID_PARAMS);
  expect(801).assertEqual(cryptoFramework.Result.NOT_SUPPORT);
  expect(801).assertEqual(cert.CertResult.NOT_SUPPORT);
  expect(17620001).assertEqual(cryptoFramework.Result.ERR_OUT_OF_MEMORY);
  expect(19020001).assertEqual(cert.CertResult.ERR_OUT_OF_MEMORY);
  expect(17620002).assertEqual(cryptoFramework.Result.ERR_RUNTIME_ERROR);
  expect(19020002).assertEqual(cert.CertResult.ERR_RUNTIME_ERROR);
  expect(17630001).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
  expect(19030001).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
  expect(19030002).assertEqual(cert.CertResult.ERR_CERT_SIGNATURE_FAILURE);
  expect(19030003).assertEqual(cert.CertResult.ERR_CERT_NOT_YET_VALID);
  expect(19030004).assertEqual(cert.CertResult.ERR_CERT_HAS_EXPIRED);
  expect(19030005).assertEqual(
    cert.CertResult.ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY
  );
  expect(19030006).assertEqual(cert.CertResult.ERR_KEYUSAGE_NO_CERTSIGN);
  expect(19030007).assertEqual(
    cert.CertResult.ERR_KEYUSAGE_NO_DIGITAL_SIGNATURE
  );
  expect(0).assertEqual(cert.EncodingFormat.FORMAT_DER);
  expect(1).assertEqual(cert.EncodingFormat.FORMAT_PEM);
  expect(0).assertEqual(cryptoFramework.CryptoMode.ENCRYPT_MODE);
  expect(1).assertEqual(cryptoFramework.CryptoMode.DECRYPT_MODE);
}

export { testSecurityRandomEnumCommon };
