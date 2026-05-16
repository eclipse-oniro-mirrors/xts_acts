/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import SecurityHuksAccessControlJsunit from './SecurityHuksAccessControlJsunit.test.js'
import SecurityHuksAgreeDHPromiseJsunit from './SecurityHuksAgreeDHPromiseJsunit.test.js'
import SecurityHuksAgreeECDHCallbackJsunit from './SecurityHuksAgreeECDHCallbackJsunit.test.js'
import SecurityHuksAgreeECDHPromiseJsunit from './SecurityHuksAgreeECDHPromiseJsunit.test.js'
import SecurityHuksAgreeX25519CallbackJsunit from './SecurityHuksAgreeX25519CallbackJsunit.test.js'
import SecurityHuksAgreeX25519PromiseJsunit from './SecurityHuksAgreeX25519PromiseJsunit.test.js'
import SecurityHuksCipherAESCallbackJsunit from './SecurityHuksCipherAESCallbackJsunit.test.js'
import SecurityHuksCipherAESPromiseJsunit from './SecurityHuksCipherAESPromiseJsunit.test.js'
import SecurityHuksCipherAESPromiseMultiSessionJsunit from './SecurityHuksCipherAESPromiseMultiSessionJsunit.test.js'
import SecurityHuksCipherExportSupportJsunit from './SecurityHuksExportSupportJsunit.test.js'
import SecurityHuksCipherRSACallbackJsunit from './SecurityHuksCipherRSACallbackJsunit.test.js'
import SecurityHuksCipherRSAPromiseJsunit from './SecurityHuksCipherRSAPromiseJsunit.test.js'
import SecurityHuksCipherSM2CallbackJsunit from './SecurityHuksCipherSM2CallbackJsunit.test.js'
import SecurityHuksCipherSM2PromiseJsunit from './SecurityHuksCipherSM2PromiseJsunit.test.js'
import SecurityHuksCipherSM4CallbackJsunit from './SecurityHuksCipherSM4CallbackJsunit.test.js'
import SecurityHuksCipherSM4PromiseJsunit from './SecurityHuksCipherSM4PromiseJsunit.test.js'
import SecurityHuksDeriveHKDFCallbackJsunit from './SecurityHuksDeriveHKDFCallbackJsunit.test.js'
import SecurityHuksDeriveHKDFPromiseJsunit from './SecurityHuksDeriveHKDFPromiseJsunit.test.js'
import SecurityHuksDerivePBKDF2CallbackJsunit from './SecurityHuksDerivePBKDF2CallbackJsunit.test.js'
import SecurityHuksDerivePBKDF2PromiseJsunit from './SecurityHuksDerivePBKDF2PromiseJsunit.test.js'
import SecurityHuksHmacCallbackJsunit from './SecurityHuksHmacCallbackJsunit.test.js'
import SecurityHuksHmacPromiseJsunit from './SecurityHuksHmacPromiseJsunit.test.js'
import SecurityHuksImportJsunit from './SecurityHuksImportJsunit.test.js'
import SecurityHuksQueryKeyJsunit from './SecurityHuksQueryKeyJsunit.test.js'
import SecurityHuksSignVerifyDSACallbackJsunit from './SecurityHuksSignVerifyDSACallbackJsunit.test.js'
import SecurityHuksSignVerifyDSAPromiseJsunit from './SecurityHuksSignVerifyDSAPromiseJsunit.test.js'
import SecurityHuksSignVerifyECCCallbackJsunit from './SecurityHuksSignVerifyECCCallbackJsunit.test.js'
import SecurityHuksSignVerifyECCPromiseJsunit from './SecurityHuksSignVerifyECCPromiseJsunit.test.js'
import SecurityHuksSignVerifyED25519CallbackJsunit from './SecurityHuksSignVerifyED25519CallbackJsunit.test.js'
import SecurityHuksSignVerifyED25519PromiseJsunit from './SecurityHuksSignVerifyED25519PromiseJsunit.test.js'
import SecurityHuksSignVerifyRSACallbackJsunit from './SecurityHuksSignVerifyRSACallbackJsunit.test.js'
import SecurityHuksSignVerifyRSAPromiseJsunit from './SecurityHuksSignVerifyRSAPromiseJsunit.test.js'
import SecurityHuksSignVerifySM2CallbackJsunit from './SecurityHuksSignVerifySM2CallbackJsunit.test.js'
import SecurityHuksSignVerifySM2PromiseJsunit from './SecurityHuksSignVerifySM2PromiseJsunit.test.js'

export default function testsuite() {
    SecurityHuksAccessControlJsunit()
    SecurityHuksAgreeDHPromiseJsunit()
    SecurityHuksAgreeECDHCallbackJsunit()
    SecurityHuksAgreeECDHPromiseJsunit()
    SecurityHuksAgreeX25519CallbackJsunit()
    SecurityHuksAgreeX25519PromiseJsunit()
    SecurityHuksCipherAESCallbackJsunit()
    SecurityHuksCipherAESPromiseJsunit()
    SecurityHuksCipherAESPromiseMultiSessionJsunit()
    SecurityHuksCipherExportSupportJsunit()
    SecurityHuksCipherRSACallbackJsunit()
    SecurityHuksCipherRSAPromiseJsunit()
    SecurityHuksCipherSM2CallbackJsunit()
    SecurityHuksCipherSM2PromiseJsunit()
    SecurityHuksCipherSM4CallbackJsunit()
    SecurityHuksCipherSM4PromiseJsunit()
    SecurityHuksDeriveHKDFCallbackJsunit()
    SecurityHuksDeriveHKDFPromiseJsunit()
    SecurityHuksDerivePBKDF2CallbackJsunit()
    SecurityHuksDerivePBKDF2PromiseJsunit()
    SecurityHuksHmacCallbackJsunit()
    SecurityHuksHmacPromiseJsunit()
    SecurityHuksImportJsunit()
    SecurityHuksQueryKeyJsunit()
    SecurityHuksSignVerifyDSACallbackJsunit()
    SecurityHuksSignVerifyDSAPromiseJsunit()
    SecurityHuksSignVerifyECCCallbackJsunit()
    SecurityHuksSignVerifyECCPromiseJsunit()
    SecurityHuksSignVerifyED25519CallbackJsunit()
    SecurityHuksSignVerifyED25519PromiseJsunit()
    SecurityHuksSignVerifyRSACallbackJsunit()
    SecurityHuksSignVerifyRSAPromiseJsunit()
    SecurityHuksSignVerifySM2CallbackJsunit()
    SecurityHuksSignVerifySM2PromiseJsunit()
}
