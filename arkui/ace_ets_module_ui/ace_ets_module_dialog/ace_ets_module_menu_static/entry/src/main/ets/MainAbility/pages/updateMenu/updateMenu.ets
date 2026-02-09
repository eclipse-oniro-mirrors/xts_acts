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

let symbolStartIcon: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_star'))
let symbolEndIcon: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_mic'))

@Builder
function myMenu() {
  Menu() {
    MenuItem({
      symbolStartIcon: symbolStartIcon,
      symbolEndIcon: symbolEndIcon,
      content: '新建文件夹',
    } as MenuItemOptions)
    MenuItem({
      symbolStartIcon: symbolStartIcon,
      content: '排序方式',
    } as MenuItemOptions)
    MenuItem({
      symbolStartIcon: symbolStartIcon,
      content: '查看方式',
    } as MenuItemOptions)
  }
  .backgroundColor(Color.Grey)
}

// xxx.ets
@Entry
@Component
struct Index {
  @State updateMenu: string = 'init'
  private uiContext: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.uiContext.getPromptAction();
  private targetInfo: TargetInfo = {
    id: 'openUpdate',
  } as TargetInfo

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text('onDidAppear')
        .fontSize(10)
        .backgroundColor(0x0000ff)
        .fontColor(0xffffff)
        .padding(5)
        .id('openUpdate')
        .onClick(() => {
          let contentNode = new ComponentContent(this.uiContext, wrapBuilder(myMenu));
          this.promptAction.openMenu(contentNode, this.targetInfo, {
            title: 'onDidAppear',
            borderRadius: 0,
          } as MenuOptions)
          setTimeout(() => {
            this.promptAction.updateMenu(contentNode, {
              borderRadius: 100,
            } as MenuOptions, false)
              .then(() => {
                this.updateMenu = 'updateMenu'
                console.info('updateMenu success');
              })
          }, 2000);
          setTimeout(() => {
            this.promptAction.closeMenu(contentNode)
          }, 4000); //4秒后自动关闭
        })
      Text(this.updateMenu)
        .id('updateMenu')
    }
    .width('100%')
    .height('100%')
  }
}
