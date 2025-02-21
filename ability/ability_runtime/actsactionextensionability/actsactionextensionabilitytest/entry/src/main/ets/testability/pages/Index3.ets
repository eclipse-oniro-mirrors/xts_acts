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
import Want from '@ohos.app.ability.Want';
import wantConstant from '@ohos.app.ability.wantConstant';
import commonEventManager from '@ohos.commonEventManager';

let wantPrv: Want = {
  bundleName: 'com.example.actsactionextensionabilitytest',
  abilityName: 'UIExtensionProvider',
  parameters: { "x": 12345, "y": "data", "ability.want.params.uiExtensionType":"UIExtensionAbility",
  }
}
wantPrv.parameters[wantConstant.Params.SHOW_MODE_KEY] = wantConstant.ShowMode.WINDOW;

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  private myProxy: UIExtensionProxy | null = null;
  want: Want = wantPrv;
  onPageShow() {
  }

  build() {
    Row() {
      Column() {
        Text(this.message).fontColor(Color.Red)
        UIExtensionComponent(this.want)
          .size({ width: "50%", height: "50%" })
          .onRemoteReady((proxy: UIExtensionProxy) => {
            this.message = "remote ready"
            this.myProxy = proxy
          })
          .onReceive((data: Object) => {
            this.message = JSON.stringify(data)
          })
          .onRelease((releaseCode: number) => {
            this.message = "Release: " + releaseCode
          })
          .onResult((data: Object) => {
            this.message = JSON.stringify(data)
          })
          .onError((error: ErrorObject) => {
            let options = {
              parameters: {
              }
            }
            commonEventManager.publish('ACTS_TEST_WINDOW', options, function (){});
          })
      }
      .width("100%")
    }
    .height('100%')
  }
}

interface ErrorObject {
  code: number;
  name: string;
  message: string;
}