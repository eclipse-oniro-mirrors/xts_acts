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
struct ImageAnimatorEventDataPage {
  @State state: AnimationStatus = AnimationStatus.Initial
  @State preDecode: number = 0
  @State fillMode: FillMode = FillMode.None
  @State reverse: boolean = false
  @State iterations: number = 1
  @State fixedSize: boolean = false


  build() {
    Column({ space:5 }) {
      ImageAnimator()
        .images([
          {
            src: '/comment/bg1.jpg',
            duration: 500,
            width: 325,
            height: 200,
            top: 0,
            left: 0
          },
          {
            src: '/comment/bg2.jpg',
            duration: 500,
            width: 325,
            height: 200,
            top: 0,
            left: 0
          },
          {
            src: '/comment/bg3.jpg',
            duration: 500,
            width: 325,
            height: 200,
            top: 0,
            left: 0
          },
          {
            src: '/comment/bg4.jpg',
            duration: 500,
            width: 325,
            height: 200,
            top: 0,
            left: 0
          }
        ])
        .state(this.state).reverse(this.reverse).fixedSize(this.fixedSize).preDecode(this.preDecode)
        .fillMode(this.fillMode).iterations(this.iterations).width(325).height(210)
        .margin({top:100})
        .onStart(() => {
          console.info('Start')
        })
        .onPause(() => {
          console.info('Pause')
        })
        .onRepeat(() => {
          console.info('Repeat')
          try {
            let backData: events_emitter.EventData = {
              data: {
                'string': 'Repeat'
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 114,
              priority: events_emitter.EventPriority.LOW
            }
            console.info('onRepeat start to emit action state')
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info('emit action state err: ' + JSON.stringify((err as Error)?.message))
          }
        })
        .onCancel(() => {
          console.info('Cancel')
        })
        .onFinish(() => {
          console.info('Finish')
        })
      Row() {
        Button('start').key('button_0').width(100).padding(5).onClick(() => {
          this.state = AnimationStatus.Running
          try {
            let backData: events_emitter.EventData = {
              data: {
                'state': this.state
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 1150,
              priority: events_emitter.EventPriority.LOW
            }
            console.info('imageAnimator 115 button start to emit action state')
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info('button emit action state err: ' + JSON.stringify((err as Error)?.message))
          }
        })
        Button('pause').key('button1').width(100).padding(5).onClick(() => {
          this.state = AnimationStatus.Paused
          try {
            let backData: events_emitter.EventData = {
              data: {
                'state': this.state,
                'fixedSize': this.fixedSize
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 116,
              priority: events_emitter.EventPriority.LOW
            }
            console.info('button1 start to emit action state')
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info('button1 emit action state err: ' + JSON.stringify((err as Error)?.message))
          }
        })
        Button('stop').key('button2').width(100).padding(5).onClick(() => {
          this.state = AnimationStatus.Stopped
          try {
            let backData: events_emitter.EventData = {
              data: {
                'state': this.state,
                'preDecode': this.preDecode
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 117,
              priority: events_emitter.EventPriority.LOW
            }
            console.info('button2 start to emit action state')
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info('button2 emit action state err: ' + JSON.stringify((err as Error)?.message))
          }
        })
      }
      Row() {
        Button('reverse').key('button3').width(100).padding(5).onClick(() => {
          this.reverse = !this.reverse
          try {
            let backData: events_emitter.EventData = {
              data: {
                'fillMode': this.fillMode
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 118,
              priority: events_emitter.EventPriority.LOW
            }
            console.info('button3 start to emit action state')
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info('button3 emit action state err: ' + JSON.stringify((err as Error)?.message))
          }
        })
        Button('once').key('button4').width(100).padding(5).onClick(() => {
          this.iterations = 1
          try {
            let backData: events_emitter.EventData = {
              data: {
                'iterations': this.iterations
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 119,
              priority: events_emitter.EventPriority.LOW
            }
            console.info('button4 start to emit action state')
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info('button4 emit action state err: ' + JSON.stringify((err as Error)?.message))
          }
        })
        Button('iteration').key('button5').width(100).padding(5).onClick(() => {
          this.iterations = -1
          try {
            let backData: events_emitter.EventData = {
              data: {
                'preDecode': this.preDecode
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 120,
              priority: events_emitter.EventPriority.LOW
            }
            console.info('button5 start to emit action state')
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info('button5 emit action state err: ' + JSON.stringify((err as Error)?.message))
          }
        })
      }
    }.width('100%').height('100%').backgroundColor(0xF1F3F5)
  }
  onPageShow() {
    console.info('imageAnimator page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 121,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)
  }

  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('imageAnimator page state change called:' + JSON.stringify(eventData));
      if (eventData.data?.preDecode != null) {
        this.preDecode = eventData.data?.preDecode;
      }
    }
  }
}