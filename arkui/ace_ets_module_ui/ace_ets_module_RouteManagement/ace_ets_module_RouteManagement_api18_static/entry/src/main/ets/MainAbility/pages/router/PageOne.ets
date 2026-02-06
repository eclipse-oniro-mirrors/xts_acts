'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import { Entry, Column, Component, Text, Button, Navigation, NavigationTitleMode, ClickEvent, Margin, NavigationMode} from '@ohos.arkui.component'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { RecordData } from '@ohos.base';
let router1 = new Router()
class RouteParam {
  constructor(msg: string) {
    this.msg = msg
  }
  private msg: string = '';
}

@Entry({routeName: 'nickNameOne'})
@Component
struct PageOne {



  aboutToAppear(): void {
    console.log('PageOne aboutToAppear');
  }

  onPageShow(): void {
    console.log('PageOne onPageShow');
    this.queryRouterPageInfo()
  }

  onNewParam(param: ESObject) {
    console.log('PageOne onNewParam, param: ' + JSON.stringify(param));
    let backData: events_emitter.EventData = {
      data: {
        'paramString': JSON.stringify(param)
      } as Record<String,RecordData>
    }

    let eventIdNum = 51;
    if (JSON.stringify(param) === '"test string"') {
      eventIdNum = 52;
    } else if (JSON.stringify(param) === '20') {
      eventIdNum = 53;
    }
    let backEvent: events_emitter.InnerEvent = {
      eventId: eventIdNum,
      priority: events_emitter.EventPriority.LOW
    }
    console.info('onNewParam start to emit action state')
    events_emitter.emit(backEvent, backData)
  }

  build() {
    Navigation() {
      Column() {
        Button('pushUrl PageOne Single')
          .onClick((e:ClickEvent) => {
            AppStorage.get<Router>("router")?.pushUrl({ url: 'MainAbility/pages/router/PageOne', params: new RouteParam('pushUrl One Single') },router.RouterMode.Single)
          })
          .id('pushUrlId')
          .height('10%')
        Button('replaceUrl PageOne Single')
          .onClick((e:ClickEvent) => {
            try{
              console.log('+++++++++++++++1')
              AppStorage.get<Router>("router")?.replaceUrl({ url: 'MainAbility/pages/router/PageOne', params: 'test string'},router.RouterMode.Single)
              console.log('+++++++++++++++2')
            }catch(err){
              console.log('+++++errreplaceUrl',err)
            }
          })
          .id('replaceUrlId')
          .height('10%')
        Button('pushNamed PageOne Single')
          .onClick((e:ClickEvent) => {
            try{
              initModule ('./PageOne')
              router1.pushNamedRoute({ name: 'nickNameOne', params: 20 }, router.RouterMode.Single)
            }catch(err){
              console.log('+++++errpushNamedRoute',err)
            }

          })
          .id('pushNamedId')
          .height('10%')
      }
      .width('100%')
      .height('100%')
    }
    .title('PageOne')
    .titleMode(NavigationTitleMode.Mini)
  }
}