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

import SecurityRandomSyncJsunit from './SecurityRandomSync.test';
import SecuritySignatureVerificationTwoJsunit from './SecuritySignatureVerificationTwo.test';
import SecuritySignatureVerificationJsunit from './SecuritySignatureVerification.test';
import SecurityKeyAgreementJsunit from './SecurityKeyAgreement.test';
import AsyKeyGeneratorBySpecJsunit from './AsyKeyGeneratorBySpec.test';
import AsyKeyGeneratorBySpecTwoJsunit from './AsyKeyGeneratorBySpecTwo.test';
import AsyGetKeySpecBySpecJsunit from './AsyGetKeySpecBySpec.test';
import SecurityCipherJsunit from './SecurityCipher.test';
import SecuritySignatureVerificationSM2Jsunit from './SecuritySignatureVerificationSM2.test';
import SecurityCipherSM2SM4Jsunit from './SecurityCipherSM2SM4.test';
import DigestAlgorithmSm3Jsunit from './DigestAlgorithmSm3.test';

export default function testsuite() {
    SecurityCipherJsunit();
    SecurityCipherSM2SM4Jsunit();
    SecuritySignatureVerificationSM2Jsunit();
    SecuritySignatureVerificationJsunit();
    SecuritySignatureVerificationTwoJsunit();
    DigestAlgorithmSm3Jsunit();
    SecurityRandomSyncJsunit();
    SecurityKeyAgreementJsunit();
    AsyGetKeySpecBySpecJsunit();
    AsyKeyGeneratorBySpecJsunit();
    AsyKeyGeneratorBySpecTwoJsunit();
}
