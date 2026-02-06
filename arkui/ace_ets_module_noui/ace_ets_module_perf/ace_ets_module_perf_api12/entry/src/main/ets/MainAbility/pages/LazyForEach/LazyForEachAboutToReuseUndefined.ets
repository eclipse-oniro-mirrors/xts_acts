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

class BasicDataSourceInterface3 implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private dataArray: string[] = [];

  public totalCount(): number {
    return this.dataArray.length;
  }

  public totalArray(): string[] {
    return this.dataArray;
  }

  pushData(data: string): void {
    this.dataArray.push(data)
    this.notifyDataReload()
  }

  public deleteData(index: number): void {
    this.dataArray.splice(index, 1);
    this.notifyDataDelete(index);
  }

  public moveData(from: number, to: number): void {
    let temp: string = this.dataArray[from];
    this.dataArray[from] = this.dataArray[to];
    this.dataArray[to] = temp;
    this.notifyDataMove(from, to);
  }

  public getData(index: number): string {
    return this.dataArray[index];
  }

  public operateData(): void {
    console.info(`[${this.dataArray.join(', ')}]`);
    this.dataArray.splice(4, 0, this.dataArray[1]);
    this.dataArray.splice(1, 1);
    let temp = this.dataArray[4];
    this.dataArray[4] = this.dataArray[6];
    this.dataArray[6] = temp;
    this.dataArray.splice(8, 0, 'Hello 1', 'Hello 2');
    this.dataArray.splice(12, 2);
    console.info(`[${this.dataArray.join(', ')}]`);
    this.notifyDatasetChange([
      { type: DataOperationType.MOVE, index: { from: 1, to: 3 } },
      { type: DataOperationType.EXCHANGE, index: { start: 4, end: 6 } },
      { type: DataOperationType.ADD, index: 8, count: 2 },
      { type: DataOperationType.DELETE, index: 10, count: 2 }]);
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    });
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    });
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    });
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    });
  }

  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    });
  }

  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    });
  }
}

AppStorage.setOrCreate('reuseCount', 0)

@Entry
@Component
struct LazyForEachAboutToReuseUndefined {
  @State data: BasicDataSourceInterface3 = new BasicDataSourceInterface3();
  @State switch:boolean = true
  scroller: Scroller = new Scroller()
  @State parentInfo: string = 'parentInfo';

  aboutToAppear(): void {
    for (let i = 1; i <= 50; i++) {
      this.data.pushData(i.toString());
    }
  }

  build() {
    Column() {
      Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap }) {
        Button('switch')
          .id('switch')
          .height('5%')
          .padding(5)
          .fontSize(12)
          .onClick(() => {
            this.switch = !this.switch
          })
        Button('pushData')
          .id('pushData')
          .height('5%')
          .padding(5)
          .fontSize(12)
          .onClick(() => {
            for (let i = 1; i <= 15; i++) {
              this.data.pushData((this.data.totalCount() + 1).toString());
            }
          })
        Button('deleteData')
          .id('deleteData')
          .height('5%')
          .padding(5)
          .fontSize(12)
          .onClick(() => {
            this.data.deleteData(2)
          })
        Button('moveData')
          .id('moveData')
          .height('5%')
          .padding(5)
          .fontSize(12)
          .onClick(() => {
            this.data.moveData(2, 0)
          })
        Button('operateData')
          .id('operateData')
          .height('5%')
          .padding(5)
          .fontSize(12)
          .onClick(() => {
            this.data.operateData()
          })

      }
      Text(this.parentInfo).id('interfaceInfo')
      if(this.switch){
        List({ space: 3, initialIndex: 0 ,scroller:this.scroller}) {
          LazyForEach(this.data, (item: string, idex: number) => {
            ListItem() {
              ChildViewShow3({ message: item,childInfo:this.parentInfo}).reuseId('ReuseId')
            }
          }, (item: string, index: number) => item + index)
        }
        .width('100%')
        .layoutWeight(1)
        .divider({ strokeWidth: 1, color: Color.Gray })
        .scrollBar(BarState.Off)
        .align(Alignment.Center)
      }
    }
  }
}

@Reusable
@Component
struct ChildViewShow3 {
  @State message: Object | undefined | null = '';
  @Link childInfo: string;

  aboutToReuse(params: Record<string, undefined>) {
    console.info('Recycle Child')
    this.childInfo = 'aboutToReuse'
    this.message = params.message as undefined
  }

  aboutToRecycle(): void {
    this.childInfo = 'aboutToRecycle'
  }

  build() {
    Column() {
      Text(this.message as string)
        .id(this.message as string)
        .width('100%')
        .height('5%')
        .textAlign(TextAlign.Center)
    }
    .borderWidth(2)
  }
}