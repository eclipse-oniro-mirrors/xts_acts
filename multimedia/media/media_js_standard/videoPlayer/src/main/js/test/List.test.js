/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import VideoPlayerAPICallbackTest from './VideoPlayerAPICallbackTest.test.js'
import VideoPlayerEnumTest from './VideoPlayerEnumTest.test.js'
import VideoPlayerFuncCallbackTest from './VideoPlayerFuncCallbackTest.test.js'
import VideoPlayerFuncPromiseTest from './VideoPlayerFuncPromiseTest.test.js'
export default function testsuite() {
VideoPlayerAPICallbackTest()
VideoPlayerEnumTest()
VideoPlayerFuncCallbackTest()
VideoPlayerFuncPromiseTest()
}
