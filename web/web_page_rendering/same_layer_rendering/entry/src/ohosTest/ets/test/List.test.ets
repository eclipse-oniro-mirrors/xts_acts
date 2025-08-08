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
import webDefaultTextEncodingFormat from './WebDefaultTextEncodingFormat.test';
import EmbedVisibilityChange from './EmbedVisibilityChange.test';
import webViewControllerPart2 from './WebViewControllerPart2.test';
import webViewRegisterNativeEmbedRule from './webViewRegisterNativeEmbedRule.test';
import webViewObjectEmbed from './webViewObjectEmbed.test';
import webViewObjectEmbed2 from './webViewObjectEmbed2.test';
import webViewObjectEmbed3 from './webViewObjectEmbed3.test';
import webViewObjectEmbedEnhance from './webViewObjectEmbedEnhance.test';
import webViewAvoidArea from './webViewAvoidArea.test';
import webViewObjectPositionReport from './webViewObjectPositionReport.test';

export default function testsuite() {
  webDefaultTextEncodingFormat();
  EmbedVisibilityChange();
  webViewControllerPart2();
  webViewRegisterNativeEmbedRule();
  webViewObjectEmbed();
  webViewObjectEmbed2();
  webViewObjectEmbed3();
  webViewObjectEmbedEnhance();
  webViewAvoidArea();
  webViewObjectPositionReport();
}