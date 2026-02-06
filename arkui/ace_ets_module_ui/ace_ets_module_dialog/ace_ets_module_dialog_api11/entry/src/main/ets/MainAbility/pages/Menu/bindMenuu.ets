/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import events_emitter from '@ohos.events.emitter'

@Entry
@Component
struct MenuExample {
  @State onActionCalled: boolean = true
  @State isShow: boolean = false

  @Builder
  MenuBuilder() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Text('text1')
        .fontSize(20)
        .width(100)
        .height(50)
        .textAlign(TextAlign.Center)
      Divider().height(10)
      Text('text2')
        .fontSize(20)
        .width(100)
        .height(50)
        .textAlign(TextAlign.Center)
      Divider().height(10)
      Button('button')
        .key('button')
        .fontSize(20)
        .width(100)
        .height(50)
        .onClick(() => {
          console.info('bindMenu button START')
          try {
            let backData: events_emitter.EventData = {
              data: {
                'ACTION': this.onActionCalled,
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 64,
              priority: events_emitter.EventPriority.LOW
            }
            console.info('bindMenuTest_0100 start to emit action state')
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info('bindMenuTest_0100 emit action state err: ' + JSON.stringify((err as Error)?.message))
          }
        })
    }.width(100)
  }

  build() {
    Column() {
      Button('click for menu')
        .key('text')
        .onClick(()=>{
          this.isShow = true
        })
        .bindMenu(this.isShow!!, this.MenuBuilder, {
          enableArrow: true,
          placement: Placement.Bottom
        })
    }
    .width('100%')
    .margin({ top: 5 })
  }
}