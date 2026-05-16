/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { huks } from '@kit.UniversalKeystoreKit';
import { StringToUint8Array } from '../common/CommonUtils';
import { GenParam } from './HuksOptionsUtils';
import { util } from '@kit.ArkTS';
import { cert } from '@kit.DeviceCertificateKit';

export function GetAttestKeyOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO, StringToUint8Array("sec_level")),
      GenParam(huks.HuksTag.HUKS_TAG_ATTESTATION_CHALLENGE, StringToUint8Array("challenge_data")),
      GenParam(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_VERSION_INFO, StringToUint8Array("version_info")),
      GenParam(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_ALIAS, StringToUint8Array("keyAlias"))
    )
  };
  return huksOptions;
}

async function ParsingCert(certData: string): Promise<void> {
  let textEncoder = new util.TextEncoder();
  let encodingBlob: cert.EncodingBlob = {
    data: textEncoder.encodeInto(certData),
    encodingFormat: cert.EncodingFormat.FORMAT_PEM
  };
  let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
  let version = x509Cert.getVersion();
  let serial = x509Cert.getCertSerialNumber();
  let pubKey = x509Cert.getPublicKey();
  await x509Cert.verify(pubKey);
}