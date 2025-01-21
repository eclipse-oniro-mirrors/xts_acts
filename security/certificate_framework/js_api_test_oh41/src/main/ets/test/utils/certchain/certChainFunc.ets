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
import { convertToUint8Array, stringTouInt8Array } from '../common/commonFunction';
import {
  selfSignedCaCertPem,
  selfSignedCaCertDer,
  CERT_CHAIN_PEM_CERT1,
  CERT_CHAIN_PEM_DATA0,
  CERT_CHAIN_PEM_DATA1,
  CERT_CHAIN_PEM_DATA2,
  CERT_CHAIN_PEM_DATA3,
  CERT_CHAIN_PKCS7_DATA0_HEX,
  CERT_CHAIN_DER_DATA0,
  CERT_CHAIN_PEM_CERTS,
  certExtensionInvalid01,
  CERT_CHAIN_DATA_CRLS
} from '../common/commonParam';

/**
 * Create Customized X509 Certificate.
 *
 * @param certType   pem/der
 * @param index
 * @returns Promise<cert.X509Cert>
 */
function createCustomizedX509CertPromise(certType: string, index: number): Promise<cert.X509Cert> {
  let certformat: cert.EncodingFormat;
  let encodingData: Uint8Array;

  if (certType == "der") {
    certformat = cert.EncodingFormat.FORMAT_DER;
    encodingData = getDerCertEncodingData(index);
  } else {
    certformat = cert.EncodingFormat.FORMAT_PEM;
    encodingData = getPemCertEncodingData(index);
  }

  let encodingBlob: cert.EncodingBlob = {
    data: encodingData,
    encodingFormat: certformat,
  };

  return new Promise((resolve, reject) => {
    cert
      .createX509Cert(encodingBlob)
      .then((data) => {
        console.warn(
          "[promise] create X509 Cert success! format is: " + certformat
        );
        resolve(data);
      })
      .catch((err: Error) => {
        reject(err);
      });
  });
}

function getDerCertEncodingData(index: number): Uint8Array {
  switch (index) {
    default:
      return convertToUint8Array(selfSignedCaCertDer);
  }
}

function getPemCertEncodingData(index: number): Uint8Array {
  switch (index) {
    case 0:
      return stringTouInt8Array(CERT_CHAIN_PEM_CERTS[0]); // leaf
    case 1:
      return stringTouInt8Array(CERT_CHAIN_PEM_CERTS[1]); // fourth
    case 2:
      return stringTouInt8Array(CERT_CHAIN_PEM_CERTS[2]); // third
    case 3:
      return stringTouInt8Array(CERT_CHAIN_PEM_CERTS[3]); // sec
    case 4:
      return stringTouInt8Array(CERT_CHAIN_PEM_CERTS[4]); // root
    case 5:
      return stringTouInt8Array(CERT_CHAIN_PEM_CERT1); // other
    default:
      return stringTouInt8Array(selfSignedCaCertPem);
  }
}

function createX509CrlPromise(index: number): Promise<cert.X509CRL> {
  let certformat: cert.EncodingFormat = cert.EncodingFormat.FORMAT_PEM;
  let encodingData: Uint8Array;

  switch (index) {
    case 1:
      encodingData = stringTouInt8Array(CERT_CHAIN_DATA_CRLS[1]);
      break;
    case 2:
      encodingData = stringTouInt8Array(CERT_CHAIN_DATA_CRLS[2]);
      break;
    default:
      encodingData = stringTouInt8Array(CERT_CHAIN_DATA_CRLS[0]);
      break;
  }

  let encodingBlob: cert.EncodingBlob = {
    data: encodingData,
    encodingFormat: certformat,
  };

  return new Promise((resolve, reject) => {
    cert
      .createX509CRL(encodingBlob)
      .then((data) => {
        console.warn(
          "[promise] create X509 Crl success! format is: " + certformat
        );
        resolve(data);
      })
      .catch((err: Error) => {
        reject(err);
      });
  });
}

