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
  Scroll,
  SaveButton,
  SaveDescription,
  SaveIconStyle,
  ButtonType,
  Color,
  ColorMetrics,
  FocusBoxStyle
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { LengthMetrics } from '@ohos.arkui.node';

@Entry
@Component
struct FocusBoxIndex {
  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('FocusBoxIndex error ' + error);
    }
  }

  build() {
    Scroll() {
      Column() {
        // focusBox with margin=4vp, strokeColor=Blue, strokeWidth=2vp
        SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.SAVE, buttonType: ButtonType.Capsule })
          .focusBox({
            margin: LengthMetrics.vp(4),
            strokeColor: ColorMetrics.resourceColor(Color.Blue),
            strokeWidth: LengthMetrics.vp(2)
          } as FocusBoxStyle)
          .key('focusBoxWithStyle')

        // focusBox with margin=2vp, strokeColor=Red, strokeWidth=4vp
        SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.SAVE, buttonType: ButtonType.Capsule })
          .focusBox({
            margin: LengthMetrics.vp(2),
            strokeColor: ColorMetrics.resourceColor(Color.Red),
            strokeWidth: LengthMetrics.vp(4)
          } as FocusBoxStyle)
          .key('focusBoxRedStroke')

        // focusBox with only strokeColor set (Green)
        SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.SAVE, buttonType: ButtonType.Capsule })
          .focusBox({
            strokeColor: ColorMetrics.resourceColor(Color.Green)
          } as FocusBoxStyle)
          .key('focusBoxColorOnly')

        // focusBox with undefined (resets to default)
        SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.SAVE, buttonType: ButtonType.Capsule })
          .focusBox(undefined)
          .key('focusBoxUndefined')
      }
      .width('100%')
      .padding({ top: '2%', bottom: '2%', left: '2%', right: '2%' })
    }
    .width('100%')
    .height('100%')
  }
}
