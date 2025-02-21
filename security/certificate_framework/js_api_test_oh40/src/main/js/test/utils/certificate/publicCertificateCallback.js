/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

async function createX509CertInstanceCallback(certType) {
  var certFormat;
  var encodingData;

  if (certType == "der") {
    certFormat = cert.EncodingFormat.FORMAT_DER;
    encodingData = new Uint8Array(param.certDataDER01);
  } else {
    certFormat = cert.EncodingFormat.FORMAT_PEM;
    encodingData = stringTouInt8Array(param.certDataPEM01);
  }

  var encodingBlob = {
    data: encodingData,
    encodingFormat: certFormat,
  };

  return new Promise((resolve, reject) => {
    cert.createX509Cert(encodingBlob, (err, data) => {
      if (data == null) {
        console.error(
          "[callback] create X509 Cert failed! err code: " + err.code
        );
        reject(err);
      } else {
        console.warn(
          "[callback] create X509 Cert success! format is: " + certFormat
        );
        resolve(data);
      }
    });
  });
}

async function createX509CertExtensionNormalCallback(flag) {
  let encodingData = "";
  let certFormat = cert.EncodingFormat.FORMAT_DER;

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

  var encodingBlob = {
    data: encodingData,
    encodingFormat: certFormat,
  };

  return new Promise((resolve, reject) => {
    cert.createCertExtension(encodingBlob, (err, extensionObj) => {
      if (err) {
        console.error(
          "[callback] create X509 CertExtension failed! err code: " + err.code
        );
        reject(err);
      } else {
        console.warn(
          "[callback] create X509 CertExtension success! format is: " +
            certFormat
        );
        resolve(extensionObj);
      }
    });
  });
}

export {
  createX509CertInstanceCallback,
  createX509CertExtensionNormalCallback,
};
