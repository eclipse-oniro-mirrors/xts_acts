/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
@Entry
@Component
struct stageMediaquery {
  @State color: string = '#000'
  @State text: string = 'Test'
  listener = globalThis.uiContent.getMediaQuery().matchMediaSync('(orientation: landscape)')
  aboutToAppear() {
    this.listener.on('change', (mediaQueryResult) => {
      if (mediaQueryResult.matches) {
        this.color = '#FFD700'
        this.text = 'Landscape'
      } else {
        this.color = '#DB7093'
        this.text = 'Portrait'
      }
    })
  }
  aboutToDisappear() {
  }
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text("mediaQuery-Off")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("offText")
        .onClick(() => {
          this.listener.off('change', (mediaQueryResult) => {
            console.log(JSON.stringify(mediaQueryResult))
            var result=true
            try {
              var backData = {
                data: {
                  "STATUS": result
                }
              }
              let backEvent = {
                eventId: 60218,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("onSelect start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("onSelect emit action state err: " + JSON.stringify(err.message))
            }
          })
        })
      Text("mediaQuery-MatchMediaSync")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("matchMediaSyncText")
        .onClick(() => {
          console.log('mediaQuery-MatchMediaSync: ' + JSON.stringify(this.listener))
          var result=(this.listener!=null)
          try {
            var backData = {
              data: {
                "STATUS": result
              }
            }
            let backEvent = {
              eventId: 60219,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("onSelect start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("onSelect emit action state err: " + JSON.stringify(err.message))
          }

        })
      Text(this.text)
        .fontSize(50)
        .fontColor(this.color)
    }.width("100%").height("100%")
  }
}