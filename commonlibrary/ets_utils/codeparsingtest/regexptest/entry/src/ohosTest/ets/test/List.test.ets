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

import RegExpTest001 from './RegExp001.test';
import RegExpTest002 from './RegExp002.test';
import RegExpTest003 from './RegExp003.test';
import RegExpTest004 from './RegExp004.test';
import RegExpTaskpoolTest001 from './RegExpTaskpool001.test';
import RegExpTaskpoolTest002 from './RegExpTaskpool002.test';
import RegExpTaskpoolTest003 from './RegExpTaskpool003.test';
import RegExpTaskpoolTest004 from './RegExpTaskpool004.test';
import RegExpWorkerTest001 from './RegExpWorker001.test';
import RegExpWorkerTest002 from './RegExpWorker002.test';
import RegExpWorkerTest003 from './RegExpWorker003.test';
import RegExpWorkerTest004 from './RegExpWorker004.test';

import regularExpressions01Test from './RegExp/RegularExpressions01.test';
import regularExpressions02Test from './RegExp/RegularExpressions02.test';
import regularExpressions03Test from './RegExp/RegularExpressions03.test';
import regularExpressions04Test from './RegExp/RegularExpressions04.test';
import regularExpressions05Test from './RegExp/RegularExpressions05.test';
import regularExpressions06Test from './RegExp/RegularExpressions06.test';
import regularExpressions07Test from './RegExp/RegularExpressions07.test';
import regularExpressions08Test from './RegExp/RegularExpressions08.test';
import regularExpressions09Test from './RegExp/RegularExpressions09.test';
import regularExpressions10Test from './RegExp/RegularExpressions10.test';
import regularExpressions11Test from './RegExp/RegularExpressions11.test';
import regularExpressions12Test from './RegExp/RegularExpressions12.test';
import regularExpressions13Test from './RegExp/RegularExpressions13.test';
import regularExpressions14Test from './RegExp/RegularExpressions14.test';

import execAnchorTest from './RegExp2/ExecAnchorTest.test';
import execBacktrackTest from './RegExp2/ExecBacktrackTest.test';
import execBasicTest from './RegExp2/ExecBasicTest.test';
import execBoundaryTest from './RegExp2/ExecBoundaryTest.test';
import execCaptureTest from './RegExp2/ExecCaptureTest.test';
import execCharClassTest from './RegExp2/ExecCharClassTest.test';
import execCoercionTest from './RegExp2/ExecCoercionTest.test';
import execConstructorTest from './RegExp2/ExecConstructorTest.test';
import execFlagsTest from './RegExp2/ExecFlagsTest.test';
import execGlobalSpecialTest from './RegExp2/ExecGlobalSpecialTest.test';
import execGlobalTest from './RegExp2/ExecGlobalTest.test';
import execInteractionTest from './RegExp2/ExecInteractionTest.test';
import execLastIndexTest from './RegExp2/ExecLastIndexTest.test';
import execQuantifierTest from './RegExp2/ExecQuantifierTest.test';
import execReturnTest from './RegExp2/ExecReturnTest.test';
import execReturnTypeTest from './RegExp2/ExecReturnTypeTest.test';
import execSpecialCharTest from './RegExp2/ExecSpecialCharTest.test';
import execSpecialTest from './RegExp2/ExecSpecialTest.test';
import instancePropertiesTest from './RegExp2/InstancePropertiesTest.test';
import matchAllAdvancedTest from './RegExp2/MatchAllAdvancedTest.test';
import matchAllBasicTest from './RegExp2/MatchAllBasicTest.test';
import matchAllCompleteTest from './RegExp2/MatchAllCompleteTest.test';
import matchAllEdgeCaseTest from './RegExp2/MatchAllEdgeCaseTest.test';
import matchAllExtrasTest from './RegExp2/MatchAllExtrasTest.test';
import regExpCompleteTest from './RegExp2/RegExpCompleteTest.test';
import replaceAdvancedTest from './RegExp2/ReplaceAdvancedTest.test';
import replaceBasicTest from './RegExp2/ReplaceBasicTest.test';
import replaceComplexTest from './RegExp2/ReplaceComplexTest.test';
import replaceExtrasTest from './RegExp2/ReplaceExtrasTest.test';
import replaceExtremeTest from './RegExp2/ReplaceExtremeTest.test';
import replaceWebTest from './RegExp2/ReplaceWebTest.test';
import searchBasicTest from './RegExp2/SearchBasicTest.test';
import searchExtrasTest from './RegExp2/SearchExtrasTest.test';
import splitTest from './RegExp2/SplitTest.test';
import testLastIndexTest from './RegExp2/TestLastIndexTest.test';
import testTest from './RegExp2/TestTest.test';
import toStringTest from './RegExp2/ToStringTest.test';


export default function testsuite() {
  RegExpTest001();
  RegExpTest002();
  RegExpTest003();
  RegExpTest004();
  RegExpTaskpoolTest001();
  RegExpTaskpoolTest002();
  RegExpTaskpoolTest003();
  RegExpTaskpoolTest004();
  RegExpWorkerTest001();
  RegExpWorkerTest002();
  RegExpWorkerTest003();
  RegExpWorkerTest004();

  regularExpressions01Test();
  regularExpressions02Test();
  regularExpressions03Test();
  regularExpressions04Test();
  regularExpressions05Test();
  regularExpressions06Test();
  regularExpressions07Test();
  regularExpressions08Test();
  regularExpressions09Test();
  regularExpressions10Test();
  regularExpressions11Test();
  regularExpressions12Test();
  regularExpressions13Test();
  regularExpressions14Test();

  execAnchorTest();
  execBacktrackTest();
  execBasicTest();
  execBoundaryTest();
  execCaptureTest();
  execCharClassTest();
  execCoercionTest();
  execConstructorTest();
  execFlagsTest();
  execGlobalSpecialTest();
  execGlobalTest();
  execInteractionTest();
  execLastIndexTest();
  execQuantifierTest();
  execReturnTest();
  execReturnTypeTest();
  execSpecialCharTest();
  execSpecialTest();
  instancePropertiesTest();
  matchAllAdvancedTest();
  matchAllBasicTest();
  matchAllCompleteTest();
  matchAllEdgeCaseTest();
  matchAllExtrasTest();
  regExpCompleteTest();
  replaceAdvancedTest();
  replaceBasicTest();
  replaceComplexTest();
  replaceExtrasTest();
  replaceExtremeTest();
  replaceWebTest();
  searchBasicTest();
  searchExtrasTest();
  splitTest();
  testLastIndexTest();
  testTest();
  toStringTest();
}