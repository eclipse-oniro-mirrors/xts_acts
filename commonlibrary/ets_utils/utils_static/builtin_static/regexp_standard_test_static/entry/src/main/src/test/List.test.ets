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
}