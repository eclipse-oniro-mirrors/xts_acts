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
import webViewNativeMediaPlayerProps from './WebViewNativeMediaPlayerProps.test';
import WebViewNativeMediaPlayerSeek1 from './WebViewNativeMediaPlayerSeek1.test';
import WebViewNativeMediaPlayerUpdateRect1 from './WebViewNativeMediaPlayerUpdateRect1.test'
import WebViewNativeMediaPlayerUpdateRect2 from './WebViewNativeMediaPlayerUpdateRect2.test'
export default function testsuite() {
  webViewNativeMediaPlayerProps()
  WebViewNativeMediaPlayerUpdateRect1()
  WebViewNativeMediaPlayerUpdateRect2()
  WebViewNativeMediaPlayerSeek1()
}