'use static';
/**
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
import {
  $r,
  Alignment,
  AlphabetIndexer,
  AnimationStatus,
  ArrowStyle,
  Builder,
  Button,
  Canvas,
  CanvasRenderingContext2D,
  Checkbox,
  CheckboxGroup,
  Circle,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Counter,
  Curve,
  DataChangeListener,
  DataPanel,
  DatePicker,
  Divider,
  Ellipse,
  Entry,
  ForEach,
  FormLink,
  Gauge,
  Grid,
  GridCol,
  GridItem,
  GridRow,
  IDataSource,
  Image,
  ImageAnimator,
  ImageSpan,
  LazyForEach,
  LineJoinStyle,
  List,
  ListItem,
  ListItemGroup,
  Margin,
  Menu,
  MenuItem,
  MenuItemGroup,
  Path,
  Polygon,
  Polyline,
  PreDragStatus,
  QRCode,
  Radio,
  Rect,
  Refresh,
  RenderingContextSettings,
  ResourceStr,
  RichEditor,
  RichEditorController,
  RichEditorOptions,
  RichText,
  Row,
  Scroll,
  Scroller,
  Search,
  Span,
  Swiper,
  SwiperController,
  TabContent,
  Tabs,
  TabsController,
  Text,
  TextAlign,
  TextArea,
  TextClock,
  TextInput,
  TextPicker,
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { ComponentUtils, Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import matrix4 from '@ohos.matrix4'

let matrix = matrix4.init([1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0])

class MyDataSource1 implements IDataSource<number> {
  private list: number[] = []

  constructor(list: number[]) {
    this.list = list
  }

  totalCount(): Int {
    return this.list.length
  }

  getData(index: Int): number {
    return this.list[index as Int]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
  }
}

@Entry
@Component
struct comSizeAbilityTest_28 {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource1 = new MyDataSource1([])

  aboutToAppear(): void {
    let uiContext = this.getUIContext();
    let comSizeAbilityTest_28 = uiContext.getRouter();
    AppStorage.setOrCreate<Router>("comSizeAbilityTest_28", comSizeAbilityTest_28);
    let list: number[] = []
    for (let i = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new MyDataSource1(list)
  }

  build() {
    Scroll() {
      Column({ space: 5 } as ColumnOptions) {
        Swiper(this.swiperController) {
          LazyForEach(this.data, (item: number): void => {
            Text(item.toString())
              .width('90%')
              .height(160)
              .backgroundColor(0xAFEEEE)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: number): string => String(item))
        }
        .size({ width: 250, height: 100 })
        .translate({ x: 1, y: 1, z: 1 })
        .scale({
          x: 1,
          y: 1,
          z: 1,
          centerX: 1,
          centerY: 1
        })
        .rotate({
          x: 1,
          y: 1,
          z: 1,
          angle: 0,
          centerX: 1,
          centerY: 1
        })
        .transform(matrix)
        .key("Swiper_Size")
        .cachedCount(2)
        .index(1)
        .autoPlay(true, { stopWhenTouched: true })
        .interval(4000)
        .indicator(true)
        .loop(true)
        .duration(1000)
        .itemSpace(0)
        .displayArrow({
          showBackground: true,
          isSidebarMiddle: true,
          backgroundSize: 24,
          backgroundColor: Color.White,
          arrowSize: 18,
          arrowColor: Color.Blue
        } as ArrowStyle, false)
        .curve(Curve.Linear)
      }.width('100%').margin({ top: 5 } as Margin).key('Swiper_Father')
    }.height('100%')
  }
}


