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

import i18nStageTest from './i18nstage.test.ets'
import FivePointOne_i18nStageTest from './FivePointOne_i18nstage.test.ets'
import SixPointZeroI18nStageTest from './SixPointZeroI18nStage.test.ets';

export default function testsuite() {
  i18nStageTest()
  FivePointOne_i18nStageTest()
  SixPointZeroI18nStageTest();
}
