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

  getAllPathName(): string[] {
    return super.getAllPathName()
  }
  pushAndReplace():void{
    super.pushPathByName('pageOne',new param('ok'))
    super.replacePathByName('pageTwo',new param('ok'))

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
struct NavPathStack20{
  derivedStack:DerivedNavPathStack = new DerivedNavPathStack()
  @State text1:string = ''

  @Builder
  pageMap(name:string){
    if (name == 'pageOne'){
      PageOne()
    }else if(name == 'pageTwo'){
      PageTwo()
    }else if(name == 'pageThree'){
      PageThree()
    }
  }

  build() {
    Navigation(this.derivedStack){
      Column(){
        Button('pushAndReplace').onClick((event: ClickEvent) => {
          this.derivedStack.pushAndReplace()
        }).id('NavPathStack20_btn1')

        Text(this.text1).id('NavPathStack20_text1')
        Button('getAllPathName').onClick((event: ClickEvent) => {
          this.text1 = '' + JSON.stringify(this.derivedStack.getAllPathName())
        }).id('NavPathStack20_btn2')

      }
    }
    .title('navigation')
    .navDestination(this.pageMap)
    .mode(NavigationMode.Split)
  }
}


@Component
struct  PageOne{
  derivedStack:DerivedNavPathStack = new DerivedNavPathStack()

  build() {
    NavDestination(){
      Column(){
        Text('pageOne').id('NavPathStack20_pageOne_text1')
      }
    }
    .title('pageOne')
  }
}

@Component
struct  PageTwo{
  derivedStack:DerivedNavPathStack = new DerivedNavPathStack()

  build() {
    NavDestination(){
      Column(){
        Text('pageTwo').id('NavPathStack20_pageTwo_text1')
      }
    }
    .title('pageTwo')
  }
}

@Component
struct  PageThree{
  derivedStack:DerivedNavPathStack = new DerivedNavPathStack()

  build() {
    NavDestination(){
      Column(){
        Text('pageThree').id('NavPathStack20_pageThree_text1')
      }
    }
    .title('pageThree')
  }
}
