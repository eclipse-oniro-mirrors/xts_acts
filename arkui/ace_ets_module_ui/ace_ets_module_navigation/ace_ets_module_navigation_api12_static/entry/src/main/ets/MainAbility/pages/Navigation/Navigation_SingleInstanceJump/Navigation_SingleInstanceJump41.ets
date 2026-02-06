'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,AnimateParam,Search,TextAlign,Axis,NavBarPosition,FlexAlign,NavPathInfo,NavDestinationContext,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,SearchController,NavigationOperation,PanGesture,
  Position,EffectType,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,TextOverflow,GestureEvent,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Visibility,NavigationCommonTitle,NavDestinationCommonTitle,Alignment,BarStyle,LaunchMode
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct Navigation_SingleInstanceJump41{
  pathInfos:NavPathStack  = new NavPathStack()
  @State count:number = 1
  @State text:string = ''


  update():void{
    let name:string[] = this.pathInfos.getAllPathName()
    for (let i = 0; i < name.length; i++) {
      if (!this.pathInfos.getParamByIndex(i)) {
        this.text += ` ${name[i]},Param:undefined`
      }else{
        this.text += `${name[i]},Param:${JSON.stringify(this.pathInfos.getParamByIndex(i))} `
      }
    }
  }


  @Builder Page1(){
    NavDestination(){
      Column(){
        Text('page1')
      }
    }
    .title('page1')

  }
  @Builder Page2(){
    NavDestination(){
      Column(){
        Text('page1')
      }
    }.title('page1')
  }

  @Builder PageMap(name:string){
    if (name == 'page1'){
      this.Page1()
    }else if (name == 'page2'){
      this.Page2()
    }
  }
  build() {
    Column(){
      Navigation(this.pathInfos){


      }
      .title('navigation',{
        barStyle:BarStyle.STACK
      })
      .height(300)
      .navDestination(this.PageMap)

      Button('replacePath page1').onClick((event: ClickEvent) => {
        this.pathInfos.replacePath(new NavPathInfo('page1',this.count++),{launchMode:LaunchMode.MOVE_TO_TOP_SINGLETON})
      }).id('Navigation_SingleInstanceJump41_btn1')
      Button('replacePath page2').onClick((event: ClickEvent) => {
        this.pathInfos.replacePath(new NavPathInfo('page2',this.count++),{launchMode:LaunchMode.MOVE_TO_TOP_SINGLETON})
      }).id('Navigation_SingleInstanceJump41_btn2')
      Text(this.text).id('Navigation_SingleInstanceJump41_text1')
      Button('getAll').onClick((e: ClickEvent) => {
        this.text = ''
        this.update()
      }).id('Navigation_SingleInstanceJump41_btn3')

    }
  }
}