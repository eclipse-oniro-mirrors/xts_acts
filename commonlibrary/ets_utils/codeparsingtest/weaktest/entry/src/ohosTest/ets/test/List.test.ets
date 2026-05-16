/*
* Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import WeakMapTest from './weak/WeakMap.test';
import WeakMixTest from './weak/WeakMix.test';
import WeakRefTest from './weak/WeakRef.test';
import WeakSetTest from './weak/WeakSet.test';
import keyedCollections_03Test from './WeakMap/KeyedCollections_03.test';
import keyedCollections_04Test from './WeakMap/KeyedCollections_04.test';
import keyedCollections_15Test from './WeakMap/KeyedCollections_15.test';
import keyedCollections_16Test from './WeakMap/KeyedCollections_16.test';
import keyedCollections_18Test from './WeakMap/KeyedCollections_18.test';
import keyedCollections_10Test from './WeakSet/KeyedCollections_10.test';
import keyedCollections_19Test from './WeakSet/KeyedCollections_19.test';

export default function testsuite() {
  WeakMapTest();
  WeakMixTest();
  WeakRefTest();
  WeakSetTest();
  keyedCollections_03Test();
  keyedCollections_04Test();
  keyedCollections_04Test();
  keyedCollections_15Test();
  keyedCollections_16Test();
  keyedCollections_18Test();
  keyedCollections_10Test();
  keyedCollections_19Test();

}