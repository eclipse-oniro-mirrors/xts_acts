/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import globalStageTest from './globalstage.test.ets'
import i18nStageTest from './i18nstage.test.ets'
import FivePointOne_resMgrStageTest from './FivePointOne_resMgrStage.test.ets'
import SixPointZeroResMgrStageTest from './SixPointZeroResMgrStage.test.ets'
import GlobalResMgrTest from './GlobalResMgr.test.ets'
export default function testsuite() {
  globalStageTest()
  i18nStageTest()
  GlobalResMgrTest()
  FivePointOne_resMgrStageTest()
  SixPointZeroResMgrStageTest()
}
