import render from 'libnativerender.so'
import { CommonView } from '../../componet/CommonView';

class BasicDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private originDataArray: string[] = [];

  public totalCount(): number {
    return 0;
  }

  public getData(index: number): string {
    return this.originDataArray[index];
  }

  // 该方法为框架侧调用，为LazyForEach组件向其数据源处添加listener监听
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  // 该方法为框架侧调用，为对应的LazyForEach组件在数据源处去除listener监听
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  // 通知LazyForEach组件需要重载所有子组件
  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  // 通知LazyForEach组件需要在index对应索引处添加子组件
  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  // 通知LazyForEach组件在index对应索引处数据有变化，需要重建该子组件
  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  // 通知LazyForEach组件需要在index对应索引处删除该子组件
  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  // 通知LazyForEach组件将from索引和to索引处的子组件进行交换
  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }

  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    })
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

  public addData(index: number, data: string): void {
    this.dataArray.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  public pushData(data: string): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }
}
@Entry
@Component
struct TestLazyForEachExpandMode005 {
  PAGE_TAG: string = 'TestLazyForEachExpandMode005';
  @State vis: Visibility = Visibility.Visible
  @State isShow: boolean = true
  private data: MyDataSource = new MyDataSource();
  private data1: MyDataSource = new MyDataSource();
  @State arr: Array<string> = [];
  private index_: number = 0

  aboutToAppear() {
    for (let i = 0; i <= 10; i++) {
      this.data.pushData(`Hello${i}`)
    }
    for (let i = 0; i <= 10; i++) {
      this.data1.pushData(`TTT${i}`)
    }
    for (let i = 0; i <= 10; i++) {
      this.arr.push(`World${i}`)
    }
  }

  build() {
    Scroll() {
      Column() {
        Column() {
          Scroll() {
            Column() {
              List({ space: 3 }) {
                LazyForEach(this.data1, (item1: string) => {
                  ListItem() {
                    Row() {
                      Text(item1).fontSize(20).id(item1)
                        .onAppear(() => {
                          console.info('appear:' + item1)
                        })
                    }.margin({ left: 10, right: 10 })
                  }.id('ListAItem_' + item1)
                }, (item1: string) => item1)
              }
              .margin(8)
              .id('ListA')
              .borderWidth(2)
              .cachedCount(2)
              .height(105)
            }
          }.scrollBarColor(Color.Transparent)
        }
        .width('100%')
        .height('50%')
        .backgroundColor(Color.Gray)
        Column() {
          CommonView({
            pageTag: this.PAGE_TAG,
          }).onAppear(() => {
            render.testLazyForEachExpandMode005(this.PAGE_TAG);
          })
        }.height('50%')
      }
      .width('100%')
      .height('100%')
    }.scrollBarColor(Color.Transparent)
  }
}