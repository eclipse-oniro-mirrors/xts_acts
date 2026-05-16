'use static'
import {
  IDataSource,
  DataChangeListener
} from '@ohos.arkui.component';

export class GridDataSource implements IDataSource<string> {
  private list: string[] = [];
  private listeners: DataChangeListener[] = [];

  constructor(list: string[]) {
    this.list = list;
  }

  totalCount(): Int {
    return this.list.length;
  }

  getData(index: Int): string {
    return this.list[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  // 通知控制器数据位置变化
  notifyDataMove(from: Int, to: Int): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }

  // 交换元素位置
  public swapItem(from: Int, to: Int): void {
    let temp: string = this.list[from];
    this.list[from] = this.list[to];
    this.list[to] = temp;
    this.notifyDataMove(from, to);
  }
}