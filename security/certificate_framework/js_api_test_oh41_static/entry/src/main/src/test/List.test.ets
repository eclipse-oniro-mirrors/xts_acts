/*
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
import certificateCRLJsunit from "./CertificateCRL.test";
import certificateJsunit from "./Certificate.test";
import certFrameworkCreateCollectionJsAPIFunctionTestUnit from './CreateCollection.test';
import certFrameworkSelectCertsJsAPIFunctionTestUnit from './SelectCerts.test';
import certFrameworkSelectCRLsJsAPIFunctionTestUnit from './SelectCRLs.test';
import certFrameworkCertMatchJsAPIFunctionTestUnit from './CertMatch.test';
import certFrameworkCRLMatchJsAPIFunctionTestUnit from './CrlMatch.test';
import certFrameworkCertChainJsAPIFunctionTestUnit from './CertChain.test';

export default function testsuite() {
  certificateCRLJsunit();
  certificateJsunit();
  certFrameworkCreateCollectionJsAPIFunctionTestUnit();
  certFrameworkSelectCertsJsAPIFunctionTestUnit();
  certFrameworkSelectCRLsJsAPIFunctionTestUnit();
  certFrameworkCertMatchJsAPIFunctionTestUnit();
  certFrameworkCRLMatchJsAPIFunctionTestUnit();
  certFrameworkCertChainJsAPIFunctionTestUnit();
}