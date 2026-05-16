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

import {  Entry,  Column,  Component,  Text,  Color,
  ItemAlign,  FlexAlign,  Scroll,  ColumnSplit,  FontWeight,
  TextAlign,  FolderStack,  Alignment,  SafeAreaType,  SafeAreaEdge,
  FoldStatus,  OnFoldStatusChangeInfo,  HoverEventParam,  AppRotation,  Divider,
  Button } from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct FolderStackTest2 {
  @State isUndefined: boolean = false;
  build() {
    Column() {
      FolderStack({ upperItems: ['upperItemsId3'] }) {
        Column() {
          Text('video zone').height('100%').width('100%').textAlign(TextAlign.Center).fontSize(25)
        }.backgroundColor(Color.Pink).width('60%').height('100%').id('upperItemsId3')
        Column() {
          Text('video title')
            .width('100%')
            .height(20)
            .textAlign(TextAlign.Center)
            .backgroundColor('rgb(213, 213, 213)')
        }.width('100%').height('100%')
      }
      .height('15%')
      .backgroundColor(Color.Yellow)
      .enableAnimation(this.isUndefined ? undefined : false)
      .id('FolderStack_EnableAnimation')
      Divider()
      Button(this.isUndefined ? 'isUndefined = true' : 'isUndefined = false')
        .onClick(() => {
          this.isUndefined = !this.isUndefined
        }
        ).id('changeButton')
    }
  }
}