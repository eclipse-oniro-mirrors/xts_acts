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
import SecurityCryptoFwCipherSM2TestUnit from './SecurityCryptoFwCipherSM2.test'
import SecurityCryptoFwGenECCCommonSpecTestUnit from './SecurityCryptoFwGenECCCommonSpec.test'
import SecurityCryptoFwKeyGenerateECCTestUnit from './SecurityCryptoFwKeyGenerateECC.test'
import SecurityCryptoFwKeyGenerateDHTestUnit from './SecurityCryptoFwKeyGenerateDH.test'
import SecurityCryptoFwAgreementDHTestUnit from './SecurityCryptoFwAgreementDH.test'
import SecurityCryptoFwAgreementECCTestUnit from './SecurityCryptoFwAgreementECC.test'
import SecurityCryptoFwAgreementECCBrainPoolTestUnit from './SecurityCryptoFwAgreementECCBrainPool.test'
import SecurityCryptoFwKeyGenerateECCBrainPoolTestUnit from './SecurityCryptoFwKeyGenerateECCBrainPool.test'
import SecurityCryptoFwKeyGenerateSM2TestUnit from './SecurityCryptoFwKeyGenerateSM2.test'
import SecurityCryptoFwSignVerifyECCTestUnit from './SecurityCryptoFwSignVerifyECC.test'
import SecurityCryptoFwSignVerifyECCBrainPoolTestUnit from './SecurityCryptoFwSignVerifyECCBrainPool.test'
import SecurityCryptoFwSignVerifySM2TestUnit from './SecurityCryptoFwSignVerifySM2.test'
export default function testsuite() {
  SecurityCryptoFwCipherSM2TestUnit();
  SecurityCryptoFwKeyGenerateECCTestUnit();
  SecurityCryptoFwKeyGenerateDHTestUnit();
  SecurityCryptoFwAgreementDHTestUnit();
  SecurityCryptoFwAgreementECCTestUnit();
  SecurityCryptoFwAgreementECCBrainPoolTestUnit();
  SecurityCryptoFwKeyGenerateECCBrainPoolTestUnit();
  SecurityCryptoFwKeyGenerateSM2TestUnit();
  SecurityCryptoFwSignVerifyECCTestUnit();
  SecurityCryptoFwSignVerifyECCBrainPoolTestUnit();
  SecurityCryptoFwSignVerifySM2TestUnit();
  SecurityCryptoFwGenECCCommonSpecTestUnit();
}