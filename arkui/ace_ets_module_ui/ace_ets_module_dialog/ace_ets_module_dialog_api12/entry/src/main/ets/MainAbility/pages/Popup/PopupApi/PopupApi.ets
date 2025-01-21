/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { Popup, PopupButtonOptions, PopupIconOptions, PopupTextOptions } from '@ohos.arkui.advanced.Popup';

@Entry
@Component
struct PopupExample {
  @State value: string = ""
  @State mes: PopupTextOptions = {
    text: 'This is the message',
    fontSize: 15,
    fontColor: Color.Black,
  } as PopupTextOptions
  build() {
    Row() {
      Column({ space: 12 }) {
        Text(this.value)
          .id("message")
        Button("click to show value")
          .id("btn")
          .onClick(() => {
            if (this.mes.text) {
              this.value = "message"
            }
          })
        // popup 自定义高级组件
        Popup({
          //PopupIconOptions 类型设置图标内容
          icon: {
            image: $r('app.media.icon'),
            width: 32,
            height: 32,
            fillColor: Color.White,
            borderRadius: 16,
          } as PopupIconOptions,
          // PopupTextOptions 类型设置文字内容
          title: {
            text: 'This is a popup with PopupOptions',
            fontSize: 20,
            fontColor: Color.Black,
            fontWeight: FontWeight.Normal,

          } as PopupTextOptions,
          //PopupTextOptions 类型设置文字内容
          message: this.mes,
          showClose: true,
          onClose: () => {
            console.info('close Button click')
            this.value = "close"
          },
          // PopupButtonOptions 类型设置按钮内容
          buttons: [{
            text: 'confirm',
            action: () => {
              console.info('confirm button click')
              this.value = "confirm"
            },
            fontSize: 15,
            fontColor: Color.Black,
          },
            {
              text: 'cancel',
              action: () => {
                console.info('cancel button click')
                this.value = "cancel"
              },
              fontSize: 15,
              fontColor: Color.Black,
            },] as [PopupButtonOptions?, PopupButtonOptions?],
        })
      }.width("100%")
    }.height("100%")
  }
}