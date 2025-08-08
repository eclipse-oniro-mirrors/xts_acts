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

import certFrameworkSelectCertsJsAPIFunctionTestUnit from './selectCerts.test';
import certFrameworkSelectCRLsJsAPIFunctionTestUnit from './selectCRLs.test';
import certFrameworkCertMatchJsAPIFunctionTestUnit from './certMatch.test';
import certFrameworkCRLMatchJsAPIFunctionTestUnit from './crlMatch.test';
import certFrameworkCertChainExtJsAPIFunctionTestUnit from './certChainExt.test'
import certFrameworkCreateTrustAnchorJsAPIFunctionTestUnit from './createTrustAnchor.test'
import certFrameworkCertChainOfflineValidateJsAPIFunctionTestUnit from './certChainOfflineValidate.test';
import certFrameworkCertChainPolicyJsAPIFunctionTestUnit from './certChainPolicy.test';
import certFrameworkCertNameJsAPIFunctionTestUnit from './certName.test';
import certFrameworkParseP12CertTestUnit from './parseP12Cert.test';
import certFrameworkCertPkcs7ExtCMSFunctionTestUnit from './certP7.test';
import certFrameworkCertCsrTestUnit from './certCsr.test';
import certFrameworkResultCodeTestUnit from './certResultCode.test';
import certFrameworkCertResolutionTestUnit from './certResolution.test';
import certFrameworkRootCaCertTestUnit from './RootCaCert.test';


export default function testsuite() {
  certFrameworkSelectCertsJsAPIFunctionTestUnit();
  certFrameworkSelectCRLsJsAPIFunctionTestUnit();
  certFrameworkCertMatchJsAPIFunctionTestUnit();
  certFrameworkCRLMatchJsAPIFunctionTestUnit();
  certFrameworkCertChainExtJsAPIFunctionTestUnit();
  certFrameworkCreateTrustAnchorJsAPIFunctionTestUnit();
  certFrameworkCertChainOfflineValidateJsAPIFunctionTestUnit();
  certFrameworkCertChainPolicyJsAPIFunctionTestUnit();
  certFrameworkCertNameJsAPIFunctionTestUnit();
  certFrameworkParseP12CertTestUnit();
  certFrameworkCertPkcs7ExtCMSFunctionTestUnit();
  certFrameworkCertCsrTestUnit();
  certFrameworkResultCodeTestUnit();
  certFrameworkCertResolutionTestUnit();
  /* The test suite can be executed only after the root certificate is preconfigured on the mobile phone */
  certFrameworkRootCaCertTestUnit();
}