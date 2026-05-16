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
struct unbindTabsFromScrollableIndex {

  private parentTabsController: TabsController = new TabsController();
  private listScroller: Scroller = new Scroller();

  build() {
    Column() {
      Button('unbindTabsFromScrollable null')
        .id('btn_unbindTabsFromScrollable_null')
        .height('10%')
        .onClick(() => {
          let ret = this.getUIContext()?.unbindTabsFromScrollable(null, this.listScroller);
          console.info('unbindTabsFromScrollable null success:' + ret);
          AppStorage.SetOrCreate('unbindTabsFromScrollableNull', ret);

          let ret1 = this.getUIContext()?.unbindTabsFromScrollable(this.parentTabsController, null);
          console.info('unbindTabsFromScrollable listScroller null success:' + ret1);
          AppStorage.SetOrCreate('unbindTabsFromScrollableListScrollerNull', ret1);

        })

      Button('unbindTabsFromScrollable undefined')
        .id('btn_unbindTabsFromScrollable_undefined')
        .height('10%')
        .onClick(() => {
          let ret = this.getUIContext()?.unbindTabsFromScrollable(undefined, this.listScroller);
          console.info('unbindTabsFromScrollable undefined success:' + ret);
          AppStorage.SetOrCreate('unbindTabsFromScrollableUndefined', ret);

          let ret1 = this.getUIContext()?.unbindTabsFromScrollable(this.parentTabsController, undefined);
          console.info('unbindTabsFromScrollable listScroller undefined success:' + ret1);
          AppStorage.SetOrCreate('unbindTabsFromScrollableListScrollerUndefined', ret1);

        })
    }
    .width('100%')
    .height('100%')
  }
}