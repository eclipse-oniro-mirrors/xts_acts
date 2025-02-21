/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import {MessageManager,Callback} from '../utils/MessageManager';

type Message = boolean|string|number

@Entry
@Component
struct RatingPage {
  @State rating: number = 3.5
  @State indicator : boolean = true
  @State stars: number = 5
  @State stepSize: number = 0.5
  @State text: string = 'no change'
  @State backgroundUri: string = 'resources/base/media/star_1.png'
  @State foregroundUri: string = 'resources/base/media/star_2.png'
  @State secondaryUri: string = 'resources/base/media/star_3.png'
  messageManager = new MessageManager<Message>()

  onPageShow() {
    console.info('RatingPage onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback<Message> = message => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'rating') {
        this.rating = message.value as number
      }
      if (message.name == 'indicator') {
        this.indicator = message.value as boolean
      }
      if (message.name == 'stars') {
        this.stars = message.value as number
      }
      if (message.name == 'stepSize') {
        this.stepSize = message.value as number
      }
      if (message.name == 'backgroundUri') {
        this.backgroundUri = message.value as string
      }
      if (message.name == 'foregroundUri') {
        this.foregroundUri = message.value as string
      }
      if (message.name == 'secondaryUri') {
        this.secondaryUri = message.value as string
      }
      if (message.name == 'text') {
        this.text = message.value as string
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      Column() {
        Rating({ rating: 0 }).margin({ top: 1, right: 8 }).key('rating')
          .starStyle({ backgroundUri: 'resources/base/media/star_1.png', foregroundUri: 'resources/base/media/star_2.png', secondaryUri: 'resources/base/media/star_3.png' })
        Text('default rating')
          .fontSize(16)
          .fontColor('rgba(24,36,49,0.60)')
        Rating({ rating: this.rating, indicator: this.indicator })
          .stars(this.stars)
          .stepSize(this.stepSize)
          .key('rating1')
          .starStyle({ backgroundUri: this.backgroundUri,foregroundUri: this.foregroundUri,secondaryUri: this.secondaryUri })
          .margin({ top: 24 })
          .onChange((value: number) => {
            this.text = 'change succ'
            this.rating = value
          })
        Text('current score is ' + this.rating)
          .fontSize(16)
          .fontColor('rgba(24,36,49,0.60)')
          .margin({ top: 16 })
        Text(this.text).fontSize(20).margin(10).key('text')
      }.width(360).height(150).backgroundColor('#FFFFFF').margin({ top: 68 })

      Row() {
        Image('resources/base/media/image.png')
          .width(40)
          .height(40)
          .borderRadius(20)
          .margin({ left: 24 })
        Column() {
          Text('Yue')
            .fontSize(16)
            .fontColor('#182431')
            .fontWeight(500)
          Row() {
            Rating({ rating: 3.5, indicator: true }).margin({ top: 1, right: 8 })
            Text('2021/06/02')
              .fontSize(10)
              .fontColor('#182431')
          }
        }.margin({ left: 12 }).alignItems(HorizontalAlign.Start)

        Text('1st Floor')
          .fontSize(10)
          .fontColor('#182431')
          .position({ x: 295, y: 8 })
      }.width(360).height(56).backgroundColor('#FFFFFF').margin({ top: 64 })
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}