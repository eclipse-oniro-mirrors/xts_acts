/*
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
import { Callback } from '@ohos.base'
class DerivedNavPathStack extends NavPathStack{
  id:string = '__default__'
  setId(id:string){
    this.id = id
  }
  getInfo():string{
    return "this page used Derived navPathStack,id:" + this.id
  }


  pushPath(info:NavPathInfo):void
  pushPath(info: NavPathInfo, animated?: boolean): void
  pushPath(info: NavPathInfo, animated?: boolean): void {
    super.pushPath(info,animated)
  }
  pushPathByName1(name: string, param: ESObject, animated?: boolean | undefined): void{
    super.pushPathByName(name,param,animated)
  }
  pushPathByName2(name: string, param: ESObject, onPop:Callback<PopInfo> , animated?: boolean | undefined): void{
    super.pushPathByName(name,param,onPop,animated)
  }
  moveToTop(name: string, animated?: boolean): number {
    return super.moveToTop(name,animated)
  }
  replacePath(info: NavPathInfo): void
  replacePath(info: NavPathInfo, animated?: boolean): void
  replacePath(info: NavPathInfo, animated?: boolean): void {
    return super.replacePath(info,animated)
  }

}
class param{
  info:string = 'default_param'

  constructor(info:string) {
    this.info= info
  }
}

@Entry
@Component
struct NavPathStack24{
  derivedStack:DerivedNavPathStack = new DerivedNavPathStack()
  @State text1:string = ''

  @Builder
  PageOne(){
    NavDestination(){
      Column(){
        Text('pageOne').id('NavPathStack2_pageOne_text1')
      }
    }
    .title('pageOne')
    .onWillAppear(() => {
      this.text1 += 'pageOne onWillAppear' + ' '
    })
    .onAppear(() => {
      this.text1 += 'pageOne onAppear' + ' '
    })
    .onWillShow(() => {
      this.text1 += 'pageOne onWillShow' + ' '
    })
    .onShown(() => {
      this.text1 += 'pageOne onShown' + ' '
    })
    .onWillHide(() => {
      this.text1 += 'pageOne onWillHide' + ' '
    })
    .onHidden(() => {
      this.text1 += 'pageOne onHidden' + ' '
    })
    .onWillDisappear(() => {
      this.text1 += 'pageOne onWillDisappear' + ' '
    })
    .onDisAppear(() => {
      this.text1 += 'pageOne onDisAppear' + ' '
    })
  }

  @Builder
  PageTwo(){
    NavDestination(){
      Column(){
        Text('pageTwo').id('NavPathStack2_pageOne_text1')
      }
    }
    .title('pageTwo')
    .onWillAppear(() => {
      this.text1 += 'pageTwo onWillAppear' + ' '
    })
    .onAppear(() => {
      this.text1 += 'pageTwo onAppear' + ' '
    })
    .onWillShow(() => {
      this.text1 += 'pageTwo onWillShow' + ' '
    })
    .onShown(() => {
      this.text1 += 'pageTwo onShown' + ' '
    })
    .onWillHide(() => {
      this.text1 += 'pageTwo onWillHide' + ' '
    })
    .onHidden(() => {
      this.text1 += 'pageTwo onHidden' + ' '
    })
    .onWillDisappear(() => {
      this.text1 += 'pageTwo onWillDisappear' + ' '
    })
    .onDisAppear(() => {
      this.text1 += 'pageTwo onDisAppear' + ' '
    })
  }

  @Builder
  PageThree(){
    NavDestination(){
      Column(){
        Text('pageThree').id('NavPathStack2_pageOne_text1')
      }
    }
    .title('pageThree')
    .onWillAppear(() => {
      this.text1 += 'pageThree onWillAppear' + ' '
    })
    .onAppear(() => {
      this.text1 += 'pageThree onAppear' + ' '
    })
    .onWillShow(() => {
      this.text1 += 'pageThree onWillShow' + ' '
    })
    .onShown(() => {
      this.text1 += 'pageThree onShown' + ' '
    })
    .onWillHide(() => {
      this.text1 += 'pageThree onWillHide' + ' '
    })
    .onHidden(() => {
      this.text1 += 'pageThree onHidden' + ' '
    })
    .onWillDisappear(() => {
      this.text1 += 'pageThree onWillDisappear' + ' '
    })
    .onDisAppear(() => {
      this.text1 += 'pageThree onDisAppear' + ' '
    })
  }


  @Builder
  pageMap(name:string){
    if (name == 'pageOne'){
      this.PageOne()
    }else if(name == 'pageTwo'){
      this.PageTwo()
    }else if(name == 'pageThree'){
      this.PageThree()
    }
  }

  build() {
    Navigation(this.derivedStack){
      Scroll(){
        Column(){
          Text(this.text1).id('NavPathStack24_text1')
          Button('pushPath pageOne').onClick((event: ClickEvent) => {
            this.derivedStack.pushPath({name:'pageOne'})
          }).id('NavPathStack24_btn1')
          Button('pushPathByName pageTwo').onClick((event: ClickEvent) => {
            this.derivedStack.pushPathByName1('pageTwo',new param('ok'))
          }).id('NavPathStack24_btn2')
          Button('moveToTop pageOne').onClick((event: ClickEvent) => {
            this.derivedStack.moveToTop('pageOne')
          }).id('NavPathStack24_btn3')
          Button('replacePath pageTwo').onClick((event: ClickEvent) => {
            this.derivedStack.replacePath({name:'pageTwo',param:new param('ok')})
          }).id('NavPathStack24_btn4')

        }
      }.height('100%')

    }
    .title('navigation')
    .navDestination(this.pageMap)
    .mode(NavigationMode.Split)
  }
}




