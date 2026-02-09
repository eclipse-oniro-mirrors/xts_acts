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
import buffer from '@ohos.buffer';
import { BusinessError } from '@ohos.base';
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
async function createCustomizedX509CertPromise(certType: string, index: number): Promise<cert.X509Cert> {
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

  let data: cert.X509Cert = await cert.createX509Cert(encodingBlob);

  return data;
}

function getDerCertEncodingData(index: number): Uint8Array {
  return convertToUint8Array(selfSignedCaCertDer);
}

function getPemCertEncodingData(index: number): Uint8Array {
  if (index == 0) {
    return stringTouInt8Array(CERT_CHAIN_PEM_CERTS[0]); // leaf
  } else if (index == 1) {
    return stringTouInt8Array(CERT_CHAIN_PEM_CERTS[1]); // fourth
  } else if (index == 2) {
    return stringTouInt8Array(CERT_CHAIN_PEM_CERTS[2]); // third
  } else if (index == 3) {
    return stringTouInt8Array(CERT_CHAIN_PEM_CERTS[3]); // third
  } else if (index == 4) {
    return stringTouInt8Array(CERT_CHAIN_PEM_CERTS[4]); // third
  } else if (index == 5) {
    return stringTouInt8Array(CERT_CHAIN_PEM_CERT1); // third
  } else {
    return stringTouInt8Array(selfSignedCaCertPem);
  }
}

async function createX509CrlPromise(index: number): Promise<cert.X509CRL> {
  let certformat: cert.EncodingFormat = cert.EncodingFormat.FORMAT_PEM;
  let encodingData: Uint8Array;

  if (index == 1) {
    encodingData = stringTouInt8Array(CERT_CHAIN_DATA_CRLS[1]);
  } else if (index == 2) {
    encodingData = stringTouInt8Array(CERT_CHAIN_DATA_CRLS[2]);
  } else {
    encodingData = stringTouInt8Array(CERT_CHAIN_DATA_CRLS[0]);
  }

  let encodingBlob: cert.EncodingBlob = {
    data: encodingData,
    encodingFormat: certformat,
  };

  let data: cert.X509CRL = await cert.createX509CRL(encodingBlob);

  return data;
}

async function createX509CertChainPromise(certType: string, index: number): Promise<cert.X509CertChain> {
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

  let data: cert.X509CertChain = await cert.createX509CertChain(encodingBlob)

  return data;
}

async function createX509CertChainCallback(certType: string, index: number): Promise<cert.X509CertChain> {
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

  return new Promise<cert.X509CertChain>((resolve, reject) => {
    cert.createX509CertChain(encodingBlob, (err: BusinessError<void>|null, data: cert.X509CertChain|undefined) => {
      if (data === undefined) {
        console.error(
          "[callback]createX509CertChainCallback failed! err code: " + err?.code
        );
        reject(err as Error);
      } else {
        resolve(data as cert.X509CertChain);
      }
    });
  });
}

async function createCustomizedX509CertChainCallback(encodingBlob: cert.EncodingBlob): Promise<cert.X509CertChain> {
  return new Promise<cert.X509CertChain>((resolve, reject) => {
    cert.createX509CertChain(encodingBlob, (err: BusinessError<void>|null, data: cert.X509CertChain|undefined) => {
      if (data === undefined) {
        console.error(
          "[callback]createCustomizedX509CertChainCallback failed! err code: " + err?.code
        );
        reject(err as Error);
      } else {
        resolve(data as cert.X509CertChain);
      }
    });
  });
}

async function certChainValidateCallback(certChain: cert.X509CertChain,
  param: cert.CertChainValidationParameters): Promise<cert.CertChainValidationResult> {
  return new Promise<cert.CertChainValidationResult>((resolve, reject) => {
    certChain.validate(param, (err: BusinessError<void>|null, data: cert.CertChainValidationResult|undefined) => {
      if (data === undefined) {
        console.error(
          "[callback]certChainValidateCallback failed! err code: " + err?.code
        );
        reject(err as Error);
      } else {
        resolve(data as cert.CertChainValidationResult);
      }
    });
  });
}

function getDerCertChainEncodingData(index: number): Uint8Array {
  if (index == 1) {
    return new Uint8Array(certExtensionInvalid01);
  } else {
    return new Uint8Array(CERT_CHAIN_DER_DATA0);
  }
}

function getPemCertChainEncodingData(index: number): Uint8Array {
  if (index == 1) {
    return stringTouInt8Array(CERT_CHAIN_PEM_CERT1);
  } else if (index == 2) {
    return stringTouInt8Array(CERT_CHAIN_PEM_DATA1);
  } else if (index == 3) {
    return stringTouInt8Array(CERT_CHAIN_PEM_DATA2);
  } else if (index == 4) {
    return stringTouInt8Array(CERT_CHAIN_PEM_DATA3);
  } else if (index == 5) {
    return stringTouInt8Array("aabb");
  } else {
    return stringTouInt8Array(CERT_CHAIN_PEM_DATA0);
  }
}

function getPkcs7CertChainEncodingData(index: number): Uint8Array {
  if (index == 1) {
    return stringTouInt8Array("aabb");
  } else {
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