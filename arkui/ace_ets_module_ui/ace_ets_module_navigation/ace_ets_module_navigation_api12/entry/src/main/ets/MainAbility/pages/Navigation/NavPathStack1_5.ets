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

  pushDestination(info: NavPathInfo): Promise<void>
  pushDestination(info: NavPathInfo, animated?: boolean): Promise<void>
  pushDestination(info: NavPathInfo, animated?: boolean): Promise<void> {
    return super.pushDestination(info,animated)
  }

  pushDestinationByName1(name: string, param: Object, animated?: boolean ): Promise<void>{
    return super.pushDestinationByName(name,param,animated)
  }
  pushDestinationByName2(name: string, param: Object,onPop:Callback<PopInfo> , animated?: boolean ): Promise<void>{
    return super.pushDestinationByName(name,param,onPop,animated)
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
struct NavPathStack1_5{
  derivedStack:DerivedNavPathStack = new DerivedNavPathStack()

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
        Button('pushPath pageOne').onClick((event: ClickEvent) => {
          this.derivedStack.pushPath({name:'pageOne'})
        }).id('NavPathStack1_5_btn1')

        Button('pushPathByName pageTwo').onClick((event: ClickEvent) => {
          this.derivedStack.pushPathByName1('pageTwo',new param('ok'))
        }).id('NavPathStack1_5_btn2')

        Button('pushPathByName(onPop) pageThree').onClick((event: ClickEvent) => {
          this.derivedStack.pushPathByName2('pageThree',new param('ok'),(popInfo) => {
            console.log(popInfo.info.name)
          })
        }).id('NavPathStack1_5_btn3')

        Button('pushDestination pageOne').onClick((event: ClickEvent) => {
          this.derivedStack.pushDestination({name:'pageOne'})
        }).id('NavPathStack1_5_btn4')

        Button('pushDestinationByName pageOne').onClick((event: ClickEvent) => {
          this.derivedStack.pushDestinationByName1('pageOne',new param('ok'))
        }).id('NavPathStack1_5_btn5')

        Button('pushDestinationByName(onPop) pageOne').onClick((event: ClickEvent) => {
          this.derivedStack.pushDestinationByName2('pageOne',new param('ok'),(popInfo) => {
            console.log(popInfo.info.name)
          })
        }).id('NavPathStack1_5_btn6')
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
        Text('pageOne').id('NavPathStack1_5_pageOne_text1')
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
        Text('pageTwo').id('NavPathStack1_5_pageTwo_text1')
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
        Text('pageThree').id('NavPathStack1_5_pageThree_text1')
      }
    }
    .title('pageThree')
  }
}
