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
struct BlockHierarchy {
  @State fatherStack: string = '';
  @State grandFatherStack: string = '';
  @State stack: string = '';
  @State text: string = '';
  @State outerButton: string = '';
  @State Button70: string = '';
  @State Button50: string = '';
  @State Button30: string = '';

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
            .id('outerButton')
            .width("85%")
            .height("85%")
            .backgroundColor('#ff1dc320')
          // inner stack
          Stack() {
            Button()
              .id('Button70')
              .backgroundColor('#F7F7F7')
              .width("70%")
              .height("70%")
              .onTouch((event) => {
                this.Button70 = 'Button70OnTouch'
                console.info('HitTestMode button150 touched type: ' + (event as TouchEvent).type);
              })
              .hitTestBehavior(HitTestMode.Transparent)
            Button()
              .id('Button50')
              .backgroundColor('#707070')
              .width("50%")
              .height("50%")
              .onTouch((event) => {
                this.Button50 = 'Button50OnTouch'
                console.info('HitTestMode button100 touched type: ' + (event as TouchEvent).type);
              })
              .hitTestBehavior(HitTestMode.Transparent)
            Button()
              .id('Button30')
              .backgroundColor('#D5D5D5')
              .width("30%")
              .height("30%")
              .onTouch((event) => {
                this.Button30 = 'Button30OnTouch'
                console.info('HitTestMode button050 touched type: ' + (event as TouchEvent).type);
              })
              .hitTestBehavior(HitTestMode.Transparent)
          }
          .width("100%")
          .height("100%")
          .id('stack')
          // 设置触摸测试模式，自身和子节点响应触摸测试，阻止所有优先级较低的兄弟节点和父节点参与触摸测试
          .hitTestBehavior(HitTestMode.BLOCK_HIERARCHY)
          .onTouch((event) => {
            this.stack = 'stackOnTouch'
            console.info('HitTestMode stack touched type: ' + (event as TouchEvent).type);
          })

          Text('Transparent')
            .hitTestBehavior(HitTestMode.Transparent)
            .id('text')
            .width("100%")
            .height("100%")
            .onTouch((event) => {
              this.text = 'textOnTouch'
              console.info('HitTestMode text touched type: ' + (event as TouchEvent).type);
            })
        }
        .width("70%")
        .height("50%")
        .borderWidth(2)
        .id('fatherStack')
        .onTouch((event) => {
          this.fatherStack = 'fatherStackOnTouch'
          console.info('HitTestMode father stack touched type: ' + (event as TouchEvent).type);
        })
      }
      .width("100%")
      .height("50%")
      .borderWidth(2)
      .id('grandFatherStack')
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
      Text('button70: ' + this.Button70)
        .id('Button70Text')
      Text('button50: ' + this.Button50)
        .id('Button50Text')
      Text('button30: ' + this.Button30)
        .id('Button30Text')
    }.width("100%").height("100%")
  }
}