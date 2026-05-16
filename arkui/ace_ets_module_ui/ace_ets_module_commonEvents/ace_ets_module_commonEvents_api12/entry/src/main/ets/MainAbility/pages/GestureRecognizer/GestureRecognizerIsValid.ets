/**
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
struct FatherControlChildTest1 {
  scroller: Scroller = new Scroller()
  scroller2: Scroller = new Scroller()
  scroller3: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  private childRecognizer: GestureRecognizer = new GestureRecognizer()
  private currentRecognizer: GestureRecognizer = new GestureRecognizer()
  private lastOffset: number = 0
  @State isShow: boolean = true
  @State vis: Visibility = Visibility.Visible
  @State text: string = 'start'


  build() {
    Column(){
      Text(this.text).fontSize(26).margin(10).id('recognizer_text')
      Button()
        .id('childScrollVisBtn')
        .onClick(()=>{
          if(this.vis == Visibility.Visible){
            this.vis = Visibility.None
          }else{
            this.vis = Visibility.Visible
          }
        }).width(200)
        .height('10%')
      Scroll(this.scroller) { // 外部滚动容器
        Column() {
          Flex({direction: FlexDirection.Column, justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center}){
          Text("Scroll Area").id('FatherControlChildTest1_text')
            .width('90%')
            .height('15%')
            .backgroundColor(0xFFFFFF)
            .borderRadius(15)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .margin({ top: 10 })

          Scroll(this.scroller2) { // 内部滚动容器
            Column() {
                Text("Scroll Area2")
                  .width('90%')
                  .height('15%')
                  .backgroundColor(0xFFFFFF)
                  .borderRadius(15)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .margin({ top: 10 })
                Column() {
                  ForEach(this.arr, (item: number) => {
                    Text(item.toString()).id(`FatherControlChildTest1_inner_${item}`)
                      .width('90%')
                      .height('15%')
                      .backgroundColor(0xFFFFFF)
                      .borderRadius(15)
                      .fontSize(16)
                      .textAlign(TextAlign.Center)
                      .margin({ top: 10 })
                  }, (item: string) => item)
                }.width('100%')
              }
            }.visibility(this.vis)
          .id("FatherControlChildTest1_inner")
          .width('100%')
          .height('80%')
          }
        }.width('100%').height('80%')
      }
      .id("outer")
      .height('80%')
      .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
      .scrollBar(BarState.On) // 滚动条常驻显示
      .scrollBarColor(Color.Gray) // 滚动条颜色
      .scrollBarWidth(10) // 滚动条宽度
      .edgeEffect(EdgeEffect.None)
      .onScroll((xOffset:number,yOffset:number)=>{
        console.info(xOffset + ' ' + yOffset)
      })
      .onScrollEdge((side:Edge)=>{
        console.info('To the edge')
      })
      .onScrollStop(()=>{
        console.info('Scroll stop')
      })
      .shouldBuiltInRecognizerParallelWith((current:GestureRecognizer,others:Array<GestureRecognizer>)=>{
        for(let i = 0; i < others.length; i++){
          let pan = others[i] as PanRecognizer;
          if(pan){
            console.log('zcb shouldBuiltInRecognizerParallelWith pan type', pan.getType() + 'distance' + pan.getPanGestureOptions().getDirection());
          }
          let target = others[i] .getEventTargetInfo();
          if(target){
            let id = target.getId();
            console.log('zcb parallelInlnerGestureTo other id' + id + 'isSystemGesture' + others[i].isBuiltIn() + 'type' + others[i].getType());
            if(id == 'FatherControlChildTest1_inner' && others[i].isBuiltIn() && others[i].getType() == GestureControl.GestureType.PAN_GESTURE){
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
          if(target){
            let id = target.getId();
            console.log('zcb onGestureJudgeBegin current id' + id);
            if(id == 'outer' && current.isBuiltIn() && current.getType() == GestureControl.GestureType.PAN_GESTURE){
              if(others){
                for(let i = 0; i < others.length; i++){
                  let target = others[i] .getEventTargetInfo() as ScrollableTargetInfo;
                  if(target){
                    let id = target.getId();
                    console.log('zcb onGestureJudgeBegin other id' + id + 'isSystemGesture' + others[i].isBuiltIn() + 'type' + others[i].getType());
                    if(id == 'FatherControlChildTest1_inner'){
                      console.log('zbc onGestureJudgeBegin other isBegin' + target.isBegin() + 'isEnd' + target.isEnd())
                      let panEvent = event as PanGestureEvent;
                      if(target.isEnd()){
                        if(panEvent && panEvent.offsetY < 0){
                          this.childRecognizer.setEnabled(false)
                          this.currentRecognizer.setEnabled(true)
                        }else{
                          this.childRecognizer.setEnabled(true)
                          this.currentRecognizer.setEnabled(false)
                        }
                      }else if(target.isBegin()){
                        if(panEvent.offsetY > 0){
                          this.childRecognizer.setEnabled(false)
                          this.currentRecognizer.setEnabled(true)
                        }else{
                          this.childRecognizer.setEnabled(true)
                          this.currentRecognizer.setEnabled(false)
                        }
                      }else{
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
          .onActionUpdate((event:GestureEvent)=>{
            if(this.childRecognizer.isValid()){
              this.text = 'valid'
              console.log('zcb is valid')
            }else{
              this.text = 'notValid'
              console.log('zcb is not valid')
            }
          })
      )
    }.width('100%').height('100%').backgroundColor(0xDCDCDC)
  }
}