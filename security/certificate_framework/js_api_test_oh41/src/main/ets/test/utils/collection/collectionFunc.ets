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
import * as certFunc from "./certFunc";
import * as crlFunc from "./crlFunc";

function createCertCRLCollectionWithOneParam(certs: Array<cert.X509Cert>): cert.CertCRLCollection {
  try {
    return cert.createCertCRLCollection(certs);
  } catch (err) {
    console.error("createCertCRLCollection err", err);
    throw new Error(err);
  }
  ;
}

function createCertCRLCollectionWithTwoParam(certs: Array<cert.X509Cert>, crls: Array<cert.X509CRL>): cert.CertCRLCollection {
  try {
    return cert.createCertCRLCollection(certs, crls);
  } catch (err) {
    console.error("createCertCRLCollection err", err);
    throw new Error(err);
  }
  ;
}

async function createCollection(certIndexArr: number[], crlIndexArr: number[], certType: string): Promise<cert.CertCRLCollection> {
  let collection: cert.CertCRLCollection = {} as cert.CertCRLCollection;
  try {
    let certArr: cert.X509Cert[] = [];
    if (certIndexArr) {
      for (let certIndex of certIndexArr) {
        const x509Cert = await certFunc.createCustomizedX509CertPromise(certType, certIndex);
        certArr.push(x509Cert);
      }
    }

    let crlArr: cert.X509CRL[] = [];
    if (crlIndexArr) {
      for (let crlIndex of crlIndexArr) {
        const x509CRL = await crlFunc.createCustomizedX509CRLPromise(certType, crlIndex);
        crlArr.push(x509CRL);
      }
    }
    collection = cert.createCertCRLCollection(certArr, crlArr);
  }
  catch (err) {
    console.error("createCertCRLCollection error");
    throw err as Error;
  }
  return collection;
}

async function selectCertsCallback(collect: cert.CertCRLCollection, param: cert.X509CertMatchParameters): Promise<Array<cert.X509Cert>> {
  return new Promise<Array<cert.X509Cert>>((resolve, reject) => {
    collect.selectCerts(param, (err, data) => {
      if (data == null) {
        console.error(
          "[callback] CertCRLCollection.selectCerts err: " + err.code
        );
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

export {
  createCertCRLCollectionWithOneParam,
  createCertCRLCollectionWithTwoParam,
  selectCertsCallback,
  createCollection
};