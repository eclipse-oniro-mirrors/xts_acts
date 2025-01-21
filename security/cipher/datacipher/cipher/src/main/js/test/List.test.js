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

import cipher1_test from './Agree/cipher1.test.js'
import cipher2_test from './Agree/cipher2.test.js'
import hitscipher_test from './Agree/hitscipher.test.js'
export default function testsuite() {
    cipher1_test()
    cipher2_test()
    hitscipher_test()
}
