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
struct NavigationStack20 {
  private arr: number[] = [1,2,3]
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  @State bool: boolean = false
  @State text: string = 'start'
  @State flagBlur: string = 'BlurStart'
  @State flagFocus: string = 'FocusStart'
  build() {
    Scroll() {
      Column(){
        Navigation(this.pageInfos) {
          Column() {
            List({space:12}){
              ForEach(this.arr, (item: number) => {
                ListItem() {
                  NavRouter(){
                    Text("NavRouter" + item).key(`NavigationStack20ListItemText${item}`)
                      .width('100%')
                      .height(60)
                      .backgroundColor('#FFFFFF')
                      .borderRadius(24)
                      .fontSize(16)
                      .fontWeight(1000)
                      .textAlign(TextAlign.Center)
                    NavDestination() {
                      Text(`${this.text+item}`).key('NavigationStack20TextCont')
                      Button('button').key('NavigationStack20ButtonContent')
                        .onClick(() => {
                          this.text = 'clicked'
                        })
                    }.key('NavigationStack20NavDestination')
                    .onBlur(()=>{
                      this.flagBlur = 'BlurDone'
                    })
                    .onFocus(()=>{
                      this.flagFocus = 'FocusDone'
                    })
                    .backgroundColor(Color.Orange)
                    .title("NavDestinationTitle"+ item)
                  }
                }.key(`NavigationStack20ListItem${item}`)
              },(item: number) => item.toString())
            }
            .width('100%')
            .margin({top:12})
          }
        }
        .key('NavigationStack20Navigation')
        .height('60%')
        .title('NavIndex')
        .titleMode(NavigationTitleMode.Mini)
        .mode(NavigationMode.Auto)
        .hideNavBar(this.bool)
        .navBarWidth(260)
        .minContentWidth(300)
        .navBarWidthRange([200,400])
        .border({width: 1})
        .height('70%')
        .width('100%')
        .backgroundColor(Color.Pink)
        Text(this.flagBlur).key('NavigationStack20Blur').fontWeight(700)
        Text(this.flagFocus).key('NavigationStack20Focus').fontWeight(700)
        Button('YCDHL')
          .key('NavigationStack20True')
          .onClick(() => {
            this.bool = true
          })
        Button('展开导航栏')
          .key('NavigationStack20False')
          .onClick(() => {
            this.bool = false
          })
      }
      .border({width:1})
      .width('100%')
    }
  }
}