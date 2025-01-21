/**
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

import ActsAceWebSafeBrowsing from './webSafeBrowsing.test'
import webViewObjectEmbedEnhance from './webViewObjectEmbedEnhance.test'
import webViewObjectEmbed from './webViewObjectEmbed.test'
import webViewGetAndSetRenderProcessMode from './webViewGetAndSetRenderProcessMode.test'
import webViewGetSecurityLevel from './webViewGetSecurityLevel.test'
import webViewObjectEmbed2 from './webViewObjectEmbed2.test'
import webViewObjectEmbed3 from './webViewObjectEmbed3.test'
import webViewIncognitoMode1 from './webViewIncognitoMode1.test'
import webViewIncognitoMode2 from './webViewIncognitoMode2.test'
export default function testsuite() {
  webViewGetSecurityLevel()
  webViewIncognitoMode1()
  webViewGetAndSetRenderProcessMode()
  webViewIncognitoMode2()
  ActsAceWebSafeBrowsing()
  webViewObjectEmbed()
  webViewObjectEmbed3()
  webViewObjectEmbed2()
  webViewObjectEmbedEnhance()
}
