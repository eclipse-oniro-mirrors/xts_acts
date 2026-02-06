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

@Entry
@Component
struct TouchStrategyExample {
  scroller: Scroller = new Scroller()
  private arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  @State testTextStr: string = 'test'

  build() {
    Column(){
      Column() {
        Text(this.testTextStr).key('listText_TouchStrategy')
          .fontSize(20)
      }
      .height(30)
      .margin(10)
      .backgroundColor(Color.White)

      Scroll(this.scroller) {
        Column() {
          Text('Test Text Visible Change')
            .fontSize(20)
            .height('15%')
            .backgroundColor(Color.Green)
              // 通过设置ratios为[0.0, 1.0]，实现当组件完全显示或完全消失在屏幕中时触发回调
            .onVisibleAreaChange([0.0, 1.0], (isVisible: boolean, currentRatio: number) => {
              console.info('Test Text isVisible: ' + isVisible + ', currentRatio:' + currentRatio)
              if (isVisible && currentRatio >= 1.0) {
                console.info('Test Text is fully visible. currentRatio:' + currentRatio)
                this.testTextStr = 'Test Text is fully visible'
              }

              if (!isVisible && currentRatio <= 0.0) {
                console.info('Test Text is completely invisible.')
                this.testTextStr = 'Test Text is completely invisible'
              }
            })

          List({ initialIndex: 0 }) {
            ForEach(this.arr, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%').height('20%').fontSize(16)
                  .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
              }
            }, (item: string) => item)
          }
          .listDirection(Axis.Vertical) // 排列方向
          .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
        }
      }
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto)
      .width('100%')
      .height('40%')
      .key('list_TouchStrategy')
      .backgroundColor(Color.Gray)

      Text().key('border_TouchStrategy')
        .width(300).height(300)
        .borderWidth(1).margin(2)

    }
    .width('100%').height('100%')
    .key('Column_TouchStrategy')
    .backgroundColor(Color.Blue)
    .onChildTouchTest((TouchTestInfo)=>{
      for(let i = 0; i<TouchTestInfo.length; i++){
        console.log('x:' + TouchTestInfo[i].x)
        console.log('windowX:' + TouchTestInfo[i].windowX)
        if(TouchTestInfo[i].id == 'list_TouchStrategy'){
          console.log('list_TouchStrategy: FORWARD_COMPETITION')
          return{id: TouchTestInfo[i].id, strategy: TouchTestStrategy.FORWARD_COMPETITION}
        }
      }
      return {strategy: TouchTestStrategy.FORWARD_COMPETITION}
    })
  }
}