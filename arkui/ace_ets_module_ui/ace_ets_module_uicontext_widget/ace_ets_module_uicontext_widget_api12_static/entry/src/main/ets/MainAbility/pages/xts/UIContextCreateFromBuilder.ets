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
import image from '@ohos.multimedia.image'
import hilog from '@ohos.hilog';
import componentSnapshot from '@ohos.arkui.componentSnapshot'
import { Entry, Column, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight, ButtonType, ClickEvent, Margin,
  ColumnOptions,Scroller,Scroll, Padding, Gauge, ScrollDirection, BarState, Color, EdgeEffect, Row, Builder, Image,
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { State } from '@ohos.arkui.stateManagement'
import { ClickEvent } from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';
@Entry
@Component
struct UIContextCreateFromBuilder {
  @State pixmap_2: image.PixelMap|string  = ''
  @State pixmap_text_3: string = ''
  @State pixmap_text_4: string = ''
  uiContext: UIContext = this.getUIContext();
  aboutToAppear(){
    this.uiContext = this.getUIContext();
}

  @Builder
  GaugeBuilder() {
    Gauge({ value: 30, min: 0, max: 100 })
      .startAngle(210)
      .endAngle(150)
      .colors([['0x317AF7', 0.1], ['0x5BA854', 0.2], ['0xE08C3A', 0.3], ['0x9C554B', 0.4]])
      .strokeWidth(20)
      .width(200)
      .height(200)
  }

  build() {
    Column() {
      Row() {
        Column({ space: 5 } as ColumnOptions) {
          Button('新增Builder：Gauge图片')
            .onClick((e:ClickEvent) => {
              this.uiContext.getComponentSnapshot().createFromBuilder(this.GaugeBuilder,
                (err: BusinessError<void>|null|undefined, pixmap: image.PixelMap|undefined):void => {
                if(pixmap){
                  this.pixmap_2 = pixmap!
                  console.info('UIContextComponentSnapshot pixmap_text_3 start')
                  this.pixmap_text_3 = 'snapshot'
                  return
                }
                  hilog.error(0x0000, 'testTag', 'getComponentSnapshot pixmap_text_3 error %{public}s', JSON.stringify(err) ?? '');
                },undefined,
                false,
                {
                  scale: 1, waitUntilRenderFinished: true,
                  region: {
                    left: 100,
                    right: 200,
                    top: 100,
                    bottom: 200
                  }
                }
              )
            }
            ).width('90%').margin(10).id('getComponentSnapshot_03')
          Button('新增：Gauge图片')
            .onClick((e:ClickEvent) => {
              this.uiContext.getComponentSnapshot().createFromBuilder(this.GaugeBuilder, undefined, false, {
                  scale: 1, waitUntilRenderFinished: true,
                  region: {
                    left: 100,
                    right: 200,
                    top: 100,
                    bottom: 200
                  }
              })!
              .then((pixmap: image.PixelMap) => {
                this.pixmap_2 = pixmap!
                this.pixmap_text_4 = 'snapshot'
              })
              .catch((err: Error) => {
                hilog.error(0x0000, 'testTag', 'getComponentSnapshot pixmap_text_4 error %{public}s', JSON.stringify(err) ?? '');
              })
            }).width('90%').margin(10).id('getComponentSnapshot_04')
          Image(this.pixmap_2)
            .margin(10)
            .height(200)
            .width(200)
            .border({ color: Color.Black, width: 2 })
          Text('' + this.pixmap_text_3).fontColor('0x000000')
            .fontSize(16).width('90%').key('key_getComponentSnapshot_text_03')
          Text('' + this.pixmap_text_4).fontColor('0x000000')
            .fontSize(16).width('90%').key('key_getComponentSnapshot_text_04')
        }.width('100%')
      }

    }.width('100%').margin({ left: 10, top: 5, bottom: 5 } as Margin).height(300)
  }
}