/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct NavigationStack23 {
  private arr: number[] = [1,2,3]
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  @State bool: boolean = false
  @State text: string = 'start'
  @State stateChange: boolean = false
  @State flagFocus: string = 'FocusStart'
  build() {
    Column(){
      Navigation(this.pageInfos) {
        Column() {
          List({space:12}){
            ForEach(this.arr, (item: number) => {
              ListItem() {
                NavRouter(){
                  Text("NavRouter" + item).key(`NavigationStack23ListItemText${item}`)
                    .width('100%')
                    .height(60)
                    .backgroundColor('#FFFFFF')
                    .borderRadius(24)
                    .fontSize(16)
                    .fontWeight(1000)
                    .textAlign(TextAlign.Center)
                  NavDestination() {
                    Text(`${this.text+item}`).key('NavigationStack23TextCont')
                    Button('button').key('NavigationStack23ButtonContent')
                      .onClick(() => {
                        this.text = 'clicked'
                      })
                  }.key('NavigationStack23NavDestination')
                  .backgroundColor(Color.Orange)
                  .title("NavDestinationTitle"+ item)

                }
              }.key(`NavigationStack23ListItem${item}`)
            },(item: number) => item.toString())
          }
          .width('100%')
          .margin({top:12})
        }
      }
      .onNavBarStateChange((isVisible: boolean) => {
        this.stateChange = isVisible
      })
      .key('NavigationStack23Navigation')
      .height('60%')
      .title('NavIndex')
      .titleMode(NavigationTitleMode.Mini)
      .mode(NavigationMode.Stack)
      .hideNavBar(this.bool)
      .navBarWidth(260)
      .minContentWidth(300)
      .navBarWidthRange([200,400])
      .border({width: 1})
      .height('70%')
      .width('100%')
      .backgroundColor(Color.Pink)
      Text(`${this.stateChange}`).key('NavigationStack23Blur').fontWeight(700)
      Button('隐藏导航栏')
        .key('NavigationStack23True')
        .onClick(() => {
          this.bool = true
        })
      Button('展开导航栏')
        .key('NavigationStack23False')
        .onClick(() => {
          this.bool = false
        })
    }
    .border({width:1})
    .height('100%')
    .width(300)
  }
}