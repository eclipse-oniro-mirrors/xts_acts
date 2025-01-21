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
struct NavigationApi3 {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()

  @State text1: string = '11'
  @State text2: string = '22'
  @State text3: string = '33'

  @Builder pageOneTmp3() {
    NavDestination() {
      Column({space:10}) {
        Text('pageOne')

        Button('Next')
          .width('80%')
          .height(40)
          .onClick(() => {
            this.pageInfos.pushPath({name:'pageTwo', })
          })
          .id('NavigationApi3_pushPathPageTwo')
        

      }.width('100%').height('100%')
    }.title('pageOne')
    .mode(NavDestinationMode.STANDARD)
    .onShown(()=>{
      this.text1 = 'pageOnw onShown'
    })
    .onHidden(()=>{
      this.text1 = 'pageOne onHidden'
    })
    .onBackPressed(() => {
      this.pageInfos.pop()
      return true
    })
  }

  @Builder pageTwoTmp3() {
  NavDestination() {
    Column({space:5}) {

      Text('pageTwo')

      Button('Next')
        .width('80%')
        .height(40)
        .onClick(() => {
          this.pageInfos.pushPath({name:'pageThree', })
        })
        .id('NavigationApi3_pushPathPageThree')


    }.width('100%').height('100%')
  }.title('pageTwo')
  .mode(NavDestinationMode.STANDARD)
  .onShown(()=>{
    this.text2 = 'pageTwo onShown'
  })
  .onHidden(()=>{
    this.text2 = 'pageTwo onHidden'
  })
  .onBackPressed(() => {
    this.pageInfos.pop()
    return true
  })
}

  @Builder pageThreeTmp3() {
    NavDestination() {
      Column({space:5}) {

        Text('pageThree')

      }.width('100%').height('100%')
    }.title('pageThree')
    .mode(NavDestinationMode.DIALOG)
    .onShown(()=>{
      this.text3 = 'pageThree onShown'
    })
    .onHidden(()=>{
      this.text3 = 'pageThree onHidden'
    })
    .onBackPressed(() => {
      this.pageInfos.pop()
      return true
    })
  }


  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      this.pageOneTmp3()
    } else if (name === 'pageTwo') {
      this.pageTwoTmp3()
    } else if (name === 'pageThree') {
      this.pageThreeTmp3()
    }
  }

  build() {
    Column({space:20}){
      Column({space:10}){
        Text(this.text1).id('NavigationApi3_text1')
        Text(this.text2).id('NavigationApi3_text2')
        Text(this.text3).id('NavigationApi3_text3')
      }.width('80%').borderWidth(1).margin({top:20})

      Navigation(this.pageInfos) {
        Column() {
          Button('pushPath', { stateEffect: true, type: ButtonType.Capsule })
            .width('80%')
            .height(40)
            .onClick(() => {
              this.pageInfos.pushPath({ name: 'pageOne' })
            })
            .id('NavigationApi3_pushPathPageOne')
        }
      }.title('NavIndex').navDestination(this.PageMap)
    }.width('100%')

  }
}
