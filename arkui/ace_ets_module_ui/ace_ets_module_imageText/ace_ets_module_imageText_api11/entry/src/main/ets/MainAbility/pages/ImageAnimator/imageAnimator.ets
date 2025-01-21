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
import { MessageManager, Callback } from '../../common/MessageManager';
@Entry
@Component
struct ImageAnimatorExample {
  @State state: AnimationStatus = AnimationStatus.Initial
  @State reverse: boolean = false
  @State iterations: number = 1
  @State fixedSize:boolean = true
  @State fillMode:FillMode = FillMode.None
  @State duration:number = 2000
  @State duration1:number = 0
  // ImageFrameIno constructor parameter
  @State widthT:number = 20;
  @State heightT:number = 20;
  @State top:number = 20;
  @State left:number = 20;

  @State message1:string = "ani"
  @State message2:string = "ani"
  @State message3:string = "ani"
  @State message4:string = "ani"
  @State message5:string = "ani"

  messageManager:MessageManager = new MessageManager()

  onPageShow() {
    console.info('imageAnimator onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'state') {
          this.state = message.value
      }
      if (message.name == 'reverse') {
          this.reverse = message.value
      }
      if (message.name == 'iterations') {
          this.iterations = message.value
      }
      if (message.name == 'fixedSize') {
          this.fixedSize = message.value
      }
      if (message.name == 'fillMode') {
          this.fillMode = message.value
      }
      if (message.name == 'duration') {
          this.duration = message.value
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column({ space: 10 }) {
      ImageAnimator()
        .images([
          {
            src: $rawfile('img1.png'),
            width:this.widthT,
            height:this.heightT,
            top:this.top,
            left:this.left,
            duration:this.duration1
          },
          {
            src: $rawfile('img2.png'),
            width:30,
            height:20,
            top:20,
            left:20
          },
          {
            src: $rawfile('img3.png'),
            width:20,
            height:20,
            top:20,
            left:20
          }
        ])
        .duration(this.duration)
        .state(this.state).reverse(this.reverse).fixedSize(this.fixedSize)
        .fillMode(this.fillMode).iterations(this.iterations).width(340).height(240)
        .margin({ top: 100 })
        .key('imageAnimator')
        .onStart(() => {
          console.info('Start123456')
          this.message1 = 'start'
        })
        .onPause(() => {
          console.info('Pause')
          this.message2 = 'pause'
        })
        .onRepeat(() => {
          console.info('Repeat')
          this.message3 = 'onRepeat'
        })
        .onCancel(() => {
          console.info('Cancel')
          this.message4 = 'onCancel'
        })
        .onFinish(() => {
          console.info('Finish')
          this.state = AnimationStatus.Stopped
          this.message5 = 'onFinish'
        })
        .width('100%').height('50%')

      Row() {
        Button('start').width(100).padding(5).onClick(() => {
          this.state = AnimationStatus.Running
        }).margin(5).key('start')
        Button('pause').width(100).padding(5).onClick(() => {
          this.state = AnimationStatus.Paused     // 显示当前帧图片
        }).margin(5).key('pause')
        Button('stop').width(100).padding(5).onClick(() => {
          this.state = AnimationStatus.Stopped    // 显示动画的起始帧图片
        }).margin(5)
      }

      Row() {
        Button('reverse').width(100).padding(5).onClick(() => {
          this.reverse = !this.reverse
        }).margin(5).key('reverse')
        Button('once').width(100).padding(5).onClick(() => {
          this.iterations = 1
        }).margin(5)
        Button('infinite').width(100).padding(5).onClick(() => {
          this.iterations = -1 // 无限循环播放
        }).margin(5).key('infinite')
      }

      Text(this.message1).key('t1')
      Text(this.message2).key('t2')
      Text(this.message3).key('t3')
      Text(this.message4).key('t4')
      Text(this.message5).key('t5')
    }.width('100%').height('100%')
  }
}