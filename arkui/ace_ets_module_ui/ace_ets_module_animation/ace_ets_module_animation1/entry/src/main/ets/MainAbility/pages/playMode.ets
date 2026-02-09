/**
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
struct PlayModeExample {
  @State playMode: PlayMode = PlayMode.Normal;
  @State show: string = 'show';

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, }) {
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor(0x317aff)
        .margin({ bottom: 20 })
        .key('button')
        .onClick(() => {
          this.playMode = PlayMode.AlternateReverse
          try {
            let backData: events_emitter.EventData = {
              data: {
                'playMode': this.playMode,
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 161,
              priority: events_emitter.EventPriority.LOW
            }
            console.info('button start to emit action state');
            events_emitter.emit(backEvent, backData);
          } catch (err) {
            console.info('button emit action state err: ' + JSON.stringify((err as Error)?.message));
          }
        })
    }
    .height(400)
    .width('100%')
    .padding({ top: 100 })
  }
}