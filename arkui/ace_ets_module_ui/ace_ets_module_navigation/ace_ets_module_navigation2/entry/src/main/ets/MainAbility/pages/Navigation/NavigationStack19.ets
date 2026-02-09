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
struct NavigationStack19 {
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
                    Text("NavRouter" + item).key(`NavigationStack19ListItemText${item}`)
                      .width('100%')
                      .height(60)
                      .backgroundColor('#FFFFFF')
                      .borderRadius(24)
                      .fontSize(16)
                      .fontWeight(1000)
                      .textAlign(TextAlign.Center)
                    NavDestination() {
                      Text(`${this.text+item}`).key('NavigationStack19TextCont')
                      Button('button').key('NavigationStack19ButtonContent')
                        .onClick(() => {
                          this.text = 'clicked'
                        })
                    }.key('NavigationStack19NavDestination')
                    .onBlur(()=>{
                      this.flagBlur = 'BlurDone'
                    })
                    .onFocus(()=>{
                      this.flagFocus = 'FocusDone'
                    })
                    .backgroundColor(Color.Orange)
                    .title("NavDestinationTitle"+ item)
                  }
                }.key(`NavigationStack19ListItem${item}`)
              },(item: number) => item.toString())
            }
            .width('100%')
            .margin({top:12})
          }
        }
        .key('NavigationStack19Navigation')
        .height('60%')
        .title('NavIndex')
        .titleMode(NavigationTitleMode.Mini)
        .mode(NavigationMode.Split)
        .hideNavBar(this.bool)
        .navBarWidth('40%')
        .minContentWidth('40%')
        .navBarWidthRange(['30%','50%'])
        .border({width: 1})
        .height('70%')
        .width('100%')
        .backgroundColor(Color.Pink)
        Text(this.flagBlur).key('NavigationStack19Blur').fontWeight(700)
        Text(this.flagFocus).key('NavigationStack19Focus').fontWeight(700)
        Button('隐藏导航栏')
          .key('NavigationStack19True')
          .onClick(() => {
            this.bool = true
          })
        Button('展开导航栏')
          .key('NavigationStack19False')
          .onClick(() => {
            this.bool = false
          })
      }
      .border({width:1})
      .width('100%')
    }
  }
}