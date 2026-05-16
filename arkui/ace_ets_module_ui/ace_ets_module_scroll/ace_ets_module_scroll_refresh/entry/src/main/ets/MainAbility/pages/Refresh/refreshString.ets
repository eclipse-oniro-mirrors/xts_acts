/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct RefreshString1 {
  @State isRefreshing: boolean = false;
  @State counter: number = 0;
  @State promptText: string = 'Refreshing...'

  onPageShow() {
    console.info('[list] page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 180,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    console.info('[stateChangCallBack] stateChangCallBack');
    if (eventData != null) {
      console.info('[stateChangCallBack] state change called:' + JSON.stringify(eventData));
      if (eventData.data?.promptText != null) {
        this.promptText = eventData.data?.promptText;
      }
    }
  }

  build() {
    Column() {
      Refresh({ refreshing: this.isRefreshing, promptText: this.promptText }) {
        Text('Pull Down and refresh: ' + this.counter)
          .fontSize(30)
          .margin(10)
      }
      .id('refreshLevel1')
      .onStateChange((refreshStatus: RefreshStatus) => {
        console.info('Refresh onStateChange state is ' + refreshStatus);
      })
      .onRefreshing(() => {
        setTimeout(() => {
          this.counter++;;
          this.isRefreshing = false;
        }, 1000)
        console.log('onRefreshing test')
      })
    }
  }
}