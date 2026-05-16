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
import WebViewControllerVideoMedia from './WebViewControllerVideoMedia.test';
import WebViewNativeMediaPlayerSetVolume1 from './WebViewNativeMediaPlayerSetVolume1.test'
import WebViewNativeMediaPlayerSetPlaybackRate1 from './WebViewNativeMediaPlayerSetPlaybackRate1.test'
import WebViewNativeMediaPlayerSetPlaybackRate2 from './WebViewNativeMediaPlayerSetPlaybackRate2.test'
export default function testsuite() {
  WebViewControllerVideoMedia()
  WebViewNativeMediaPlayerSetVolume1()
  WebViewNativeMediaPlayerSetPlaybackRate1()
  WebViewNativeMediaPlayerSetPlaybackRate2()
}
