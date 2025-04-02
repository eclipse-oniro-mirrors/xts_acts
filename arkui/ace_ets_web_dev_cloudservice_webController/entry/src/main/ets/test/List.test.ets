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
import webViewJsBridgeLastJsProxyCallingFrameUrl from './webViewJsBridgeLastJsProxyCallingFrameUrl.test';
import webViewOnFullScreenEnterVideoInfo from './webViewOnFullScreenEnterVideoInfo.test';
import webViewNativeVideoUpdateRect from './webViewNativeMediaUpdateRect.test';
import webViewCookieTrack from './webViewCookieTrack.test';
import webViewSetRenderProcessMode from './webViewSetRenderProcessMode.test';
import webViewRegisterNativeEmbedRule from './webViewRegisterNativeEmbedRule.test';
import webViewOnOverrideUrlLoading from './webViewOnOverrideUrlLoading.test';
import webViewMetaViewportFalse from './webViewMetaViewportFalse.test';
import webViewMetaViewportTrue from './webViewMetaViewportTrue.test';

export default function testsuite() {
  webViewOnFullScreenEnterVideoInfo()
  webViewSetRenderProcessMode()
  webViewRegisterNativeEmbedRule()
  webViewOnOverrideUrlLoading()
  webViewMetaViewportFalse()
  webViewMetaViewportTrue()
  webViewJsBridgeLastJsProxyCallingFrameUrl()
  webViewCookieTrack()
  webViewNativeVideoUpdateRect()
}
