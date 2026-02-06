/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
@Entry
@Component
struct AttachDetachRebindTest {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  @State flag: boolean = true
  @State canvasWidth: number = 600
  @State canvasHeight: number = 200
  @State message: string = ''


  aboutToAppear(): void {
    this.context.on('onAttach', () => {
      console.info('onAttach')
      if (this.message == '') {
        this.message = 'onAttach'
      } else {
        this.message += ' onAttach'
      }
    })

    this.context.on('onDetach', () => {
      console.info('onDetach')
      if (this.message == '') {
        this.message = 'onDetach'
      } else {
        this.message += ' onDetach'
      }
    })
  }

  build() {
    Column() {
      Row() {
        Button('Change Canvas').id('change_canvas')
          .onClick(() => {
            this.flag = !this.flag
          })
      }

      Text(this.message).id('attach_detach_content').backgroundColor(Color.Pink)

      Row() {
        if (this.flag) {
          Canvas(this.context).id('canvas1')
            .width('100%')
            .height(this.canvasHeight)
            .backgroundColor(Color.Yellow)
            .onReady(() => {
              this.context.font = '25vp'
              this.context.textAlign = 'center'
              this.context.fillText('Canvas 1', this.context.width / 2, 50)
            })
        } else {
          Canvas(this.context).id('canvas2')
            .width('100%')
            .height(this.canvasHeight)
            .backgroundColor(Color.Green)
            .onReady(() => {
              this.context.font = '25vp'
              this.context.textAlign = 'center'
              this.context.fillText('Canvas 2', this.context.width / 2, 50)
            })
        }
      }
    }
  }
}