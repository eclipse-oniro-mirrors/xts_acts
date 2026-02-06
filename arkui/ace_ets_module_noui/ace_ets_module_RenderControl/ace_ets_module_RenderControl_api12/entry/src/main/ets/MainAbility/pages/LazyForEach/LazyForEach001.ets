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

class MyBasicDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private originDataArray: string[] = [];


  public totalCount(): number {
    return this.originDataArray.length;
  }


  public getData(index: number): string {
    return this.originDataArray[index];
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

class MyCusDataSource extends MyBasicDataSource {
  private dataArray: string[] = [];
  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): string {
    return this.dataArray[index];
  }

  public pushData(data: string): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }
  public changeData(data: string, index: number): void {
    this.dataArray.splice(index, 0 , data);
    this.notifyDataChange(index);
  }
  public changeMultipleData(indices: number[], newValue: string): void {
    indices.forEach(index => {
      if (index >= 0 && index < this.dataArray.length) {
        this.dataArray[index] = newValue;
        this.notifyDataChange(index);
      }
    });
  }
}
let childV1Count = 0;
@Reusable
@Component
struct ChildV1 {
  @Prop @Require @Watch('onNameChange') name: string;
  @Consume('newId') newId: number;
  private myId: number = -1;

  onNameChange(monitor: IMonitor) {
    this.newId = this.myId;
  }
  aboutToAppear(): void {
    this.myId = childV1Count++;
    this.newId = this.myId;
  }
  build() {
    Stack() {
      Text(this.name)
        .border({width: 10})
    }
  }
}
@Entry
@Component
struct MyComponent {
  @Provide('newId') @Watch('changeId') newId: number = -1;
  @State maxId: number = 0;
  @State changeNum: number = 0;
  @State rotateAngle: number = 0;
  @State startIndex: number = -1;
  private data: MyCusDataSource = new MyCusDataSource();
  private scroller: Scroller = new Scroller();
  aboutToAppear() {
    for (let i = 0; i <= 20; i++) {
      this.data.pushData(`Hello ${i}`);
    }
  }
  changeId() {
    if (this.maxId < this.newId) {
      this.maxId = this.newId;
    }
  }
  build() {
    Column({space: 10}) {
      Button('stop rotating')
        .height('5%')
        .margin(50)
        .rotate({ x: 0, y: 0, z: 1, angle: this.rotateAngle })
        .onAppear(() => {
          this.getUIContext()?.animateTo({
            duration: 1200,
            curve: Curve.Friction,
            delay: 500,
            iterations: -1,
            playMode: PlayMode.Alternate,
            expectedFrameRateRange: {
              min: 10,
              max: 120,
              expected: 60,
            }
          }, () => {
            this.rotateAngle = 90;
          })
        })
        .onClick(() => {
          this.getUIContext()?.animateTo({ duration: 0 }, () => {
            this.rotateAngle = 0;
          })
        })
      Divider()
      Row() {
        Text(`newId: ${this.newId}, maxId:`)
        Text(this.maxId.toString())
          .id('maxId')
        Button('sliding')
          .id('sliding')
          .height('3%')
          .onClick(() => {
            this.scroller.fling(-1000)
          })
        Button('change date')
          .id('changeDate')
          .height('3%')
          .onClick(() => {
            this.scroller.scrollToIndex(4);
            this.data.changeMultipleData([4,5,6], `update${this.changeNum++}`);
          })
      }
      List({ space: 3 ,scroller: this.scroller}) {
        LazyForEach(this.data, (item: string) => {
          ListItem() {
            Row() {
              ChildV1({name: item})
                .height('25%')
            }.margin({ left: 10, right: 10 })
          }
        }, (item: string) => item)
      }.cachedCount(0)
      .height('50%')
      .borderWidth(5)
      .onScrollIndex((start: number, end: number) => {
        this.startIndex = start;
      })
    }
  }
}
