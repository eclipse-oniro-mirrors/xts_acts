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

import certManagerPriCertJsAPIFunctionTestUnit from './priCertFunc.test';
import certManagerPubCertJsAPIFunctionTestUnit from './pubCertFunc.test';
import userCertJsAPIFunctionTestUnit from './userCertFunc.test';
import api16CertFuncTestUnit from './api16CertFunc.test';
import api16CertFuncTestTwoUnit from './api16CertFuncTwo.test';
import certManagerPubCertJsAPIFunctionTestUnitTwo from './pubCertFuncTwo.test';
import certManagerPubCertJsAPIFunctionTestUnitThree from './pubCertFuncThree.test';

export default function testsuite() {
  certManagerPubCertJsAPIFunctionTestUnitThree();
  certManagerPubCertJsAPIFunctionTestUnit();
  certManagerPriCertJsAPIFunctionTestUnit();
  userCertJsAPIFunctionTestUnit();
  api16CertFuncTestTwoUnit();
  api16CertFuncTestUnit();
  certManagerPubCertJsAPIFunctionTestUnitTwo();
}