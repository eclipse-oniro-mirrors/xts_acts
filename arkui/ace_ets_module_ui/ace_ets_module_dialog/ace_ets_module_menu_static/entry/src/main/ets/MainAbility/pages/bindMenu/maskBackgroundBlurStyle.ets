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
  Column, ColumnOptions, Row, RowOptions, Scroll, Scroller, Button, Text, Color,
  $r, Image, ResourceStr, ResourceColor, SubMenuExpandingMode, MenuOptions,
  ContextMenuOptions, MenuElement, Menu, MenuItem, MenuItemOptions, CustomDialog,
  PopupOptions, CustomPopupOptions, PopupCommonOptions, PopupStateChangeParam,
  EdgeOutlineWidths, wrapBuilder, AvoidanceMode, Placement, PopupMessageOptions,
  PopupBorderLinearGradient, GradientDirection, ContextMenuAnimationOptions, MenuPreviewMode,
  BlurStyle, ModalMode, PreviewScaleMode, AvailableLayoutArea, ResponseType,
  CustomDialogController, CustomBuilder, CustomBuilderT, FontWeight, Length,
  TextAlign, TransitionEffect, Curve,AnimationNumberRange, Margin, FlexAlign
} from '@ohos.arkui.component'
import { BusinessError } from '@kit.BasicServicesKit';
import { ComponentContent, FrameNode, Frame } from '@ohos.arkui.node';
import { UIContext, PromptAction, TargetInfo } from '@ohos.arkui.UIContext'
import { SymbolGlyphModifier } from 'arkui.SymbolGlyphModifier';
import promptAction from '@ohos.promptAction';
import hilog from '@ohos.hilog'


@Entry
@Component
struct maskBackgroundBlurStyleIndex {
  @Builder
  myMenu() {
        Column() {
          Row() {
            Button('Menu').fontSize(20).id('maskBackgroundBlurStyleClose')
          }
        }.padding(5).height(40)
  }
  build() {
    Column() {
      Text($r('sys.string.ohos_id_menu_has_filter'))
      .id('maskBlurResource')
      Row(){
        Button('1')
          .id('maskBackgroundBlurStyleButton1')
          .bindMenu(this.myMenu, {
            mask: { backgroundBlurStyle:BlurStyle.Thin },
            showInSubWindow: false })
        Button('2')
          .id('maskBackgroundBlurStyleButton2')
          .bindMenu(this.myMenu, {
            mask: { backgroundBlurStyle:BlurStyle.Regular },
            showInSubWindow: false })
        Button('3')
          .id('maskBackgroundBlurStyleButton3')
          .bindMenu(this.myMenu, {
            mask: { backgroundBlurStyle:BlurStyle.Thick },
            showInSubWindow: false})
        Button('4')
          .id('maskBackgroundBlurStyleButton4')
          .bindMenu(this.myMenu, {
            mask: { backgroundBlurStyle:BlurStyle.BACKGROUND_THIN },
            showInSubWindow: false })
      }
      Row(){
        Button('5')
          .id('maskBackgroundBlurStyleButton5')
          .bindMenu(this.myMenu, {
            mask: { backgroundBlurStyle:BlurStyle.BACKGROUND_REGULAR },
            showInSubWindow: false })
        Button('6')
          .id('maskBackgroundBlurStyleButton6')
          .bindMenu(this.myMenu, {
            mask: { backgroundBlurStyle:BlurStyle.BACKGROUND_THICK },
            showInSubWindow: false })
        Button('7')
          .id('maskBackgroundBlurStyleButton7')
          .bindMenu(this.myMenu, {
            mask: { backgroundBlurStyle:BlurStyle.BACKGROUND_ULTRA_THICK },
            showInSubWindow: false })
        Button('8')
          .id('maskBackgroundBlurStyleButton8')
          .bindMenu(this.myMenu, {
            mask: { backgroundBlurStyle:BlurStyle.NONE },
            showInSubWindow: false })
      }
      Row(){
        Button('9')
          .id('maskBackgroundBlurStyleButton9')
          .bindMenu(this.myMenu, {
            mask: { backgroundBlurStyle:BlurStyle.COMPONENT_ULTRA_THIN },
            showInSubWindow: false})
        Button('10')
          .id('maskBackgroundBlurStyleButton10')
          .bindMenu(this.myMenu, {
            mask: { backgroundBlurStyle:BlurStyle.COMPONENT_THIN },
            showInSubWindow: false })
        Button('11')
          .id('maskBackgroundBlurStyleButton11')
          .bindMenu(this.myMenu, {
            mask: { backgroundBlurStyle:BlurStyle.COMPONENT_REGULAR },
            showInSubWindow: false })
        Button('12')
          .id('maskBackgroundBlurStyleButton12')
          .bindMenu(this.myMenu, {
            mask: { backgroundBlurStyle:BlurStyle.COMPONENT_THICK },
            showInSubWindow: false })
      }
      Row(){
        Button('13')
          .id('maskBackgroundBlurStyleButton13')
          .bindMenu(this.myMenu, {
            mask: { backgroundBlurStyle:BlurStyle.COMPONENT_ULTRA_THICK },
            showInSubWindow: false })
        Button('14')
          .id('maskBackgroundBlurStyleButton14')
          .bindMenu(this.myMenu, {
             mask: { backgroundBlurStyle:undefined },
             showInSubWindow: false })
      }
    }.width('100%')
  }
}
