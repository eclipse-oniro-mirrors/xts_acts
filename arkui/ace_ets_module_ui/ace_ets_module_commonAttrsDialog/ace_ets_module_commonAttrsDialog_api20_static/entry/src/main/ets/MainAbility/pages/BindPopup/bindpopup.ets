'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {
  Button,
  ClickEvent,
  Color,
  Component,
  Entry,
  Flex,
  FlexDirection,
  FlexOptions,
  GradientDirection,
  Padding,
  PopupOptions,
  PopupStateChangeParam,
  Position
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct PopupExample {
  @State handlePopup: boolean = false
  @State customPopup: boolean = false

  build() {
    Flex({ direction: FlexDirection.Column } as FlexOptions) {
      // PopupOptions 类型设置弹框内容
      Button('PopupOptions')
        .onClick((e: ClickEvent) => {
          this.handlePopup = !this.handlePopup
        })
        .bindPopup(this.handlePopup, {
          message: 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
          // placementOnTop: true,
          showInSubWindow: false,
          enableArrow: true,
          primaryButton: {
            value: '普通按钮',
            action: () => {
              this.handlePopup = !this.handlePopup
              console.info('confirm Button click')
            }
          },
          // 第二个按钮
          secondaryButton: {
            value: '强调按钮',
            action: () => {
              this.handlePopup = !this.handlePopup
              console.info('cancel Button click')
            }
          },
          // outlineWidth: 6,
          // outlineLinearGradient: {
          //   direction: GradientDirection.Left,
          //   colors: [[Color.Green, 0.0], [Color.Pink, 1]]
          // },
          // borderWidth: 6,
          // borderLinearGradient: {
          //   direction: GradientDirection.Top,
          //   colors: [['#ff26ff00', 0.0], [Color.Blue, 1.0]]
          // },
          onStateChange: (e: PopupStateChangeParam) => {
            console.info(JSON.stringify(e.isVisible))
            if (!e.isVisible) {
              this.handlePopup = false
            }
          }
        } as PopupOptions)
        .id('bindPopup001')
        .position({ x: 100, y: 150 } as Position)
    }
    .width('100%')
    .padding({ top: 5 } as Padding)
  }
}