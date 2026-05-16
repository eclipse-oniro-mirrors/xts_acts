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

@Entry
@Component
struct BlockDescendants {
  @State fatherStack: string = '';
  @State grandFatherStack: string = '';
  @State stack: string = '';
  @State text: string = '';
  @State outerButton: string = '';
  @State innerButton: string = '';

  build() {
    // outer stack
    Column({ space: 5 }) {
      Stack() {
        Stack() {
          Button('outer button')
            .onTouch((event) => {
              this.outerButton = 'outerButtonOnTouch'
              console.info('HitTestMode outer button touched type: ' + (event as TouchEvent).type);
            })
            .id('outer')
            .width("70%")
            .height("50%")
          // inner stack
          Stack() {
            Button('inner button')
              .width('70%')
              .height('50%')
              .id('inner')
              .onTouch((event) => {
                this.innerButton = 'innerButtonOnTouch'
                console.info('HitTestMode inner button touched type: ' + (event as TouchEvent).type);
              })
          }
          .id('stackColor')
          .width("100%")
          .height("100%")
          // 设置触摸测试模式，自身不响应触摸测试，并且所有的后代（孩子，孙子等）也不响应触摸测试
          .hitTestBehavior(HitTestMode.BLOCK_DESCENDANTS)
          .onTouch((event) => {
            this.stack = 'stackOnTouch'
            console.info('HitTestMode stack touched type: ' + (event as TouchEvent).type);
          })

          Text('Transparent')
            .id('text')
            .hitTestBehavior(HitTestMode.Transparent)
            .width("100%")
            .height("100%")
            .onTouch((event) => {
              this.text = 'textOnTouch'
              console.info('HitTestMode text touched type: ' + (event as TouchEvent).type);
            })
        }
        .width("70%")
        .height("50%")
        .id('fatherStack')
        .borderWidth(2)
        .onTouch((event) => {
          this.fatherStack = 'fatherStackOnTouch'
          console.info('HitTestMode father stack touched type: ' + (event as TouchEvent).type);
        })
      }
      .width("100%")
      .height("50%")
      .id('grandFatherStack')
      .borderWidth(2)
      .onTouch((event) => {
        this.grandFatherStack = 'grandFatherStackOnTouch'
        console.info('HitTestMode grandfather stack touched type: ' + (event as TouchEvent).type);
      })

      Text('grandfather stack: ' + this.grandFatherStack)
        .id('grandFatherStackText')
      Text('father stack: ' + this.fatherStack)
        .id('fatherStackText')
      Text('stack: ' + this.stack)
        .id('stackText')
      Text('text: ' + this.text)
        .id('textText')
      Text('out button: ' + this.outerButton)
        .id('outerButtonText')
      Text('inner button: ' + this.innerButton)
        .id('innerButtonText')
    }.width("100%").height("100%")
  }
}