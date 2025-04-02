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
import { stringTouInt8Array } from '../common/commonFunction';
import {
  CRL_DATA_DER_01,
  CRL_DATA_DER_02,
  CRL_DATA_PEM_01,
  CRL_DATA_PEM_02,
  DER
} from '../common/commonParam';
import * as certFunc from "./certFunc";
import * as collectionFunc from "./collectionFunc";

/**
 * Create Customized X509 CRL.
 *
 * @param certType   pem/der
 * @param index      0->
 * @returns Promise<cert.X509CRL>
 */
function createCustomizedX509CRLPromise(certType: string, index: number): Promise<cert.X509CRL> {
  let certFormat: cert.EncodingFormat;
  let encodingData: Uint8Array;

  if (certType === DER) {
    certFormat = cert.EncodingFormat.FORMAT_DER;
    encodingData = getDerCRLEncodingData(index);
  } else {
    certFormat = cert.EncodingFormat.FORMAT_PEM;
    encodingData = getPemCRLEncodingData(index);
  }

  let encodingBlob: cert.EncodingBlob = {
    data: encodingData,
    encodingFormat: certFormat,
  };

  return new Promise((resolve, reject) => {
    cert
      .createX509CRL(encodingBlob)
      .then((data) => {
        console.warn(
          "[promise] createX509CRL success! format is: " + certFormat
        );
        resolve(data);
      })
      .catch((err: Error) => {
        reject(err);
      });
  });
}

async function checkCRLMatchPEMX509Cert(certType: string, index: number, certContent: string): Promise<boolean> {
  const x509Cert = await certFunc.createPEMCustomizedX509CertPromise(certContent);
  const param: cert.X509CRLMatchParameters = {
    x509Cert: x509Cert
  };
  const x509CRL = await createCustomizedX509CRLPromise(certType, index);
  return x509CRL.match(param);
}

/**
 * call selectCRLs, in callback way
 * @param collection collection, which contains the crl
 * @param param query param
 * @returns crl, which match the param
 */
async function selectCRLsCallback(collection: cert.CertCRLCollection, param: cert.X509CRLMatchParameters): Promise<Array<cert.X509CRL>> {
  return new Promise((resolve, reject) => {
    collection.selectCRLs(param, (err, crls) => {
      if (err) {
        console.error(
          "[callback] selectCRLs failed! error code is: " + err.code
        );
        reject(err);
      } else {
        console.info(
          "[callback] selectCRLs success!"
        );
        resolve(crls);
      }
    });
  })
}

async function checkSelectCRLs(certType: string, indexArr: number[], param: cert.X509CRLMatchParameters, isPromise: boolean): Promise<Array<cert.X509CRL>> {
  let crls: Array<cert.X509CRL> = [];
  const collection: cert.CertCRLCollection = await collectionFunc.createCollection([], indexArr, certType);
  if (isPromise) {
    crls = await collection.selectCRLs(param);
  }
  else {
    crls = await selectCRLsCallback(collection, param);
  }
  return crls;
}

async function checkSelectCRLsX509Cert(certType: string, indexArr: number[], certContent: string, isPromise: boolean): Promise<Array<cert.X509CRL>> {
  const x509Cert = await certFunc.createPEMCustomizedX509CertPromise(certContent);
  const param: cert.X509CRLMatchParameters = {
    x509Cert: x509Cert
  };
  return await checkSelectCRLs(certType, indexArr, param, isPromise);
}


function getDerCRLEncodingData(index: number): Uint8Array {
  switch (index) {
    case 1:
      return new Uint8Array(CRL_DATA_DER_01);
    case 2:
      return new Uint8Array(CRL_DATA_DER_02);
    default:
      return new Uint8Array(CRL_DATA_DER_01);
  }
}

function getPemCRLEncodingData(index: number): Uint8Array {
  switch (index) {
    case 1:
      return stringTouInt8Array(CRL_DATA_PEM_01);
    case 2:
      return stringTouInt8Array(CRL_DATA_PEM_02);
    default:
      return stringTouInt8Array(CRL_DATA_PEM_02);
  }
}

export {
  createCustomizedX509CRLPromise,
  checkCRLMatchPEMX509Cert,
  checkSelectCRLs,
  selectCRLsCallback,
  checkSelectCRLsX509Cert,
};