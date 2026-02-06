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
import SecurityCryptoFwDataBlobToPemTestUnit from './SecurityCryptoFwExternalPemDataBlobToKeyPair.test'
import SecurityCryptoFwSECP256K1TestUnit from './SecurityCryptoFwSecp256k1.test'
import SecurityCryptoFwRSAEncodeDecodeWithSecretTestUnit from './SecurityCryptoFwRSAencodeDecodeWithSecret.test'
import SecurityCryptoFwCmacTestUnit from './SecurityCryptoFwCmac.test'
import SecurityCryptoFwScryptKdfTestUnit from './SecurityCryptoFwScryptKdf.test'
import SecurityCryptoFwErrCodeTestUnit from './SecurityCryptoErrCode.test'
import SecurityCryptoFwSM2TestUnit from './SecurityCryptoFwSM2Signature.test'
import SecurityCryptoFwDESTestUnit from './SecurityCryptoFwDes.test'
import SecurityCryptoFwRandomTestUnit from './SecurityCryptoFwRandom.test'
import SecurityCryptoFwSha3TestUnit from './SecurityCryptoFwSHA3.test'
import SecurityCryptoFwX963TestUnit from './SecurityCryptoFwX963.test'
import SecurityCryptoFwAesWrapTestUnit from './SecurityCryptoFwAesWrap.test'
import SecurityCryptoFwChaCha20Poly1305TestUnit from './SecurityCryptoFwChaCha20Poly1305.test'

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
  SecurityCryptoFwDataBlobToPemTestUnit();
  SecurityCryptoFwSECP256K1TestUnit();
  SecurityCryptoFwRSAEncodeDecodeWithSecretTestUnit();
  SecurityCryptoFwCmacTestUnit();
  SecurityCryptoFwScryptKdfTestUnit();
  SecurityCryptoFwErrCodeTestUnit();
  SecurityCryptoFwSM2TestUnit();
  SecurityCryptoFwDESTestUnit();
  SecurityCryptoFwRandomTestUnit();
  SecurityCryptoFwSha3TestUnit();
  SecurityCryptoFwX963TestUnit();
  SecurityCryptoFwAesWrapTestUnit();
  SecurityCryptoFwChaCha20Poly1305TestUnit();
}