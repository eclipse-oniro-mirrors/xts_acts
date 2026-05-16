'use static'
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

import { numA } from './LazyDynamicImportVariable'
import { funcAdd } from './LazyDynamicImportFunc'
import { User } from './LazyDynamicImportClass'

let res = 'failed'
if (numA === 123 && funcAdd(1, 2) === 3 && new User('lazy import in dynamic', 10).name === 'lazy import in dynamic') {
  res = 'success'
}
export { res };