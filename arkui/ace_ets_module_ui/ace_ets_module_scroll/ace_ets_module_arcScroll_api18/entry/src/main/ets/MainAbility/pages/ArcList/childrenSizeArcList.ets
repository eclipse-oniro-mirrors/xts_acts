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

@Builder
function buildText() {
  Column() {
    Text('header')
      .fontSize('60px')
      .fontWeight(FontWeight.Bold)
  }.margin(0)
}

@Entry
@Component
struct listChildrenSizeArcList {
  @State  private numItems: number[] = [0, 1, 2, 3, 4, 5];
  @State listChildrenSize: ChildrenMainSize = new ChildrenMainSize(6)
  scroller: Scroller = new Scroller()
  @State count: number = 0

  private watchSize: string = '466px' // 手表默认宽高：466*466
  private listSize: string = '414px'

  context: UIContext = this.getUIContext()
  tabBar1: ComponentContent<Object> = new ComponentContent(this.context, wrapBuilder(buildText));
  getColor(): Color {
    this.count++
    return Color.Pink
  }

  aboutToAppear(){
    this.listChildrenSize.childDefaultSize = 40
  }

  build() {
    Column() {
      Text(this.count.toString())
        .id('arcList_Count')
        .height('5%')
        .margin({top: 5})
      Button('splice 5')
        .id('arcList_splice')
        .height('5%')
        .onClick(() => {
          this.listChildrenSize.splice(0, 2, [30, 30, 30])
        })
      Button('update 5')
        .id('arcList_update')
        .height('5%')
        .onClick(() => {
          this.listChildrenSize.update(0, 50)
        })
      Stack() {
        Column() {
        }
        .justifyContent(FlexAlign.Center)
        .width(this.watchSize)
        .height(this.watchSize)
        .clipShape(new CircleShape({ width: '100%', height: '100%' }))
        .backgroundColor(Color.White)

        ArcList({ initialIndex: 0, header: this.tabBar1, scroller: this.scroller }) {
          ForEach(this.numItems, (item: number, index: number) => {
            ArcListItem() {
              Button('' + item, { type: ButtonType.Capsule })
                .id('arcList_size_' + item)
                .width(this.listSize)
                .height('100px')
                .fontSize('40px')
                .focusable(true)
                .focusOnTouch(true)
                .backgroundColor(0x17A98D)
            }.align(Alignment.Center)
          }, (item: string, index: number) => item + index)
        }
        .space(LengthMetrics.px(10))
        .borderRadius(this.watchSize)
        .focusable(true)
        .focusOnTouch(true)
        .defaultFocus(true)
        .childrenMainSize(this.listChildrenSize)
        .backgroundColor(this.getColor())
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
