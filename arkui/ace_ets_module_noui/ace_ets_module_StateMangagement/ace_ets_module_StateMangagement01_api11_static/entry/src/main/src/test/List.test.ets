'use static';
/*
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

import ConsumeArray from './@stateTest/ConsumeArray.test.ets'
import ConsumeArray1 from './@stateTest/ConsumeArray1.test.ets'
import ConsumeNumber from './@stateTest/ConsumeNumber.test.ets'
import LinkArray from './@stateTest/LinkArray.test.ets'
import LinkColor from './@stateTest/LinkColor.test.ets'
import LinkNumber from './@stateTest/LinkNumber.test.ets'
import objectLinkNumber from './@stateTest/objectLinkNumber.test.ets'
import PropArray from './@stateTest/PropArray.test.ets'
import PropArray1 from './@stateTest/PropArray1.test.ets'
import PropColor from './@stateTest/PropColor.test.ets'
import PropNumber from './@stateTest/PropNumber.test.ets'
import ProvideArray from './@stateTest/ProvideArray.test.ets'
import ProvideArray1 from './@stateTest/ProvideArray1.test.ets'
import ProvideNumber from './@stateTest/ProvideNumber.test.ets'
import StateArray from './@stateTest/StateArray.test.ets'
import StateArray1 from './@stateTest/StateArray1.test.ets'
import StateColor from './@stateTest/StateColor.test.ets'
import StateNumber from './@stateTest/StateNumber.test.ets'
import allowOverride from './allowOverrideTest/allowOverride.test';
import linkJsunit from './Link/LinkJsunit.test';

import provideBrother1 from './ProvideTest/provideBrother1.test.ets'
import provideBrother2 from './ProvideTest/provideBrother2.test.ets'
import provideComponent1 from './ProvideTest/provideComponent1.test.ets'
import provideComponent2 from './ProvideTest/provideComponent2.test.ets'
import provideParent2 from './ProvideTest/provideParent2.test.ets'
import provideParent3 from './ProvideTest/provideParent3.test.ets'
import provideParent4 from './ProvideTest/provideParent4.test.ets'
import provideParent5 from './ProvideTest/provideParent5.test.ets'
import provideParent6 from './ProvideTest/provideParent6.test.ets'
import PersistentTest0040 from './Zhuang/PersistentTest0040.test';


export default function testsuite() {
  ConsumeArray();
  ConsumeArray1();
  ConsumeNumber();
  LinkArray();
  LinkColor();
  LinkNumber();
  objectLinkNumber();
  PropArray();
  PropArray1();
  PropColor();
  PropNumber();
  ProvideArray();
  ProvideArray1();
  ProvideNumber();
  StateArray();
  StateArray1();
  StateColor();
  // StateHight();
  StateNumber();
  allowOverride();
  linkJsunit();
  provideBrother1();
  provideBrother2();
  provideComponent1();
  provideComponent2();
  provideParent2();
  provideParent3();
  provideParent4();
  provideParent5();
  provideParent6();
  PersistentTest0040();
}