/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import WebTextAutosizing from './WebTextAutosizing.test';
import webDefaultFontSize from './webDefaultFontSize.test';
import webDefaultFontSizeNoAll from './webDefaultFontSizeNoAll.test';
import webDefaultFontSizeNoMinFontSize from './webDefaultFontSizeNoMinFontSize.test';
import webDefaultFontSizeWithMinLogical from './webDefaultFontSizeWithMinLogical.test';
import webViewDefaultFontSize from './webViewDefaultFontSize.test';
import webViewDefaultFontSizeNoAll from './webViewDefaultFontSizeNoAll.test';
import webViewDefaultFontSizeNoMinFontSize from './webViewDefaultFontSizeNoMinFontSize.test';
import webViewDefaultFontSizeWithMinLogical from './webViewDefaultFontSizeWithMinLogical.test';
import webViewMinLogicalFontSize from './WebViewMinLogicalFontSize.test';
import webFontTest from './WebFontTest.test';
import WebViewEnumAndFontLibrary from './WebViewEnumAndFontLibrary.test';
import WebViewJavaScriptProxyAndOnPageVisible from './WebViewJavaScriptProxyAndOnPageVisible.test';
import enableFollowSystemFontWeight from './enableFollowSystemFontWeight.test';
import webFantasyFont from './webFantasyFont.test';

export default function testsuite() {
       WebTextAutosizing();
       webDefaultFontSize();
       webDefaultFontSizeNoAll();
       webDefaultFontSizeNoMinFontSize();
       webDefaultFontSizeWithMinLogical();
       webViewDefaultFontSize();
       webViewDefaultFontSizeNoAll();
       webViewDefaultFontSizeNoMinFontSize();
       webViewDefaultFontSizeWithMinLogical();
       webViewMinLogicalFontSize();
       webFontTest();
       WebViewEnumAndFontLibrary();
       WebViewJavaScriptProxyAndOnPageVisible();
	   enableFollowSystemFontWeight();
	   webFantasyFont()
}