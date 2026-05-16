/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static'

import {
  Entry,
  Component,
  Column,
  Text,
  TextArea,
  Scroll,
  Button,
  Color,
  MaxLinesMode,
  MaxLinesOptions,
  LineSpacingOptions,
  SelectedDragPreviewStyle,
  TextMenuItemId,
  ColumnOptions
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { LengthMetrics } from '@ohos.arkui.node';

@Entry
@Component
struct TextCommonIndex {
  @State mMenuSame: string = 'menu_same_init'
  @State mMenuDistinct: string = 'menu_distinct_init'

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('TextCommonIndex error ' + error);
    }
  }

  build() {
    Scroll() {
      Column({ space: 4 } as ColumnOptions) {
        // TextMenuItemId singleton reference test
        Button(this.mMenuSame)
          .id('btnTextMenuItemIdSame')
          .width('90%')
          .onClick(() => {
            let a = TextMenuItemId.autoFill;
            let b = TextMenuItemId.autoFill;
            this.mMenuSame = 'menu_same:' + (a === b ? 'true' : 'false');
          })
        // TextMenuItemId.autoFill !== TextMenuItemId.passwordVault
        Button(this.mMenuDistinct)
          .id('btnTextMenuItemIdDistinct')
          .width('90%')
          .onClick(() => {
            let a = TextMenuItemId.autoFill;
            let b = TextMenuItemId.passwordVault;
            this.mMenuDistinct = 'menu_distinct:' + (a !== b ? 'true' : 'false');
          })

        Text('Drag Preview Blue')
          .selectedDragPreviewStyle({ color: Color.Blue } as SelectedDragPreviewStyle)
          .key('textCommonDragPreviewBlue')

        Text('Drag Preview Undefined')
          .selectedDragPreviewStyle(undefined)
          .key('textCommonDragPreviewUndef')

        Text('Line Spacing onlyBetweenLines true')
          .lineSpacing(LengthMetrics.vp(8), { onlyBetweenLines: true } as LineSpacingOptions)
          .key('textCommonLineSpacingTrue')

        Text('Line Spacing onlyBetweenLines false')
          .lineSpacing(LengthMetrics.vp(8), { onlyBetweenLines: false } as LineSpacingOptions)
          .key('textCommonLineSpacingFalse')

        TextArea({ text: 'line1\nline2\nline3\nline4\nline5' })
          .maxLines(3, { overflowMode: MaxLinesMode.CLIP } as MaxLinesOptions)
          .key('textCommonMaxLinesClip')

        TextArea({ text: 'line1\nline2\nline3\nline4\nline5' })
          .maxLines(3, { overflowMode: MaxLinesMode.SCROLL } as MaxLinesOptions)
          .key('textCommonMaxLinesScroll')
      }
      .width('100%')
      .padding({ top: '2%', bottom: '2%', left: '2%', right: '2%' })
    }
    .width('100%')
    .height('100%')
  }
}
