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
import webJsunit from './WebJsunit.test';
import webJsunitTwo from './WebJsunitTwo.test';
import webAttribute from './WebAttribute.test';
import webJavaScriptOnDocumentStartTest from './WebJavaScriptOnDocumentStartTest.test';
import abilityTest from './Ability.test';
import DeleteJavaScriptRegisterUnitTest from './WebViewDeleteJavaScriptRegister.test';
import ActsAceRegisterJavaScriptProxy from './WebViewRegisterJavaScriptProxy.test';
import webViewControllerPart3Test from './WebViewControllerPart3.test';
import webViewJsBridgeLastJsProxyCallingFrameUrl from './webViewJsBridgeLastJsProxyCallingFrameUrl.test';
import webViewMetaViewportFalse from './webViewMetaViewportFalse.test';
import webViewJavaScriptPermission from './webViewJavaScriptPermission.test';
import AceWeb from './Acewebenhanced2.test';
import webViewApiOne from './webViewApiOne.test';
import webTwoJsunit from './WebTwoJsunit.test';
import webController from './WebController.test';

export default function testsuite() {
  webJsunit();
  webJsunitTwo();
  webAttribute();
  webController();
  webJavaScriptOnDocumentStartTest();
  abilityTest();
  DeleteJavaScriptRegisterUnitTest();
  ActsAceRegisterJavaScriptProxy();
  webViewControllerPart3Test();
  webViewJsBridgeLastJsProxyCallingFrameUrl();
  webViewMetaViewportFalse();
  webViewJavaScriptPermission();
  AceWeb();
  webViewApiOne();
  webTwoJsunit();
}
