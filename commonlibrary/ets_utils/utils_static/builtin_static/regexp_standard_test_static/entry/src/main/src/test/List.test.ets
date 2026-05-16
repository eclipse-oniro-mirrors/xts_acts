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

import RegExpTest001 from './regexp/RegExp001.test';
import RegExpTest002 from './regexp/RegExp002.test';
import RegExpTest003 from './regexp/RegExp003.test';
import RegExpTest004 from './regexp/RegExp004.test';
import RegularExpressions01Test from './regexp/RegularExpressions01.test';
import RegularExpressions02Test from './regexp/RegularExpressions02.test';
import RegularExpressions03Test from './regexp/RegularExpressions03.test';
import RegularExpressions04Test from './regexp/RegularExpressions04.test';
import RegularExpressions05Test from './regexp/RegularExpressions05.test';
import RegularExpressions06Test from './regexp/RegularExpressions06.test';
import RegularExpressions07Test from './regexp/RegularExpressions07.test';
import RegularExpressions08Test from './regexp/RegularExpressions08.test';
import RegularExpressions09Test from './regexp/RegularExpressions09.test';
import RegularExpressions10Test from './regexp/RegularExpressions10.test';
import RegularExpressions12Test from './regexp/RegularExpressions12.test';
import RegularExpressions13Test from './regexp/RegularExpressions13.test';
import RegularExpressions14Test from './regexp/RegularExpressions14.test';
import ExecTest001 from './regexp2/ExecTest001.test';
import ExecTest002 from './regexp2/ExecTest002.test';
import ExecTest003 from './regexp2/ExecTest003.test';
import InstancePropertiesTest from './regexp2/InstancePropertiesTest.test';
import MatchTest001 from './regexp2/MatchTest001.test';
import MatchTest002 from './regexp2/MatchTest002.test';
import MatchTest003 from './regexp2/MatchTest003.test';
import RegExpComplete001 from './regexp2/RegExpComplete001.test';
import RegExpComplete002 from './regexp2/RegExpComplete002.test';
import ReplaceTest001 from './regexp2/ReplaceTest001.test';
import ReplaceTest002 from './regexp2/ReplaceTest002.test';
import SearchTest001 from './regexp2/SearchTest001.test';
import SearchTest002 from './regexp2/SearchTest002.test';
import SplitTest001 from './regexp2/SplitTest001.test';
import SplitTest002 from './regexp2/SplitTest002.test';
import TestLastIndex from './regexp2/TestLastIndexTest.test';
import TestTest001 from './regexp2/TestTest001.test';
import TestTest002 from './regexp2/TestTest002.test';
import TestTest003 from './regexp2/TestTest003.test';
import ToStringTest001 from './regexp2/ToStringTest001.test';
import ToStringTest002 from './regexp2/ToStringTest002.test';

export default function testsuite() {
  RegExpTest001();
  RegExpTest002();
  RegExpTest003();
  RegExpTest004();

  RegularExpressions01Test();
  RegularExpressions02Test();
  RegularExpressions03Test();
  RegularExpressions04Test();
  RegularExpressions05Test();
  RegularExpressions06Test();
  RegularExpressions07Test();
  RegularExpressions08Test();
  RegularExpressions09Test();
  RegularExpressions10Test();
  RegularExpressions12Test();
  RegularExpressions13Test();
  RegularExpressions14Test();
  ExecTest001();
  ExecTest002();
  ExecTest003();
  InstancePropertiesTest();
  MatchTest001();
  MatchTest002();
  MatchTest003();
  RegExpComplete001();
  RegExpComplete002();
  ReplaceTest001();
  ReplaceTest002();
  SearchTest001();
  SearchTest002();
  SplitTest001();
  SplitTest002();
  TestLastIndex();
  TestTest001();
  TestTest002();
  TestTest003();
  ToStringTest001();
  ToStringTest002();
}