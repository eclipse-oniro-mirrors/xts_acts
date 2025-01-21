/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import SecurityCryptoFwGenECCCommonSpecTestUnit from './SecurityCryptoFwGenECCCommonSpec.test'
import SecurityCryptoFwCipherSM2TestUnit from './SecurityCryptoFwCipherSM2.test'
import SecurityCryptoFwSignVerifySM2TestUnit from './SecurityCryptoFwSignVerifySM2.test'
import SecurityCryptoFwSignVerifyECCBrainPoolTestUnit from './SecurityCryptoFwSignVerifyECCBrainPool.test'
import SecurityCryptoFwAgreementECCBrainPoolTestUnit from './SecurityCryptoFwAgreementECCBrainPool.test'
import SecurityCryptoFwKeyGenerateSM2TestUnit from './SecurityCryptoFwKeyGenerateSM2.test'
import SecurityCryptoFwKeyGenerateECCBrainPoolTestUnit from './SecurityCryptoFwKeyGenerateECCBrainPool.test'
import SecurityCryptoFwAgreementDHTestUnit from './SecurityCryptoFwAgreementDH.test'
import SecurityCryptoFwKeyGenerateDHTestUnit from './SecurityCryptoFwKeyGenerateDH.test'
import SecurityCryptoFwKeyGenerateECCTestUnit from './SecurityCryptoFwKeyGenerateECC.test'
import SecurityCryptoFwSignVerifyECCTestUnit from './SecurityCryptoFwSignVerifyECC.test'
import SecurityCryptoFwAgreementECCTestUnit from './SecurityCryptoFwAgreementECC.test'

export default function testsuite() {
  SecurityCryptoFwCipherSM2TestUnit();
  SecurityCryptoFwGenECCCommonSpecTestUnit();
  SecurityCryptoFwSignVerifySM2TestUnit();
  SecurityCryptoFwSignVerifyECCBrainPoolTestUnit();
  SecurityCryptoFwAgreementECCBrainPoolTestUnit();
  SecurityCryptoFwKeyGenerateSM2TestUnit();
  SecurityCryptoFwKeyGenerateECCBrainPoolTestUnit();
  SecurityCryptoFwAgreementDHTestUnit();
  SecurityCryptoFwKeyGenerateDHTestUnit();
  SecurityCryptoFwKeyGenerateECCTestUnit();
  SecurityCryptoFwSignVerifyECCTestUnit();
  SecurityCryptoFwAgreementECCTestUnit();
}