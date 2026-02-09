/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import webJsunit from './WebJsunit.test';
import webAttributeTest from './WebAttributeTest.test';
import webInitTest from './WebInitTest.test';
import webMessageExt from './WebMessageExt.test';
import setPathAllowingUniversalAccess from './setPathAllowingUniversalAccess.test';
import webResourceError from './WebResourceError.test';
import webDownloadEnumTest from './WebDownloadEnumTest.test';
import abilityTest from './Ability.test';
import precompileJavaScript from './precompileJavaScript.test';
import ActsAceWebViewSdkSchemeHandler from './webViewSdkSchemeHandler.test';
import webDownloadEnumTestTwo from './WebDownloadEnumTest2.test';
import EnableBackForwardCacheTest from './enableBackForwardCache.test';

export default function testsuite() {
  webJsunit();
  webAttributeTest();
  webInitTest();
  webMessageExt();
  setPathAllowingUniversalAccess();
  webResourceError();
  webDownloadEnumTest();
  abilityTest();
  precompileJavaScript();
  ActsAceWebViewSdkSchemeHandler();
  webDownloadEnumTestTwo();
  EnableBackForwardCacheTest();
}