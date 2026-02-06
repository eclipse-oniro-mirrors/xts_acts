/*
 * Copyright (C) 2023-2026 Huawei Device Co., Ltd.
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
import * as certFunc from "./certFunc";

function createCertCRLCollectionWithOneParam(certs: cert.X509Cert[]): cert.CertCRLCollection {
  try {
    return cert.createCertCRLCollection(certs);
  } catch (err) {
    console.error("createCertCRLCollection err", err);
    throw err as Error;
  };
}

function createCertCRLCollectionWithTwoParam(certs: cert.X509Cert[], crls: cert.X509CRL[]): cert.CertCRLCollection {
  try {
    return cert.createCertCRLCollection(certs, crls);
  } catch (err) {
    console.error("createCertCRLCollection err", err);
    throw err as Error;
  };
}

async function selectCertsCallback(collect: cert.CertCRLCollection, param: cert.X509CertMatchParameters): Promise<cert.X509Cert[]> {
  return new Promise<cert.X509Cert[]>((resolve, reject) => {
    collect.selectCerts(param, (err: BusinessError<void>|null, data: cert.X509Cert[]|undefined) => {
      if (err || data === undefined) { // success: error is null, failed: data is undefined
        console.error(
          "[callback] CertCRLCollection.selectCerts err: " + err?.code
        );
        reject(err as Error);
      } else {
        resolve(data as cert.X509Cert[]);
      }
    });
  });
}

export {
  createCertCRLCollectionWithOneParam,
  createCertCRLCollectionWithTwoParam,
  selectCertsCallback,
};