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
import cert from "@ohos.security.cert";

function certificateEnumTypeTest() {
  expect(cert.CertResult.INVALID_PARAMS).assertEqual(401);
  expect(cert.CertResult.NOT_SUPPORT).assertEqual(801);
  expect(cert.CertResult.ERR_OUT_OF_MEMORY).assertEqual(19020001);
  expect(cert.CertResult.ERR_RUNTIME_ERROR).assertEqual(19020002);
  expect(cert.CertResult.ERR_CRYPTO_OPERATION).assertEqual(19030001);
  expect(cert.CertResult.ERR_CERT_SIGNATURE_FAILURE).assertEqual(19030002);
  expect(cert.CertResult.ERR_CERT_NOT_YET_VALID).assertEqual(19030003);
  expect(cert.CertResult.ERR_CERT_HAS_EXPIRED).assertEqual(19030004);
  expect(cert.CertResult.ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY).assertEqual(
    19030005
  );
  expect(cert.CertResult.ERR_KEYUSAGE_NO_CERTSIGN).assertEqual(19030006);
  expect(cert.CertResult.ERR_KEYUSAGE_NO_DIGITAL_SIGNATURE).assertEqual(
    19030007
  );

  expect(cert.EncodingFormat.FORMAT_DER).assertEqual(0);
  expect(cert.EncodingFormat.FORMAT_PEM).assertEqual(1);

  expect(cert.CertItemType.CERT_ITEM_TYPE_TBS).assertEqual(0);
  expect(cert.CertItemType.CERT_ITEM_TYPE_PUBLIC_KEY).assertEqual(1);
  expect(cert.CertItemType.CERT_ITEM_TYPE_ISSUER_UNIQUE_ID).assertEqual(2);
  expect(cert.CertItemType.CERT_ITEM_TYPE_SUBJECT_UNIQUE_ID).assertEqual(3);
  expect(cert.CertItemType.CERT_ITEM_TYPE_EXTENSIONS).assertEqual(4);

  expect(cert.ExtensionOidType.EXTENSION_OID_TYPE_ALL).assertEqual(0);
  expect(cert.ExtensionOidType.EXTENSION_OID_TYPE_CRITICAL).assertEqual(1);
  expect(cert.ExtensionOidType.EXTENSION_OID_TYPE_UNCRITICAL).assertEqual(2);

  expect(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY).assertEqual(0);
  expect(
    cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY_CRITICAL
  ).assertEqual(1);
  expect(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY_VALUE).assertEqual(
    2
  );
}

function getX509CertItem(certObject, itemType) {
  let uint8Data = certObject.getItem(itemType);
  return uint8Data;
}

export { certificateEnumTypeTest, getX509CertItem };
