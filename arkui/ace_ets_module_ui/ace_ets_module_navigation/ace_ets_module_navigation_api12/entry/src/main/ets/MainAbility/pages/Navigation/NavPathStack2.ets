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

  pop(animated?: boolean | undefined): NavPathInfo | undefined
  pop(result: Object, animated?: boolean | undefined): NavPathInfo | undefined
  pop(result?: Object | undefined, animated?: boolean | undefined): NavPathInfo | undefined {
    return super.pop(result,animated)
  }

  popToName(name: string, animated?: boolean): number
  popToName(name: string, result: Object, animated?: boolean): number
  popToName(name: string, result?: Object , animated?: boolean): number {
    return super.popToName(name,result,animated)
  }

  popToIndex(index: number, animated?: boolean): void
  popToIndex(index: number, result: Object, animated?: boolean): void
  popToIndex(index: number, result?: Object, animated?: boolean): void {
    return super.popToIndex(index,result,animated)
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
struct NavPathStack2{
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
        Text('navigation').id('NavPathStack2_text1')

        Button('pushPath pageOne').onClick((event: ClickEvent) => {
          this.derivedStack.pushPath({name:'pageOne'})
        }).id('NavPathStack2_btn1')

        Button('pushPathByName pageTwo').onClick((event: ClickEvent) => {
          this.derivedStack.pushPathByName1('pageTwo',new param('ok'))
        }).id('NavPathStack2_btn2')

        Button('pushPathByName(onPop) pageThree').onClick((event: ClickEvent) => {
          this.derivedStack.pushPathByName2('pageThree',new param('ok'),(popInfo) => {
            console.log(popInfo.info.name)
          })
        }).id('NavPathStack2_btn3')

        Button('pushDestination pageOne').onClick((event: ClickEvent) => {
          this.derivedStack.pushDestination({name:'pageOne'})
        }).id('NavPathStack2_btn4')

        Button('pushDestinationByName pageOne').onClick((event: ClickEvent) => {
          this.derivedStack.pushDestinationByName1('pageOne',new param('ok'))
        }).id('NavPathStack2_btn5')

        Button('pushDestinationByName(onPop) pageOne').onClick((event: ClickEvent) => {
          this.derivedStack.pushDestinationByName2('pageOne',new param('ok'),(popInfo) => {
            console.log(popInfo.info.name)
          })
        }).id('NavPathStack2_btn6')

        Button('pop').onClick((event: ClickEvent) => {
          let mes = this.derivedStack.pop()
          if (mes){
            console.log(JSON.stringify(mes))
          }
        }).id('NavPathStack2_btn7')

        Button('pop(result)').onClick((event: ClickEvent) => {
          let mes = this.derivedStack.pop(new param('pop ok'),true)
          if (mes){
            console.log(JSON.stringify(mes))
          }
        }).id('NavPathStack2_btn8')

        Button('popToName pageOne').onClick((event: ClickEvent) => {
          let mes = this.derivedStack.popToName('pageOne')
          console.log('' + mes)
        }).id('NavPathStack2_btn9')

        Button('popToName(result) pageOne').onClick((event: ClickEvent) => {
          let mes = this.derivedStack.popToName('pageOne',new param('pop ok'))
          console.log('' + mes)
        }).id('NavPathStack2_btn10')

        Button('popToIndex 0').onClick((event: ClickEvent) => {
          this.derivedStack.popToIndex(0)
        }).id('NavPathStack2_btn11')

        Button('popToIndex(result) 0').onClick((event: ClickEvent) => {
          this.derivedStack.popToIndex(0,new param('pop ok'))
        }).id('NavPathStack2_btn12')
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
        Text('pageOne').id('NavPathStack2_pageOne_text1')
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
        Text('pageTwo').id('NavPathStack2_pageTwo_text1')
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
        Text('pageThree').id('NavPathStack2_pageThree_text1')
      }
    }
    .title('pageThree')
  }
}
