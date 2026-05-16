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
import ActsAccountCreateAccount from './CreateAccount.test.js'
import ActsAccountRemoveAccount from './RemoveAccount.test.js'
import ActsAccountSetAppAccess from './SetAppAccess.test.js'
import ActsAccountCustomData from './CustomData.test.js'
import ActsAppAccountCredential from './AccountCredential.test.js'
import ActsAccountAuthToken from './AuthToken.test.js'
import ActsAccountManager from './AccountManager.test.js'
import ActsAccountErrPermission from './ErrPermission.test.js'
import ActsAccountOnOff from './ChangeOnOff.js'
import ActsAccountAuthenticator from './Authenticator.test.js'
import ActsAccountErrCode from './ErrCode.test.js'
export default function testsuite() {
    ActsAccountCreateAccount()
    ActsAccountSetAppAccess()
    ActsAccountCustomData()
    ActsAccountManager()
    ActsAppAccountCredential()
    ActsAccountRemoveAccount()
    ActsAccountErrPermission()
    ActsAccountAuthToken()
    ActsAccountAuthenticator()
    ActsAccountErrCode()
    ActsAccountOnOff()
}