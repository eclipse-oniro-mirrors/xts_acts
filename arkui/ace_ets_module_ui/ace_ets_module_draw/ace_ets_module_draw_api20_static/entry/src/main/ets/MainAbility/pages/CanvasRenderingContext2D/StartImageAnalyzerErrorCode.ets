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


import { BusinessError } from '@ohos.base';
import {
  Entry, Component, Builder,NodeContainer,
  Column, ColumnOptions, ImageAnalyzerType,
  Flex, FlexDirection, ItemAlign, FlexAlign, ImageAIOptions,  ImageAnalyzerController, ImageBitmap,  ImageAnalyzerConfig,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, RenderingContextSettings, CanvasRenderingContext2D, Canvas,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct StartImageAnalyzerErrorCode {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private config: ImageAnalyzerConfig = {
    types: [ImageAnalyzerType.SUBJECT, ImageAnalyzerType.TEXT]
  } as ImageAnalyzerConfig
  private img:ImageBitmap = new ImageBitmap('resources/base/media/icon.png')
  private aiController: ImageAnalyzerController = new ImageAnalyzerController()
  private options: ImageAIOptions = {
    types: [ImageAnalyzerType.SUBJECT, ImageAnalyzerType.TEXT],
    aiController: this.aiController
  } as ImageAIOptions
  @State enable: boolean = true
  @State flag: boolean = true
  @State ErrorCode: string | undefined = ''

  build() {
     Column({ space:10} as ColumnOptions) {
      Row(){
        Text(this.ErrorCode).id('TextErrorCode1').width(55).height(25)
        Button('flag').onClick((event: ClickEvent) => {
          console.log('++++++1')
          this.flag = !this.flag
        }).id('FlagButton1').width(55).height(25)

        Button('enable').onClick((event: ClickEvent) => {
          console.log('++++++2')
          this.enable = !this.enable
        }).id('EnableButton1').width(65).height(25)
      }
      Row(){
        Button('start')
          .width(55).height(25)
          .onClick((event: ClickEvent) => {
            console.log('++++++3')
            this.context.startImageAnalyzer(this.config)
              .then(() => {
                console.log('abc analysis complete')
              })
              .catch( (error: Error): void => {   //SDK 11.22 catch未执行
                console.log('abc error code: ' + error?.code)
                this.ErrorCode = error?.code.toString()
              })
          }).id('StartButton1')
        Button('stop')
          .width(55).height(25)
          .onClick((event: ClickEvent) => {
            console.log('++++++4')
            this.context.stopImageAnalyzer()
          })
        Button('getTypes')
          .width(55).height(25)
          .onClick((event: ClickEvent) => {
            console.log('++++++5')
            this.aiController.getImageAnalyzerSupportTypes()
          })
      }

      if (this.flag) {
        Canvas(this.context, this.options)
          .width(50)
          .height(50)
          .enabled(this.enable)
          .enableAnalyzer(true)
          .onReady(():void => {
            this.context.drawImage(this.img, 0, 0,50,50)
          })
      }

    }
    .width('100%')
    .height('100%')
  }
}