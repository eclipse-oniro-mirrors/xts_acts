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



import LoadingProgressJsunit from './ProgressTest/LoadingProgressJsunit.test';
import LoadingProgressJsunit2 from './ProgressTest/LoadingProgressJsunit2.test';
import ProgressJsunit from './ProgressTest/ProgressJsunit.test';
import ProgressJsunit1 from './ProgressTest/ProgressJsunit1.test';
import ActsProgressSecTest from './ProgressTest/ActsProgressSecTest.test';
import ActsProgressTest from './ProgressTest/ActsProgressTest.test';
import LoadingProgressCircularJsunit from './ProgressTest/LoadingProgressCircularJsunit.test';
import ProgressAttrTest from './ProgressTest/ProgressAttrTest.test';
import ProgressCapsuleRadius from './ProgressTest/ProgressCapsuleRadius.test';
import ProgressContentModifierTest from './ProgressTest/ProgressContentModifier.test';
import ProgressContentTest from './ProgressTest/ProgressContentTest.test';
import ProgressMask from './ProgressTest/ProgressMask.test';
import ProgressPrivacySensitiveTest from './ProgressTest/ProgressPrivacySensitive.test';
import ProgressScaleCountTest from './ProgressTest/ProgressScaleCountTest.test';
import ProgressStyleTest from './ProgressTest/ProgressStyleTest.test';

import TextClockApiTest from './TextClockTest/TextClockApiTest.test';
import TextClockJsunit from './TextClockTest/TextClockJsunit.test';
import TextClockJsunit2 from './TextClockTest/TextClockJsunit2.test';
import TextClockLongJsunit from './TextClockTest/TextClockLongJsunit.test';
import TextClockDateTimeOptionsTest from './TextClockTest/TextClockDateTimeOptions.test';
import TextClockFormatTest from './TextClockTest/TextClockFormat.test';
import TextClockNodeTest from './TextClockTest/TextClockNodeTest.test';

import TextTimerApiTest from './TextTimerTest/TextTimerApiTest.test';
import TextTimerJsunit from './TextTimerTest/TextTimerJsunit.test';
import TextTimerJsunit2 from './TextTimerTest/TextTimerJsunit2.test';
import TextTimerFontWeightTest from './TextTimerTest/TextTimerFontWeight.test';
import TextTimerNodeTest from './TextTimerTest/TextTimerNode.test';
import TextTimerTextShadowTest from './TextTimerTest/TextTimerTextShadow.test';


export default function testsuite() {

    // ProgressTest
    LoadingProgressJsunit()
    LoadingProgressJsunit2()
    ProgressJsunit()
    ProgressJsunit1()
    ActsProgressSecTest()
    ActsProgressTest()
    LoadingProgressCircularJsunit()
    ProgressAttrTest()
    ProgressCapsuleRadius()
    ProgressContentModifierTest()
    ProgressContentTest()
    ProgressMask()
    ProgressPrivacySensitiveTest()
    ProgressScaleCountTest()
    ProgressStyleTest()
    // TextClockTest
    TextClockApiTest()
    TextClockJsunit()
    TextClockJsunit2()
    TextClockLongJsunit()
    TextClockDateTimeOptionsTest()
    TextClockFormatTest()
    TextClockNodeTest()
    // TextTimerTest
    TextTimerApiTest()
    TextTimerJsunit()
    TextTimerJsunit2()
    TextTimerFontWeightTest()
    TextTimerNodeTest()
    TextTimerTextShadowTest()
}