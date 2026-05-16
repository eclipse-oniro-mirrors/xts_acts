import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';

// BasicDataSource实现了IDataSource接口，用于管理listener监听，以及通知LazyForEach数据更新
export class BasicDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private originDataArray: string[] = [];

  public totalCount(): number {
    return this.originDataArray.length;
  }

  public getData(index: number): string {
    return this.originDataArray[index];
  }

  // 该方法为框架侧调用，为LazyForEach组件向其数据源处添加listener监听
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  // 该方法为框架侧调用，为对应的LazyForEach组件在数据源处去除listener监听
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  // 通知LazyForEach组件需要重载所有子组件
  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    });
  }

  // 通知LazyForEach组件需要在index对应索引处添加子组件
  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
      // 写法2：listener.onDatasetChange([{type: DataOperationType.ADD, index: index}]);
    });
  }

  // 通知LazyForEach组件在index对应索引处数据有变化，需要重建该子组件
  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
      // 写法2：listener.onDatasetChange([{type: DataOperationType.CHANGE, index: index}]);
    });
  }

  // 通知LazyForEach组件需要在index对应索引处删除该子组件
  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
      // 写法2：listener.onDatasetChange([{type: DataOperationType.DELETE, index: index}]);
    });
  }

  // 通知LazyForEach组件将from索引和to索引处的子组件进行交换
  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
      // 写法2：listener.onDatasetChange(
      // [{type: DataOperationType.EXCHANGE, index: {start: from, end: to}}]);
    });
  }

  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    });
  }
}

class MyDataSource extends BasicDataSource {
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

  // 删除数据
  public deleteData(index: number, count: number): void {
    this.dataArray.splice(index, count);
    this.notifyDatasetChange([
      { type: DataOperationType.DELETE, index: index, count: count }
    ]);
  }

  public modifyAllData(): void {
    this.dataArray = this.dataArray.map((item: string) => {
      return 'Changed ' + item;
    });
    this.notifyDataReload();
  }
}

@Entry
@Component
struct MyComponent {
  private data: MyDataSource = new MyDataSource();
  scroller: Scroller = new Scroller();
  @State h: number = 50

  aboutToAppear() {
    for (let i = 0; i <= 10000; i++) {
      this.data.pushData(`Hello ${i}`);
    }
  }

  build() {
    Column({ space: 5 }) {

      Button('ScrollToIndex 20')
        .onClick(() => {
          this.scroller.scrollToIndex(20); // 滑动场景
        })
        .height(20)

      Button('modifyAllData')
        .onClick(() => {
          this.data.modifyAllData(); //
        })
        .height(20)

      Button('deleteData(0, 5)')
        .onClick(() => {
          this.data.deleteData(0, 5); //
        })
        .height(20)

      Button('height(50)')
        .onClick(() => {
          this.h = 50
        })
        .height(20)

      Button('height(20)')
        .onClick(() => {
          this.h = 20
        })
        .height(20)

      List({ space: 3, scroller: this.scroller }) {
        LazyForEach(this.data, (item: string) => {
          ListItem() {
            ListItemComponent({ item: item, h: this.h }).borderWidth(1)
          }
        }, (item: string) => {
          return item;
        }, { releaseStrategy: LazyForEachReleaseStrategy.PROGRESSIVE })
      }.cachedCount(5)
      .height(50)
      .borderWidth(1)
      .id('LazyForEach_Item_0')

      List({ space: 3, scroller: this.scroller }) {
        LazyForEach(this.data, (item: string) => {
          ListItem() {
            ListItemComponent({ item: item, h: this.h }).borderWidth(1)
          }
        }, (item: string) => {
          return item;
        }, { releaseStrategy: LazyForEachReleaseStrategy.BATCH })
      }.cachedCount(5)
      .height(50)
      .borderWidth(1)
      .id('LazyForEach_Item_1')
    }
  }
}

// @Reusable
@Component
struct ListItemComponent {
  @Prop item: string;
  @Prop h: number;

  aboutToDisappear() {
    // 模拟耗时操作（实际开发中应避免阻塞主线程）
    hiTraceMeter.startTrace(`trace1, ${this.item}`, 1);
    console.log(`jyy Item ${this.item} disappeared with delay`);
    hiTraceMeter.finishTrace(`trace1, ${this.item}`, 1);
  }

  aboutToReuse(params: Record<string, Object | null | undefined>): void {
    console.log(`jyy abouttoreuse ${this.item}`);
  }

  aboutToAppear() {
    console.log(`jyy aboutToAppear: ${this.item}`);
  }

  aboutToRecycle(): void {
    console.log(`jyy aboutToRecycle`);
  }

  build() {
    Text(this.item)
      .fontSize(20)
      .height(this.h)
  }
}

