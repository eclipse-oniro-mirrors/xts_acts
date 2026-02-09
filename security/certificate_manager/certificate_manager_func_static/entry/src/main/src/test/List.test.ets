/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import api16CertFuncTestUnit from './Api16CertFunc.test';
import api16CertFuncTestTwoUnit from './Api16CertFuncTwo.test';
import certManagerPriCertJsAPIFunctionTestUnit from './PriCertFunc.test';
import certManagerPubCertJsAPIFunctionTestUnit from './PubCertFunc.test';
import certManagerPubCertJsAPIFunctionTestUnitThree from './PubCertFuncThree.test';
import certManagerPubCertJsAPIFunctionTestUnitTwo from './PubCertFuncTwo.test';
import userCertJsAPIFunctionTestUnit from './UserCertFunc.test';

export default function testsuite() {
  api16CertFuncTestUnit();
  api16CertFuncTestTwoUnit();
  certManagerPriCertJsAPIFunctionTestUnit();
  certManagerPubCertJsAPIFunctionTestUnit();
  certManagerPubCertJsAPIFunctionTestUnitThree();
  certManagerPubCertJsAPIFunctionTestUnitTwo();
  userCertJsAPIFunctionTestUnit();
}