'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  Entry, Text, Column, Component, List, ListItem, Image, Button, ImageFit, PixelMap,
  LazyForEach, DataChangeListener, DataOperation, DataOperationType, DataAddOperation, Row
} from '@ohos.arkui.component';
import { ObjectLink, Observed, State } from '@ohos.arkui.stateManagement';
import { IDataSourcePrefetching, BasicPrefetcher } from '@ohos.arkui.Prefetcher';
import image from '@ohos.multimedia.image';

const ITEMS_ON_SCREEN = 8;

@Entry
@Component
struct BasicPrefetcherMethods {
  private page: Int = 1;
  private pageSize: Int = 3;
  private readonly fetchDelayMs: Int = 100;
  private readonly dataSource: MyDataSource = new MyDataSource(this.page, this.pageSize, this.fetchDelayMs);
  private readonly prefetcher: BasicPrefetcher<PictureItem> = new BasicPrefetcher<PictureItem>();
  @State SetDataSourceResult: string = ""
  @State VisibleAreaChangedResult: string = ""

  build() {
    Column() {
      List() {
        LazyForEach<PictureItem>(this.dataSource, (item: PictureItem, index: Int) => {
          ListItem() {
            PictureItemComponent({ info: item })
              .height('5%')
          }
        }, (item: PictureItem) => item.title)
      }
      .onScrollIndex((start: Int, end: Int) => {
        this.prefetcher.visibleAreaChanged(start as int, end as int);
      })

      Button('Set DataSource')
        .id('ButtonSetDataSource')
        .onClick(() => {
          this.prefetcher.setDataSource(this.dataSource);
          this.SetDataSourceResult = "SetDataSource success";
        })
        .height('5%')

      Button('Visible Area Changed')
        .id('ButtonVisibleAreaChanged')
        .onClick(() => {
          this.prefetcher.visibleAreaChanged(0, 2);
          this.VisibleAreaChangedResult = "VisibleAreaChanged 0,5 called";
        })
        .height('5%')

      Text(this.SetDataSourceResult)
        .id('SetDataSourceResultShow')
        .height('5%')

      Text(this.VisibleAreaChangedResult)
        .id('VisibleAreaChangedResultShow')
        .height('5%')
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct PictureItemComponent {
  @ObjectLink info: PictureItem;

  build() {
    Row() {
      Image(this.info.imagePixelMap)
        .objectFit(ImageFit.Contain)
        .width('40%')
      Text(this.info.title)
        .width('60%')
    }
  }
}

@Observed
export class PictureItem {
  readonly color: Int;
  title: string;
  imagePixelMap: image.PixelMap | undefined;
  key: string;
  loaded: boolean = false;

  constructor(color: Int, title: string) {
    this.color = color;
    this.title = title;
    this.key = title;
    const bitmap = create10x10Bitmap(16777215);
    const imageSource: image.ImageSource | undefined = image.createImageSource(bitmap);
    this.imagePixelMap = imageSource?.createPixelMapSync();
  }
}

type ItemIndex = Int;
type TimerId = Int;

export class MyDataSource implements IDataSourcePrefetching<PictureItem> {
  private readonly items: PictureItem[] = [];
  private readonly fetchDelayMs: Int;
  private readonly fetches: Map<ItemIndex, TimerId> = new Map<ItemIndex, TimerId>();
  private readonly listeners: DataChangeListener[] = [];

  constructor(pageNum: Int, pageSize: Int, fetchDelayMs: Int) {
    this.fetchDelayMs = fetchDelayMs;
    this.getHttpData(pageNum, pageSize);
  }

  prefetch(index: int): Promise<void> | undefined {
    const item = this.items[index as int];
    if (item.loaded) {
      return undefined;
    }

    return new Promise<void>(resolve => {
      const timeoutId: Int = setTimeout(() => {
        this.fetches.delete(index);
        item.loaded = true;
        resolve(undefined);
      }, this.fetchDelayMs as int);

      this.fetches.set(index, timeoutId)
    });
  }

  cancel(index: int): Promise<void> | undefined {
    const timerId:Int|undefined = this.fetches.get(index);
    if (timerId) {
      this.fetches.delete(index);
      clearTimeout(timerId as int);
    }
    return undefined;
  }

  getHttpData(pageNum: Int, pageSize:Int): void {
    const newItems: PictureItem[] = [];
    for (let i = (pageNum - 1) * pageSize; i < pageNum * pageSize; i++) {
      const item = new PictureItem(255 + i, `Item ${i}`);
      newItems.push(item);
    }
    const startIndex = this.items.length;
    this.items.splice(startIndex, 0, ...newItems);
    this.notifyBatchUpdate([
      {
        type: DataOperationType.ADD,
        index: startIndex,
        count: newItems.length,
      } as DataAddOperation
    ]);
  }

  private notifyBatchUpdate(operations: DataOperation[]) {
    this.listeners.forEach((listener: DataChangeListener) => {
      listener.onDatasetChange(operations);
    });
  }

  totalCount(): Int {
    return this.items.length;
  }

  getData(index: Int): PictureItem {
    return this.items[index as int];
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
}

function create10x10Bitmap(color: Int): ArrayBuffer {
  const height = 10;
  const width = 10;

  const fileHeaderLength = 14;
  const bitmapInfoLength = 40;
  const headerLength = fileHeaderLength + bitmapInfoLength;
  const pixelSize = (width * 3 + 2) * height;

  let length = pixelSize + headerLength;

  const buffer = new ArrayBuffer(length);
  const view16 = new Uint16Array(buffer);

  view16[0] = 0x4D42;
  view16[1] = length & 0xffff;
  view16[2] = length >> 16;
  view16[5] = headerLength;

  let offset = 7;
  view16[offset++] = bitmapInfoLength & 0xffff;
  view16[offset++] = bitmapInfoLength >> 16;
  view16[offset++] = width & 0xffff;
  view16[offset++] = width >> 16;
  view16[offset++] = height & 0xffff;
  view16[offset++] = height >> 16;
  view16[offset++] = 1;
  view16[offset++] = 24;

  const b = color & 0xff;
  const g = (color >> 8) & 0xff;
  const r = color >> 16;
  offset = headerLength;
  const view8 = new Uint8Array(buffer);
  for (let y = 0; y < height; y++) {
    for (let x = 0; x < width; x++) {
      view8[offset++] = b;
      view8[offset++] = g;
      view8[offset++] = r;
    }
    offset += 2;
  }

  return buffer;
}