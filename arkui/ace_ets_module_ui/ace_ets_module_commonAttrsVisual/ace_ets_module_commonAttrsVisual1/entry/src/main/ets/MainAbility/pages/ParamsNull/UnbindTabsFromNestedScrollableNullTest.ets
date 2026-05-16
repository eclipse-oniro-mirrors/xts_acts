/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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

@Entry
@Component
struct unbindTabsFromNestedScrollableIndex {

  private tabs: TabsController = new TabsController();
  private scroller: Scroller = new Scroller();
  private childScroller: Scroller = new Scroller();

  build() {
    Column() {
      Button('unbindTabsFromNestedScrollable null')
        .id('btn_unbindTabsFromNestedScrollable_null')
        .height('10%')
        .onClick(() => {
          let ret = this.getUIContext()?.unbindTabsFromNestedScrollable(null, this.scroller, this.childScroller);
          console.info('unbindTabsFromNestedScrollable null 1 success:' + ret);
          AppStorage.SetOrCreate('unbindTabsFromNestedScrollable1Null', ret);

          let ret1 = this.getUIContext()?.unbindTabsFromNestedScrollable(this.tabs, null, this.childScroller);
          console.info('unbindTabsFromNestedScrollable null 2 success:' + ret1);
          AppStorage.SetOrCreate('unbindTabsFromNestedScrollable2Null', ret1);

          let ret2 = this.getUIContext()?.unbindTabsFromNestedScrollable(this.tabs, this.scroller, null);
          console.info('unbindTabsFromNestedScrollable  null 3 success:' + ret2);
          AppStorage.SetOrCreate('unbindTabsFromNestedScrollable3Null', ret2);
        })

      Button('unbindTabsFromNestedScrollable undefined')
        .id('btn_unbindTabsFromNestedScrollable_undefined')
        .height('10%')
        .onClick(() => {
          let ret = this.getUIContext()?.unbindTabsFromNestedScrollable(undefined, this.scroller, this.childScroller);
          console.info('unbindTabsFromNestedScrollable undefined 1 success:' + ret);
          AppStorage.SetOrCreate('unbindTabsFromNestedScrollable1Undefined', ret);

          let ret1 = this.getUIContext()?.unbindTabsFromNestedScrollable(this.tabs, undefined, this.childScroller);
          console.info('unbindTabsFromNestedScrollable undefined 2 success:' + ret1);
          AppStorage.SetOrCreate('unbindTabsFromNestedScrollable2Undefined', ret1);

          let ret2 = this.getUIContext()?.unbindTabsFromNestedScrollable(this.tabs, this.scroller, undefined);
          console.info('unbindTabsFromNestedScrollable undefined 3 success:' + ret2);
          AppStorage.SetOrCreate('unbindTabsFromNestedScrollable3Undefined', ret2);
        })
    }
    .width('100%')
    .height('100%')
  }
}