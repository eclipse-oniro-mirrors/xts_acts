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
  Button,  FolderStackAttribute,  AttributeModifier } from '@ohos.arkui.component'
import { State, AppStorage,Observed } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
@Observed
export class FolderStackModifierTest1 implements AttributeModifier<FolderStackAttribute>{
  public isUndefined: boolean = false;
  applyNormalAttribute(instance: FolderStackAttribute):void{
    instance
      .alignContent(this.isUndefined ? undefined : Alignment.Start)
  }
}

@Observed
export class FolderStackModifierTest0 implements AttributeModifier<FolderStackAttribute>{
  applyNormalAttribute(instance: FolderStackAttribute):void{
    instance
      .alignContent(Alignment.Start)
  }
}
@Entry
@Component
struct FolderStackExampleM {
  @State modifier0:FolderStackModifierTest0 = new FolderStackModifierTest0();
  @State modifier1:FolderStackModifierTest1 = new FolderStackModifierTest1();
  build() {
    Column() {
      FolderStack({ upperItems: ['upperItemsId'] }) {
        Column() {
          Text('video zone').height('100%').width('100%').textAlign(TextAlign.Center).fontSize(25)
        }.backgroundColor(Color.Pink).width('60%').height('100%').id('upperItemsId')
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
      .attributeModifier(this.modifier1)
      .id('FolderStack_AlignContent_Modifier')

      Divider()

      Button(this.modifier1.isUndefined ?'isUndefined = true':'isUndefined = false')
        .onClick(() => {
          this.modifier1.isUndefined = !this.modifier1.isUndefined
        }
        ).id('changeButton')
    }.width('100%')
  }
}