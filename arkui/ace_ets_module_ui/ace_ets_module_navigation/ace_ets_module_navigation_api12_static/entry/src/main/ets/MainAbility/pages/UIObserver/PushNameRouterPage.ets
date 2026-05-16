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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,PopInfo,HorizontalAlign,AnimateParam,Search,TextAlign,Axis,NavBarPosition,FlexAlign,NavPathInfo,NavDestinationContext,
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
import { Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { BusinessError } from '@ohos.base';
interface Data2 {
  data3: int[]
}
interface Param {
  data1: string,
  data2: Data2
}
@Entry({routeName:'pushNameRouter'})
@Component
struct PushNameRouterPage {
   routePage:() => void = () => {
     console.log('+++++++++++++++++++++++++++1');
    const uiContext = this.getUIContext();
    if (uiContext && uiContext.getRouter()) {
      console.log('+++++++++++++++++++++++++++2');
      uiContext.getRouter().pushNamedRoute({
        name: 'pushNameRouter',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as Param,
        recoverable: false
      } as router.NamedRouterOptions,
        (err: BusinessError|null): void => {  //没走这里
        console.log('+++++++++++++++++++++++++++2.1');
        if (err) {
          let message = (err as BusinessError).message;
          let code = (err as BusinessError).code;
          console.error(`pushNamedRoute failed, code is ${code}, message is ${message}`);
          return;
        }
        console.info('pushNamedRoute success');
        AppStorage.setOrCreate<string>('PushNameRouterPage_pushNamedRoute', 'success') //没走到这里
      })
      console.log('+++++++++++++++++++++++++++3');
    }else {
      console.error('UIContext or Router is undefined');
    }

  }

  aboutToAppear(): void {
    let myParams = this.getUIContext().getRouter().getParams()
    if (myParams){
      console.info('getParams success');
      AppStorage.setOrCreate<string>('PushNameRouterPage_aboutToAppear', 'success')
    }
  }

  build() {
    Column(){
      Row(){
        Button('Push').onClick((e: ClickEvent)=>{
          console.log('+++++++++++++++++++++++++++4');
          this.routePage()
          console.log('+++++++++++++++++++++++++++5');
        }).id('PushNameRouter_btn_push')
      }.height(44).width('100%').margin({bottom:20} as Margin)
    }.alignItems(HorizontalAlign.Center).width('100%')
  }
}