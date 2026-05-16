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
import { Entry,Component,Column,ColumnOptions,Margin,Text, Button, ButtonType, ClickEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct router_InitPage {
  @State amount: string = '0'
  @State page: number = 0

  onPageShow() {
    this.amount = this.getUIContext().getRouter().getLength()
    this.page = this.getUIContext().getRouter().getState().index;
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text(this.amount).id('amountIndex').fontSize(20).margin({ top: 50 } as Margin)
      Text(this.page + '').id('pageIndex').fontSize(20).margin({ top: 50 } as Margin)
      Button("跳转pageA")
        .type(ButtonType.Capsule)
        .id("Router1_A")
        .onClick((e: ClickEvent) => {
          this.getUIContext().getRouter().pushUrl({
            url: "MainAbility/pages/back_router/pageA",
          })
        })
    }.width('100%').height('100%')
  }
}