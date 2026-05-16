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
struct NavDestinationEvents {
  @State str1:string = ''
  @State str2:string = ''
  @State pageInfos: NavPathStack = new NavPathStack();

  @Builder
  pageOneTmp() {
    NavDestination() {
      Column({ space: 10 }) {
        Button('pop')
          .onClick(() => {
            this.pageInfos.pop()
          })
          .id('NavDestinationEvents_pop')
      }
    }.title('pageOne')
    .onWillAppear(()=>{
      this.str1 = 'onWillAppear'
    })
    .onWillDisappear(()=>{
      this.str2 = 'onWillDisappear'
    })
  }


  @Builder
  PageMap(name: string, param:Object) {
    if (name === 'pageOne') {
      this.pageOneTmp()
    }
  }

  build() {
    Column({space:5}){
      Text(this.str1).id('NavDestinationEvents_text1')
      Text(this.str2).id('NavDestinationEvents_text2')


      Navigation(this.pageInfos) {
        Column({space:10}) {
          Button('pushPath pageOne' ,)
            .onClick(() => {
              this.pageInfos.pushPath({ name: 'pageOne'})
            })
            .id('NavDestinationEvents_pageOne')
        }
      }
      .title('NavIndex')
      .navDestination(this.PageMap)
    }

  }
}
