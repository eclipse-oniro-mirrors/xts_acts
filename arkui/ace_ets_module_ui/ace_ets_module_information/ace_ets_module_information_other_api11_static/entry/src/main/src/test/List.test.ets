'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import progress from './ProgressTest/progress.test'
import progress2 from './ProgressTest/progress2.test'
import progress3 from './ProgressTest/progress3.test'
import ProgressJsunit from './ProgressTest/ProgressJsunit.test'
import progressSec from './ProgressTest/progressSec.test'

export default function testsuite() {
  progress()
  progress2()
  progress3()
  ProgressJsunit()
  progressSec()
}