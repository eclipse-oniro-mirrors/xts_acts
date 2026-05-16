/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import SecurityHuksAccessControl from './SecurityHuksAccessControl.test'
import SecurityHuksAgreeDh from './SecurityHuksAgreeDh.test'
import SecurityHuksAgreeEcc from './SecurityHuksAgreeEcc.test'
import SecurityHuksAgreeX25519 from './SecurityHuksAgreeX25519.test'
import SecurityHuksCipherAes from './SecurityHuksCipherAes.test'
import SecurityHuksCipherRsa from './SecurityHuksCipherRsa.test'
import SecurityHuksCipherSm2 from './SecurityHuksCipherSm2.test'
import SecurityHuksCipherSm4 from './SecurityHuksCipherSm4.test'
import SecurityHuksDeriveHkdf from './SecurityHuksDeriveHkdf.test'
import SecurityHuksDerivePbkdf2 from './SecurityHuksDerivePbkdf2.test'
import SecurityHuksExport from './SecurityHuksExport.test'
import SecurityHuksFaceFinger from './SecurityHuksFaceFinger.test'
import SecurityHuksImport from './SecurityHuksImport.test'
import SecurityHuksMacHmac from './SecurityHuksMacHmac.test'
import SecurityHuksQueryKey from './SecurityHuksQueryKey.test'
import SecurityHuksSignExtendRsa from './SecurityHuksSignExtendRsa.test'
import SecurityHuksSignVerifyDsa from './SecurityHuksSignVerifyDsa.test'
import SecurityHuksSignVerifyEcc from './SecurityHuksSignVerifyEcc.test'
import SecurityHuksSignVerifyEd25519 from './SecurityHuksSignVerifyEd25519.test'
import SecurityHuksSignVerifyRsa from './SecurityHuksSignVerifyRsa.test'
import SecurityHuksSignVerifySm2 from './SecurityHuksSignVerifySm2.test'

export default function testsuite() {
  SecurityHuksAccessControl()
  SecurityHuksAgreeDh()
  SecurityHuksAgreeEcc()
  SecurityHuksAgreeX25519()
  SecurityHuksCipherAes()
  SecurityHuksCipherRsa()
  SecurityHuksCipherSm2()
  SecurityHuksCipherSm4()
  SecurityHuksDeriveHkdf()
  SecurityHuksDerivePbkdf2()
  SecurityHuksExport()
  SecurityHuksFaceFinger()
  SecurityHuksImport()
  SecurityHuksMacHmac()
  SecurityHuksQueryKey()
  SecurityHuksSignExtendRsa()
  SecurityHuksSignVerifyDsa()
  SecurityHuksSignVerifyEcc()
  SecurityHuksSignVerifyEd25519()
  SecurityHuksSignVerifyRsa()
  SecurityHuksSignVerifySm2()
}
