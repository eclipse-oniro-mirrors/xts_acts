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
 
import { MessageManager, Callback, Message } from '../../common/MessageManager';


@Entry
@Component
struct SwiperExample {
  private swiperController: SwiperController = new SwiperController()
  private swiperController1: SwiperController = new SwiperController()

  @State exposeInnerGesture: boolean = true;
  @State callBackString: string = "";


  messageManager: MessageManager<boolean> = new MessageManager();

   onPageShow() {
    console.info('tabsInterceptionEnhancement pages onPageShow');
    globalThis.value = {
      name: 'messageManager',
      message: this.messageManager
    };
    let callback: Callback<boolean> = (message: Message<boolean>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'exposeInnerGesture') {
        this.exposeInnerGesture = message.value;
      }
      
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column({ space: 5 }) {

      Text(this.callBackString).key("callBackString");
      Swiper(this.swiperController) {
        Text("item.toString()")
          .width('90%')
          .height(160)
          .backgroundColor(0xAFEEEE)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text("item2.toString()")
          .width('90%')
          .height(160)
          .backgroundColor(0xAFEEEE)
          .textAlign(TextAlign.Center)
          .fontSize(30)

        Swiper(this.swiperController1) {

          Text("itemxx.toString()")
            .width('90%')
            .height(160)
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
          Text("itemxx2.toString()")
            .width('90%')
            .height(160)
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }.cachedCount(2)
        .index(1)
        .autoPlay(false)
        .interval(4000)
        .loop(true)
        .indicatorInteractive(true)
        .duration(1000)
        .itemSpace(0)
        .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
          others: Array<GestureRecognizer>): GestureJudgeResult => { // 在识别器即将要成功时，根据当前组件状态，设置识别器使能状态
          console.info('enhance ets onGestureRecognizerJudgeBegin child')
          this.callBackString = "接口触发"
          console.info("enhance" + JSON.stringify(event));
          console.info("enhance tag = " + current.getTag() + " type = " + current.getType() + " isBuildIn = " + current.isBuiltIn()
            + " isEnable = " + current.isEnabled() + " getState " + current.getState() + " EventTargetInfo = " +  current.getEventTargetInfo().getId() + " isValid =" + current.isValid());

          for (let i = 0; i < others.length; i++) {
            console.info("enhance others tag = " + others[i].getTag() + " type = " + others[i].getType() + " isBuildIn = " + others[i].isBuiltIn()
              + " isEnable = " + others[i].isEnabled() + " getState " + others[i].getState() + " EventTargetInfo = " +  others[i].getEventTargetInfo().getId() + " isValid =" + others[i].isValid());
          }
          if (current) {
            let target = current.getEventTargetInfo();
            if (target && current.isBuiltIn() && current.getType() == GestureControl.GestureType.PAN_GESTURE) {
              console.info('enhance ets onGestureRecognizerJudgeBegin child PAN_GESTURE')
              let swiperTaget = target as ScrollableTargetInfo
              if (swiperTaget instanceof ScrollableTargetInfo) {
                console.info('enhance ets onGestureRecognizerJudgeBegin child PAN_GESTURE isEnd: ' + swiperTaget.isEnd() + ' isBegin: ' + swiperTaget.isBegin())
              }
              if (swiperTaget instanceof ScrollableTargetInfo && (swiperTaget.isEnd() || swiperTaget.isBegin())) {
                let panEvent = event as PanGestureEvent;
                console.log('enhance pan direction:' + panEvent.offsetX + ' begin:' + swiperTaget.isBegin() + ' end:' +
                swiperTaget.isEnd())
                if (panEvent && panEvent.offsetX < 0 && swiperTaget.isEnd()) {
                  console.info('enhance ets onGestureRecognizerJudgeBegin child reject end')
                  return GestureJudgeResult.REJECT;
                }
                if (panEvent && panEvent.offsetX > 0 && swiperTaget.isBegin()) {
                  console.info('enhance ets onGestureRecognizerJudgeBegin child reject begin')
                  return GestureJudgeResult.REJECT;
                }
              }
            }
          }
          return GestureJudgeResult.CONTINUE;
        }, this.exposeInnerGesture)

        Text("item3.toString()")
          .width('90%')
          .height(160)
          .backgroundColor(0xAFEEEE)
          .textAlign(TextAlign.Center)
          .fontSize(30)
      }
      .cachedCount(2)
      .index(1)
      .autoPlay(false)
      .interval(4000)
      .loop(true)
      .duration(1000)
      .itemSpace(0)
      .key("swiperRecogniserTest")
      .curve(Curve.Linear)
      .onChange((index: number) => {
        console.info(index.toString())
      })
      .onGestureSwipe((index: number, extraInfo: SwiperAnimationEvent) => {
        console.info("index: " + index)
        console.info("current offset: " + extraInfo.currentOffset)
      })
      .onAnimationStart((index: number, targetIndex: number, extraInfo: SwiperAnimationEvent) => {
        console.info("index: " + index)
        console.info("targetIndex: " + targetIndex)
        console.info("current offset: " + extraInfo.currentOffset)
        console.info("target offset: " + extraInfo.targetOffset)
        console.info("velocity: " + extraInfo.velocity)
      })
      .onAnimationEnd((index: number, extraInfo: SwiperAnimationEvent) => {
        console.info("index: " + index)
        console.info("current offset: " + extraInfo.currentOffset)
      })


    }.width('100%')
    .margin({ top: 5 })
  }
}
