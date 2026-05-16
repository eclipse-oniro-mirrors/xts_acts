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

import events_emitter from '@ohos.events.emitter'

@Entry
@Component
struct customSaveSetNull {
  @State bgType: ButtonType = ButtonType.Normal
  @State iconSize: number | SizeOptions = 16
  @State customIcon: Resource = $r('app.media.icon')
  @State customText: string = '自定义保存'
  @State iconRadius: number | BorderRadiuses = {topLeft: 2, topRight: 2, bottomLeft: 2, bottomRight: 2}
  @State isShow: number = 0

  build() {
    Row(){
      Column(){
        Row() {
          Column() {
            SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.DOWNLOAD, buttonType: this.bgType })
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.debug('====>page_SaveButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.debug('====>page_SaveButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .setIcon(null)
              .setText(this.customText)
              .iconSize(this.iconSize)
              .iconBorderRadius(this.iconRadius)
              .key('customSave0')
          }
          .visibility(this.isShow === 0 ? Visibility.Visible : Visibility.None)

          Column() {
            SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.DOWNLOAD, buttonType: this.bgType })
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.debug('====>page_SaveButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.debug('====>page_SaveButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .setIcon(this.customIcon)
              .setText(null)
              .iconSize(this.iconSize)
              .iconBorderRadius(this.iconRadius)
              .key('customSave1')
          }
          .visibility(this.isShow === 1 ? Visibility.Visible : Visibility.None)

          Column() {
            SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.DOWNLOAD, buttonType: this.bgType })
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.debug('====>page_SaveButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.debug('====>page_SaveButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .setIcon(this.customIcon)
              .setText(this.customText)
              .iconSize(null)
              .iconBorderRadius(this.iconRadius)
              .key('customSave2')
          }
          .visibility(this.isShow === 2 ? Visibility.Visible : Visibility.None)

          Column() {
            SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.DOWNLOAD, buttonType: this.bgType })
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.debug('====>page_SaveButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.debug('====>page_SaveButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .setIcon(this.customIcon)
              .setText(this.customText)
              .iconSize(this.iconSize)
              .iconBorderRadius(null)
              .key('customSave3')
          }
          .visibility(this.isShow === 3 ? Visibility.Visible : Visibility.None)

          Button('点击切换安全控件')
            .width('50%')
            .height(40)
            .offset({x:-100, y:50})
            .onClick(() => {
              this.isShow++
            })
            .id('switchButton')
        }.width(100)
      }.width('100%').alignItems(HorizontalAlign.Center)
    }.height('100%')
  }
}
