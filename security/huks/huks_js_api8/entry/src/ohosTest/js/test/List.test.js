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

import SecurityHuksAgreeECDHCallbackJsunit from './SecurityHuksAgreeECDHCallbackJsunit.test.js'
import SecurityHuksAgreeDHPromiseJsunit from './SecurityHuksAgreeDHPromiseJsunit.test.js'
import SecurityHuksAgreeECDHPromiseJsunit from './SecurityHuksAgreeECDHPromiseJsunit.test.js'
import SecurityHuksAgreeX25519PromiseJsunit from './SecurityHuksAgreeX25519PromiseJsunit.test.js'
import SecurityHuksCipherAESCallbackJsunit from './SecurityHuksCipherAESCallbackJsunit.test.js'
import SecurityHuksCipherExportSupportJsunit from './SecurityHuksExportSupportJsunit.test.js'
import SecurityHuksCipherRSACallbackJsunit from './SecurityHuksCipherRSACallbackJsunit.test.js'
import SecurityHuksCipherSM2CallbackJsunit from './SecurityHuksCipherSM2CallbackJsunit.test.js'
import SecurityHuksCipherSM4CallbackJsunit from './SecurityHuksCipherSM4CallbackJsunit.test.js'
import SecurityHuksCipherAESPromiseJsunit from './SecurityHuksCipherAESPromiseJsunit.test.js'
import SecurityHuksCipherRSAPromiseJsunit from './SecurityHuksCipherRSAPromiseJsunit.test.js'
import SecurityHuksCipherSM4PromiseJsunit from './SecurityHuksCipherSM4PromiseJsunit.test.js'
import SecurityHuksCipherSM2PromiseJsunit from './SecurityHuksCipherSM2PromiseJsunit.test.js'
import SecurityHuksDeriveHKDFCallbackJsunit from './SecurityHuksDeriveHKDFCallbackJsunit.test.js'
import SecurityHuksDerivePBKDF2CallbackJsunit from './SecurityHuksDerivePBKDF2CallbackJsunit.test.js'
import SecurityHuksDeriveHKDFPromiseJsunit from './SecurityHuksDeriveHKDFPromiseJsunit.test.js'
import SecurityHuksDerivePBKDF2PromiseJsunit from './SecurityHuksDerivePBKDF2PromiseJsunit.test.js'
import SecurityHuksAccessControlJsunit from "./SecurityHuksAccessControlJsunit.test.js";
import SecurityHuksHmacCallbackJsunit from "./SecurityHuksHmacCallbackJsunit.test.js";
import SecurityHuksImportJsunit from "./SecurityHuksImportJsunit.test.js";
import SecurityHuksHmacPromiseJsunit from './SecurityHuksHmacPromiseJsunit.test.js'
import SecurityHuksSignVerifyDSACallbackJsunit from './SecurityHuksSignVerifyDSACallbackJsunit.test.js'
import SecurityHuksSignVerifyECCCallbackJsunit from './SecurityHuksSignVerifyECCCallbackJsunit.test.js'
import SecurityHuksSignVerifyED25519CallbackJsunit from './SecurityHuksSignVerifyED25519CallbackJsunit.test.js'
import SecurityHuksSignVerifyRSACallbackJsunit from './SecurityHuksSignVerifyRSACallbackJsunit.test.js'
import SecurityHuksSignVerifySM2CallbackJsunit from './SecurityHuksSignVerifySM2CallbackJsunit.test.js'
import SecurityHuksSignVerifyDSAPromiseJsunit from './SecurityHuksSignVerifyDSAPromiseJsunit.test.js'
import SecurityHuksSignVerifyECCPromiseJsunit from './SecurityHuksSignVerifyECCPromiseJsunit.test.js'
import SecurityHuksSignVerifyED25519PromiseJsunit from './SecurityHuksSignVerifyED25519PromiseJsunit.test.js'
import SecurityHuksSignVerifyRSAPromiseJsunit from './SecurityHuksSignVerifyRSAPromiseJsunit.test.js'
import SecurityHuksSignVerifySM2PromiseJsunit from './SecurityHuksSignVerifySM2PromiseJsunit.test.js'

export default function testsuite() {
    SecurityHuksAgreeECDHCallbackJsunit()
    SecurityHuksAgreeDHPromiseJsunit()
    SecurityHuksAgreeECDHPromiseJsunit()
    SecurityHuksAgreeX25519PromiseJsunit()
    SecurityHuksCipherAESCallbackJsunit()
    SecurityHuksCipherExportSupportJsunit()
    SecurityHuksCipherRSACallbackJsunit()
    SecurityHuksCipherSM2CallbackJsunit()
    SecurityHuksCipherSM4CallbackJsunit()
    SecurityHuksCipherAESPromiseJsunit()
    SecurityHuksCipherRSAPromiseJsunit()
    SecurityHuksCipherSM4PromiseJsunit()
    SecurityHuksCipherSM2PromiseJsunit()
    SecurityHuksDeriveHKDFCallbackJsunit()
    SecurityHuksDerivePBKDF2CallbackJsunit()
    SecurityHuksDeriveHKDFPromiseJsunit()
    SecurityHuksDerivePBKDF2PromiseJsunit()
    SecurityHuksAccessControlJsunit()
    SecurityHuksHmacCallbackJsunit()
    SecurityHuksImportJsunit()
    SecurityHuksHmacPromiseJsunit()
    SecurityHuksSignVerifyDSACallbackJsunit()
    SecurityHuksSignVerifyECCCallbackJsunit()
    SecurityHuksSignVerifyED25519CallbackJsunit()
    SecurityHuksSignVerifyRSACallbackJsunit()
    SecurityHuksSignVerifySM2CallbackJsunit()
    SecurityHuksSignVerifyDSAPromiseJsunit()
    SecurityHuksSignVerifyECCPromiseJsunit()
    SecurityHuksSignVerifyED25519PromiseJsunit()
    SecurityHuksSignVerifyRSAPromiseJsunit()
    SecurityHuksSignVerifySM2PromiseJsunit()
}
