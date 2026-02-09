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
struct NavigationLevelTest2 {
  @State message:string = 'NavBar'
  @State pageInfos: NavPathStack = new NavPathStack();

  @Builder
  pageOneTmp() {
    NavDestination() {
      Column({ space: 10 }) {
        Button('pop(false)')
          .onClick(()=>{
            let popFalseResult: NavPathInfo | undefined = this.pageInfos.pop(false)
            console.log('NavigationLevelTest2 popFalseResult: ', popFalseResult)
            AppStorage.setOrCreate('popFalseResult', popFalseResult)
          })
          .id('NavigationLevelTest2_btn2')
          .height('10%')
        Button('pop2(false)')
          .onClick(()=>{
            let popFalseResult2: NavPathInfo | undefined = this.pageInfos.pop({name: 'test'}, false)
            console.log('NavigationLevelTest2 popFalseResult2: ', popFalseResult2)
            AppStorage.setOrCreate('popFalseResult2', popFalseResult2)
          })
          .id('pop2FalseBtn')
          .height('10%')
      }
    }.title('pageOne')
  }

  @Builder
  pageTwoTmp() {
    NavDestination() {
      Column({ space: 10 }) {
        Text('pageTwo')
      }
    }.title('pageTwo')
  }

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      this.pageOneTmp()
    } else if (name === 'pageTwo') {
      this.pageTwoTmp()
    }
  }

  build() {
    Column({space:5}){
      Navigation(this.pageInfos) {
        Column({space:10}) {
          Text(this.message).id('NavigationLevelTest2_text1')
          .height('10%')

          Button('pushPath pageOne')
            .onClick(() => {
              this.pageInfos.pushPath({ name: 'pageOne' , param:'mes'})
            })
            .id('NavigationLevelTest2_btn1')
            .height('10%')
          Button('pop(true)')
            .onClick(()=>{
              let popResult = this.pageInfos.pop(true)
              console.log('NavigationLevelTest2 popResult: ', popResult)
              AppStorage.setOrCreate('popResult', popResult)
            })
            .id('popTrueBtn2')
            .height('10%')
          Button('pop2(true)')
            .onClick(()=>{
              let pop2Result = this.pageInfos.pop({name: 'test'}, true)
              console.log('NavigationLevelTest2 popResult: ', pop2Result)
              AppStorage.setOrCreate('pop2Result', pop2Result)
            })
            .id('pop2TrueBtn2')
            .height('10%')
        }
      }
      .mode(NavigationMode.Stack)
      .title('NavIndex')
      .navDestination(this.PageMap)
    }

  }
}

