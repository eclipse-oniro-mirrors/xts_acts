/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import autoFillManager from '@ohos.app.ability.autoFillManager'
import hilog from '@ohos.hilog'

let storage = LocalStorage.getShared()
let fillCallback = storage.get<autoFillManager.FillRequestCallback>('fillCallback');
let viewData: autoFillManager.ViewData | undefined = storage.get<autoFillManager.ViewData>('viewData');
let pageNodeInfos = storage.get<Array<autoFillManager.PageNodeInfo>>('pageNodeInfos');

function parseInfoString(item: Array<autoFillManager.PageNodeInfo>) {
  if (item.length == 0) {
    return 'empty pageNodeInfos';
  }
  return JSON.stringify(item);
}

function parseViewDataString(item: autoFillManager.ViewData) {
  if (!item) {
    return 'empty viewData';
  }
  return JSON.stringify(item);
}

function successFunc(data: autoFillManager.ViewData) {
  if (data.pageNodeInfos.length !== 3) {
    hilog.error(0x0000, 'testTag', '%{public}s', 'get unEnough pageNodeInfos, skipping!');
    return;
  }
  data.pageNodeInfos[0].value = 'user1';
  data.pageNodeInfos[1].value = 'pwd';
  data.pageNodeInfos[2].value = 'U41Ne6p@$$Wor!?';
  hilog.info(0x0000, 'testTag', 'autofill about to success with viewData: %{public}s', JSON.stringify(viewData));
  if (fillCallback) {
    let response: autoFillManager.FillResponse = { viewData: data };
    fillCallback.onSuccess(response);
  }
}

function failFunc() {
  if (fillCallback) {
    fillCallback.onFailure();
  }
}

function cancelFunc() {
  if (fillCallback) {
    fillCallback.onCancel();
  }
}

@Entry
@Component
struct SelectorList {
  @State message: string = 'AutoFill Page'

  build() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
      Column() {
        Row() {
          Text(this.message)
            .fontWeight(FontWeight.Bold)
            .fontSize(30)
        }
        .alignSelf(ItemAlign.Center)
        .margin({ top: 20, bottom: 20 })
        .justifyContent(FlexAlign.SpaceBetween)

        Row() {
          Text('Got ViewData, string length: '+ JSON.stringify(viewData).length)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })
        }
        .alignSelf(ItemAlign.Center)
        .margin({ left: 30 })

        Row() {
          Flex({ justifyContent: FlexAlign.Center, alignContent: FlexAlign.SpaceBetween }) {
            Button('Success')
              .onClick(() => {
                successFunc(viewData);
                hilog.info(0x0000, 'testTag', 'autofill success');
              })
              .fontWeight(FontWeight.Bolder)
              .margin({ top: 15, bottom: 10, left: 10, right: 10 })
              .id('success_btn')

            Button('Failure')
              .onClick(() => {
                failFunc();
                hilog.info(0x0000, 'testTag', 'autofill failure')
              })
              .fontWeight(FontWeight.Bolder)
              .margin({ top: 15, bottom: 10, left: 10, right: 10 })
              .id('failure_btn')

            Button('Cancel')
              .onClick(() => {
                cancelFunc();
                hilog.info(0x0000, 'testTag', 'autofill cancel')
              })
              .fontWeight(FontWeight.Bolder)
              .margin({ top: 15, bottom: 10, left: 10, right: 10 })
              .id('cancel_btn')
          }
        }
      }
    }
  }
}