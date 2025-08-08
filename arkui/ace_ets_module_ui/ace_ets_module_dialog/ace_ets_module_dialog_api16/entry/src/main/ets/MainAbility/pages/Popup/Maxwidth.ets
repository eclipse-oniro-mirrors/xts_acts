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
import { Popup, PopupTextOptions, PopupButtonOptions, PopupIconOptions } from '@kit.ArkUI';

@Entry
@Component
struct PopupExample {
  @State text1: string = ''
  @State text2: string = ''
  @State text3: string = ''
  build() {
    Column({ space: 10 }){
      Column({ space: 10 }) {
        Popup({
          maxWidth:'300vp',
          icon: {
            image: $r('app.media.icon'),
            width: 32,
            height: 32,
            fillColor: Color.White,
            borderRadius: 16
          } as PopupIconOptions,
          title: {
            text: 'This is the title',
            fontSize: 20,
            fontColor: Color.Black,
            fontWeight: FontWeight.Normal
          } as PopupTextOptions,
          message: {
            text: 'This is the message',
            fontSize: 15,
            fontColor: Color.Black
          } as PopupTextOptions,
          showClose: false,
          onClose: () => {
            console.info('close Button click')
          },
          buttons: [{
            text: 'confirm',
            action: () => {
              console.info('confirm button click')
            },
            fontSize: 15,
            fontColor: Color.Black,
          },
            {
              text: 'cancel',
              action: () => {
                console.info('cancel button click')
              },
              fontSize: 15,
              fontColor: Color.Black
            },] as [PopupButtonOptions?, PopupButtonOptions?]
        })
        Button('getInspectorTree').onClick(()=>{
          this.text1 = JSON.parse(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[0]
          .$children[0]
          .$attrs
          .constraintSize).maxWidth
        }).id('PopupApi1_btn1')
        Text(this.text1).id('PopupApi1_text1')
      }
      Column({ space: 10 }) {
        Popup({
          maxWidth: -9.9,
          icon: {
            image: $r('app.media.icon'),
            width: 32,
            height: 32,
            fillColor: Color.White,
            borderRadius: 16
          } as PopupIconOptions,
          title: {
            text: 'This is the title',
            fontSize: 20,
            fontColor: Color.Black,
            fontWeight: FontWeight.Normal
          } as PopupTextOptions,
          message: {
            text: 'This is the message',
            fontSize: 15,
            fontColor: Color.Black
          } as PopupTextOptions,
          showClose: false,
          onClose: () => {
            console.info('close Button click')
          },
          buttons: [{
            text: 'confirm',
            action: () => {
              console.info('confirm button click')
            },
            fontSize: 15,
            fontColor: Color.Black,
          },
            {
              text: 'cancel',
              action: () => {
                console.info('cancel button click')
              },
              fontSize: 15,
              fontColor: Color.Black
            },] as [PopupButtonOptions?, PopupButtonOptions?]
        })
        Button('getInspectorTree').onClick(() => {
          this.text2 = JSON.parse(JSON.parse(JSON.stringify(getInspectorTree()))
            .$children[0]
            .$children[1]
            .$children[0]
            .$attrs
            .constraintSize).maxWidth
        }).id('PopupApi1_btn2')
        Text(this.text2).id('PopupApi1_text2')
      }
      Column({ space: 10 }) {
        Popup({
          maxWidth: undefined,
          icon: {
            image: $r('app.media.icon'),
            width: 32,
            height: 32,
            fillColor: Color.White,
            borderRadius: 16
          } as PopupIconOptions,
          title: {
            text: 'This is the title',
            fontSize: 20,
            fontColor: Color.Black,
            fontWeight: FontWeight.Normal
          } as PopupTextOptions,
          message: {
            text: 'This is the message',
            fontSize: 15,
            fontColor: Color.Black
          } as PopupTextOptions,
          showClose: false,
          onClose: () => {
            console.info('close Button click')
          },
          buttons: [{
            text: 'confirm',
            action: () => {
              console.info('confirm button click')
            },
            fontSize: 15,
            fontColor: Color.Black,
          },
            {
              text: 'cancel',
              action: () => {
                console.info('cancel button click')
              },
              fontSize: 15,
              fontColor: Color.Black
            },] as [PopupButtonOptions?, PopupButtonOptions?]
        })
        Button('getInspectorTree').onClick(() => {
          this.text3 = JSON.parse(JSON.parse(JSON.stringify(getInspectorTree()))
            .$children[0]
            .$children[2]
            .$children[0]
            .$attrs
            .constraintSize).maxWidth
        }).id('PopupApi1_btn3')
        Text(this.text3).id('PopupApi1_text3')
      }
    }
  }
}