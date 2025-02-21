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
@Entry
@Component
struct MyComponent_AX {
  @State  color: undefined | null | ResourceColor = Color.Pink;



  build() {
    Column({ space: 20 }) {
      Text("count type of " + JSON.stringify(Object.prototype.toString.call(this.color)) + " number is " + JSON.stringify(this.color))
        .fontSize(20).margin(30).key('StateColor')
      Text("设置变量color类型pink-->Orange")
      Button('change')
        .backgroundColor(this.color)
        .onClick(() => {
          this.color = Color.Orange;
        })
        .key('state1')

      Text("设置变量number类型Orange-->008000")
      Button('change')
        .backgroundColor(this.color)
        .onClick(() => {
          this.color = 0x0000ff;
        })
        .key('state2')

      Text("设置变量undefined类型pink-->undefined")
      Button('change')
        .backgroundColor(this.color)
        .onClick(() => {
          this.color = undefined
        })
        .key('state3')

      Text("设置变量string类型pink-->'008000'")
      Button('change')
        .backgroundColor(this.color)
        .onClick(() => {
          this.color = '#FFA52A2A'
        })
        .key('state4')

      Text("设置变量string类型pink-->null")
      Button('change')
        .backgroundColor(this.color)
        .onClick(() => {
          this.color = null
        })
        .key('state5')

      Text("设置变量Resource类型pink-->Resource")
      Button('change')
        .backgroundColor(this.color)
        .onClick(() => {
          this.color = $r('app.string.color')
        })
        .key('state6')

    }.width('100%').margin({top:10})
  }
}