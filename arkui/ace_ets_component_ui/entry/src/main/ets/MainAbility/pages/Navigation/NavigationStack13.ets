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
struct NavigationStack13 {
  private arr: number[] = [1,2,3]
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  @State bool: boolean = false
  @State text: string = 'start'
  @State flagBlur: string = 'BlurStart'
  @State flagFocus: string = 'FocusStart'
  @State mode: NavigationMode = NavigationMode.Split
  build() {
    Column(){
      Navigation(this.pageInfos) {
        Column() {
          List({space:12}){
            ForEach(this.arr, (item:number) => {
              ListItem() {
                NavRouter(){
                  Text("NavRouter" + item).key(`NavigationStack13ListItemText${item}`)
                    .width('100%')
                    .height(60)
                    .backgroundColor('#FFFFFF')
                    .borderRadius(24)
                    .fontSize(16)
                    .fontWeight(1000)
                    .textAlign(TextAlign.Center)
                  NavDestination() {
                    Text(`${this.text+item}`).key('NavigationStack13TextCont')
                    Button('button').key('NavigationStack13ButtonContent')
                      .onClick(() => {
                        this.text = 'clicked'
                      })
                  }.key('NavigationStack13NavDestination')
                  .onBlur(()=>{
                    this.flagBlur = 'BlurDone'
                  })
                  .onFocus(()=>{
                    this.flagFocus = 'FocusDone'
                  })
                  .backgroundColor(Color.Orange)
                  .title("NavDestinationTitle"+ item)
                }
              }.key(`NavigationStack13ListItem${item}`)
            },(item: number) => item.toString())
          }
          .width('100%')
          .margin({top:12})
        }
      }
      .height('60%')
      .title('NavIndex')
      .titleMode(NavigationTitleMode.Mini)
      .mode(this.mode)
      .hideNavBar(this.bool)
      .navBarWidth(260)
      .minContentWidth(300)
      .navBarWidthRange([200,400])
      .border({width: 1})
      .height('70%')
      .width('100%')
      .backgroundColor(Color.Pink)
      Text(this.flagBlur).key('NavigationStack13Blur').fontWeight(700)
      Text(this.flagFocus).key('NavigationStack13Focus').fontWeight(700)
      Button('YCDHL')
        .key('NavigationStack13True')
        .onClick(() => {
          this.bool = true
        })
      Button('CZ').key('NavigationStack13CZ')
        .onClick(() => {
          this.bool = false
          this.text = 'start'
          this.flagBlur = 'BlurStart'
          this.flagFocus = 'FocusStart'
          this.pageInfos.clear()
        })
      Button('changeModel').key('NavigationStack13clear')
        .onClick(() => {
          this.mode = NavigationMode.Stack
        })
    }
    .border({width:1})
    .height('100%')
    .width(300)
  }
}