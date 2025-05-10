/**
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
import observer  from '@ohos.arkui.observer';

@Entry
@Component
struct ObserverNavDestinationState {
  @State str:string = ''
  @State pageInfos: NavPathStack = new NavPathStack();

  testFunc(info:NavDestinationInfo) {
    if (info) {
      console.info('NavDestination state update', JSON.stringify(info));
      if (info.name == 'pageOne' && info.state == observer.NavDestinationState.ON_SHOWN) {
        AppStorage.setOrCreate('observer_NavDestinationState', AppStorage.get('observer_NavDestinationState') + '1ON_SHOWN;')
      } else if (info.name == 'pageOne' && info.state == observer.NavDestinationState.ON_HIDDEN) {
        AppStorage.setOrCreate('observer_NavDestinationState', AppStorage.get('observer_NavDestinationState') + '1ON_HIDDEN;')
      } else if (info.name == 'pageOne' && info.state == observer.NavDestinationState.ON_APPEAR) {
        AppStorage.setOrCreate('observer_NavDestinationState', AppStorage.get('observer_NavDestinationState') + '1ON_APPEAR;')
      } else if (info.name == 'pageOne' && info.state == observer.NavDestinationState.ON_DISAPPEAR) {
        AppStorage.setOrCreate('observer_NavDestinationState', AppStorage.get('observer_NavDestinationState') + '1ON_DISAPPEAR;')
      } else if (info.name == 'pageOne' && info.state == observer.NavDestinationState.ON_WILL_SHOW) {
        AppStorage.setOrCreate('observer_NavDestinationState', AppStorage.get('observer_NavDestinationState') + '1ON_WILL_SHOW;')
      } else if (info.name == 'pageOne' && info.state == observer.NavDestinationState.ON_WILL_HIDE) {
        AppStorage.setOrCreate('observer_NavDestinationState', AppStorage.get('observer_NavDestinationState') + '1ON_WILL_HIDE;')
      } else if (info.name == 'pageOne' && info.state == observer.NavDestinationState.ON_WILL_APPEAR) {
        AppStorage.setOrCreate('observer_NavDestinationState', '1ON_WILL_APPEAR;')
      } else if (info.name == 'pageOne' && info.state == observer.NavDestinationState.ON_WILL_DISAPPEAR) {
        AppStorage.setOrCreate('observer_NavDestinationState', AppStorage.get('observer_NavDestinationState') + '1ON_WILL_DISAPPEAR;')
      } else if (info.name == 'pageOne' && info.state == observer.NavDestinationState.ON_BACKPRESS) {
        AppStorage.setOrCreate('observer_NavDestinationState', AppStorage.get('observer_NavDestinationState') + '1ON_BACKPRESS;')
      } else if (info.name == 'pageTwo' && info.state == observer.NavDestinationState.ON_SHOWN) {
        AppStorage.setOrCreate('observer_NavDestinationState', AppStorage.get('observer_NavDestinationState') + '2ON_SHOWN;')
      } else if (info.name == 'pageTwo' && info.state == observer.NavDestinationState.ON_HIDDEN) {
        AppStorage.setOrCreate('observer_NavDestinationState', AppStorage.get('observer_NavDestinationState') + '2ON_HIDDEN;')
      } else if (info.name == 'pageTwo' && info.state == observer.NavDestinationState.ON_APPEAR) {
        AppStorage.setOrCreate('observer_NavDestinationState', AppStorage.get('observer_NavDestinationState') + '2ON_APPEAR;')
      } else if (info.name == 'pageTwo' && info.state == observer.NavDestinationState.ON_DISAPPEAR) {
        AppStorage.setOrCreate('observer_NavDestinationState', AppStorage.get('observer_NavDestinationState') + '2ON_DISAPPEAR;')
      } else if (info.name == 'pageTwo' && info.state == observer.NavDestinationState.ON_WILL_SHOW) {
        AppStorage.setOrCreate('observer_NavDestinationState', AppStorage.get('observer_NavDestinationState') + '2ON_WILL_SHOW;')
      } else if (info.name == 'pageTwo' && info.state == observer.NavDestinationState.ON_WILL_HIDE) {
        AppStorage.setOrCreate('observer_NavDestinationState', AppStorage.get('observer_NavDestinationState') + '2ON_WILL_HIDE;')
      } else if (info.name == 'pageTwo' && info.state == observer.NavDestinationState.ON_WILL_APPEAR) {
        AppStorage.setOrCreate('observer_NavDestinationState', AppStorage.get('observer_NavDestinationState') + '2ON_WILL_APPEAR;')
      } else if (info.name == 'pageTwo' && info.state == observer.NavDestinationState.ON_WILL_DISAPPEAR) {
        AppStorage.setOrCreate('observer_NavDestinationState', AppStorage.get('observer_NavDestinationState') + '2ON_WILL_DISAPPEAR;')
      } else if (info.name == 'pageTwo' && info.state == observer.NavDestinationState.ON_BACKPRESS) {
        AppStorage.setOrCreate('observer_NavDestinationState', AppStorage.get('observer_NavDestinationState') + '2ON_BACKPRESS;')
      }
    }
  }

  aboutToAppear(){
    observer.on('navDestinationUpdate', this.testFunc);
  }

  aboutToDisappear(){
    observer.off('navDestinationUpdate',  this.testFunc);
  }


  @Builder
  pageOneTmp() {
    NavDestination() {
      Column({ space: 10 }) {

        Button('pushPath pageTwo' ,)
          .onClick(() => {
            this.pageInfos.pushPath({ name: 'pageTwo' , param: null})
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
      Column({ space: 5 }) {
      }
    }.title('pageTwo')
    .onBackPressed(() => {
      this.pageInfos.pop()
      console.info('pageTwo back');
      return true
    })
  }

  @Builder
  PageMap(name: string, param: object) {
    if (name === 'pageOne') {
      this.pageOneTmp()
    } else if (name === 'pageTwo') {
      this.pageTwoTmp()
    }
  }

  build() {
    Column({space:5}){
      Text(this.str).id('ObserverNavDestinationState_text')

      Button('get')
        .onClick(()=>{
          this.str =  AppStorage.get('observer_NavDestinationState')+ ''
        })
      .id('ObserverNavDestinationState_get')

      Navigation(this.pageInfos) {
        Column({space:10}) {

          Button('pushPath pageOne' ,)
            .onClick(() => {
              this.pageInfos.pushPath({ name: 'pageOne' , param: null})
            })
            .id('ObserverNavDestinationState_pageOne')

        }
      }
      .title('NavIndex')
      .navDestination(this.PageMap)
    }

  }
}
