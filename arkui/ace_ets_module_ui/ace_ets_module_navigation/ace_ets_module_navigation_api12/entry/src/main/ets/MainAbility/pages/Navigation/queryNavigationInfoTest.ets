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
import observer  from '@ohos.arkui.observer';

@Entry
@Component
struct queryNavigationInfoTest {
  @State str:string = ''
  @State pageInfos: NavPathStack = new NavPathStack();
  @State navIdValue: string | undefined = ''
  @State navPathStack: NavPathStack | undefined = undefined


  @Builder
  pageOneTmp() {
    NavDestination() {
      Column({ space: 10 }) {
        CustomCom({navIdValue:this.navIdValue, navPathStack:this.navPathStack})
        Button('push PageTwo')
          .onClick(()=>{
            this.navPathStack?.pushPath({ name: 'pageTwo' , param:'mes'})
          })
          .id('queryNavigationInfoTest_btn2')
      }
    }.title('pageOne')
  }

  @Builder
  pageTwoTmp() {
    NavDestination() {
      Column({ space: 10 }) {
        CustomCom({navIdValue:this.navIdValue, navPathStack:this.navPathStack})
        Text('pageTwo').id('queryNavigationInfoTest_text2')
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
      Text(this.navIdValue).id('queryNavigationInfoTest_text1')

      Navigation(this.pageInfos) {
        Column({space:10}) {

          Button('pushPath pageOne' ,)
            .onClick(() => {
              this.pageInfos.pushPath({ name: 'pageOne' , param:'mes'})
            })
            .id('queryNavigationInfoTest_btn1')
          Button('testQueryNavigationInfoUndefined')
            .onClick(()=>{
              let navInfo = this.queryNavigationInfo();
              if (navInfo == undefined) {
                console.log('queryNavigationInfoTest navInfo: ', JSON.stringify(navInfo))
              }
             AppStorage.setOrCreate('queryNavigationInfoUndefined', navInfo)
            })
            .id('testQueryNavigationInfoUndefinedId')
        }
      }
      .mode(NavigationMode.Stack)
      .id('queryNavigationInfoTest_navId')
      .title('NavIndex')
      .navDestination(this.PageMap)
    }

  }
}


@Component
struct CustomCom {
  navInfo: observer.NavigationInfo | undefined
  @Link navIdValue: string | undefined;
  @Link navPathStack: NavPathStack | undefined;

  build() {
    Column(){
      Button('queryNavigationInfo')
        .onClick(()=>{
          this.navInfo = this.queryNavigationInfo();
          this.navIdValue = this.navInfo?.navigationId
          this.navPathStack = this.navInfo?.pathStack
        })
    }.width('100%')
  }
}