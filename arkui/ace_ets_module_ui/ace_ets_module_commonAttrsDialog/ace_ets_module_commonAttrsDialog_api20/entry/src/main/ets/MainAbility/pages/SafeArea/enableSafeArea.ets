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
import { JSON } from '@kit.ArkTS';

@Entry
@Component
struct safeArea {
  @State isShow: boolean = false;
  @State safeArea: boolean = true;

  @Builder
  myBuilder() {
    Column() {
      Button('change SafeArea')
        .fontSize(20)
        .id('Button1')
        .onClick(() => {
          this.safeArea = !this.safeArea
        })
    }
    .id('SafeArea')
    .backgroundColor(Color.Pink)
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }

  build() {
    Column() {
      Button('Open ContentCover')
        .onClick(() => {
          this.isShow = true
        })
        .id('Button')
        .fontSize(20)
        .margin(10)
        .bindContentCover(this.isShow, this.myBuilder(), {
          modalTransition: ModalTransition.ALPHA,
          backgroundColor: Color.Red,
          enableSafeArea: this.safeArea
        })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}