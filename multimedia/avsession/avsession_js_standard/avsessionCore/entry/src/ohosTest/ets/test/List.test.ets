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

import AVSessionCore from './AVSessionCore.test'
import AVSessionMetadata from './AVSessionMetadata.test'
import AVSessionController from './AVSessionController.test'
import AVSessionEnum from './AVSessionEnum.test'
import AVSessionERRCode from './AVSessionERRCode.test'


export default function testsuite() {
  AVSessionCore()
  AVSessionMetadata()
  AVSessionController()
  AVSessionEnum()
  AVSessionERRCode()
}

/**
 * This test suite is arranged as below: (allocated level by level)
 *    if the testcase is about ENUM                                 -> AVSessionEnum.test.ets
 *    if the testcase covers AVMetadata or other related interface  -> AVSessionMetadata.test.ets
 *    if the testcase is about the controller interface             -> AVSessionController.test.ets
 *    if the testcase is about 6600xxx error code                   -> AVSessionERRCode.test.ets
 *    others(such as interface logic functions and 401 err)         -> AVSessionCore.test.ets
 */