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
import WebViewNativeVideoUpdateRect from './WebViewNativeMediaUpdateRect.test';
import WebViewNativeMediaPlayerEnableFalse from './WebViewNativeMediaPlayerEnableFalse.test';
import WebViewNativeMediaPlayerHandlerEnhanced from './WebViewNativeMediaPlayerHandlerEnhanced.test';
import WebViewNativeMediaPlayerHandler4 from './WebViewNativeMediaPlayerHandler4.test';
import WebViewNativeMediaPlayerHandlerEnhanced2 from './WebViewNativeMediaPlayerHandlerEnhanced2.test';
import WebViewNativeMediaPlayerHandlerEnhancedSetMuted from './WebViewNativeMediaPlayerHandlerEnhancedSetMuted.test';

export default function testsuite() {
  WebViewNativeVideoUpdateRect()
  WebViewNativeMediaPlayerEnableFalse()
  WebViewNativeMediaPlayerHandlerEnhanced()
  WebViewNativeMediaPlayerHandlerEnhanced2()
  WebViewNativeMediaPlayerHandlerEnhancedSetMuted()
  WebViewNativeMediaPlayerHandler4()

}
