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
import ProgressContent from './progressTest/ProgressContent.test';
import QRCodeResourceStr from './qrcode/QRCodeResourceStr.test';
import TextClockFormat from './textClockTest/TextClockFormat.test';
import TextPickerValue from './textPicker/TextPickerValue.test';
import TextTimerFontWeight from './textTimerTest/TextTimerFontWeight.test';
import badgeTest from './badgeTest/badgeResource.test';

export default function testsuite() {
    ProgressContent();
    QRCodeResourceStr();
    TextClockFormat();
    TextPickerValue();
    TextTimerFontWeight();
    badgeTest();
}