function createX509CertChainPromise(certType: string, index: number): Promise<cert.X509CertChain> {
  let certFormat: cert.EncodingFormat;
  let encodingData: Uint8Array;

  if (certType == "der") {
    certFormat = cert.EncodingFormat.FORMAT_DER;
    encodingData = getDerCertChainEncodingData(index);
  } else if (certType == "pem") {
    certFormat = cert.EncodingFormat.FORMAT_PEM;
    encodingData = getPemCertChainEncodingData(index);
  } else {
    certFormat = cert.EncodingFormat.FORMAT_PKCS7;
    encodingData = getPkcs7CertChainEncodingData(index);
  }

  let encodingBlob: cert.EncodingBlob = {
    data: encodingData,
    encodingFormat: certFormat,
  };

  return new Promise((resolve, reject) => {
    cert
      .createX509CertChain(encodingBlob)
      .then((data) => {
        resolve(data);
      })
      .catch((err: Error) => {
        console.error(
          "[promise]createX509CertChainPromise failed! err code: " + err
        );
        reject(err);
      });
  });
}

function createX509CertChainCallback(certType: string, index: number): Promise<cert.X509CertChain> {
  let certFormat: cert.EncodingFormat;
  let encodingData: Uint8Array;

  if (certType == "der") {
    certFormat = cert.EncodingFormat.FORMAT_DER;
    encodingData = getDerCertChainEncodingData(index);
  } else if (certType == "pem") {
    certFormat = cert.EncodingFormat.FORMAT_PEM;
    encodingData = getPemCertChainEncodingData(index);
  } else {
    certFormat = cert.EncodingFormat.FORMAT_PKCS7;
    encodingData = getPkcs7CertChainEncodingData(index);
  }

  let encodingBlob: cert.EncodingBlob = {
    data: encodingData,
    encodingFormat: certFormat,
  };

  return new Promise((resolve, reject) => {
    cert.createX509CertChain(encodingBlob, (err, data) => {
      if (data == null) {
        console.error(
          "[callback]createX509CertChainCallback failed! err code: " + err.code
        );
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

function createCustomizedX509CertChainCallback(encodingBlob: cert.EncodingBlob): Promise<cert.X509CertChain> {
  return new Promise((resolve, reject) => {
    cert.createX509CertChain(encodingBlob, (err, data) => {
      if (data == null) {
        console.error(
          "[callback]createCustomizedX509CertChainCallback failed! err code: " + err.code
        );
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

function certChainValidateCallback(certChain: cert.X509CertChain, param: cert.CertChainValidationParameters): Promise<cert.CertChainValidationResult> {
  return new Promise((resolve, reject) => {
    certChain.validate(param, (err, data) => {
      if (data == null) {
        console.error(
          "[callback]certChainValidateCallback failed! err code: " + err.code
        );
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

function getDerCertChainEncodingData(index: number): Uint8Array {
  switch (index) {
    case 1:
      return new Uint8Array(certExtensionInvalid01);
    default:
      return new Uint8Array(CERT_CHAIN_DER_DATA0);
  }
}

function getPemCertChainEncodingData(index: number): Uint8Array {
  switch (index) {
    case 1:
      return stringTouInt8Array(CERT_CHAIN_PEM_CERT1);
    case 2:
      return stringTouInt8Array(CERT_CHAIN_PEM_DATA1);
    case 3:
      return stringTouInt8Array(CERT_CHAIN_PEM_DATA2);
    case 4:
      return stringTouInt8Array(CERT_CHAIN_PEM_DATA3);
    case 5:
      return stringTouInt8Array("aabb");
    default:
      return stringTouInt8Array(CERT_CHAIN_PEM_DATA0);
  }
}

function getPkcs7CertChainEncodingData(index: number): Uint8Array {
  switch (index) {
    case 1:
      return stringTouInt8Array("aabb");
    default:
      return convertToUint8Array(CERT_CHAIN_PKCS7_DATA0_HEX);
  }
}

export {
  createCustomizedX509CertPromise,
  createX509CertChainPromise,
  createX509CrlPromise,
  createX509CertChainCallback,
  createCustomizedX509CertChainCallback,
  certChainValidateCallback
};