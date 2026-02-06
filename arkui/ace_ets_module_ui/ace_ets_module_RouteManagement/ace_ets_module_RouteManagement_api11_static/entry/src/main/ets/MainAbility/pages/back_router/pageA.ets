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
import { Entry,Component,Column,ColumnOptions,Margin,Text, Button, ButtonType, ClickEvent, Scroll } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct router_PageA {
  @State amount: string = '0'
  @State page: number = 0

  onPageShow() {
    this.amount = this.getUIContext().getRouter().getLength()
    this.page = this.getUIContext().getRouter().getState().index;
  }

  build() {
    Scroll() {
      Column({ space: 5 } as ColumnOptions) {
        Text(this.amount).id('text_amount').fontSize(20).margin({ top: 50 } as Margin)
        Text(this.page + '').id('text_page').fontSize(20).margin({ top: 50 } as Margin)
        Button("跳转pageB")
          .type(ButtonType.Capsule)
          .margin({ bottom: 50 } as Margin)
          .id("RouterA1")
          .onClick((e: ClickEvent) => {
            this.getUIContext().getRouter().pushUrl({
              url: "MainAbility/pages/back_router/pageB",
            })
          })
        Button("返回上一级")
          .type(ButtonType.Capsule)
          .id("RouterA2")
          .onClick((e: ClickEvent) => {
            this.getUIContext().getRouter().back()
          })
      }.width('100%')
    }
  }
}