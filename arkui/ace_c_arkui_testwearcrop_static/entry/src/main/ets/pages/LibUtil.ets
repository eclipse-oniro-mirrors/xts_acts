'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Content } from '@ohos.arkui.node'
export class LibUtil {
  static {
    loadLibrary("entry")
  }

  native testCalendarPickerHintRadius001(): int;

  native testCalendarPickerHintRadius002(): int;

  native testCalendarPickerHintRadius003(): int;

  native testCalendarPickerHintRadius004(): int;

  native testCalendarPickerHintRadius005(): int;

  native testCalendarPickerHintRadius006(): int;

  native testCalendarPickerHintRadius007(): int;

  native testCalendarPickerEdgeAlign001(): int;

  native testCalendarPickerEdgeAlign002(): int;

  native testCalendarPickerEdgeAlign003(): int;

  native testCalendarPickerEdgeAlign004(): int;

  native testCalendarPickerTextStyle001(): int;

  native testCalendarPickerTextStyle002(): int;

  native testCalendarPickerTextStyle003(): int;

  native testCalendarPickerTextStyle004(): int;

  native testCalendarPickerTextStyle005(): int;

  native testCalendarPickerTextStyle006(): int;

  native testCalendarPickerTextStyle007(): int;

  native testCalendarPickerTextStyle008(): int;

  native testCalendarPickerTextStyle009(): int;

  native testCalendarPickerTextStyle010(): int;

  native testCalendarPickerTextStyle011(): int;

  native testCalendarPickerTextStyle012(): int;

  native testCalendarPickerTextStyle013(): int;

  native testCalendarPickerTextStyle014(): int;

  native testCalendarPickerTextStyle015(): int;

  native testCalendarPickerTextStyle016(): int;



  native testCalendarPickerWidth001(): int;

  native testCalendarPickerWidth002(): int;

  native testCalendarPickerWidth003(): int;



  native testCalendarPickerEdgeAlign005(): int;


  native testCalendarPickerSelectedDate001(): int;
  native testCalendarPickerSelectedDate002(): int;
  native testCalendarPickerSelectedDate003(): int;
  native testCalendarPickerSelectedDate004(): int;
  native testCalendarPickerSelectedDate005(): int;

  native calendarPickerEnabledTest(a: Content): void;


  native calendarPickerOnChangeTest(a: Content): void;

  native textAreaOnPasteTest(a: Content): void;

  native textInputOnCutTest(a: Content): void;

  native textInputOnPasteTest(a: Content): void;

  native InputMethodTest001(a: Content): void;
}