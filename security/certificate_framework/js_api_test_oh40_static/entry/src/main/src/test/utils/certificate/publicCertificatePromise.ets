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

import cert from "@ohos.security.cert";
import { stringTouInt8Array } from "../common/publicDoString";
import * as param from "../common/publicParam";

async function createX509CertInstancePromise(certType: string): Promise<cert.X509Cert> {
  let certformat: cert.EncodingFormat;
  let encodingData: Uint8Array = new Uint8Array();

  if (certType == "der") {
    certformat = cert.EncodingFormat.FORMAT_DER;
    encodingData = new Uint8Array(param.certDataDER01);
  } else {
    certformat = cert.EncodingFormat.FORMAT_PEM;
    encodingData = stringTouInt8Array(param.certDataPEM01);
  }

  let encodingBlob: cert.EncodingBlob = {
    data: encodingData,
    encodingFormat: certformat,
  };

  let data: cert.X509Cert = await cert.createX509Cert(encodingBlob)

  return data;
}

async function createX509CertExtensionNormalPromise(flag: string): Promise<cert.CertExtension> {
  let encodingData: Uint8Array = new Uint8Array();
  let certFormat: cert.EncodingFormat = cert.EncodingFormat.FORMAT_DER;

  switch (flag) {
    case "certExtensionNormal01":
      encodingData = new Uint8Array(param.certExtensionNormal01);
      break;
    case "certExtensionNormal02":
      encodingData = new Uint8Array(param.certExtensionNormal02);
      break;
    case "certExtensionInvalid01":
      encodingData = new Uint8Array(param.certExtensionInvalid01);
      break;
    case "certExtensionInvalid02":
      encodingData = new Uint8Array(param.certExtensionInvalid02);
      break;
    default:
      break;
  }

  let encodingBlob: cert.EncodingBlob = {
    data: encodingData,
    encodingFormat: certFormat,
  };

  let extensionObj: cert.CertExtension = await cert.createCertExtension(encodingBlob)

  return extensionObj;
}

export { createX509CertInstancePromise, createX509CertExtensionNormalPromise };
