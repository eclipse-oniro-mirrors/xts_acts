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
  wrapBuilder,
  Button,
  Text,
  FlexAlign,
  PopupCommonOptions,
  HorizontalAlign,
  ColumnOptions,
  TextOverflow
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { ComponentContent, promptAction, AvoidanceMode } from '@kit.ArkUI';
import { FrameNode } from '@ohos.arkui.node';
import { BusinessError } from '@kit.BasicServicesKit';

@Builder
function buildPopupContent() {
  Column() {
    Text('Popup Content')
      .fontSize(24)
      .key('popupContent')
  }
  .width(200)
  .height(100)
  .padding(10)
}

@Entry
@Component
struct popupCommonOptions {
  @State onWillAppearResult: string = 'init';
  @State onDidAppearResult: string = 'init';
  @State onWillDisappearResult: string = 'init';
  @State onDidDisappearResult: string = 'init';
  @State openPopupResult: string = 'init';

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column({ space: 4 } as ColumnOptions) {
      Button('Popup')
        .id('btnOpenPopup')
        .fontSize(10)
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '14%' })
        .onClick(() => {
          let context = this.getUIContext();
          const contentNode = new ComponentContent<Object>(context, wrapBuilder(buildPopupContent));
          const promptActionInstance = context.getPromptAction();
          let uniqueId = this.getUniqueId();
          let frameNode: FrameNode | null = context.getFrameNodeByUniqueId(uniqueId);
          let targetId = frameNode?.getFirstChild()?.getUniqueId().toInt();
          let popupOptions: PopupCommonOptions = {
            avoidTarget: AvoidanceMode.AVOID_AROUND_TARGET,
            outlineWidth: 2,
            borderWidth: 3,
            autoCancel: true,
            onWillAppear: () => {
              this.onWillAppearResult = 'onWillAppear_called';
              console.info('PopupCommon onWillAppear called');
            },
            onDidAppear: () => {
              this.onDidAppearResult = 'onDidAppear_called';
              this.openPopupResult = 'openPopup';
              console.info('PopupCommon onDidAppear called');
            },
            onWillDisappear: () => {
              this.onWillDisappearResult = 'onWillDisappear_called';
              console.info('PopupCommon onWillDisappear called');
            },
            onDidDisappear: () => {
              this.onDidDisappearResult = 'onDidDisappear_called';
              console.info('PopupCommon onDidDisappear called');
            }
          };

          promptActionInstance.openPopup(contentNode, {id: targetId!}, popupOptions)
            .then(() => {
              console.info('PopupCommon openPopup success');
            })
        })

      Text(this.openPopupResult)
        .key('openPopupResult')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '7%' })
        .fontSize(8)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      Text(this.onWillAppearResult)
        .key('onWillAppearResult')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '7%' })
        .fontSize(8)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      Text(this.onDidAppearResult)
        .key('onDidAppearResult')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '7%' })
        .fontSize(8)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      Text(this.onWillDisappearResult)
        .key('onWillDisappearResult')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '7%' })
        .fontSize(8)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      Text(this.onDidDisappearResult)
        .key('onDidDisappearResult')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '7%' })
        .fontSize(8)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    .width('100%')
    .height('100%')
    .padding({ left: '3%', right: '3%', top: '2%', bottom: '2%' })
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}
