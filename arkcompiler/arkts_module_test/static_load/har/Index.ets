/**
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import validator from 'validator';
import validator2 from 'validator/validator';

export let npmRes: boolean = validator.isEmail('foo@bar.com');

export let npmRes2: boolean = validator2.isEmail('foo@bar.com');

export { MainPage } from './src/main/ets/components/MainPage'

export { add } from 'ets/testAdd';

export { add as add1 } from './testAdd';

export { subtract } from './src/main/ets/test';

export { multiply } from './src/main/ets/test';

export { getInfo as testGetCNInfo } from './src/main/ets/test/中文';

export { addTest } from 'loadHar';

export { getHarName } from 'loadHar/src/main/ets/getHarNameTest';

export { addTest as addTest2 } from '@test/library';

export { getHarName as getHarName2 } from '@test/library/src/main/ets/getHarNameTest';

export { expect as expect2 } from '@ohos/hypium';

export { TAG as ConstantTAG } from '@ohos/hypium/src/main/Constant';

export { add as hspAdd } from 'loadHsp';

export { add as hspAdd2 } from '@test/library1';

export { subtract as hspSubtract } from 'loadHsp/src/test/testSubtract';

export { subtract as hspSubtract2 } from '@test/library1/src/test/testSubtract';