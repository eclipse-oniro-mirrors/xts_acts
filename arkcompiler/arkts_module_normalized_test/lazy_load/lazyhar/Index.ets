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

export { MainPage } from './src/main/ets/components/MainPage';

export { numA as numAHar } from './src/main/ets/utils/LazyHarVariable'
export { funcAdd as funcAddHar } from './src/main/ets/utils/LazyHarFunc'
export { User as UserHar } from './src/main/ets/utils/LazyHarClass'

export { add as harSoAdd } from 'liblazyhar.so'