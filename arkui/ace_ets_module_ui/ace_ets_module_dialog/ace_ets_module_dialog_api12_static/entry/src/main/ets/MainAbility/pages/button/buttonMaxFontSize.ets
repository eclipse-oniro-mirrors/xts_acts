'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Color,
  Flex,
  FlexDirection,
  ItemAlign,
  Row,
  Button,
  ClickEvent,
  Week,
  FontWeight,
  Axis,
  Margin,
  PickerTextStyle, CalendarAlign, CalendarPicker,Builder,TextOverflow, TextHeightAdaptivePolicy,
  ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
@Entry
@Component
struct buttonMaxFontSize {
  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button('button1')
        .height('8%')
        .id('button1')
        .labelStyle({
          overflow:TextOverflow.Ellipsis,
          maxLines:1,
          minFontSize:18,
          maxFontSize:12,
          heightAdaptivePolicy:TextHeightAdaptivePolicy.MAX_LINES_FIRST,
        })
      Button('button2')
        .height('8%')
        .id('button2')
        .labelStyle({
          overflow:TextOverflow.Ellipsis,
          maxLines:1,
          minFontSize:18,
          maxFontSize:'12',
          heightAdaptivePolicy:TextHeightAdaptivePolicy.MAX_LINES_FIRST,
        })
      Button('button3')
        .height('8%')
        .id('button3')
        .labelStyle({
          overflow:TextOverflow.Ellipsis,
          maxLines:1,
          minFontSize:18,
          maxFontSize:$r('app.string.maxFontSize'),
          heightAdaptivePolicy:TextHeightAdaptivePolicy.MAX_LINES_FIRST,
        })

    }.width('100%').margin({ top: 5 } as Margin)
  }
}