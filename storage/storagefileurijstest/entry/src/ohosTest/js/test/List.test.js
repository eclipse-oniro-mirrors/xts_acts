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

import fileuri_test from './fileuri.test.js'
import filegetFullDirectoryUri_test from './getFullDirectoryUri.test.js'
import filegetpath_test from './getpath.test.js'
export default function testsuite() {
    fileuri_test()
    filegetFullDirectoryUri_test()
    filegetpath_test()
}
