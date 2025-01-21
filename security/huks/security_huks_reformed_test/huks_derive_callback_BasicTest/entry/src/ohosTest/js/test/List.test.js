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

import SecurityHuksHKDFBasicAbort63KBCallbackJsunit from './Derive/SecurityHuksHKDFBasicAbort63KBCallbackJsunit.test.js'
import SecurityHuksHKDFBasicFinish63KBCallbackJsunit from './Derive/SecurityHuksHKDFBasicFinish63KBCallbackJsunit.test.js'
import SecurityHuksPBKDF2BasicAbort63KBCallbackJsunit from './Derive/SecurityHuksPBKDF2BasicAbort63KBCallbackJsunit.test.js'
import SecurityHuksPBKDF2BasicFinish63KBCallbackJsunit from './Derive/SecurityHuksPBKDF2BasicFinish63KBCallbackJsunit.test.js'
export default function testsuite() {
SecurityHuksHKDFBasicAbort63KBCallbackJsunit()
SecurityHuksHKDFBasicFinish63KBCallbackJsunit()
SecurityHuksPBKDF2BasicAbort63KBCallbackJsunit()
SecurityHuksPBKDF2BasicFinish63KBCallbackJsunit()
}
