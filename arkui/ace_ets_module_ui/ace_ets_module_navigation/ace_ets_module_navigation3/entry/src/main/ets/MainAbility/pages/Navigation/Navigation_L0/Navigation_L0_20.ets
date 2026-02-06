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

@Entry
@Component
struct Navigation_L0_20 {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack();
  @State text1:string = ''

  @Builder PageMap(name:string){
    if (name === 'pageOne'){
      Navigation_L0_20_pageOne()
    }else if (name === 'pageTwo'){
      Navigation_L0_20_pageTwo({text1:this.text1})
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Button('pushPath pageOne').onClick((event: ClickEvent) => {
        this.pageInfos.pushPath({name:'pageOne'},true)
      }).id('Navigation_L0_20_btn1')
      Text(this.text1).id('Navigation_L0_20_text1')
    }
    .navDestination(this.PageMap)
    .height('100%')
    .width('100%')
    .title('navigation')
    .mode(NavigationMode.Split)
    .navBarWidth('30%')
  }
}


@Component
struct Navigation_L0_20_pageOne{
  @Consume('pageInfos') pageInfos: NavPathStack;
  build() {
    NavDestination(){
      Button('pushPath pageTwo').onClick((event: ClickEvent) => {
        this.pageInfos.pushPath({
          name:'pageTwo',
        },true);
      }).id('Navigation_L0_20_pageOne_btn1')



    }.title('pageOne')
  }
}
@Component
struct Navigation_L0_20_pageTwo{
  @Consume('pageInfos') pageInfos: NavPathStack;
  @Link text1:string;
  build() {
    NavDestination(){
      Button('popToName').onClick((event: ClickEvent) => {
        this.text1 = '' + this.pageInfos.popToName('pageOne',true);
      }).id('Navigation_L0_20_pageTwo_btn1')

    }.title('pageTwo')
  }
}

