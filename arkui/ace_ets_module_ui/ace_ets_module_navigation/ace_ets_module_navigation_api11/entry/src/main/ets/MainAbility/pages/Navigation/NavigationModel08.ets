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
struct NavigationModel08 {
  private arr: number[] = [1,2,3,4,5,6,7,8,9]
  @State text: string = 'start'
  @State minContentWidth:number = 200
  @State currentIndex: number = 0
  @State strText: string = 'doing'
  build() {
    Column(){
      Navigation() {
        Column() {
          List({space:12}){
            ForEach(this.arr, (item: number) => {
              ListItem() {
                NavRouter(){
                  Text("NavRouter" + item)
                    .width('100%')
                    .height(60)
                    .backgroundColor('#FFFFFF')
                    .borderRadius(24)
                    .fontSize(16)
                    .fontWeight(1000)
                    .textAlign(TextAlign.Center)
                  NavDestination()
                    .backgroundColor(Color.Orange)
                    .title("NavDestinationTitle"+ item)
                }
              }
            },(item: number) => item.toString())
          }
          .width('80%')
          .margin({top:12})
        }
      }
      .mode(NavigationMode.Auto)
      .navBarWidthRange([100,300])
      .width(300)
      .height('60%')
      .minContentWidth(this.minContentWidth)
      .border({width: 1})
      .backgroundColor(Color.Pink)
      .onNavigationModeChange(() => {
        this.currentIndex ++
        this.strText =  'doing' + `${ this.currentIndex }`
      })
      Text(this.strText).fontWeight(700).fontSize(22).key('NavigationModel08Txt')
      Button('切换双栏').key('NavigationModel08But')
        .onClick(() => {
          this.minContentWidth = 100
        })
    }
    .border({width:1})
    .height('100%')
    .width('100%')
  }
}