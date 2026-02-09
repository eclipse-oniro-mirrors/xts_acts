/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import ActsAccountAddAccount from './AddAccount.test.js'
import ActsAccountDeleteAccount from './DeleteAccount.test.js'
import ActsAccountAppAccess from './AppAccess.test.js'
import ActsAccountAssociatedData from './AssociatedData.test.js'
import ActsAccountSetGetExtraInfo from './ExtraInfo.test.js'
import ActsAccountCredential from './Credential.test.js'
import ActsAccountOAuthToken from './OAuthToken.test.js'
import ActsCreatAppAccountManager from './CreatManager.test.js'
import ActsAccountNoPermission from './NoPermission.test.js'
import ActsAccountChangeOnOff from './OnOff.js'
import ActsAccountAuthenticator from './Authenticator.test.js'
export default function testsuite() {
    ActsAccountAddAccount()
    ActsAccountAppAccess()
    ActsAccountAssociatedData()
    ActsCreatAppAccountManager()
    ActsAccountCredential()
    ActsAccountDeleteAccount()
    ActsAccountSetGetExtraInfo()
    ActsAccountNoPermission()
    ActsAccountOAuthToken()
    ActsAccountAuthenticator()
    ActsAccountChangeOnOff()
}