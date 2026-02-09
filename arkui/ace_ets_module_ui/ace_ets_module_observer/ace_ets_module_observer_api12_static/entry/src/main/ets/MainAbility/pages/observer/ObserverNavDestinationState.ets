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
import observer  from '@ohos.arkui.observer';
import { Entry, Component, Column, Text, Image, Color, Padding, Button, ClickEvent, ColumnOptions, NavPathStack,
  NavDestinationContext, Builder, NavDestinationInfo, Builder, NavDestination, Navigation, NavPathInfo} from '@ohos.arkui.component'
import { State,  AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ObserverNavDestinationState {
  @State str:string = ''
  @State pageInfos: NavPathStack = new NavPathStack();

  testFunc(info:NavDestinationInfo) {
    if (info) {
      console.info('NavDestination state update', JSON.stringify(info));
      if (info.name == 'pageOne' && info.state == observer.NavDestinationState.ON_SHOWN) {
        AppStorage.setOrCreate<string>('observer_NavDestinationState', AppStorage.get<string>('observer_NavDestinationState') + '1ON_SHOWN;')
      } else if (info.name == 'pageOne' && info.state == observer.NavDestinationState.ON_HIDDEN) {
        AppStorage.setOrCreate<string>('observer_NavDestinationState', AppStorage.get<string>('observer_NavDestinationState') + '1ON_HIDDEN;')
      } else if (info.name == 'pageOne' && info.state == observer.NavDestinationState.ON_APPEAR) {
        AppStorage.setOrCreate<string>('observer_NavDestinationState', AppStorage.get<string>('observer_NavDestinationState') + '1ON_APPEAR;')
      } else if (info.name == 'pageOne' && info.state == observer.NavDestinationState.ON_DISAPPEAR) {
        AppStorage.setOrCreate<string>('observer_NavDestinationState', AppStorage.get<string>('observer_NavDestinationState') + '1ON_DISAPPEAR;')
      } else if (info.name == 'pageOne' && info.state == observer.NavDestinationState.ON_WILL_SHOW) {
        AppStorage.setOrCreate<string>('observer_NavDestinationState', AppStorage.get<string>('observer_NavDestinationState') + '1ON_WILL_SHOW;')
      } else if (info.name == 'pageOne' && info.state == observer.NavDestinationState.ON_WILL_HIDE) {
        AppStorage.setOrCreate<string>('observer_NavDestinationState', AppStorage.get<string>('observer_NavDestinationState') + '1ON_WILL_HIDE;')
      } else if (info.name == 'pageOne' && info.state == observer.NavDestinationState.ON_WILL_APPEAR) {
        AppStorage.setOrCreate<string>('observer_NavDestinationState', '1ON_WILL_APPEAR;')
      } else if (info.name == 'pageOne' && info.state == observer.NavDestinationState.ON_WILL_DISAPPEAR) {
        AppStorage.setOrCreate<string>('observer_NavDestinationState', AppStorage.get<string>('observer_NavDestinationState') + '1ON_WILL_DISAPPEAR;')
      } else if (info.name == 'pageOne' && info.state == observer.NavDestinationState.ON_BACKPRESS) {
        AppStorage.setOrCreate<string>('observer_NavDestinationState', AppStorage.get<string>('observer_NavDestinationState') + '1ON_BACKPRESS;')
      } else if (info.name == 'pageTwo' && info.state == observer.NavDestinationState.ON_SHOWN) {
        AppStorage.setOrCreate<string>('observer_NavDestinationState', AppStorage.get<string>('observer_NavDestinationState') + '2ON_SHOWN;')
      } else if (info.name == 'pageTwo' && info.state == observer.NavDestinationState.ON_HIDDEN) {
        AppStorage.setOrCreate<string>('observer_NavDestinationState', AppStorage.get<string>('observer_NavDestinationState') + '2ON_HIDDEN;')
      } else if (info.name == 'pageTwo' && info.state == observer.NavDestinationState.ON_APPEAR) {
        AppStorage.setOrCreate<string>('observer_NavDestinationState', AppStorage.get<string>('observer_NavDestinationState') + '2ON_APPEAR;')
      } else if (info.name == 'pageTwo' && info.state == observer.NavDestinationState.ON_DISAPPEAR) {
        AppStorage.setOrCreate<string>('observer_NavDestinationState', AppStorage.get<string>('observer_NavDestinationState') + '2ON_DISAPPEAR;')
      } else if (info.name == 'pageTwo' && info.state == observer.NavDestinationState.ON_WILL_SHOW) {
        AppStorage.setOrCreate<string>('observer_NavDestinationState', AppStorage.get<string>('observer_NavDestinationState') + '2ON_WILL_SHOW;')
      } else if (info.name == 'pageTwo' && info.state == observer.NavDestinationState.ON_WILL_HIDE) {
        AppStorage.setOrCreate<string>('observer_NavDestinationState', AppStorage.get<string>('observer_NavDestinationState') + '2ON_WILL_HIDE;')
      } else if (info.name == 'pageTwo' && info.state == observer.NavDestinationState.ON_WILL_APPEAR) {
        AppStorage.setOrCreate<string>('observer_NavDestinationState', AppStorage.get<string>('observer_NavDestinationState') + '2ON_WILL_APPEAR;')
      } else if (info.name == 'pageTwo' && info.state == observer.NavDestinationState.ON_WILL_DISAPPEAR) {
        AppStorage.setOrCreate<string>('observer_NavDestinationState', AppStorage.get<string>('observer_NavDestinationState') + '2ON_WILL_DISAPPEAR;')
      } else if (info.name == 'pageTwo' && info.state == observer.NavDestinationState.ON_BACKPRESS) {
        AppStorage.setOrCreate<string>('observer_NavDestinationState', AppStorage.get<string>('observer_NavDestinationState') + '2ON_BACKPRESS;')
      }
    }
  }

  aboutToAppear(){
    observer.onNavDestinationUpdate( this.testFunc);  //create page failed
  }

  aboutToDisappear(){
    observer.offNavDestinationUpdate(this.testFunc);
  }


  @Builder
  pageOneTmp() {
    NavDestination() {
      console.log('++++++++++++++++++++++++++++++3')
      Column({ space: 10 } as ColumnOptions) {

        Button('pushPath pageTwo' ,)
          .onClick((e: ClickEvent) => {
            console.log('++++++++++++++++++++++++++++++4')
            this.pageInfos.pushPath(new NavPathInfo('pageTwo', null))
            console.log('++++++++++++++++++++++++++++++5')
          })
          .id('ObserverNavDestinationState_pageTwo')
      }
    }.title('pageOne')
    .onBackPressed(() => {
      this.pageInfos.pop()
      console.info('pageOne back');
      return true
    })

  }

  @Builder
  pageTwoTmp() {
    NavDestination() {
      console.log('++++++++++++++++++++++++++++++6')
      Column({ space: 5 } as ColumnOptions) {
      }
    }.title('pageTwo')
    .onBackPressed(() => {
      this.pageInfos.pop()
      console.info('pageTwo back');
      return true
    })
  }

  @Builder
  PageMap(name: string, param?: object) {
    if (name === 'pageOne') {
      // console.log('++++++++++++++++++++++++++++++2')
      this.pageOneTmp()//
      // console.log('++++++++++++++++++++++++++++++3')
    } else if (name === 'pageTwo') {
      this.pageTwoTmp()
    }
  }

  build() {
    Column({space:5} as ColumnOptions){
      Text(this.str).id('ObserverNavDestinationState_text')

      Button('get')
        .onClick((e:ClickEvent)=>{
          this.str =  AppStorage.get<string>('observer_NavDestinationState')+ ''
        })
      .id('ObserverNavDestinationState_get')

      Navigation(this.pageInfos) {
        Column({space:10} as ColumnOptions) {

          Button('pushPath pageOne' ,)
            .onClick((e:ClickEvent) => {
              console.log('++++++++++++++++++++++++++++++0')
              this.pageInfos.pushPath(new NavPathInfo('pageOne', null))//页面无法跳转
              console.log('++++++++++++++++++++++++++++++1')
            })
            .id('ObserverNavDestinationState_pageOne')

        }
      }
      .title('NavIndex')
      .navDestination(this.PageMap)
    }
  }
}
