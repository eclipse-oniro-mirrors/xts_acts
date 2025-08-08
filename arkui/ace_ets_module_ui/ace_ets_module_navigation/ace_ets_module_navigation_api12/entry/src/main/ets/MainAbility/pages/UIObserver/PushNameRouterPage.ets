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
import { BusinessError } from '@kit.BasicServicesKit';

@Entry({routeName:'pushNameRouter'})
@Component
struct PushNameRouterPage {
  async routePage() {
    this.getUIContext().getRouter().pushNamedRoute({
      name: 'pushNameRouter',
      params: {
        data1: 'message',
        data2: {
          data3: [123, 456, 789]
        }
      },
      recoverable: false
    }, (err: Error) => {
      if (err) {
        let message = (err as BusinessError).message;
        let code = (err as BusinessError).code;
        console.error(`pushNamedRoute failed, code is ${code}, message is ${message}`);
        return;
      }
      console.info('pushNamedRoute success');
      AppStorage.setOrCreate('PushNameRouterPage_pushNamedRoute', 'success')
    })
  }

  aboutToAppear(): void {
    let myParams = this.getUIContext().getRouter().getParams()
    if (myParams){
      console.info('getParams success');
      AppStorage.setOrCreate('PushNameRouterPage_aboutToAppear', 'success')
    }
  }

  build() {
    Column(){
      Row(){
        Button('Push').onClick(()=>{
          this.routePage()
        }).id('PushNameRouter_btn_push')
      }.height(44).width('100%').margin({bottom:20})
    }.alignItems(HorizontalAlign.Center).width('100%')
  }
}