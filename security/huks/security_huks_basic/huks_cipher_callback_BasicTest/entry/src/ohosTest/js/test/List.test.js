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

//dont knwo why AES is not added into this list
import SecurityHuksAESBasicCallbackJsunit from './Cipher/SecurityHuksAESBasicCallbackJsunit.test.js'

import securityHuksExportSupportJsunit from './Cipher/securityHuksExportSupportJsunit.test.js'
import SecurityHuksRSABasicCallbackJsunit from './Cipher/SecurityHuksRSABasicCallbackJsunit.test.js'
import SecurityHuksSM4BasicCallbackJsunit from './Cipher/SecurityHuksSM4BasicCallbackJsunit.test.js'
import SecurityHuksSM2BasicCallbackJsunit from './Cipher/SecurityHuksSM2BasicCallbackJsunit.test.js'
export default function testsuite() {
    SecurityHuksAESBasicCallbackJsunit()
    
    securityHuksExportSupportJsunit()
    SecurityHuksRSABasicCallbackJsunit()
    SecurityHuksSM4BasicCallbackJsunit()
    SecurityHuksSM2BasicCallbackJsunit()
}
