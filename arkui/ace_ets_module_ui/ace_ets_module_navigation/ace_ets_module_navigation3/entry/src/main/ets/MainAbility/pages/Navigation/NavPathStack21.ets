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

  getParent(): NavPathStack | null {
    return super.getParent()
  }
}


@Entry
@Component
struct NavPathStack21{
  derivedStack:DerivedNavPathStack = new DerivedNavPathStack()
  faStack:NavPathStack = new NavPathStack()
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
    Navigation(this.faStack){
      Column(){
        Button('父navigation push pageOne').onClick((event: ClickEvent) => {
          this.faStack.pushPath({name:'pageOne'})
        }).id('NavPathStack21_btn1')
        Text(this.text1).id('NavPathStack21_text1')
        Button('子navigation getParent且清除Navigation的路由栈').onClick((event: ClickEvent) => {
          let stack = this.derivedStack.getParent()
          if (stack){
            stack.clear()
            this.text1 = '' + this.faStack.size()
          }
        }).id('NavPathStack21_btn2')

      }
      Navigation(this.derivedStack){

      }.navDestination(this.pageMap)
    }
    .title('navigation')
    .navDestination(this.pageMap)
    .mode(NavigationMode.Split)
	.navBarWidth('30%')
  }
}


@Component
struct  PageOne{
  derivedStack:DerivedNavPathStack = new DerivedNavPathStack()

  build() {
    NavDestination(){
      Column(){
        Text('pageOne').id('NavPathStack21_pageOne_text1')
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
        Text('pageTwo').id('NavPathStack21_pageTwo_text1')
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
        Text('pageThree').id('NavPathStack21_pageThree_text1')
      }
    }
    .title('pageThree')
  }
}
