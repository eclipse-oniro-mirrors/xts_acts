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
import XComponentNodeChageJsSuit from './XComponentTest/XComponentNodeChageJsSuit.test';

import videoJsunit from './video/VideoJsunit.test';
import videoJsunit2 from './video/VideoJsunit2.test';

import videoOnFullscreenChangeJsunit from './video/video.test';
import xcomponentGetXComponentContextJsunit from './XComponentTest/xcomponent.test';
import XComponentNodeTest from './XComponentNode/XComponentNodeTest.test';

export default function testsuite() {
  XComponentNodeChageJsSuit()

  videoJsunit()
  videoJsunit2()
  videoOnFullscreenChangeJsunit()
  xcomponentGetXComponentContextJsunit()

  XComponentNodeTest()
}