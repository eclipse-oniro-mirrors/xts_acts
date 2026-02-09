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
import SecurityHuksAccessControlAsUserTest from './SecurityHuksAccessControlAsUser.test';
import SecurityHuksCipherSM4Test from './SecurityHuksCipherSM4.test';
import SecurityHuksKeyGenerateListAliasesTest from './SecurityHuksKeyGenerateListAliases.test';
import SecurityHuksCmacTest from './SecurityHuksCmac.test';
import SecurityHuksSignVerifyRSATest from './SecurityHuksSignVerifyRSA.test';
import SecurityHuksCipherRSATest from './SecurityHuksCipherRSA.test';
import SecurityHuksCipherAesTest from './SecurityHuksCipherAES.test';
import SecurityHuksCipherDESTest from './SecurityHuksCipherDES.test';
import SecurityHuksCipher3DESTest from './SecurityHuksCipher3DES.test';
import SecurityHuksImportTest from './SecurityHuksImport.test';
import SecurityHuksKeyAttestationTest from './SecurityHuksKeyAttestation.test';
import SecurityHuksInterfaceErrorCodeTest from './SecurityHuksInterfaceErrorCode.test';
import SecurityHuksWrapKeyTest from './SecurityHuksWrapKey.test';
import SecurityHuksAccessControlUserAuthTest from './SecurityHuksAccessControlUserAuth.test';
import SecurityHuksApiTest from './SecurityHuksApi.test';
import SecurityHuksKeyGenerateOverrideTest from './SecurityHuksKeyGenerateOverride.test';
import SecurityHuksSignVerifySM2Test from './SecurityHuksSignVerifySM2.test';
import SecurityHuksGroupAPI23Test from './SecurityHuksGroupAPI23.test';

export default function testsuite() {
  SecurityHuksAccessControlAsUserTest();
  SecurityHuksCipherSM4Test();
  SecurityHuksKeyGenerateListAliasesTest();
  SecurityHuksCmacTest();
  SecurityHuksSignVerifyRSATest();
  SecurityHuksCipherRSATest();
  SecurityHuksCipherAesTest();
  SecurityHuksCipherDESTest();
  SecurityHuksCipher3DESTest();
  SecurityHuksImportTest();
  SecurityHuksKeyAttestationTest();
  SecurityHuksInterfaceErrorCodeTest();
  SecurityHuksWrapKeyTest();
  SecurityHuksAccessControlUserAuthTest();
  SecurityHuksApiTest();
  SecurityHuksKeyGenerateOverrideTest();
  SecurityHuksSignVerifySM2Test();
  SecurityHuksGroupAPI23Test()
}