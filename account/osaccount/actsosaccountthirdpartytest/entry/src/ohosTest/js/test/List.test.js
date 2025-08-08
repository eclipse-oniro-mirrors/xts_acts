/*
 * Copyright (c) 2021-2024 Huawei Device Co., Ltd.
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
import ActsOsAccountThirdPartyTest_third_2 from './OsAccountGet.test.js'
import ActsOsAccountThirdPartyTest_third_1 from './OsAccountIs.test.js'
import ActsOsAccountThirdPartyTest_third_4 from './OsAccountQuery.test.js'
import ActsOsAccountThirdPartyTest_third_3 from './OsAccountCheck.test.js'
import ActsOsAccountTest from './OsAccount.test.js'
export default function testsuite() {
    ActsOsAccountThirdPartyTest_third_2()
    ActsOsAccountThirdPartyTest_third_1()
    ActsOsAccountThirdPartyTest_third_4()
    ActsOsAccountThirdPartyTest_third_3()
    ActsOsAccountTest()
}