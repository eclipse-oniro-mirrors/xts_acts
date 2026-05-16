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

class MyButtonModifier implements AttributeModifier<ListAttribute> {
  public isDark: boolean = false;

  applyNormalAttribute(instance: ListAttribute): void {
    instance.syncLoad(this.isDark);
  }
}

@Entry
@Component
export struct syncLoadPageList {
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
          .id('list_syncLoad_true')
          .onClick(() => {
            this.syncLoad1 = true
          })
        Button('scrollTo50')
          .id('list_syncLoad_scrollTo')
          .onClick(() => {
            this.scroller.scrollToIndex(49)
          })
        List({scroller:this.scroller}) {
          LazyForEach(this.data, (item: number) => {
            ListItem() {
              // 使用可复用自定义组件
              ReusableChildComponent({ item: item })
            }
          }, (item: string) => item)
        }
        .id('list_syncLoad')
        .syncLoad(this.syncLoad1)
        .cachedCount(0)
        .margin(10)
        .height('60%')
        .width('90%')
        .backgroundColor(0xFAEEE0)
        .layoutWeight(1)
        // .attributeModifier(this.modifier)
        .onScrollIndex((start: number, end: number, center: number)=>{
          console.log('onScrollIndex:start:' + start + ',end:' + end + ',center:' + center);
        })
        .onReachStart(()=>{
          console.log('onReachStart');
        })
        .onReachEnd(()=>{
          console.log('onReachEnd');
        })
        .onDidScroll(()=>{
          console.log('onDidScroll');
        })
        .onWillScroll(()=>{
          console.log('onWillScroll');
        })
        .onScrollStart(()=>{
          console.log('onWillScroll');
        })
        .onScrollStop(()=>{
          console.log('onScrollStop');
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
    let deadline = me + 20
    while(true) {
      me = Date.now()
      if (me > deadline) {
        return
      }
    }
  }

  build() {
    Column() {
      Text(`图片${this.item}`)
        .fontSize(10)
        .textAlign(TextAlign.Center)
    }
    .width('100%')
    .height('5%')
    .backgroundColor(0xF9CF93)
  }
}