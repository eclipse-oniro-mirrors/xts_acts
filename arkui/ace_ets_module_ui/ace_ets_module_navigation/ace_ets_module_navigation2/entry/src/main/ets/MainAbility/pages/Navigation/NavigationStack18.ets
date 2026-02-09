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
struct NavigationStack18 {
  private arr: number[] = [1,2,3]
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  @State bool: boolean = false
  @State text: string = 'start'
  @State flagBlur: string = 'BlurStart'
  @State flagFocus: string = 'FocusStart'
  @State getText: string = ''
  build() {
    Scroll() {
      Column(){
        Navigation() {
          Column() {
            List({space:12}){
              ForEach(this.arr, (item: number) => {
                ListItem() {
                  NavRouter(){
                    Text("NavRouter" + item).key(`NavigationStack18ListItemText${item}`)
                      .width('100%')
                      .height(60)
                      .backgroundColor('#FFFFFF')
                      .borderRadius(24)
                      .fontSize(16)
                      .fontWeight(1000)
                      .textAlign(TextAlign.Center)
                    NavDestination()
                      .key('NavigationStack18NavDestination')
                      .onBlur(()=>{
                        this.flagBlur = 'BlurDone'
                      })
                      .onFocus(()=>{
                        this.flagFocus = 'FocusDone'
                      })
                  }
                }.key(`NavigationStack18ListItem${item}`)
              },(item: number) => item.toString())
            }
            .width('100%')
            .margin({top:12})
          }
        }
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
        Text(this.getText).key('NavigationStack18getText').fontWeight(700)
        Text(this.flagBlur).key('NavigationStack18Blur').fontWeight(700)
        Text(this.flagFocus).key('NavigationStack18Focus').fontWeight(700)
        Button('隐藏导航栏')
          .key('NavigationStack18True')
          .onClick(() => {
            this.bool = true
          }).height('5%')
        Button('展开导航栏')
          .key('NavigationStack18False')
          .onClick(() => {
            this.bool = false
          }).height('5%')
        Button('get').id('NavigationStack18get')
          .onClick(() => {
            this.getText = JSON.stringify(this.pageInfos.getAllPathName()?.length)
          }).height('5%')
      }
      .border({width:1})
      .width('100%')
      .height('85%')
    }
  }
}