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

import Want from '@ohos.app.ability.Want'

@Entry
@Component
struct OnTerminated1 {
  @State message: string = 'Message: '
  @State flag: string = 'start'
  private want: Want = {
    bundleName: "com.open.harmony.commoncapability",
    abilityName: "ExampleEmbeddedAbility",
  }

  build() {
    Row() {
      Column() {
        Text(this.flag).fontSize(30).id("OnTerminated_text")
        EmbeddedComponent(this.want, EmbeddedType.EMBEDDED_UI_EXTENSION)
          .id("EmbeddedComponent_id")
          .width('100%')
          .height('90%')
          .onTerminated((info)=>{
            this.message = 'Terminarion: code = ' + info.code + ', want = ' + JSON.stringify(info.want);
            this.flag = "onTerminated succ"
          })
          .onError((error)=>{
            this.message = 'Error: code = ' + error.code;
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}