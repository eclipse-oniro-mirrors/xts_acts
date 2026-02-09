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
  ColumnOptions,Scroller,Scroll, Padding, Gauge, ScrollDirection, BarState, Color, EdgeEffect, Row,Image,LinearGradient,Resource
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { UIContext, Router,ComponentSnapshot } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { State } from '@ohos.arkui.stateManagement'
import { ClickEvent } from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';
@Entry
@Component
struct UIContextComponentSnapshot {
  uiContext: UIContext = this.getUIContext();
  @State pixmap_2: image.PixelMap|string  = ''
  @State pixmap_text_1: string = ''
  @State pixmap_text_2: string = ''
  private scroller: Scroller = new Scroller()

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('Component Snapshot').fontColor('0x000000').fontSize(16).width('90%').height('5%')
      Scroll(this.scroller) {
        Column({ space: 5 } as ColumnOptions) {
          Gauge({ value: 30, min: 0, max: 100 })
            .id('snapshot_4')
            .startAngle(210)
            .endAngle(150)
            .colors([['0x317AF7', 0.1], ['0x5BA854', 0.2], ['0xE08C3A', 0.3], ['0x9C554B', 0.4]] as  Array<[LinearGradient|Color|Int|String|Resource, number]>) //造成创建页面失败
            .strokeWidth(20)
            .width(200)
            .height(200)

        }
        .width('100%')
        .backgroundColor('0x13ff7e')
        .padding({ top: 5 } as Padding)
      }
      .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
      .scrollBar(BarState.On) // 滚动条常驻显示
      .scrollBarColor(Color.Gray) // 滚动条颜色
      .scrollBarWidth(10) // 滚动条宽度
      .friction(0.6)
      .height('35%')
      .edgeEffect(EdgeEffect.Fade)

      Text(`上面是要截取的图下面是所截的图`).fontColor('0x000000').fontSize(16).width('90%').margin(15).height('5%')
      Row() {
        Column({ space: 5 } as ColumnOptions) {
          Button('新增Callback')
            .onClick((e:ClickEvent) => {
              console.log('wj+++++++++++++++++++++++++++')
            this.getUIContext().getComponentSnapshot()
              .get('snapshot_4', (err: BusinessError<void>|null|undefined, pixmap: image.PixelMap|undefined):void => {
                // if (err) {
                //   hilog.error(0x0000, 'testTag', 'getComponentSnapshot pixmap_text_1 error %{public}s', JSON.stringify(err) ?? '');
                //   return;
                // }
                this.pixmap_2 = pixmap!
                this.pixmap_text_1 = 'snapshot'
              }, {
                scale: 1, waitUntilRenderFinished: true,
                region: {
                  left: 100,
                  right: 200,
                  top: 100,
                  bottom: 200
                }
              })
          })
            .width('90%')
            .margin(10)
            .id('getComponentSnapshot_01')
            .height('5%')


          Button('新增Promise').onClick((e:ClickEvent) => {
            this.uiContext!.getComponentSnapshot()!
              .get('snapshot_4',{
                scale: 1, waitUntilRenderFinished: true,
                region: {
                  left: 100,
                  right: 200,
                  top: 100,
                  bottom: 200
                }
              })!
              .then((pixmap: image.PixelMap) => {
                this.pixmap_2 = pixmap
                console.info('UIContextComponentSnapshot pixmap_text_2 start')
                this.pixmap_text_2 = 'snapshot'
              })
              .catch((err: Error) => {
                console.log('error: ' + err)
                hilog.error(0x0000, 'testTag', '新增：更换图片getPromise pixmap_text_2 error %{public}s', JSON.stringify(err) ?? '');
              })
          }).width('90%').margin(10).id('getComponentSnapshot_02').height('5%')
          Image(this.pixmap_2).width(200).height(200)
          Text('' + this.pixmap_text_1).fontColor('0x000000')
            .fontSize(16).width('90%').key('key_getComponentSnapshot_text_01').height('5%')
          Text('' + this.pixmap_text_2).fontColor('0x000000')
            .fontSize(16).width('90%').key('key_getComponentSnapshot_text_02').height('5%')
        }.width('100%')
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('0xDCDCDC')
    .padding({ top: 5 } as Padding)
  }
}