/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import windowErrCode401_1 from './windowErrCode401_1.test'
import windowErrCode401_2 from './windowErrCode401_2.test'
import windowErrCode401_3 from './windowErrCode401_3.test'
import windowErrCode1300002_1 from './windowErrCode1300002_1.test'
import windowErrCode1300002_2 from './windowErrCode1300002_2.test'
import windowErrCode1300004 from './windowErrCode1300004.test'
import windowErrCode1300006 from './windowErrCode1300006.test'
import windowErrCode1300009 from './windowErrCode1300009.test'
import windowErrCode1300010 from './windowErrCode1300010.test'
import windowErrCode201_1 from './windowErrCode201_1.test'
export default function testsuite() {
  windowErrCode401_1()
  windowErrCode401_2()
  windowErrCode401_3()
  windowErrCode1300002_1()
  windowErrCode1300002_2()
  windowErrCode1300004()
  windowErrCode1300006()
  windowErrCode1300009()
  windowErrCode1300010()
  windowErrCode201_1()
}