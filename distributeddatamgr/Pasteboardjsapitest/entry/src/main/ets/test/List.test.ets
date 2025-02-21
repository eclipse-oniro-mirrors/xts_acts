/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import pasteboardDetectPatternsTest from './PasteBoardDetectPatterns.test';
import PasteboardDelayCopyTest from './PasteboardDelayCopyTest.test';
import pasteboardSyncTest from './Pasteboardsync.test';
import pasteBoardJEtsunitTest from './PasteBoardEtsunitTest';
import pasteBoardTest from './PasteBoard.test.ets';
import pasteBoardRecordTest from './PasteBoardRecord.test.ets'
import pasteBoardSystemPasteBoardTest from './PasteBoardSystemPasteBoard.test.ets'
import PasteboardUnifiedTest from './PasteboardUnified.test';
import PasteboartdCopyJsAPITest from './PasteboartdCopyJsAPITest.test';
import PasteboardVarietyTest from './PasteboardVariety.test';
export default function testsuite() {
  pasteboardDetectPatternsTest()
  pasteBoardJEtsunitTest()
  pasteBoardSystemPasteBoardTest()
  pasteBoardTest()
  pasteBoardRecordTest()
  pasteboardSyncTest()
  PasteboardUnifiedTest()
  PasteboardDelayCopyTest()
  PasteboartdCopyJsAPITest()
  PasteboardVarietyTest()
}