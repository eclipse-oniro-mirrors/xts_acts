'use static';
/*
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
import { ColorMetrics } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base';
import { ComponentContent } from '@kit.ArkUI';
import { BuilderNode, FrameNode, NodeController,typeNode } from '@ohos.arkui.node'
import { Entry, Column, Component,Builder,Text,ColumnOptions,Margin,Button,NodeContainer,
  Visibility,wrapBuilder,FontWeight,Color,WrappedBuilder,Scroll,Scroller,ColumnOptions,
  HorizontalAlign,ColumnOptions,Stack
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct Index {
  private stackNode: FrameNode | null = null
  private columnNode: FrameNode | null = null
  @State columnNodeIsVisible: string = '0';

  build() {
    Column() {
      Stack() {
        if (true) {
          Column()
            .id('column')
            .visibility(Visibility.Visible)
        }
      }
      .id('stack')
      .visibility(Visibility.Hidden)

      Button('print')
        .id('print_id')
        .onClick((e:ClickEvent) => {
          this.stackNode = this.getUIContext().getFrameNodeById('stack')
          this.columnNode = this.getUIContext().getFrameNodeById('column')
          if (this.stackNode) {
            // Stack节点的可见性，为false
            console.log('stackNode.isVisible:', this.stackNode?.isVisible())
          }
          if (this.columnNode) {
            // Column节点的可见性，变更前为true，变更后为false
            console.log('columnNode.isVisible:', this.columnNode?.isVisible())
            this.columnNodeIsVisible = this.columnNode?.isVisible() + ''
          }
        })
      Text(this.columnNodeIsVisible)
        .id('columnNodeIsVisible')

    }
  }
}