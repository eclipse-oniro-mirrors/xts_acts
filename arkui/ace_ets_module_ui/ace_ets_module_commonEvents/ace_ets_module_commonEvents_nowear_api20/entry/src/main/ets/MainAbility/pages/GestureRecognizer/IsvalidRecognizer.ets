/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
struct FatherControlChild {
  scroller: Scroller = new Scroller()
  scroller2: Scroller = new Scroller()
  scroller3: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  private childRecognizer: GestureRecognizer = new GestureRecognizer()
  private currentRecognizer: GestureRecognizer = new GestureRecognizer()
  private lastOffset: number = 0
  @State isShow: boolean = true

  build() {
    Column() {
      Button().onClick(()=>{
        this.isShow = !this.isShow
      }).id('button')
      Scroll(this.scroller) {
        Column() {
          Text("Scroll Area")
            .width('90%')
            .height('10%')
            .backgroundColor(0xFFFFFF)
            .borderRadius(15)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .margin({ top: 10 })
          if (this.isShow) {
            Scroll(this.scroller2) {
              Column() {
                Text("Scroll Area2")
                  .width('90%')
                  .height('10%')
                  .backgroundColor(0xFFFFFF)
                  .borderRadius(15)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .margin({ top: 10 })
                Column() {
                  ForEach(this.arr, (item: number) => {
                    Text(item.toString())
                      .width('90%')
                      .height('10%')
                      .backgroundColor(0xFFFFFF)
                      .borderRadius(15)
                      .fontSize(16)
                      .textAlign(TextAlign.Center)
                      .margin({ top: 10 })
                  }, (item: string) => item)
                }.width('100%')
              }
            }
            .id("inner")
            .width('100%')
            .height('90%')
          }
        }.width('100%')
      }
      .id("outer")
      .height('100%')
      .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
      .scrollBar(BarState.On) // 滚动条常驻显示
      .scrollBarColor(Color.Gray) // 滚动条颜色
      .scrollBarWidth(10) // 滚动条宽度
      .edgeEffect(EdgeEffect.None)
      .onScroll((xOffset: number, yOffset: number) => {
        console.info(xOffset + ' ' + yOffset)
      })
      .onScrollEdge((side: Edge) => {
        console.info('To the edge')
      })
      .onScrollStop(() => {
        console.info('Scroll Stop')
      })
      .shouldBuiltInRecognizerParallelWith((current: GestureRecognizer, others: Array<GestureRecognizer>) => {
        for (let i = 0; i < others.length; i++) {
          let pan = others[i] as PanRecognizer;
          if (pan) {
            console.log("zcb shouldBuiltInRecognizerParallelWith pan type ", pan.getType() + " distance " + pan.getPanGestureOptions().getDirection());
          }
          let target = others[i].getEventTargetInfo();
          if (target) {
            let id = target.getId();
            console.log("zcb parallelInnerGestureTo other id " + id + " isSystemGesture " + others[i].isBuiltIn() + " type " + others[i].getType());
            if (id == "inner" && others[i].isBuiltIn() && others[i].getType() == GestureControl.GestureType.PAN_GESTURE) {
              this.currentRecognizer = current;
              this.childRecognizer = others[i];
              return others[i];
            }
          }
        }
        return undefined;
      })
      .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer, others: Array<GestureRecognizer>) => {
        if (current) {
          let target = current.getEventTargetInfo();
          if (target) {
            let id = target.getId();
            console.log("zcb onGestureJudgeBegin current id " + id);
            if (id == "outer" && current.isBuiltIn() && current.getType() == GestureControl.GestureType.PAN_GESTURE) {
              if (others) {
                for (let i = 0; i < others.length; i++) {
                  let target = others[i].getEventTargetInfo() as ScrollableTargetInfo;
                  if (target) {
                    let id = target.getId();
                    console.log("zcb onGestureJudgeBegin other id " + id);
                    if (id == "inner") {
                      console.log("zcb onGestureJudgeBegin other isBegin " + target.isBegin() + " isEnd " + target.isEnd());
                      let panEvent = event as PanGestureEvent;
                      if (target.isEnd()) {
                        if (panEvent && panEvent.offsetY < 0) {
                          this.childRecognizer.setEnabled(false)
                          this.currentRecognizer.setEnabled(true)
                        } else {
                          this.childRecognizer.setEnabled(true)
                          this.currentRecognizer.setEnabled(false)
                        }
                      } else if (target.isBegin()) {
                        if (panEvent.offsetY > 0) {
                          this.childRecognizer.setEnabled(false)
                          this.currentRecognizer.setEnabled(true)
                        } else {
                          this.childRecognizer.setEnabled(true)
                          this.currentRecognizer.setEnabled(false)
                        }
                      } else {
                        this.childRecognizer.setEnabled(true)
                        this.currentRecognizer.setEnabled(false)
                      }
                    }
                  }
                }
              }
            }
          }
        }
        return GestureJudgeResult.CONTINUE;
      })
      .parallelGesture(
        PanGesture()
          .onActionUpdate((event: GestureEvent)=>{
            console.log('cccc'+this.childRecognizer.isBuiltIn())
            console.log('aaaa'+this.childRecognizer.getState())
            AppStorage.setOrCreate('READY',GestureRecognizerState.READY)
            AppStorage.setOrCreate('DETECTING',GestureRecognizerState.DETECTING)
            AppStorage.setOrCreate('PENDING',GestureRecognizerState.PENDING)
            AppStorage.setOrCreate('BLOCKED',GestureRecognizerState.BLOCKED)
            AppStorage.setOrCreate('SUCCESSFUL',GestureRecognizerState.SUCCESSFUL)
            AppStorage.setOrCreate('FAILED',GestureRecognizerState.FAILED)
            AppStorage.setOrCreate('getState4',this.childRecognizer.getState())
            AppStorage.setOrCreate('isBuiltIn',this.childRecognizer.isBuiltIn())
            AppStorage.setOrCreate('isValid',this.childRecognizer.isValid())
            if (this.childRecognizer.isValid()) {
              console.log("zcb is valid")
            } else {
              console.log("zcb is not valid")
            }
          })
      )
    }.width('100%').height('90%').backgroundColor(0xDCDCDC)
  }
}