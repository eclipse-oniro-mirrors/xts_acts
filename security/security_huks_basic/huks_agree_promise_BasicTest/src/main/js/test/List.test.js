/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import SecurityHuksAgreeDHBasicAbort63KBPromiseJsunit from './Agree/SecurityHuksAgreeDHBasicAbort63KBPromiseJsunit.test.js'
import SecurityHuksAgreeDHBasicFinish63KBPromiseJsunit from './Agree/SecurityHuksAgreeDHBasicFinish63KBPromiseJsunit.test.js'
import SecurityHuksAgreeECDHBasicAbort63KBPromiseJsunit from './Agree/SecurityHuksAgreeECDHBasicAbort63KBPromiseJsunit.test.js'
import SecurityHuksAgreeECDHBasicFinish63KBPromiseJsunit from './Agree/SecurityHuksAgreeECDHBasicFinish63KBPromiseJsunit.test.js'
import SecurityHuksAgreeX25519BasicAbort63KBPromiseJsunit from './Agree/SecurityHuksAgreeX25519BasicAbort63KBPromiseJsunit.test.js'
import SecurityHuksAgreeX25519BasicFinish63KBPromiseJsunit from './Agree/SecurityHuksAgreeX25519BasicFinish63KBPromiseJsunit.test.js'
export default function testsuite() {
SecurityHuksAgreeDHBasicAbort63KBPromiseJsunit()
SecurityHuksAgreeDHBasicFinish63KBPromiseJsunit()
SecurityHuksAgreeECDHBasicAbort63KBPromiseJsunit()
SecurityHuksAgreeECDHBasicFinish63KBPromiseJsunit()
SecurityHuksAgreeX25519BasicAbort63KBPromiseJsunit()
SecurityHuksAgreeX25519BasicFinish63KBPromiseJsunit()
}
