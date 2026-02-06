'use static';
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

import ChipGroupIconItemOptionsTest from './ChipGroupTest/ChipGroupIconItemOptionsTest.test';
import ChipGroupSymbolItemOptionsTest from './ChipGroupTest/ChipGroupSymbolItemOptionsTest.test';
import ChipTest0010 from './ChipTest/ChipTest0010.test';
import SegmentButtonV2Test0010 from './segmenButtonV2Test/SegmentButtonV2Test0010.test';
import MultiSegmentButtonV2PageTest from './multiCapsuleSegmentButtonV2/MultiSegmentButtonV2PageTest.test';
import SegmentButtonV2Test from './capsuleSegmentButtonV2/SegmentButtonV2.test';
import TabSegmentButtonV2Test from './tabSegmentButtonV2/TabSegmentButtonV2Test.test';

export default function testsuite() {
  ChipGroupIconItemOptionsTest();
  ChipGroupSymbolItemOptionsTest();
  ChipTest0010();
  SegmentButtonV2Test0010();
  MultiSegmentButtonV2PageTest();
  SegmentButtonV2Test();
  TabSegmentButtonV2Test();
}