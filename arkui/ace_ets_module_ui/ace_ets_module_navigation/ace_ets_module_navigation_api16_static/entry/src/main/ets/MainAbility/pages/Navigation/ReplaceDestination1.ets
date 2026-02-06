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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,Curve,PopInfo,HorizontalAlign,AnimateParam,NavDestinationTransition,Search,TextAlign,Axis,NavBarPosition,FlexAlign,NavPathInfo,NavDestinationContext,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,SearchController,NavigationOperation,PanGesture,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,TextOverflow,GestureEvent,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Visibility,NavigationCommonTitle,NavDestinationCommonTitle,Alignment,BarStyle,LaunchMode
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide,Consume
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct ReplaceDestination1 {
  @Provide({alias:'pageInfos'}) pageInfos: NavPathStack = new NavPathStack()
  @State code100006: string = '';

  @Builder
  pageMap(name: string) {
    if (name == 'pageOne') {
      PageOne()
    } else if (name == 'pageThree') {
      PageThree()
    } else if (name == 'pageFour') {
      PageFour()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column({space: '5vp'} as ColumnOptions) {
        Text(this.code100006).id('id06').height('5%')
        Button('push pageTwo').id('pageOneId').onClick((e: ClickEvent) => {
          console.log('[replaceDestination pageOne] start')
          this.pageInfos.replaceDestination(new NavPathInfo('pageTwo',null))
            .then(() => {
              console.log('[replaceDestination pageOne] success')
            })
            .catch((error: Error) => {
              this.code100006 = error.code + '';
              console.log(`[replaceDestination pageOne] failed, error code ${error.code}`)
            })
        }).height('10%')

        // Button('push undefined').id('undefinedId').onClick((e: ClickEvent) => {
        //   this.pageInfos.replaceDestination(undefined)
        //     .then(() => {
        //       console.log('[replaceDestination pageOne] success')
        //     })
        //     .catch((error: Error) => {
        //       this.code100006 = error.code + '';
        //       console.log(`[replaceDestination undefined] failed, error code ${error.code}`)
        //     })
        // }).height('10%')

        // Button('push null').id('nullId').onClick((e: ClickEvent) => {
        //   console.log(`[replaceDestination null`)
        //   this.pageInfos.replaceDestination(null)
        //     .then(() => {
        //       console.log('[replaceDestination pageOne] success')
        //     })
        //     .catch((error: Error) => {
        //       this.code100006 = error.code + '';
        //       console.log(`[replaceDestination null] failed, error code ${error.code}`)
        //     })
        // }).height('10%')

        Button('replace pageOne').id('replaceId').onClick((e: ClickEvent) => {
          this.pageInfos.replaceDestination(new NavPathInfo('pageOne',null))
            .then(() => {
              console.log('[replaceDestination pageOne] success')
            })
            .catch((error: Error) => {
              this.code100006 = error.code + '';
              console.log(`[replaceDestination pageOne] failed, error code ${error.code}`)
            })
        }).height('10%')

        Button('push pageOne').id('pushId').onClick((e: ClickEvent) => {
          this.pageInfos.pushPath(new NavPathInfo('pageOne',null) )
        }).height('10%')
      }
      .width('100%')
      .height('100%')
    }
    .title('Title')
    .titleMode(NavigationTitleMode.Mini)
    .navDestination(this.pageMap)
  }
}

@Component
struct PageOne {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @State stacks: string[] = new Array<string>();
  build() {
    NavDestination() {
      Text(String(this.stacks)).id('stackId').height('5%')
      Button('push pageThree').id('pushThreeId').onClick((e: ClickEvent) => {
        this.pageInfos.pushPath(new NavPathInfo('pageThree',null) )
      }).height('10%')
      Button('clear').id('clearId').onClick((e: ClickEvent) => {
        this.pageInfos.clear()
      }).height('10%')
    }
    .title('pageOne')
    .onReady((): void => {
      this.stacks = this.pageInfos.getAllPathName()
      console.log('PageOne stackId this.pageInfos: ', this.pageInfos.getAllPathName())
      console.log('PageOne stackId this.pageInfos: ', this.stacks)
    })
  }
}

@Component
struct PageThree {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Text('This is page three')
      Button('push pageFour').id('pushFourId').onClick((e: ClickEvent) => {
        
        this.pageInfos.pushPath(new NavPathInfo('pageFour',null),{launchMode: LaunchMode.STANDARD} )
      }).height('10%')
    }
    .title('page three')
    .onReady((): void => {
      console.log('this.pageInfos: ', this.pageInfos.getAllPathName())
    })
  }
}

@Component
struct PageFour {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Column({space: '5vp'} as ColumnOptions) {
        Button('LaunchModeMoveTOTopSingleton').id('moveId').onClick((e: ClickEvent) => {
          console.log("============================================ moveId ");
          this.pageInfos.replaceDestination(new NavPathInfo('pageOne',null),{ launchMode: LaunchMode.MOVE_TO_TOP_SINGLETON, animated: true } )
        }).height('10%')
        Button('LaunchModePopToSingleton').id('popId').onClick((e: ClickEvent) => {
          console.log("============================================ popId ");
          this.pageInfos.replaceDestination(new NavPathInfo('pageOne',null),{ launchMode: LaunchMode.POP_TO_SINGLETON, animated: undefined } )
        }).height('10%')
      }
    }
    .title('PageFour')
    .onReady((): void => {
      console.log('this.pageInfos: ', this.pageInfos.getAllPathName())
    })
  }
}