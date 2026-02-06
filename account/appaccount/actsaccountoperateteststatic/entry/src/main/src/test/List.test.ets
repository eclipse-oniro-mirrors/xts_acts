/**
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import ActsAccountCreateAccountStatic from "./CreateAccountStatic.test";
import ActsAccountSetAppAccessStatic from './SetAppAccessStatic.test'
import ActsAccountCustomDataStatic from './CustomDataStatic.test'
import ActsAccountManagerStatic from './AccountManagerStatic.test'
import ActsAppAccountCredentialStatic from './AccountCredentialStatic.test'
import ActsAccountRemoveAccountStatic from './RemoveAccountStatic.test'
import ActsAccountErrPermissionStatic from './ErrPermissionStatic.test'
import ActsAccountAuthTokenStatic from './AuthTokenStatic.test'
import ActsAccountAuthenticatorStatic from './AuthenticatorStatic.test'
import ActsAccountOnOffStatic from './ChangeOnOffStatic.test'

export default function testsuite() {
    ActsAccountCreateAccountStatic()
    ActsAccountSetAppAccessStatic()
    ActsAccountCustomDataStatic()
    ActsAccountManagerStatic()
    ActsAppAccountCredentialStatic()
    ActsAccountRemoveAccountStatic()
    ActsAccountErrPermissionStatic()
    ActsAccountAuthTokenStatic()
    ActsAccountAuthenticatorStatic()
    ActsAccountOnOffStatic()
}