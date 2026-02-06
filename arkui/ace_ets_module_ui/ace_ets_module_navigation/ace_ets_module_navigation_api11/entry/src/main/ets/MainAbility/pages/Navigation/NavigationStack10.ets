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
class T10 {
  names: string = ""
  values: NavPathStack | null = null
}
@Entry
@Component
struct NavigationStack10 {
  private arr: number[] = [1,2,3]
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  @State isShow:boolean = false
  @State isShow2:boolean = false
  @State bool: boolean = false
  @State text: string = 'start'
  @State flagBlur: string = 'BlurStart'
  @State flagFocus: string = 'FocusStart'
  @State getText: string = ''
  @Builder
  pageOneTmp(info: T10) {
    NavDestination() {
      Column() {
        Button('pageOneTmp', { stateEffect: true, type: ButtonType.Capsule }).id('NavigationStack10pageOneTmpbut10')
          .width('80%')
          .height(40)
          // .margin(20)
          .onClick(() => {
            (info.values as NavPathStack).pushPathByName('pageTwo', null)
          })
      }.width('100%').height('100%')
    }.title('pageOne')
  }
  @Builder
  pageTwoTmp(info: T10) {
    NavDestination() {
      Column() {
        Button('pageTwoTmp', { stateEffect: true, type: ButtonType.Capsule }).id('NavigationStack10pageTwoTmpbut10')
          .width('80%')
          .height(40)
          .onClick(() => {
            (info.values as NavPathStack).pushPathByName('pageOne', null)
          })
      }.width('100%').height('100%')
    }.title('pageTwo')
  }
  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      this.pageOneTmp({ names: name, values: this.pageInfos })
    } else if (name === 'pageTwo') {
      this.pageTwoTmp({ names: name, values: this.pageInfos })
    }
  }
  @Builder myBuilder2() {
    Column() {
      Button("close modal 2")
      // .margin(10)
        .fontSize(20)
        .onClick(()=>{
          this.isShow2 = false;
        })
    }
    .width('100%')
    .height('100%')
  }
  @Builder myBuilder() {
    Column() {
      Button("transition modal 2")
        .fontSize(20)
        .onClick(()=>{
          this.isShow2 = true;
        }).bindContentCover(this.isShow2, this.myBuilder2(), {modalTransition: ModalTransition.DEFAULT, backgroundColor: Color.Pink, onAppear: () => {console.log("BindContentCover onAppear.")}, onDisappear: () => {console.log("BindContentCover onDisappear.")}})
      Button("close modal 1")
        .fontSize(20)
        .onClick(()=>{
          this.isShow = false;
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
  build() {
    Scroll() {
      Column() {
        Navigation(this.pageInfos) {
          Column() {
            Button('pushPath', { stateEffect: true, type: ButtonType.Capsule }).id('NavigationStack10pushPathbut')
              .width('80%')
              .height(40)
              .onClick(() => {
                this.pageInfos.pushPath({ name: 'pageOne' }) //将name指定的NavDestination页面信息入栈
              })
          }
        }
        .navDestination(this.PageMap)
        .height('60%')
        .title('NavIndex')
        .titleMode(NavigationTitleMode.Mini)
        .mode(NavigationMode.Stack)
        .hideNavBar(this.bool)
        .navBarWidth(260)
        .minContentWidth(300)
        .navBarWidthRange([200,400])
        .border({width: 1})
        .height('50%')
        .width('100%')
        .backgroundColor(Color.Pink)
        .bindContentCover(this.isShow, this.myBuilder(), {modalTransition: ModalTransition.NONE, backgroundColor: Color.Pink, onAppear: () => {console.log("BindContentCover onAppear.")}, onDisappear: () => {console.log("BindContentCover onDisappear.")}})
        Text(this.getText).id('NavigationStack10getText').fontWeight(700)
        Text(this.flagBlur).id('NavigationStack10Blur').fontWeight(700)
        Text(this.flagFocus).id('NavigationStack10Focus').fontWeight(700)
        Button('YCDHL')
          .id('NavigationStack10True')
          .onClick(() => {
            this.bool = true
          }).height('5%')
        Button('CZ').id('NavigationStack10CZ')
          .onClick(() => {
            this.bool = false
            this.isShow = false
            this.isShow2 = false
            this.bool = false
            this.text = 'start'
            this.flagBlur = 'BlurStart'
            this.flagFocus = 'FocusStart'
            this.pageInfos.clear()
          }).height('5%')
        Button('get').id('NavigationStack10get')
          .onClick(() => {
            this.getText = JSON.stringify(this.pageInfos.getAllPathName()?.length)
          }).height('5%')
        Button('getEmptyAllPathName').id('getEmptyAllPathName')
          .onClick(() => {
            let emptyAllPathNameValue: String[] = this.pageInfos.getAllPathName()
            console.log('emptyAllPathNameValue ', emptyAllPathNameValue?.length )
            AppStorage.setOrCreate('emptyAllPathName', emptyAllPathNameValue)
          }).height('5%')
      }
      .border({width:1})
      .width('100%')
      .height('85%')
    }
  }
}