'use static';
/**
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

import {
  Entry,
  Text,
  Column,
  Component,
  Image,$r,ColumnOptions
} from '@ohos.arkui.component'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct Index {
  aboutToAppear() {
    try {
      let router1 = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router1);
    } catch (error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text("Text与Image组件测试卡片privacySensitive:true")
      .key('ArkUIHDS_Text_privacySensitive_0100')
      .privacySensitive(true)
      Text("Text与Image组件测试卡片privacySensitive:false")
        .key('ArkUIHDS_Text_privacySensitive_0200')
        .privacySensitive(false)
      Text("Text与Image组件测试卡片privacySensitive:null")
        .key('ArkUIHDS_Text_privacySensitive_0300')
        .privacySensitive(undefined)
      Text("Text与Image组件测试卡片privacySensitive:false")
        .key('ArkUIHDS_Text_privacySensitive_0400')
      .privacySensitive(undefined)
      Image($r("app.media.icon"))
        .borderWidth(1)
        .height("10%")
        .privacySensitive(true)
        .key('ArkUIHDS_Image_privacySensitive_0100')
      Image($r("app.media.icon"))
        .borderWidth(1)
        .height("10%")
        .privacySensitive(false)
        .key('ArkUIHDS_Image_privacySensitive_0200')
      Image($r("app.media.icon"))
        .borderWidth(1)
        .height("10%")
        .privacySensitive(undefined)
        .key('ArkUIHDS_Image_privacySensitive_0300')
      Image($r("app.media.icon"))
        .borderWidth(1)
        .height("10%")
        .privacySensitive(undefined)
        .key('ArkUIHDS_Image_privacySensitive_0400')
    }
    .width('100%')
    .height('100%')

  }
}