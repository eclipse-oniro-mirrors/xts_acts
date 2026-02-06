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
class BasicDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private originDataArray: string[] = [];

  public totalCount(): number {
    return 0;
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

  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    })
  }
}

class MyDataSource extends BasicDataSource {
  public dataArray: string[] = [];

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): string {
    return this.dataArray[index];
  }

  public addData(index: number): void {
    this.dataArray.splice(index, 0, 'Hello A');
    this.notifyDatasetChange([{type: DataOperationType.ADD, index: index,count:1}]);
  }
  public DeleteData(index: number): void {
    this.dataArray.splice(index, 1);
    this.notifyDatasetChange([{type: DataOperationType.DELETE, index: index,count:1}]);
    this.totalCount()
  }
  public ExChangeData(): void {
    let temp = this.dataArray[1];
    this.dataArray[1] = this.dataArray[2];
    this.dataArray[2] = temp
    this.notifyDatasetChange([{type: DataOperationType.EXCHANGE, index: {start:1,end:2 }}]);
  }
  public pushData(data: string): void {
    this.dataArray.push(data);
  }

}

@Entry
@Component
struct LazyForEachDataOperationType {
  private data: MyDataSource = new MyDataSource();
  @State message:string=''
  @State message1:string=''
  @State length1: number = 0
  aboutToAppear() {
    for (let i = 0; i <= 2; i++) {
      this.data.pushData(`Hello ${i}`)
    }
  }

  build() {
    Column() {
      Text('Text:'+ this.message1)
        .id('DataOperationType_0')
      Text('Length:'+ this.length1)
        .id('DataOperationType_1')
      Button('ADD')
        .id('DataOperationType_2')
        .onClick(() => {
          this.data.addData(0)
          this.length1 = this.data.dataArray.length
        })
      Button('DELETE')
        .id('DataOperationType_3')
        .onClick(() => {
          this.data.DeleteData(0)
          this.length1 = this.data.dataArray.length
        })
      Button('EXCHANGE')
        .id('DataOperationType_4')
        .onClick(() => {
        this.data.ExChangeData()
          this.message1=this.data.dataArray[1]
      })
      List() {
        LazyForEach(this.data, (item: string,index:number) => {
          ListItem() {
            Row() {
              Text(item)
                .id('indexA'+index)
                .fontSize(9)
                .onAppear(() => {
                  console.info("appear:" + item)
                })
            }
          }

        }, (item: string) => item)
      }.cachedCount(5)
    }
  }
}