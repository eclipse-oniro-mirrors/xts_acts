'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  Entry,
  Component,
  Builder,
  Column,
  Button,
  Color,
  FlexAlign,
  ContentCoverOptions,
  ModalTransition
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ContentCoverOptionsIndex {
  @State isShowContentCover: boolean = false;
  @State safeArea: boolean = true;

  @Builder
  contentCoverBuilder() {
    Column() {
      Button('change SafeArea')
        .fontSize(20)
        .id('Button1')
        .height('8%')
        .onClick(() => {
          this.safeArea = !this.safeArea;
        });
    }
    .id('SafeArea')
    .backgroundColor(Color.Pink)
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%');
  }

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('ContentCoverOptionsIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    let coverOptions = {
      modalTransition: ModalTransition.ALPHA,
      backgroundColor: Color.Red,
      enableSafeArea: this.safeArea
    } as ContentCoverOptions;

    Column() {
      Button('Open ContentCover')
        .onClick(() => {
          this.isShowContentCover = true;
        })
        .id('Button')
        .fontSize(20)
        .height('8%')
        .margin(10)
        .bindContentCover(this.isShowContentCover, this.contentCoverBuilder, coverOptions);
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%');
  }
}
