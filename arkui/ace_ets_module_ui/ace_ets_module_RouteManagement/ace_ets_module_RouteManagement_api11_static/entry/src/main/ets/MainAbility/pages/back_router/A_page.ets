'use static';
/*
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
import {Entry,Component,Column,ColumnOptions,Button,ClickEvent,ButtonType} from '@ohos.arkui.component';

class JsonObject {
  data1: JsonObject1 = new JsonObject1()
}
class JsonObject1 {
  data2: [string, string] = ['', '']
}

@Entry
@Component
struct router_page1 {
  build() {
    Column({ space: 5 } as ColumnOptions) {

      Button("跳转pageB--带参数")
        .type(ButtonType.Capsule)
        .id("R_params")
        .onClick((e: ClickEvent) => {
          this.getUIContext().getRouter().pushUrl({
            url: "MainAbility/pages/back_router/B_page",
            params: {
              data1: {
                data2: ['message', 'message1']
              }
            } as JsonObject
          })
        })
    }
    .width('100%')
    .height('100%')
  }
}