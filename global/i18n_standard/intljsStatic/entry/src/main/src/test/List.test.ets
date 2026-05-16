/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import BreakIteratorInI18nTest from "./BreakIteratorInI18nStatic.test";
import CalendarInI18nTest from "./CalendarInI18nStatic.test";
import CollatorInIntlTest from "./CollatorInIntlStatic.test";
import DateTimeFormatInIntlTest from "./DateTimeFormatInIntlStatic.test";
import I18NTest from "./I18nStatic.test";
import I18nUtilInI18nTest from "./I18nUtilInI18nStatic.test";
import IndexUtilInI18nTest from "./IndexUtilInI18nStatic.test";
import NormalizerInI18nTest from "./NormalizerInI18nStatic.test";
import NumberFormatInIntlTest from "./NumberFormatInIntlStatic.test";
import PhoneNumberFormatInI18nTest from "./PhoneNumberFormatInI18nStatic.test";
export default function testsuite() {
    BreakIteratorInI18nTest();
    CalendarInI18nTest();
    CollatorInIntlTest();
    DateTimeFormatInIntlTest();
    I18NTest();
    I18nUtilInI18nTest();
    IndexUtilInI18nTest();
    NormalizerInI18nTest();
    NumberFormatInIntlTest();
    PhoneNumberFormatInI18nTest();
}
