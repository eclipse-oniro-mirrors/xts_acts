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
import { Entry, Component, NavDestination, ClickEvent, Dimension, EdgeColors, Column, ColumnOptions,
  Row, RowOptions, Scroll, Scroller, Button, Text, Color, $r, Image, ResourceStr, ResourceColor,
  SubMenuExpandingMode, MenuOptions, ContextMenuOptions, MenuElement, Menu, MenuItem, MenuItemOptions,
  CustomDialog, PopupOptions, CustomPopupOptions, PopupCommonOptions, PopupStateChangeParam,
  EdgeOutlineWidths, wrapBuilder, AvoidanceMode, Placement, PopupMessageOptions, PopupBorderLinearGradient,
  GradientDirection, ContextMenuAnimationOptions, MenuPreviewMode, BlurStyle, ModalMode,
  PreviewScaleMode, AvailableLayoutArea, ResponseType, CustomDialogController, CustomBuilder, CustomBuilderT,
  FontWeight, Length, TextAlign, TransitionEffect, Curve,AnimationNumberRange, Margin,
  FlexAlign
} from '@ohos.arkui.component'
import { BusinessError } from '@kit.BasicServicesKit';
import { ComponentContent, FrameNode, Frame } from '@ohos.arkui.node';
import { UIContext, PromptAction, TargetInfo } from '@ohos.arkui.UIContext'
import { SymbolGlyphModifier } from 'arkui.SymbolGlyphModifier';
import promptAction from '@ohos.promptAction';
import hilog from '@ohos.hilog'

let startIcon: ResourceStr = $r('app.media.startIcon')
let endIcon: ResourceStr = $r('app.media.startIcon')
let subMenuExpandingMode: SubMenuExpandingMode | undefined = SubMenuExpandingMode.SIDE_EXPAND;
let subMenuExpandingMode1: SubMenuExpandingMode | undefined = SubMenuExpandingMode.EMBEDDED_EXPAND;
let subMenuExpandingMode2: SubMenuExpandingMode | undefined = SubMenuExpandingMode.STACK_EXPAND;

@Builder
function myMenu() {
  Menu() {
    MenuItem({
      startIcon: startIcon,
      endIcon: endIcon,
      content: '新建文件夹',
    } as MenuItemOptions)
      .id('bindContextMenuClose')
    MenuItem({
      startIcon: startIcon,
      content: '排序方式',
    } as MenuItemOptions)
    MenuItem({
      startIcon: startIcon,
      content: '查看方式',
    } as MenuItemOptions)
  }
  .backgroundColor(Color.Grey)
  .subMenuExpandingMode(subMenuExpandingMode)
}

// xxx.ets
@Entry
@Component
struct bindContextMenuIndex {
  @Builder
  myPreview() {
    Column({ space: 10 } as ColumnOptions) {
      Image($r('app.media.startIcon'))
        .width(200)
        .height(200)
    }
  }

  @State onDidAppear0: boolean = false;
  @State onDidAppear1: boolean = false;
  @State onDidAppear2: boolean = false;
  @State onDidAppear3: boolean = false;

  contextMenuOptions0: ContextMenuOptions = {
    preview: this.myPreview,
    outlineWidth: '10px',
    outlineColor: '#FFFFFF00',
    availableLayoutArea: AvailableLayoutArea.SAFE_AREA,
    modalMode: ModalMode.AUTO,
    anchorPosition: { x: '10px', y: '10px' },
    previewBorderRadius: 50,
    previewAnimationOptions: { scale: [0.5, 5.0] } as ContextMenuAnimationOptions,
    previewScaleMode: PreviewScaleMode.AUTO,
    mask: { color: Color.Red, backgroundBlurStyle: BlurStyle.Thin },
    onAppear: () => {
      this.onDidAppear0 = true
    },
  } as ContextMenuOptions
  contextMenuOptions3: ContextMenuOptions = {
    preview: this.myPreview,
    outlineWidth: '10px',
    outlineColor: $r('app.color.color2'),
    modalMode: ModalMode.NONE,
    previewBorderRadius: 50,
    previewAnimationOptions: { scale: [0.5, 5.0] } as ContextMenuAnimationOptions,
    anchorPosition: { x: $r('app.float.page_text_font_size'), y: $r('app.float.page_text_font_size') },
    previewScaleMode: PreviewScaleMode.CONSTANT,
    mask: { color: $r('app.color.color2'), backgroundBlurStyle: BlurStyle.BACKGROUND_THIN },
    onAppear: () => {
      this.onDidAppear3 = true
    },
  } as ContextMenuOptions
  contextMenuOptions2: ContextMenuOptions = {
    preview: this.myPreview,
    outlineWidth: '10px',
    outlineColor: 12345,
    modalMode: ModalMode.TARGET_WINDOW,
    previewBorderRadius: 50,
    previewAnimationOptions: { scale: [0.5, 5.0] } as ContextMenuAnimationOptions,
    previewScaleMode: PreviewScaleMode.MAINTAIN,
    mask: { color: Color.Red, backgroundBlurStyle: BlurStyle.BACKGROUND_REGULAR },
    onAppear: () => {
      this.onDidAppear2 = true
    },
  } as ContextMenuOptions
  contextMenuOptions1: ContextMenuOptions = {
    preview: this.myPreview,
    outlineWidth: undefined,
    outlineColor: undefined,
    availableLayoutArea: AvailableLayoutArea.SAFE_AREA,
    modalMode: undefined,
    anchorPosition: { x: undefined, y: undefined },
    previewBorderRadius: 50,
    previewAnimationOptions: { scale: [0.5, 5.0] } as ContextMenuAnimationOptions,
    previewScaleMode: undefined,
    mask: { color: undefined, backgroundBlurStyle: undefined },
    onAppear: () => {
      this.onDidAppear1 = true
    },
  } as ContextMenuOptions
  build() {
    Column() {
      Row() {
        Button('menu0')
          .id('bindContextMenu0')
          .bindContextMenu( myMenu, ResponseType.LongPress, this.contextMenuOptions0)
      }
      Row() {
        Button('menu1')
          .id('bindContextMenu1')
          .bindContextMenu( myMenu, ResponseType.LongPress, this.contextMenuOptions1)
      }
      Row() {
        Button('menu2')
          .id('bindContextMenu2')
          .bindContextMenu( myMenu, ResponseType.LongPress, this.contextMenuOptions2)
      }
      Row() {
        Button('undefined')
          .id('bindContextMenu3')
          .bindContextMenu( myMenu, ResponseType.LongPress, this.contextMenuOptions3)
      }
      Text('' + this.onDidAppear0).id('bindContextMenuText0').fontColor(Color.Red)
      Text('' + this.onDidAppear1).id('bindContextMenuText1').fontColor(Color.Red)
      Text('' + this.onDidAppear2).id('bindContextMenuText2').fontColor(Color.Red)
      Text('' + this.onDidAppear3).id('bindContextMenuText3').fontColor(Color.Red)
    }
    .width('100%')
    .height('100%')
  }
}
