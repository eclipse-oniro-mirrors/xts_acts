/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { ComponentContent, LengthMetrics } from '@kit.ArkUI';
import { UIContext, CircleShape } from '@kit.ArkUI';
import { ArcList, ArcListItem, ArcListAttribute, ArcListItemAttribute } from '@ohos.arkui.ArcList';

@Entry
@Component
struct swipeActionArcList {
  @State  private numItems: number[] = [0, 1, 2, 3, 4];
  scroller: Scroller = new Scroller()
  @State listItemOffset: string = 'swipeAction'
  @State listItemState: string = 'swipeAction'

  private watchSize: string = '466px' // 手表默认宽高：466*466
  private listSize: string = '414px'

  @Builder
  itemStart() {
    Row() {
      Button('Del').margin('4vp')
    }.justifyContent(FlexAlign.SpaceEvenly)
  }
  @Builder
  itemEnd() {
    Row() {
      Button('Del').margin('4vp')
    }.justifyContent(FlexAlign.SpaceEvenly)
  }

  build() {
    Column() {
      Text(this.listItemOffset)
        .id('arcList_listItemOffset')
        .height('5%')
        .margin({top: 5})
      Text(this.listItemState)
        .id('arcList_listItemState')
        .height('5%')
      Stack() {
        Column() {
        }
        .justifyContent(FlexAlign.Center)
        .width(this.watchSize)
        .height(this.watchSize)
        .clipShape(new CircleShape({ width: '100%', height: '100%' }))
        .backgroundColor(Color.White)

        ArcList({ initialIndex: 0, scroller: this.scroller }) {
          ForEach(this.numItems, (item: number, index: number) => {
            ArcListItem() {
              Button('' + item, { type: ButtonType.Capsule })
                .width(this.listSize)
                .height('100px')
                .fontSize('40px')
                .focusable(true)
                .focusOnTouch(true)
                .backgroundColor(0x17A98D)
            }.align(Alignment.Center)
            .id('arcListItem_' + item)
            .swipeAction({
              start: {
                builder: (): void => this.itemStart(),
                actionAreaDistance: 5,
                onStateChange: (state: SwipeActionState) => {
                  if (state == SwipeActionState.COLLAPSED) {
                    console.info('MyList1_ListItem0 swipe action state COLLAPSED')
                    this.listItemState = 'start COLLAPSED'
                  } else if (state == SwipeActionState.EXPANDED) {
                    console.info('MyList1_ListItem0 swipe action state EXPANDED')
                    this.listItemState = 'start EXPANDED'
                  } else if (state == SwipeActionState.ACTIONING) {
                    console.info('MyList1_ListItem0 swipe action state ACTIONING')
                    this.listItemState = 'start ACTIONING'
                  } else {
                    console.info('MyList1_ListItem0 swipe action state UNKOWN')
                    this.listItemState = 'start UNKOWN'
                  }
                }
              },
              end: {
                builder: (): void => this.itemEnd(),
                onStateChange: (state: SwipeActionState) => {
                  if (state == SwipeActionState.COLLAPSED) {
                    console.info('MyList2_ListItem0 swipe action state COLLAPSED')
                    this.listItemState = 'end COLLAPSED'
                  } else if (state == SwipeActionState.EXPANDED) {
                    console.info('MyList2_ListItem0 swipe action state EXPANDED')
                    this.listItemState = 'end EXPANDED'
                  } else if (state == SwipeActionState.ACTIONING) {
                    console.info('MyList2_ListItem0 swipe action state ACTIONING')
                    this.listItemState = 'end ACTIONING'
                  } else {
                    console.info('MyList2_ListItem0 swipe action state UNKOWN')
                    this.listItemState = 'end UNKOWN'
                  }
                }
              },
              edgeEffect: SwipeEdgeEffect.Spring,
              onOffsetChange: (offset: number) => {
                if (offset > 0) {
                  console.info('MyList1_Item0 swipe start')
                  this.listItemOffset = 'swipe start'
                } else {
                  console.info('MyList1_Item0 swipe end')
                  this.listItemOffset = 'swipe end'
                }
              }
            })
          }, (item: string, index: number) => item + index)
        }
        .space(LengthMetrics.px(10))
        .borderRadius(this.watchSize)
        .focusable(true)
        .focusOnTouch(true)
        .defaultFocus(true)
      }
      .align(Alignment.Center)
      .width(this.watchSize)
      .height(this.watchSize)
      .border({color: Color.Black, width: 1})
      .borderRadius(this.watchSize)
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}
