/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

//Button组件和事件禁用
@Entry
@Component
struct buttonEnabledDemo {
  @State but: string = 'enabled_true'
  @State but1: string = 'onClick-禁用'
  @State but2: string = 'onTouch-禁用'
  @State but3: string = 'onKeyEvent-禁用'

  @State but4: string = '鼠标事件onHover-禁用'
  @State but5: string = '鼠标事件onMouse-禁用'
  @State but7: string = '鼠标事件onMouse-禁用'
  @State action: string = ''
  @State mouseBtn: string = ''

  @State but6: string = '焦点事件-禁用'
  @State enable: boolean = true


  build() {
    Column({ space: 10 }) {
      Button(this.but)
        .key("btnEnd")
        .onClick(() => {
          this.but = '点击事件已触发'
        })
        .enabled(true)

      Button(this.but1)
        .key("btnEnd1")
        .onClick(() => {
          this.but1 = '点击事件已触发'
        })
        .enabled(false)

      Button(this.but2)
        .key("btnEnd2")
        .onTouch(() => {
          this.but2 = '触摸事件已触发'
        })
        .enabled(false)

      Button(this.but3)
        .key("btnEnd3")
        .onKeyEvent(() => {
          this.but3 = '按键事件已触发'
        })
        .enabled(false)

      Button(this.but4)
        .key("btnEnd4")
        .onHover(() => {
          this.but4 = '鼠标事件onHover 已触发'
        })
        .enabled(false)

      Button(this.but5)
        .key("btnEnd5")
        .onClick((event: ClickEvent) => {
          this.but5 = '鼠标事件onMouse 已触发'
        })
        .enabled(false)

      Button(this.but6)
        .key("btnEnd6")
        .focusable(true)
        .onFocus(() => {
          this.but6 = '焦点事件onFocus 已触发'
        })
        .onBlur(() => {
          this.but6 = '焦点事件onBlur 已触发'
        })
        .enabled(false)

      Button(this.but7)
        .key("btnEnd7")
        .onMouse((event: MouseEvent) => {
          switch (event.button) {
            case MouseButton.None:
              this.mouseBtn = 'None';
              break;
            case MouseButton.Left:
              this.mouseBtn = 'Left';
              break;
            case MouseButton.Right:
              this.mouseBtn = 'Right';
              break;
            case MouseButton.Back:
              this.mouseBtn = 'Back';
              break;
            case MouseButton.Forward:
              this.mouseBtn = 'Forward';
              break;
            case MouseButton.Middle:
              this.mouseBtn = 'Middle';
              break;
          }
          switch (event.action) {
            case MouseAction.Hover:
              this.action = 'Hover';
              break;
            case MouseAction.Press:
              this.action = 'Press';
              break;
            case MouseAction.Move:
              this.action = 'Move';
              break;
            case MouseAction.Release:
              this.action = 'Release';
              break;
          }
          this.but7 = '鼠标事件onMouse 已触发'
        })
        .enabled(false)
    }
    .width('100%')
    .margin({ top: 20 })
  }
}