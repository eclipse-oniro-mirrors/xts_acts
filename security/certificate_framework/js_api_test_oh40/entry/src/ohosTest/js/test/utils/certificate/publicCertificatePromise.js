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

import cert from "@ohos.security.cert";
import { stringTouInt8Array } from "../common/publicDoString";
import * as param from "../common/publicParam";

async function createX509CertInstancePromise(certType) {
  var certformat;
  var encodingData;

  if (certType == "der") {
    certformat = cert.EncodingFormat.FORMAT_DER;
    encodingData = new Uint8Array(param.certDataDER01);
  } else {
    certformat = cert.EncodingFormat.FORMAT_PEM;
    encodingData = stringTouInt8Array(param.certDataPEM01);
  }

  var encodingBlob = {
    data: encodingData,
    encodingFormat: certformat,
  };

  return new Promise((resolve, reject) => {
    cert
      .createX509Cert(encodingBlob)
      .then((data) => {
        try {
          data.getCRLDistributionPoint();
        } catch (err) {
          console.info("[promise] create X509 Cert success! get point failed!");
        }
        console.warn(
          "[promise] create X509 Cert success! format is: " + certformat
        );
        resolve(data);
      })
      .catch((err) => {
        console.error(
          "[promise] create X509 Cert failed! error code is: " + err.code
        );
        reject(err);
      });
  });
}

async function createX509CertExtensionNormalPromise(flag) {
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
    cert
      .createCertExtension(encodingBlob)
      .then((extensionObj) => {
        console.warn(
          "[promise] create X509 CertExtension success! format is: " +
            certFormat
        );
        resolve(extensionObj);
      })
      .catch((err) => {
        console.error(
          "[promise] create X509 CertExtension failed! error code is: " +
            err.code
        );
        reject(err);
      });
  });
}

export { createX509CertInstancePromise, createX509CertExtensionNormalPromise };
