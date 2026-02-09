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

import { expect } from "../../../../../hypium/index";
import cert from "@ohos.security.cert";

function certificateEnumTypeTest(): void {
  expect(cert.CertResult.INVALID_PARAMS).assertEqual(401);
  expect(cert.CertResult.NOT_SUPPORT).assertEqual(801);
  expect(cert.CertResult.ERR_OUT_OF_MEMORY).assertEqual(19020001);
  expect(cert.CertResult.ERR_RUNTIME_ERROR).assertEqual(19020002);
  expect(cert.CertResult.ERR_PARAMETER_CHECK_FAILED).assertEqual(19020003);
  expect(cert.CertResult.ERR_CRYPTO_OPERATION).assertEqual(19030001);
  expect(cert.CertResult.ERR_CERT_SIGNATURE_FAILURE).assertEqual(19030002);
  expect(cert.CertResult.ERR_CERT_NOT_YET_VALID).assertEqual(19030003);
  expect(cert.CertResult.ERR_CERT_HAS_EXPIRED).assertEqual(19030004);
  expect(cert.CertResult.ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY).assertEqual(19030005);
  expect(cert.CertResult.ERR_KEYUSAGE_NO_CERTSIGN).assertEqual(19030006);
  expect(cert.CertResult.ERR_KEYUSAGE_NO_DIGITAL_SIGNATURE).assertEqual(19030007);
  expect(cert.CertResult.ERR_MAYBE_WRONG_PASSWORD).assertEqual(19030008);
  expect(cert.EncodingFormat.FORMAT_DER).assertEqual(0);
  expect(cert.EncodingFormat.FORMAT_PEM).assertEqual(1);
  expect(cert.EncodingFormat.FORMAT_PKCS7).assertEqual(2);
  expect(cert.CertItemType.CERT_ITEM_TYPE_TBS).assertEqual(0);
  expect(cert.CertItemType.CERT_ITEM_TYPE_PUBLIC_KEY).assertEqual(1);
  expect(cert.CertItemType.CERT_ITEM_TYPE_ISSUER_UNIQUE_ID).assertEqual(2);
  expect(cert.CertItemType.CERT_ITEM_TYPE_SUBJECT_UNIQUE_ID).assertEqual(3);
  expect(cert.CertItemType.CERT_ITEM_TYPE_EXTENSIONS).assertEqual(4);
  expect(cert.ExtensionOidType.EXTENSION_OID_TYPE_ALL).assertEqual(0);
  expect(cert.ExtensionOidType.EXTENSION_OID_TYPE_CRITICAL).assertEqual(1);
  expect(cert.ExtensionOidType.EXTENSION_OID_TYPE_UNCRITICAL).assertEqual(2);
  expect(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY).assertEqual(0);
  expect(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY_CRITICAL).assertEqual(1);
  expect(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY_VALUE).assertEqual(2);
}

function certificateEnumTypeTest2(): void {
  expect(cert.EncodingType.ENCODING_UTF8).assertEqual(0);
  expect(cert.GeneralNameType.GENERAL_NAME_TYPE_OTHER_NAME).assertEqual(0);
  expect(cert.GeneralNameType.GENERAL_NAME_TYPE_RFC822_NAME).assertEqual(1);
  expect(cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME).assertEqual(2);
  expect(cert.GeneralNameType.GENERAL_NAME_TYPE_X400_ADDRESS).assertEqual(3);
  expect(cert.GeneralNameType.GENERAL_NAME_TYPE_DIRECTORY_NAME).assertEqual(4);
  expect(cert.GeneralNameType.GENERAL_NAME_TYPE_EDI_PARTY_NAME).assertEqual(5);
  expect(cert.GeneralNameType.GENERAL_NAME_TYPE_UNIFORM_RESOURCE_ID).assertEqual(6);
  expect(cert.GeneralNameType.GENERAL_NAME_TYPE_IP_ADDRESS).assertEqual(7);
  expect(cert.GeneralNameType.GENERAL_NAME_TYPE_REGISTERED_ID).assertEqual(8);
  expect(cert.EncodingBaseFormat.PEM).assertEqual(0);
  expect(cert.EncodingBaseFormat.DER).assertEqual(1);
  expect(cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP).assertEqual(0);
  expect(cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK).assertEqual(1);
  expect(cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_NO_PREFER).assertEqual(2);
  expect(cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_LOCAL).assertEqual(3);
  expect(cert.ValidationPolicyType.VALIDATION_POLICY_TYPE_X509).assertEqual(0);
  expect(cert.ValidationPolicyType.VALIDATION_POLICY_TYPE_SSL).assertEqual(1);
  expect(cert.KeyUsageType.KEYUSAGE_DIGITAL_SIGNATURE).assertEqual(0);
  expect(cert.KeyUsageType.KEYUSAGE_NON_REPUDIATION).assertEqual(1);
  expect(cert.KeyUsageType.KEYUSAGE_KEY_ENCIPHERMENT).assertEqual(2);
  expect(cert.KeyUsageType.KEYUSAGE_DATA_ENCIPHERMENT).assertEqual(3);
  expect(cert.KeyUsageType.KEYUSAGE_KEY_AGREEMENT).assertEqual(4);
  expect(cert.KeyUsageType.KEYUSAGE_KEY_CERT_SIGN).assertEqual(5);
  expect(cert.KeyUsageType.KEYUSAGE_CRL_SIGN).assertEqual(6);
  expect(cert.KeyUsageType.KEYUSAGE_ENCIPHER_ONLY).assertEqual(7);
  expect(cert.KeyUsageType.KEYUSAGE_DECIPHER_ONLY).assertEqual(8);
  expect(cert.CmsContentType.SIGNED_DATA).assertEqual(0);
  expect(cert.CmsContentDataFormat.BINARY).assertEqual(0);
  expect(cert.CmsContentDataFormat.TEXT).assertEqual(1);
  expect(cert.CmsFormat.PEM).assertEqual(0);
  expect(cert.CmsFormat.DER).assertEqual(1);
}

function getX509CertItem(certObject: cert.X509Cert, itemType: cert.CertItemType): cert.DataBlob {
  let uint8Data: cert.DataBlob = certObject.getItem(itemType);
  return uint8Data;
}

export { certificateEnumTypeTest, certificateEnumTypeTest2, getX509CertItem };
