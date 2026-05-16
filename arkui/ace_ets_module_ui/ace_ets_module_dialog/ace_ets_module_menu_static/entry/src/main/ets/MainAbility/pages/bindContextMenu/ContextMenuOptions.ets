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


'use static';

import router from '@ohos.router';
import {
  Entry,
  Column,
  Component,
  Builder,
  Button,
  Text,
  FlexAlign,
  ContextMenuOptions,
  ResponseType,
  Menu,
  MenuItem,
  $r,
  MenuItemOptions,
  MenuPreviewMode,
  PreviewScaleMode,
  AvailableLayoutArea,
  ModalMode,
  BlurStyle,
  MenuKeyboardAvoidMode,
  Color,
  HorizontalAlign,
  ColumnOptions,
  TextOverflow
} from '@ohos.arkui.component';
import { LengthUnit, LengthMetrics } from '@ohos.arkui.node';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { ResourceStr } from '@ohos.arkui.component';

let startIcon: ResourceStr = $r('app.media.startIcon');

@Builder
function buildMenuContent() {
  Menu() {
    MenuItem({
      startIcon: startIcon,
      content: '菜单选项1',
    } as MenuItemOptions)
    MenuItem({
      startIcon: startIcon,
      content: '菜单选项2',
    } as MenuItemOptions)
    MenuItem({
      startIcon: startIcon,
      content: '菜单选项3',
    } as MenuItemOptions)
  }
  .key('Menu1')
}

@Entry
@Component
struct ContextMenuOptionsIndex {
  @State onWillAppearResult: string = 'init';
  @State onDidAppearResult: string = 'init';
  @State onWillDisappearResult: string = 'init';
  @State onDidDisappearResult: string = 'init';

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column({ space: 2 } as ColumnOptions) {
      Button('CM-mask')
        .id('btnContextMenuMask')
        .fontSize(8)
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '6.5%' })
        .bindContextMenu(buildMenuContent, ResponseType.LongPress, {
          mask: { color: Color.Red, backgroundBlurStyle: BlurStyle.Thin }
        } as ContextMenuOptions)

      Button('CM-modal')
        .id('btnContextMenuModalMode')
        .fontSize(8)
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '6.5%' })
        .bindContextMenu(buildMenuContent, ResponseType.LongPress, {
          modalMode: ModalMode.NONE
        } as ContextMenuOptions)

      Button('CM-preview')
        .id('btnContextMenuPreviewScaleMode')
        .fontSize(8)
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '6.5%' })
        .bindContextMenu(buildMenuContent, ResponseType.LongPress, {
          preview: MenuPreviewMode.IMAGE,
          previewScaleMode: PreviewScaleMode.AUTO
        } as ContextMenuOptions)

      Button('CM-area')
        .id('btnContextMenuAvailableLayoutArea')
        .fontSize(8)
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '6.5%' })
        .bindContextMenu(buildMenuContent, ResponseType.LongPress, {
          preview: MenuPreviewMode.IMAGE,
          availableLayoutArea: AvailableLayoutArea.SAFE_AREA
        } as ContextMenuOptions)

      Button('CM-anchor')
        .id('btnContextMenuAnchorPosition')
        .fontSize(8)
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '6.5%' })
        .bindContextMenu(buildMenuContent, ResponseType.LongPress, {
          anchorPosition: { x: 10, y: 10 }
        } as ContextMenuOptions)

      Button('CM-keybd')
        .id('btnContextMenuKeyboardAvoidMode')
        .fontSize(8)
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '6.5%' })
        .bindContextMenu(buildMenuContent, ResponseType.LongPress, {
          keyboardAvoidMode: MenuKeyboardAvoidMode.NONE
        } as ContextMenuOptions)

      Button('CM-kbdD')
        .id('btnContextMenuMinKeyboardAvoidDistance')
        .fontSize(8)
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '6.5%' })
        .bindContextMenu(buildMenuContent, ResponseType.LongPress, {
          minKeyboardAvoidDistance: new LengthMetrics(20,LengthUnit.VP)
        } as ContextMenuOptions)

      Button('CM-life')
        .id('btnContextMenuLifecycle')
        .fontSize(8)
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '6.5%' })
        .bindContextMenu(buildMenuContent, ResponseType.LongPress, {
          onWillAppear: () => {
            this.onWillAppearResult = 'onWillAppear_called';
            console.info('ContextMenuOptions onWillAppear called');
          },
          onDidAppear: () => {
            this.onDidAppearResult = 'onDidAppear_called';
            console.info('ContextMenuOptions onDidAppear called');
          },
          onWillDisappear: () => {
            this.onWillDisappearResult = 'onWillDisappear_called';
            console.info('ContextMenuOptions onWillDisappear called');
          },
          onDidDisappear: () => {
            this.onDidDisappearResult = 'onDidDisappear_called';
            console.info('ContextMenuOptions onDidDisappear called');
          }
        } as ContextMenuOptions)

      Text(this.onWillAppearResult)
        .key('onWillAppearResultContextMenu')
        .fontSize(8)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      Text(this.onDidAppearResult)
        .key('onDidAppearResultContextMenu')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '4.8%' })
        .fontSize(8)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      Text(this.onWillDisappearResult)
        .key('onWillDisappearResultContextMenu')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '4.8%' })
        .fontSize(8)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      Text(this.onDidDisappearResult)
        .key('onDidDisappearResultContextMenu')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '4.8%' })
        .fontSize(8)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' })
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}
