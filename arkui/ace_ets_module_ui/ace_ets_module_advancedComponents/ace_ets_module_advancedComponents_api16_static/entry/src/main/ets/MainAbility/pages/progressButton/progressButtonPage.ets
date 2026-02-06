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

import { ProgressButton } from '@ohos.arkui.advanced.ProgressButton';
import { LengthMetrics } from '@ohos.arkui.node';
import {
  Entry,
  Column,
  Component,
  TextAlign,
  Text,
  Color,
  Row,
  ClickEvent,
  Stack,
  Alignment,
  Button,
  Alignment,
  Scroll,
  HorizontalAlign,
  Margin,
  Builder,
  ColumnOptions
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct Index {
  @State progressIndex: int = 0
  @State textState: string = '下载'
  @State buttonWidth: number = 200
  @State isRunning: boolean = false
  @State enableState: boolean = true
  @State timer:Int = 0

  build() {
    Column() {
      Scroll() {
        Column({ space: 20 } as ColumnOptions) {
          ProgressButton({
            colorOptions: {
              progressColor: Color.Orange,
              borderColor: Color.Black,
              textColor: Color.Blue,
              backgroundColor: Color.Pink
            },
            progress: this.progressIndex,
            progressButtonWidth: this.buttonWidth,
            content: this.textState,
            enable: this.enableState,
            progressButtonRadius: LengthMetrics.vp(8),
            clickCallback: () => {
              if (this.textState && !this.isRunning && this.progressIndex < 100) {
                this.textState = '继续'
              }
              this.isRunning = !this.isRunning
              this.timer = setInterval(() => {
                if (this.isRunning) {
                  if (this.progressIndex === 100) {
                  } else {
                    this.progressIndex++
                    if (this.progressIndex === 100) {
                      this.textState = '已完成'
                      this.enableState = false
                    }
                  }
                } else {
                  clearInterval(this.timer)
                }
              }, 20)
            }
          })
        }.alignItems(HorizontalAlign.Center).width('100%').margin({ top: 20 } as Margin)
      }
    }
  }
}