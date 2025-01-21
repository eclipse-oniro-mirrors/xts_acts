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
@Entry
@Component
struct aboutToDisappearFalse {
  private iconStr: ResourceStr = $r("app.media.icon")
  @State isShown: boolean = false
  @State arr: Array<String> = [];

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" })
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" })
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" })
    }
    Button("点我关闭Menu").onClick(()=>{
      this.isShown = false;
    })
  }


  build() {
    Column({ space: 50 }) {
      Column() {
        Column() {
          Text('aboutToDisappearFalse')
            .width(200)
            .height(100)
            .textAlign(TextAlign.Center)
            .margin(100)
            .fontSize(30)
            .bindContextMenu(this.isShown, this.MyMenu, {
              aboutToDisappear: ()=>{
                this.arr.push("aboutToDisappear");
              },
              onDisappear: ()=>{
                this.arr.push("onDisappear");
                this.isShown = false;
              }
            })
          Button('click')
            .margin(30)
            .id("aboutToDisappearFalse")
            .margin(30)
            .onClick(()=>{
              this.isShown = !this.isShown;
            })

          Text(this.arr.toString()).fontSize(30).id("aboutToDisappearFalseText")
        }
      }.width('100%')
    }
  }
}