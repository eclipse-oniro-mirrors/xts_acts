'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { State } from '@ohos.arkui.stateManagement'
import { Entry, Component, NavDestination, ClickEvent, Dimension, EdgeColors,
  Column, ColumnOptions, Row, RowOptions, Scroll, Scroller, Button, Text,
  Color, $r, Image, ResourceStr, ResourceColor, SubMenuExpandingMode,
  MenuOptions, ContextMenuOptions, MenuElement, Menu, MenuItem, MenuItemOptions,
  CustomDialog, PopupOptions, CustomPopupOptions, PopupCommonOptions, PopupStateChangeParam,
  EdgeOutlineWidths, wrapBuilder, AvoidanceMode, Placement, PopupMessageOptions,
  PopupBorderLinearGradient, GradientDirection, ContextMenuAnimationOptions,
  MenuPreviewMode, BlurStyle, ModalMode,
  PreviewScaleMode, AvailableLayoutArea, ResponseType,
  CustomDialogController, CustomBuilder, CustomBuilderT, FontWeight, Length,
  TextAlign, TransitionEffect, Curve,AnimationNumberRange, Margin,
  FlexAlign
} from '@ohos.arkui.component'
import { BusinessError } from '@kit.BasicServicesKit';
import { ComponentContent, FrameNode, Frame } from '@ohos.arkui.node';
import { UIContext, PromptAction, TargetInfo } from '@ohos.arkui.UIContext'
import { SymbolGlyphModifier } from 'arkui.SymbolGlyphModifier';
import promptAction from '@ohos.promptAction';
import hilog from '@ohos.hilog'


@Entry
@Component
struct maskIndex {

  build() {
    Column() {
      Text($r('sys.string.ohos_id_menu_has_filter'))
      .id('maskResource')
      Row(){
        Button('1')
          .id('maskButton1')
          .bindMenu([{
            value: 'Menu1', action: () => {
              console.info('handle Menu1 select');
            }
          } as MenuElement, {
            value: 'Menu2', action: () => {
              console.info('handle Menu2 select');
            }
          } as MenuElement], { mask: true, showInSubWindow: false })
        Button('2')
          .id('maskButton2')
          .bindMenu([{
            value: 'Menu1', action: () => {
              console.info('handle Menu1 select');
            }
          } as MenuElement, {
            value: 'Menu2', action: () => {
              console.info('handle Menu2 select');
            }
          } as MenuElement], { mask: false, showInSubWindow: false })
        Button('3')
          .id('maskButton3')
          .bindMenu([{
            value: 'Menu1', action: () => {
              console.info('handle Menu1 select');
            }
          } as MenuElement, {
            value: 'Menu2', action: () => {
              console.info('handle Menu2 select');
            }
          } as MenuElement], { mask: undefined, showInSubWindow: false })
      }
    }.width('100%')
  }
}
