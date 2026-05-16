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
struct Navigation_L0_9 {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack();

  @Builder PageMap(name:string){
    if (name === 'pageOne'){
      Navigation_L0_9_pageOne()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Button('pushPath pageOne').onClick((event: ClickEvent) => {
        this.pageInfos.pushDestination({name:'pageOne'})
      }).id('Navigation_L0_9_btn1')
    }
    .navDestination(this.PageMap)
    .height('100%')
    .width('100%')
    .title('navigation')
    .mode(NavigationMode.Split)
  }
}


@Component
struct Navigation_L0_9_pageOne{
  @Consume('pageInfos') pageInfos: NavPathStack;
  build() {
    NavDestination(){
      Text('pageOne').id('Navigation_L0_9_pageOne_text1')
    }.title('pageOne')
    .mode(NavDestinationMode.DIALOG)
  }
}
