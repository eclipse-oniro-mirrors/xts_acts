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
import link2 from './Zhuang/link2.test';
import ObjectLink2 from './Zhuang/ObjectLink2.test';
import Prop2 from './Zhuang/Prop2.test';
import state2 from './Zhuang/state2.test';
import provide2 from './Zhuang/provide2.test';
export default function testsuite() {
  state2();
  provide2();
  link2();
  ObjectLink2();
  Prop2();
}
