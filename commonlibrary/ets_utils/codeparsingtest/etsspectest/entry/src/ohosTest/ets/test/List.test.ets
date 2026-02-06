/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import builtinsStatementBlockTest from './statement/BuiltinsStatementBlockTest.test';
import BuiltinsStatementBreakTest from './statement/BuiltinsStatementBreakTest.test';
import BuiltinsStatementContinueTest from './statement/BuiltinsStatementContinueTest.test';
import builtinsStatementForOfTest from './statement/BuiltinsStatementForOfTest.test';
import builtinsStatementForTest from './statement/BuiltinsStatementForTest.test';
import builtinsStatementIfTest from './statement/BuiltinsStatementIfTest.test';
import builtinsStatementThrowTest from './statement/BuiltinsStatementThrowTest.test';
import builtinsStatementTry from './statement/BuiltinsStatementTryTest.test';
import builtinsStatementWhileTest from './statement/BuiltinsStatementWhile.test';
import builtinsStatementReturnTest from './statement/StatementReturnTest.test';
import builtinsStatementSwitchTest from './statement/StatementSwitchTest.test';
import numberTest from './numberstring/NumberTest.test';
import stringTest from './numberstring/StringTest.test';
import dateTimeTest from './datetime/DateTimeTest.test';

export default function testsuite() {
  builtinsStatementBlockTest();
  builtinsStatementForOfTest();
  builtinsStatementThrowTest();
  builtinsStatementTry();
  builtinsStatementIfTest();
  BuiltinsStatementBreakTest();
  BuiltinsStatementContinueTest();
  builtinsStatementForTest();
  builtinsStatementReturnTest();
  builtinsStatementSwitchTest();
  builtinsStatementWhileTest();
  numberTest();
  stringTest();
  dateTimeTest();
}