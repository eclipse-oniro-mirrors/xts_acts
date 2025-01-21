/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
 
import SecurityCryptoFwSignRecoverRSARecoverTestUnit from './SecurityCryptoFwSignVerifyRSARecover.test'
import SecurityCryptoFwSymKeyGeneratorTestUnit from './SecurityCryptoFwSymKeyGenerator.test'
import SecurityCryptoFwSymEncryptAndDecryptTestUnit from './SecurityCryptoFwSymEncryptAndDecrypt.test'
import SecurityCryptoFwAsyKeyGeneratorTestUnit from './SecurityCryptoFwAsyKeyGenerator.test'
import SecurityCryptoFwHkdfTestUnit from './SecurityCryptoFwHkdf.test'
import SecurityCryptoFwMd5TestUnit from './SecurityCryptoFwMd5.test'
import SecurityCryptoFwECCRfc5208TestUnit from './SecurityCryptoFwRfc5915ToRfc5208.test'
import SecurityCryptoFwDigestSyncTestUnit from './SecurityCryptoFwDigestSync.test'
import SecurityCryptoFwPbkdf2TestUnit from './SecurityCryptoFwPbkdf2Sync.test'
import SecurityCryptoFwHmacSyncTestUnit from './SecurityCryptoHmacSync.test'
import SecurityCryptoFwAgreementSyncTestUnit from './SecurityCryptoFwNegotiateAlgSync.test'
import SecurityCryptoFwSignVerifySyncTestUnit from './SecurityCryptoFwSignVerify.test'
import SecurityCryptoFwPkcs1ToPkcs8TestUnit from './SecurityCryptoFwPkcs1ToPkcs8.test'
import SecurityCryptoFwVectorTestUnit from './SecurityCryptoFwVector.test'


export default function testsuite() {
  SecurityCryptoFwSignRecoverRSARecoverTestUnit();
  SecurityCryptoFwSymKeyGeneratorTestUnit();
  SecurityCryptoFwSymEncryptAndDecryptTestUnit();
  SecurityCryptoFwAsyKeyGeneratorTestUnit();
  SecurityCryptoFwHkdfTestUnit();
  SecurityCryptoFwECCRfc5208TestUnit();
  SecurityCryptoFwMd5TestUnit();
  SecurityCryptoFwDigestSyncTestUnit();
  SecurityCryptoFwHmacSyncTestUnit();
  SecurityCryptoFwPbkdf2TestUnit();
  SecurityCryptoFwAgreementSyncTestUnit();
  SecurityCryptoFwSignVerifySyncTestUnit();
  SecurityCryptoFwPkcs1ToPkcs8TestUnit();
  SecurityCryptoFwVectorTestUnit();
}