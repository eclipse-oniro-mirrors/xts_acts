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
  SystemAdaptiveOptions
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component

struct BlurPage{
  @State isShow: boolean = false;
  build(){
    Column(){
      Image($r('app.media.startIcon'))
        .width(200)
        .height(200)
        .id('blurTest')
        .blur(this.isShow ? (10.0) : undefined, this.isShow ? ({ grayscale: [5, 5] } as BlurOptions) : undefined,
        this.isShow ? ({ disableSystemAdaptation: false } as SystemAdaptiveOptions ) : undefined)
      Button('blur: ' + this.isShow)
        .id('blur')
        .onClick((e: ClickEvent) => {
          this.isShow = !this.isShow
        })
    }
  }
}