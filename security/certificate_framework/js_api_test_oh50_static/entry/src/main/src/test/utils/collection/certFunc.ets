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
import { BusinessError } from '@ohos.base';
import cert from "@ohos.security.cert";
import { convertToUint8Array, stringTouInt8Array } from '../common/commonFunction';
import {
  CA_CERT_DATA_PEM,
  CERT_DATA_PEM,
  CERT_DATA_PEM_MULTI_COUNTRY,
  CERT_DATA_PEN_ALL_KEY_USAGE_TRUE,
  CERT_DATA_PEN_EIGHT_KEY_USAGE_TRUE,
  CRL_CERT_DER_DATA_02,
  DER,
  selfSignedCaCertDer,
  selfSignedCaCertPem,
} from '../common/commonParam';
import * as crlFunc from "./crlFunc";

/**
 * Create Customized X509 Certificate.
 *
 * @param certType   pem/der
 * @param index      0->
 * @returns Promise<cert.X509Cert>
 */
function createCustomizedX509CertPromise(certType: string, index: number): Promise<cert.X509Cert> {
  let certformat: cert.EncodingFormat;
  let encodingData: Uint8Array;

  if (certType === DER) {
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

  return new Promise<cert.X509Cert>((resolve, reject) => {
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

/**
 * create X509Cert by content,which is in PEM format
 * @param certContent
 * @returns
 */
async function createPEMCustomizedX509CertPromise(certContent: string): Promise<cert.X509Cert> {
  const encodingData = stringTouInt8Array(certContent);

  let encodingBlob: cert.EncodingBlob = {
    data: encodingData,
    encodingFormat: cert.EncodingFormat.FORMAT_PEM,
  };
  return await cert.createX509Cert(encodingBlob);
}

async function checkCertMatchParam(certType: string, index: number, param: cert.X509CertMatchParameters): Promise<boolean> {
  const x509Cert = await createCustomizedX509CertPromise(certType, index);
  const result = x509Cert.match(param);
  return result;
}

async function checkSelectCerts(certType: string, indexArr: number[], param: cert.X509CertMatchParameters, isPromise: boolean): Promise<Array<cert.X509Cert>> {
  let certs: Array<cert.X509Cert> = new Array<cert.X509Cert>();
  let num: number[] = new Array<number>();
  const collection: cert.CertCRLCollection = await crlFunc.createCollection(indexArr, num, certType);
  if (isPromise) {
    certs = await collection.selectCerts(param);
  }
  else {
    certs = await selectCertsCallback(collection, param);
  }
  return certs;
}

async function selectCertsCallback(collection: cert.CertCRLCollection,
  param: cert.X509CertMatchParameters): Promise<cert.X509Cert[]> {
  return new Promise<cert.X509Cert[]>((resolve, reject) => {
    collection.selectCerts(param, (err: BusinessError<void>|null, certs: cert.X509Cert[]|undefined) => {
      if (err || certs === undefined) { // success: error is null, failed: data is undefined
        console.error(
          "[callback] selectCerts failed! error code is: " + err?.code
        );
        reject(err as Error);
      } else {
        console.info(
          "[callback] selectCerts success!"
        );
        resolve(certs as cert.X509Cert[]);
      }
    });
  })
}

function getDerCertEncodingData(index: number): Uint8Array {
  if (index == 1) {
      return new Uint8Array(CRL_CERT_DER_DATA_02[0]);
  } else if (index == 2) {
    return new Uint8Array(CRL_CERT_DER_DATA_02[1]);
  } else if (index == 3) {
    return new Uint8Array(CRL_CERT_DER_DATA_02[2]);
  } else {
    return convertToUint8Array(selfSignedCaCertDer);
  }
}

function getPemCertEncodingData(index: number): Uint8Array {
  if (index == 0) {
    return stringTouInt8Array(CERT_DATA_PEM[0]);
  } else if (index == 1) {
    return stringTouInt8Array(CERT_DATA_PEM[1]);
  } else if (index == 2) {
    return stringTouInt8Array(CERT_DATA_PEM[2]);
  } else if (index == 3) {
    return stringTouInt8Array(CERT_DATA_PEM[3]);
  } else if (index == 4) {
    return stringTouInt8Array(CERT_DATA_PEM[4]);
  } else if (index == 5) {
    return stringTouInt8Array(CA_CERT_DATA_PEM[0]);
  } else if (index == 6) {
    return stringTouInt8Array(CA_CERT_DATA_PEM[1]);
  } else if (index == 7) {
    return stringTouInt8Array(CERT_DATA_PEN_ALL_KEY_USAGE_TRUE);
  } else if (index == 8) {
    return stringTouInt8Array(CERT_DATA_PEN_EIGHT_KEY_USAGE_TRUE);
  } else if (index == 9) {
    return stringTouInt8Array(CERT_DATA_PEM_MULTI_COUNTRY);
  } else if (index == 10) {
    return stringTouInt8Array(CERT_DATA_PEM[5]);
  } else if (index == 11) {
    return stringTouInt8Array(CERT_DATA_PEM[6]);
  } else if (index == 12) {
    return stringTouInt8Array(CERT_DATA_PEM[7]);
  } else if (index == 13) {
    return stringTouInt8Array(CERT_DATA_PEM[8]);
  } else {
    return stringTouInt8Array(selfSignedCaCertPem);
  }
}

export {
  createCustomizedX509CertPromise,
  createPEMCustomizedX509CertPromise,
  checkCertMatchParam,
  checkSelectCerts,
  selectCertsCallback
};