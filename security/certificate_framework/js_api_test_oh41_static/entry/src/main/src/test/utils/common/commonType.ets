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
import cert from '@ohos.security.cert';

// export interface DataUint8Array {
//   data: Uint8Array;
// }

// export interface IAnyObj {
//   [key: string]: any;
// }

export interface X509CRLParameters {
  issuer: Uint8Array;
  inDurationTime: string;
  lastUpdate: string;
  nextUpdate: string;
  crlNumber: bigint;
  maxCRL: number;
  minCRL: number;
}

export interface X509CertParameters {
  notBeforeDate?: string;
  notAfterDate?: string;
  issuer?: Uint8Array;
  extendedKeyUsage?: string[];
  nameConstraints?: Uint8Array;
  certificatePolicies?: string[];
  privateKeyNotBeforeDate?: string;
  privateKeyNotAfterDate?: string;
  serialNumber?: bigint;
  subject?: Uint8Array;
  subjectKeyIdentifier?: Uint8Array;
  publicKey?: cert.DataBlob;
  publicKeyAlgID?: string;
  authorityKeyIdentifier?: Uint8Array;
}

export interface X509CertChainParameters {
  subject?: Uint8Array;
  publicKey?: Uint8Array;
  certSerialNumber?: bigint;
}