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

import webRunJavaScriptOnDocumentStartTest from './WebRunJavaScriptOnDocumentStartTest.test';
import webRunJavaScriptOnDocumentEndTest from './WebRunJavaScriptOnDocumentEndTest.test';
import webRunJavaScriptOnHeadEndTest from './WebRunJavaScriptOnHeadEndTest.test';
import webJavaScriptOnDocumentStartTest from './WebJavaScriptOnDocumentStartTest.test';
import webJavaScriptOnDocumentEndTest from './WebJavaScriptOnDocumentEndTest.test';
import webViewRegisterJavaScriptProxyErrorCode from './WebViewRegisterJavaScriptProxyErrorCode.test';
import webRunJavaScriptOnHeadEndSetUndefinedOrNull from './WebRunJavaScriptOnHeadEndSetUndefinedOrNull.test';
import webRunJavaScriptOnDocumentStartSetUndefinedOrNull from './WebRunJavaScriptOnDocumentStartSetUndefinedOrNull.test';
import webRunJavaScriptOnDocumentEndSetUndefinedOrNull from './WebRunJavaScriptOnDocumentEndSetUndefinedOrNull.test';
import webJavaScriptOnDocumentStartSpecial from './WebJavaScriptOnDocumentStartSpecial.test';
import webJavaScriptOnDocumentEndSpecial from './WebJavaScriptOnDocumentEndSpecial.test';
import webJavaScriptProxySpecial from './WebJavaScriptProxySpecial.test';
import webJavaScriptAccessSpecial from './WebJavaScriptAccessSpecial.test';


export default function testsuite() {
  webRunJavaScriptOnHeadEndSetUndefinedOrNull()
  webRunJavaScriptOnDocumentStartSetUndefinedOrNull()
  webRunJavaScriptOnDocumentEndSetUndefinedOrNull()
  webRunJavaScriptOnDocumentStartTest();
  webRunJavaScriptOnDocumentEndTest();
  webRunJavaScriptOnHeadEndTest();
  webJavaScriptOnDocumentStartTest();
  webJavaScriptOnDocumentEndTest();
  webViewRegisterJavaScriptProxyErrorCode();
  webJavaScriptOnDocumentStartSpecial();
  webJavaScriptOnDocumentEndSpecial();
  webJavaScriptProxySpecial();
  webJavaScriptAccessSpecial();
}
