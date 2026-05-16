'use static'

/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { UIContext } from '@ohos.arkui.UIContext';
import {
  Entry,
  Text,
  Column,
  Component,
  Builder,
  ColumnOptions,
  Button,
  Color,
  Margin,
  FontWeight,
  NodeContainer,
  Row,WrappedBuilder,CustomBuilderT,wrapBuilder,Stack,Button, ContentSlot, CustomBuilder,$r
} from '@ohos.arkui.component';
import { UIUtils, MutableBinding, State, LocalStorage, LocalStorageLink, Provide, Consume, Watch, PropRef, MutableBinding, Binding, MutableVariable, rememberVariable, Observed  } from '@ohos.arkui.stateManagement';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { NodeContent, typeNode, FrameNode } from '@ohos.arkui.node';
import { CrossLanguageOptions } from 'arkui.FrameNode'

@Entry
@Component
struct CrossLanguageOptionsSupportFiveMethodsStatic {
  @State message: string = 'Hello World';
  nc: NodeContent = new NodeContent()
  node: FrameNode | null = null;
  node2: FrameNode | null = null;
  aboutToAppear(): void {
    this.node = typeNode.createColumnNode(this.getUIContext())
    this.node!.setCrossLanguageOptions({treeOperating: false})
    this.node!.commonAttribute.width(150).height(20).backgroundColor(Color.Red).id('colStatic')
    this.nc.addFrameNode(this.node!)
    this.node2 = typeNode.createColumnNode(this.getUIContext())
    this.node2!.setCrossLanguageOptions({treeOperating: false})
    this.node2!.commonAttribute.width(100).height(50).backgroundColor(Color.Green).id('col_child')
    this.node!.appendChild(this.node2!)
    this.nc.addFrameNode(this.node!)
  }

  aboutToDisappear(): void {
    this.nc.removeFrameNode(this.node!)
    this.node?.dispose()
    this.node = null;
  }

  build() {
    Column({space:2} as ColumnOptions) {
      Column({space:2} as ColumnOptions) {
          Button('SetTrue')
            .onClick(()=>{
              this.node!.setCrossLanguageOptions({treeOperating: true})
              this.node2!.setCrossLanguageOptions({treeOperating: true})
            })
            .id('CrossLanguageOptionsSetTrue')
            .width(100)
            .height(15)
        Column() {
          ContentSlot(this.nc)
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}
