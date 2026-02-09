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

import webViewNativeMediaPlayerEnableFalse from './webViewNativeMediaPlayerEnableFalse.test';
import webViewNativeMediaPlayerHandlerEnhanced from './webViewNativeMediaPlayerHandlerEnhanced.test';
import webViewNativeMediaPlayerHandler4 from './webViewNativeMediaPlayerHandler4.test';
import webViewNativeMediaPlayerHandlerEnhanced2 from './webViewNativeMediaPlayerHandlerEnhanced2.test';
import webViewNativeMediaPlayerHandlerEnhancedHandleVolume from './webViewNativeMediaPlayerHandlerEnhancedHandleVolume.test';
import webViewNativeMediaPlayerHandlerEnhancedHandleCallback from './webViewNativeMediaPlayerHandlerEnhancedHandleCallback.test';
import webViewNativeMediaPlayerHandlerEnhancedSetMuted from './webViewNativeMediaPlayerHandlerEnhancedSetMuted.test';
import webViewNativeVideoUpdateRect from './webViewNativeMediaUpdateRect.test';
export default function testsuite() {
  webViewNativeMediaPlayerEnableFalse()
  webViewNativeMediaPlayerHandlerEnhanced()
  webViewNativeMediaPlayerHandlerEnhanced2()
  webViewNativeMediaPlayerHandlerEnhancedHandleCallback()
  webViewNativeMediaPlayerHandlerEnhancedHandleVolume()
  webViewNativeMediaPlayerHandlerEnhancedSetMuted()
  webViewNativeMediaPlayerHandler4()
  webViewNativeVideoUpdateRect()
}
