'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  Column,
  Component,
  Button,
  ClickEvent,
  Image,
  $r,
  BlurOptions,
  SystemAdaptiveOptions,
  Optional
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct BackdropBlurPage {
  @State isShow: boolean = false;
  @State isBlurRadius: Optional<number> | undefined = 10.0;
  @State isBlurOptions: BlurOptions | undefined = { grayscale: [5, 5] } as BlurOptions;
  @State isBlurSysOptions: SystemAdaptiveOptions | undefined =
    { disableSystemAdaptation: true } as SystemAdaptiveOptions;

  build() {
    Column() {
      Image($r('app.media.startIcon'))
        .width(200)
        .height(200)
        .id('backdropBlurTest')
        .backdropBlur(this.isShow ? this.isBlurRadius : undefined, this.isShow ? this.isBlurOptions : undefined,
          this.isShow ? this.isBlurSysOptions : undefined)
      Button('backdropBlur: ' + this.isShow)
        .id('backdropBlur_change')
        .onClick((e: ClickEvent) => {
          this.isShow = !this.isShow
        })
    }
  }
}