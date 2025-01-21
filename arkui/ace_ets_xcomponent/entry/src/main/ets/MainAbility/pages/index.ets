/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

// @ts-nocheck


@Entry
@Component
struct XComponentTest {
  private xcomponentContext1 = null;
  private xcomponentContext2 = null;
  private xcomponentId1 = 'xcomponentId1';
  private xcomponentId2 = 'xcomponentId2';
  @State private isHidden:boolean = false;
  @State private changeSize:boolean = true;
  @State private flag:boolean = true;
  @State private xcomponentHeight:number = 300;
  @State private xcomponentWidth:number = 720;
  private offset_x:double = 0.000;
  private offset_y:double = 610.000;
  private index:number = 0;
  private callback_:number = 0;
  private type_:number = 5;
  private touchTypeDown:number = 0;
  private touchTypeUp:number = 1;
  private touchTypeMove:number = 2;
  private touchTypeCancel:number = 3;

  onPageShow() {
      console.info("xclog start run testcase!!!!");
  }

  build() {
    Flex({direction: FlexDirection.Column,alignItems: ItemAlign.Center}) {
      Button('ChangeColor')
        .key('changeXcColor')
        .onClick(() => {
          if (this.xcomponentContext1) {
            this.xcomponentContext1.changeColor();
          }
        })
        .width('300px')
        .height('60px')
      Button('ChangeShape')
        .onClick(() => {
          if (this.xcomponentContext1) {
            this.xcomponentContext1.changeShape();
            console.info('xclog changshape1');
          }
        })
        .width('300px')
        .height('60px')

      XComponent({ id: this.xcomponentId1, type: 'texture', libraryname: 'nativerender'})
        .onLoad((context) => {
          console.info("xclog xcomponent1 build");
          this.xcomponentContext1 = context;
          globalThis.xcomponentContext1 = this.xcomponentContext1;
          globalThis.xcomponentId1 = this.xcomponentId1;
          globalThis.xcomponentHeight = this.xcomponentHeight;
          globalThis.xcomponentWidth = this.xcomponentWidth;
          globalThis.touchTypeDown = this.touchTypeDown;
          globalThis.touchTypeUp = this.touchTypeUp;
          globalThis.type_ = this.type_;
          globalThis.index = this.index;
          globalThis.touchTypeMove = this.touchTypeMove;
          globalThis.touchTypeCancel = this.touchTypeCancel;
          globalThis.offset_x = this.offset_x;
          globalThis.offset_y = this.offset_y;
        })
        .width(this.xcomponentWidth+'px')
        .height(this.xcomponentHeight+'px')
        .key('xc_num1')
        .onDestroy(() => {
          globalThis.flag = false;
          console.info("xclog xcomponet flag: " + globalThis.flag);
        })

      Button('ChangeXComponentSizeTest')
        .key('changeXcSize')
        .width('300px')
        .height('60px')
        .onClick( () => {

          if (this.changeSize) {
            this.xcomponentHeight = 250;

          } else
          {
            this.xcomponentHeight = 300;
          }
          this.changeSize = !this.changeSize;
        })

      Button('ChangeColor')
        .onClick(() => {
          if (this.xcomponentContext2) {
            this.xcomponentContext2.changeColor();
          }
        })
        .width('300px')
        .height('60px')

      Button('ChangeShape')
        .onClick(() => {
          if (this.xcomponentContext2) {
            this.xcomponentContext2.changeShape();
          }
        })
        .width('300px')
        .height('60px')

      XComponent({ id: this.xcomponentId2, type: 'texture', libraryname: 'nativerender'})
        .onLoad((context) => {
          console.info("xclog xcomponent_2 build");
          this.xcomponentContext2 = context;
          globalThis.xcomponentContext2 = this.xcomponentContext2;
          globalThis.xcomponentId2 = this.xcomponentId2;
          globalThis.xcomponentHeight = this.xcomponentHeight;
          globalThis.callback_ = this.callback_;
          globalThis.xcomponentWidth = this.xcomponentWidth;
          globalThis.offset_x = this.offset_x;
          globalThis.offset_y = this.offset_y;
        })
        .width(this.xcomponentWidth+'px')
        .height(this.xcomponentHeight+'px')
        .onDestroy(() => {
        })
    }
    .width('720px')
    .height('1200px')
  }
}