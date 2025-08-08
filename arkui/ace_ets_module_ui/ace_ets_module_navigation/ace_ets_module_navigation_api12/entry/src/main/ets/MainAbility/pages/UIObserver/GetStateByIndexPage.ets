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
    Column(){
      Row(){
        Text(this.routerStateIndex == 0?'getStateByIndex':'OK').id('getStateByIndex_content')
        Button('Push').onClick(()=>{
          this.getUIContext().getRouter().pushUrl({
            url:'pages/GetStateByIndexPage'
          })
        })
          .id('getStateByIndex_btn_push')
        Button('get').onClick(()=> {
          let router:Router = this.getUIContext().getRouter()
          let options:router.RouterState | undefined = router.getStateByIndex(1)
          if (options != undefined) {
            this.routerStateIndex = options.index
          }
        }).id('getStateByIndex_btn_get')
      }.height(44).width('100%').margin({bottom:20})
    }.alignItems(HorizontalAlign.Center).width('100%')
  }
}