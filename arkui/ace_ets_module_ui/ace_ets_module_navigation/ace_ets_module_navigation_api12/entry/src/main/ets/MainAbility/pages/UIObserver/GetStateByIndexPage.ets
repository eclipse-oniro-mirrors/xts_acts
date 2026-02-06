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
import { Router, router } from '@kit.ArkUI'

@Entry
@Component
struct getStateByIndexPage {
  @State routerStateIndex:number = 0
  build() {
    Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Column() {
        Text(this.routerStateIndex == 0 ? 'getStateByIndex' : 'OK').id('getStateByIndex_content')
        Button('getUndefined').onClick(() => {
          let router: Router = this.getUIContext().getRouter()
          let options: router.RouterState | undefined = router.getStateByIndex(5)
          console.log('getStateByIndexPage options', JSON.stringify(options))
          if (options == undefined) {
            console.log('getStateByIndexPage undefined options', options)
          }
          AppStorage.setOrCreate('stateByIndexUndefined', options)
        }).id('getUndefinedBtn')
        Button('Push').onClick(() => {
          this.getUIContext().getRouter().pushUrl({
            url: 'pages/getStateByIndexPage'
          })
        })
          .id('getStateByIndex_btn_push')
        Button('get').onClick(() => {
          let router: Router = this.getUIContext().getRouter()
          let options: router.RouterState | undefined = router.getStateByIndex(1)
          if (options != undefined) {
            this.routerStateIndex = options.index
          }
        }).id('getStateByIndex_btn_get')
        Button('push2').onClick(() => {
          this.getUIContext().getRouter().pushUrl({
            url: 'MainAbility/pages/UIObserver/PushNameRouterPage'
          })
        })
        .id('push2Btn')
      }.alignItems(HorizontalAlign.Center).width('100%')
    }.height('100%').width('100%')
  }
}