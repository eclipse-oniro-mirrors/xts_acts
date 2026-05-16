/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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


import webSetAppCustomUserAgent from './WebSetAppCustomUserAgent.test';
import webSetUserAgentForHosts from './WebSetUserAgentForHosts.test';
import webSetUserAgentClientHintsEnabled from './WebSetUserAgentClientHintsEnabled.test';
import webUserAgentMetadata from './WebUserAgentMetadata.test';
import webSetUrlUrlTrustListList from './WebSetUrlTrustList.test';
import webViewControllerRefresh from './WebViewControllerRefresh.test';
import webUserAgentBrandVersion from './WebUserAgentBrandVersion.test';
import webTestUserAgentMetadata from './WebUserAgentMetadataBrandVersionList.test';
import webTestUserAgentMetadataArch from './WebUserAgentMetadataArch.test';
import webTestUserAgentMetadataBitness from './WebUserAgentMetadataBitness.test';
import webTestUserAgentMetadataFormFactors from './WebUserAgentMetadataFormFactors.test';
import webTestUserAgentMetadataFormFactorsEum from './WebUserAgentMetadataFormFactorsEum.test';
import webTestUserAgentMetadataFullVersion from './WebUserAgentMetadataFullVersion.test';
import webTestUserAgentMetadataMobile from './WebUserAgentMetadataMobile.test';
import webTestUserAgentMetadataModel from './WebUserAgentMetadataModel.test';
import webTestUserAgentMetadataPlatform from './WebUserAgentMetadataPlatform.test';
import webTestUserAgentMetadataPlatformVersion from './WebUserAgentMetadataPlatformVersion.test';
import webTestUserAgentMetadataWow64 from './WebUserAgentMetadataWow64.test';

export default function testsuite() {
  webSetAppCustomUserAgent();
  webSetUserAgentForHosts();
  webSetUserAgentClientHintsEnabled();
  webUserAgentMetadata();
  webSetUrlUrlTrustListList();
  webViewControllerRefresh();
  webUserAgentBrandVersion();
  webTestUserAgentMetadata();
  webTestUserAgentMetadataArch();
  webTestUserAgentMetadataBitness();
  webTestUserAgentMetadataFormFactors();
  webTestUserAgentMetadataFormFactorsEum();
  webTestUserAgentMetadataFullVersion();
  webTestUserAgentMetadataMobile();
  webTestUserAgentMetadataModel();
  webTestUserAgentMetadataPlatform();
  webTestUserAgentMetadataPlatformVersion();
  webTestUserAgentMetadataWow64();
}
