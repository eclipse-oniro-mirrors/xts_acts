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
import { Entry,Component,FlexDirection,ItemAlign, Button, FlexAlign, Color, ClickEvent, Flex } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct stageRouter {
  private TAG: string = '[AnimatorTest]';
  // private backAnimator = undefined;
  private flag: boolean = false;
  @State wid: number = 100;
  @State hei: number = 100;

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Button('router-pushUrl')
        .width(100)
        .height(70)
        .fontSize(30)
        .fontColor(Color.Black)
        .onClick((e: ClickEvent) => {
          this.getUIContext().getRouter().pushUrl({
            url: 'pages/Animator',
            params: {
              data1: 'message',
              data2: {
                data3: [123, 456, 789]
              }
            } as JsonObj
          })
        })
        .key("routerPushUrl")
    }
    .width("100%")
    .height("100%")
  }
}

class JsonObj {
  data1: string = '';
  data2: JsonObj1 = new JsonObj1();
}
class JsonObj1 {
  data3: int[] = [0];
}