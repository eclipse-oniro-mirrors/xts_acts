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
struct NavigationLevelTest16 {
  @State message:string = ''
  @State pageInfos: NavPathStack = new NavPathStack();

  @Builder
  pageOneTmp() {
    NavDestination() {
      Column({ space: 10 }) {
        Button('pushPath pageTwo')
          .onClick(() => {
            this.pageInfos.pushPath({ name: 'pageTwo' , param:'push pageTwo with animation'})
          })
          .id('NavigationLevelTest16_btn2')
      }
    }.title('pageOne')
  }

  @Builder
  pageTwoTmp() {
    NavDestination() {
      Column({ space: 10 }) {
        Button('get')
          .onClick(() => {
            this.message = 'getAllPathName:' + JSON.stringify(this.pageInfos.getAllPathName())
              + ';getParamByIndex:' + this.pageInfos.getParamByIndex(1)
              + ';getParamByName:' + JSON.stringify(this.pageInfos.getParamByName('pageTwo'))
              + ';getIndexByName:' + JSON.stringify(this.pageInfos.getIndexByName('pageOne'))
              + ';size:' + this.pageInfos.size()
          })
          .id('NavigationLevelTest16_btn3')
          .height('10%')
        Button('getParamByName')
          .onClick(() => {
            let paramByName: ESObject[] = this.pageInfos.getParamByName('pageTwo')
            let indexByName: number[] = this.pageInfos.getIndexByName('pageTwo')
            console.log('NavigationLevelTest16 paramByName length: ',  paramByName?.length)
            console.log('NavigationLevelTest16 indexByName length: ',  indexByName?.length)
            AppStorage.setOrCreate('paramByName', paramByName)
            AppStorage.setOrCreate('indexByName', indexByName)
          })
          .id('getParamByNameBtn')
          .height('10%')
        Button('getPathStack')
          .onClick(() => {
            let stackValue: NavPathInfo[] = this.pageInfos.getPathStack()
            console.log('NavigationLevelTest16 stackValue: ', stackValue?.length)
            AppStorage.setOrCreate('stackValue', stackValue)
          })
          .id('getPathStackBtn')
          .height('10%')
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
      Text(this.message).id('NavigationLevelTest16_text1')
      Navigation(this.pageInfos) {
        Column({space:3}) {
          Button('pushPath pageOne')
            .onClick(() => {
              this.pageInfos.pushPath({ name: 'pageOne' , param:'mes'})
            })
            .id('NavigationLevelTest16_btn1')
            .height('10%')
          Button('getParamByNameUndefined')
            .onClick(() => {
              let paramByNameUndefined: ESObject[] = this.pageInfos.getParamByName('pageTwo')
              console.log('NavigationLevelTest16 indexByNameUndefined: ', paramByNameUndefined?.length)
              AppStorage.setOrCreate('paramByNameUndefined', paramByNameUndefined)
            })
            .id('getParamByNameUndefinedBtn')
            .height('10%')
          Button('getIndexByNameUndefined')
            .onClick(() => {
              let indexByNameUndefined: number[] = this.pageInfos.getIndexByName('pageTwo')
              console.log('NavigationLevelTest16 indexByNameUndefined: ', indexByNameUndefined?.length)
              AppStorage.setOrCreate('indexByNameUndefined', indexByNameUndefined)
            })
            .id('getIndexByNameUndefinedBtn')
            .height('10%')

          Button('getParentNull')
            .onClick(() => {
              let parentValue = this.pageInfos.getParent()
              console.log('NavigationLevelTest16 getParentNull: ', parentValue)
              AppStorage.setOrCreate('parentValue', parentValue)
            })
            .id('getParentNullBtn')
            .height('10%')
          Button('getPathStackNull')
            .onClick(() => {
              let stackEmptyValue: NavPathInfo[] = this.pageInfos.getPathStack()
              console.log('NavigationLevelTest16 stackEmptyValue: ', stackEmptyValue?.length)
              AppStorage.setOrCreate('stackEmptyValue', stackEmptyValue)
            })
            .id('getPathStackNullBtn')
            .height('10%')
        }
      }
      .mode(NavigationMode.Stack)
      .title('NavIndex')
      .navDestination(this.PageMap)
    }

  }
}