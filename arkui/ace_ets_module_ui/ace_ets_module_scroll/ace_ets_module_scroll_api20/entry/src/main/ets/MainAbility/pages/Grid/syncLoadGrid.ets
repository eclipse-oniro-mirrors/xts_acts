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
class MyDataSource implements IDataSource {
  private dataArray: number[] = [];

  public pushData(data: number): void {
    this.dataArray.push(data);
  }

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): number {
    return this.dataArray[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
  }
}

class MyButtonModifier implements AttributeModifier<GridAttribute> {
  public isDark: boolean = false;

  applyNormalAttribute(instance: GridAttribute): void {
    instance.syncLoad(this.isDark);
  }
}

@Entry
@Component
export struct syncLoadPageGrid {
  private data: MyDataSource = new MyDataSource();
  private scroller: Scroller = new Scroller();
  @State modifier: MyButtonModifier = new MyButtonModifier();
  @State syncLoad1: boolean = false

  aboutToAppear() {
    for (let i = 1; i < 100; i++) {
      this.data.pushData(i);
    }
  }

  build() {
    NavDestination() {
      Column({ space: 5 }) {
        Button('syncLoad true')
          .id('grid_syncLoad_true')
          .onClick(() => {
            this.syncLoad1 = true
          })
        Button('scrollTo50')
          .id('grid_syncLoad_scrollTo')
          .onClick(() => {
            this.scroller.scrollToIndex(49)
          })
        Grid(this.scroller, { regularSize: [1, 1] }) {
          GridItem().height('20%').backgroundColor(Color.Blue)
            .columnStart(undefined)
          LazyForEach(this.data, (item: number) => {
            GridItem() {
              // 使用可复用自定义组件
              ReusableChildComponent({ item: item })
            }
          }, (item: string) => item)
        }
        .id('grid_syncLoad')
        .syncLoad(this.syncLoad1)
        // .attributeModifier(this.modifier)
        .cachedCount(0)
        .columnsTemplate('1fr 1fr 1fr')
        .columnsGap(10)
        .rowsGap(10)
        .margin(10)
        .height('60%')
        .width('90%')
        .backgroundColor(0xFAEEE0)
        .onScrollIndex((first: number, last: number) => {
          console.info(`first:${first}, last:${last}`)
        })
        .onReachStart(() => {
          console.info('onReachStart')
        })
        .onReachEnd(() => {
          console.info('onReachEnd')
        })
        .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
          console.info(`scrollOffset:${scrollOffset}, scrollState:${scrollState}`)
        })
      }
    }
  }
}

@Component
struct ReusableChildComponent {
  @State item: number = 0;

  aboutToReuse(params: Record<string, number>) {
    this.item = params.item;
  }

  aboutToAppear(): void {
    let me = Date.now()
    let deadline = me + 10
    while (true) {
      me = Date.now()
      if (me > deadline) {
        return
      }
    }
  }

  build() {
    Column() {
      Text(`图片${this.item}`)
        .fontSize(16)
        .textAlign(TextAlign.Center)
    }
    .width('100%')
    .height('10%')
    .backgroundColor(0xF9CF93)
    .onClick(() => {
      console.info(`index:${this.item} onClick`);
    })
    .onFocus(() => {
      console.info(`index:${this.item} onFocus`);
    })
    .onBlur(() => {
      console.info(`index:${this.item} onBlur`);
    })
  }
}