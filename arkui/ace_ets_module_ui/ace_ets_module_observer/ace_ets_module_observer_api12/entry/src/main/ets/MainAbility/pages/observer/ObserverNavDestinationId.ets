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
struct ObserverNavDestinationId {
  @State str:string = ''
  @State pageInfos: NavPathStack = new NavPathStack();
  @State navDestinationIdValue: string | undefined = ''

  @Builder
  pageOneTmp() {
    NavDestination() {
      Column({ space: 10 }) {
        CustomCom({navDestinationIdValue:this.navDestinationIdValue})
      }
    }.title('pageOne')
    .onReady((context: NavDestinationContext) => {
      if(context){
        this.str = String(context.navDestinationId)
      }
    })
  }

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      this.pageOneTmp()
    }
  }

  build() {
    Column({space:5}){
      Text(this.str).id('ObserverNavDestinationId_text1')
      Text(this.navDestinationIdValue).id('ObserverNavDestinationId_text2')

      Navigation(this.pageInfos) {
        Column({space:10}) {

          Button('pushPath pageOne' ,)
            .onClick(() => {
              this.pageInfos.pushPath({ name: 'pageOne' , param: null})
            })
            .id('ObserverNavDestinationId_pageOne')
        }
      }
      .title('NavIndex')
      .navDestination(this.PageMap)
    }

  }
}


@Component
struct CustomCom {
  navDesInfo: observer.NavDestinationInfo | undefined
  @Link navDestinationIdValue: string | undefined;

  aboutToAppear() {
    this.navDesInfo = this.queryNavDestinationInfo();
    this.navDestinationIdValue = this.navDesInfo?.navDestinationId
  }

  build() {
    Column(){
      Text('queryNavDestinationInfo')
    }.width('100%')
  }
}