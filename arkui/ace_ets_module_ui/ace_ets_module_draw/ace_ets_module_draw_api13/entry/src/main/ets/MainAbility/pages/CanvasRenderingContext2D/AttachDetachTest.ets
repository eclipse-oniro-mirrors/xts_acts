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
struct AttachDetachTest {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  @State flag: boolean = false
  @State canvasWidth: number = 600
  @State canvasHeight: number = 200
  @State message1: string = ''
  @State message2: string = ''
  @State message3: string = ''
  @State message4: string = ''
  private attachCallback: Callback<void> = () => {
    console.info('onAttach 2')
    this.message3 = 'onAttach 2'
  }
  private detachCallback: Callback<void> = () => {
    console.info('onDetach 2')
    this.message4 = 'onDetach 2'
  }

  aboutToAppear(): void {
    this.context.on('onAttach', () => {
      console.info('onAttach 1')
      this.message1 = 'onAttach 1'
    })

    this.context.on('onDetach', () => {
      console.info('onDetach 1')
      this.message2 = 'onDetach 1'
    })
  }

  build() {
    Column() {
      Row() {
        Button('on onAttach').id('on_onAttach')
          .onClick(() => {
            this.context.on('onAttach', this.attachCallback)
          })

        Button('off onAttach').id('off_onAttach')
          .onClick(() => {
            this.context.off('onAttach', this.attachCallback)
          })
      }

      Row() {
        Button('on onDetach').id('on_onDetach')
          .onClick(() => {
            this.context.on('onDetach', this.detachCallback)
          })

        Button('off onDetach').id('off_onDetach')
          .onClick(() => {
            this.context.off('onDetach', this.detachCallback)
          })
      }

      Row() {
        Button('off onAttach all').id('off_onAttach_all')
          .onClick(() => {
            this.context.off('onAttach')
          })

        Button('off onDetach all').id('off_onDetach_all')
          .onClick(() => {
            this.context.off('onDetach')
          })
      }

      Row() {
        Button('change content <=> undefined').id('change_canvas')
          .onClick(() => {
            this.message1 = ''
            this.message2 = ''
            this.message3 = ''
            this.message4 = ''
            this.flag = !this.flag
          })
      }

      Text(this.message1).id('attach_content_1').width('80%').height(30).backgroundColor(Color.Pink)
      Text(this.message2).id('detach_content_1').width('80%').height(30).backgroundColor(Color.Pink)
      Text(this.message3).id('attach_content_2').width('80%').height(30).backgroundColor(Color.Pink)
      Text(this.message4).id('detach_content_2').width('80%').height(30).backgroundColor(Color.Pink)
      Row() {
        Canvas(this.flag ? undefined : this.context)
          .width('100%')
          .height(this.canvasHeight)
          .backgroundColor('#ffff00')
          .onReady(() => {
            this.context.font = '25vp'
            this.context.textAlign = 'center'
            this.context.fillText('Canvas 1', this.context.width / 2, 50)
          })
      }
    }
  }
}