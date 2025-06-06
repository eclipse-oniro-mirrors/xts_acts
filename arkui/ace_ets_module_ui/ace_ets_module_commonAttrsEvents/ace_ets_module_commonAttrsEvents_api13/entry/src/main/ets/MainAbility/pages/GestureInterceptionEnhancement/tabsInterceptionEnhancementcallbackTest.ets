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
struct GestureTest2 {
  @State currentIndex: number = 0
  @State selectedIndex: number = 0
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  controller?: TabsController = new TabsController();
  @State exposeInnerGesture: boolean = true;
  @State eventString:string = "ceshi"; 
  @State timestamp: number = 0

  @Builder
  tabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.selectedIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.selectedIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 17, bottom: 7 })
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.selectedIndex === index ? 1 : 0)
    }.width('100%')
  }
  build() {
    Column() {
        
      Text(this.eventString).key("eventtest");
      Text(this.timestamp + "").key("timestamp");
      Tabs({ barPosition: BarPosition.Start, index: this.currentIndex, controller: this.controller }) {
        TabContent() {
          Column(){
            Text(`GreenTest`).fontSize(16)
          }.width('100%').height('100%').backgroundColor(Color.Green).key("firstTabsContent")

        }.tabBar(this.tabBuilder(0, 'green'))
        TabContent() {
          Tabs() {
            TabContent() {
              Column(){
                Text(`BlueTest`).fontSize(16)
              }.width('100%').height('100%').backgroundColor(Color.Blue)
            }.tabBar(new SubTabBarStyle('blue'))
            TabContent() {
              Column(){
                Text(`PinkTest`).fontSize(16)
              }.width('100%').height('100%').backgroundColor(Color.Pink)
            }.tabBar(new SubTabBarStyle('pink'))
          }
          .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
                                          others: Array<GestureRecognizer>): GestureJudgeResult => { // 在识别器即将要成功时，根据当前组件状态，设置识别器使能状态
            console.info('enhance ets onGestureRecognizerJudgeBegin child')

            console.info("enhance" + JSON.stringify(event));
            this.eventString = JSON.stringify(event);

            console.info("enhance tag = " + current.getTag() + " type = " + current.getType() + " isBuildIn = " + current.isBuiltIn()
             + " isEnable = " + current.isEnabled() + " getState " + current.getState() + " EventTargetInfo = " +  current.getEventTargetInfo().getId() + " isValid =" + current.isValid());

            for (let i = 0; i < others.length; i++) {
              console.info("others tag = " + others[i].getTag() + " type = " + others[i].getType() + " isBuildIn = " + others[i].isBuiltIn()
              + " isEnable = " + others[i].isEnabled() + " getState " + others[i].getState() + " EventTargetInfo = " +  others[i].getEventTargetInfo().getId() + " isValid =" + others[i].isValid());
            }

            if (current) {
              let target = current.getEventTargetInfo();
              if (target && current.isBuiltIn() && current.getType() == GestureControl.GestureType.PAN_GESTURE) {
                console.info('ets onGestureRecognizerJudgeBegin child PAN_GESTURE')
                let swiperTaget = target as ScrollableTargetInfo
                if (swiperTaget instanceof ScrollableTargetInfo) {
                  console.info('ets onGestureRecognizerJudgeBegin child PAN_GESTURE isEnd: ' + swiperTaget.isEnd() + ' isBegin: ' + swiperTaget.isBegin())
                }
                if (swiperTaget instanceof ScrollableTargetInfo && (swiperTaget.isEnd() || swiperTaget.isBegin())) {
                  let panEvent = event as PanGestureEvent;
                  console.log('pan direction:' + panEvent.offsetX + ' begin:' + swiperTaget.isBegin() + ' end:' +
                  swiperTaget.isEnd())
                  if (panEvent && panEvent.offsetX < 0 && swiperTaget.isEnd()) {
                    console.info('ets onGestureRecognizerJudgeBegin child reject end')
                    return GestureJudgeResult.REJECT;
                  }
                  if (panEvent && panEvent.offsetX > 0 && swiperTaget.isBegin()) {
                    console.info('ets onGestureRecognizerJudgeBegin child reject begin')
                    return GestureJudgeResult.REJECT;
                  }
                }
              }
            }
            return GestureJudgeResult.CONTINUE;
          }, this.exposeInnerGesture)
        }.tabBar(this.tabBuilder(1, 'blue and pink'))
        TabContent() {
          Column(){
            Text(`blue and pink test`).fontSize(16)
          }.width('100%').height('100%').backgroundColor(Color.Brown)
        }.tabBar(this.tabBuilder(2, 'brown'))
      }
      .onAnimationStart((index: number, targetIndex: number, event: TabsAnimationEvent) => {
        // 切换动画开始时触发该回调。目标页签显示下划线。
        this.selectedIndex = targetIndex
      })
    }
  }
}