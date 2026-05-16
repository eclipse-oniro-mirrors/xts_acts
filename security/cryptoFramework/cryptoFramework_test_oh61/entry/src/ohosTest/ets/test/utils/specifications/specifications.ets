/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export let AsyEncryptAlgSpec: string[] = [
  "RSA2048|PKCS1_OAEP|SHA256|MGF1_SHA256",
  "SM2_256|SM3",
];

export let signAlgSpec: string[] = [
  "RSA512|PKCS1|SHA256",
  "SM2_256|SM3",
  "ECC256|SHA384",
  "DSA1024|SHA256",
  "Ed25519"
];

export let agreementAlgSpec: string[] = [
  "ECC521",
  "X25519",
  "DH_modp1536",
];
