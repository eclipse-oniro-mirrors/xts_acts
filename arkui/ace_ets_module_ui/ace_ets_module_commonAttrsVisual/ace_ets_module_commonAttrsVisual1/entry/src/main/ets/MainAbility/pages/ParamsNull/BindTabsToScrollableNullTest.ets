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
struct bindTabsToScrollableIndex {

  private parentTabsController: TabsController = new TabsController();
  private listScroller: Scroller = new Scroller();

  build() {
    Column() {
      Button('bindTabsToScrollable null')
        .id('btn_bindTabsToScrollable_null')
        .height('10%')
        .onClick(() => {
          let ret = this.getUIContext()?.bindTabsToScrollable(null, this.listScroller);
          console.info('bindTabsToScrollable null success:' + ret);
          AppStorage.SetOrCreate('bindTabsToScrollableNull', ret);

          let ret1 = this.getUIContext()?.bindTabsToScrollable(this.parentTabsController, null);
          console.info('bindTabsToScrollable listScroller null success:' + ret1);
          AppStorage.SetOrCreate('bindTabsToScrollableListScrollerNull', ret1);

        })

      Button('bindTabsToScrollable undefined')
        .id('btn_bindTabsToScrollable_undefined')
        .height('10%')
        .onClick(() => {
          let ret = this.getUIContext()?.bindTabsToScrollable(undefined, this.listScroller);
          console.info('bindTabsToScrollable undefined success:' + ret);
          AppStorage.SetOrCreate('bindTabsToScrollableUndefined', ret);

          let ret1 = this.getUIContext()?.bindTabsToScrollable(this.parentTabsController, undefined);
          console.info('bindTabsToScrollable listScroller undefined success:' + ret1);
          AppStorage.SetOrCreate('bindTabsToScrollableListScrollerUndefined', ret1);

        })
    }
    .width('100%')
    .height('100%')
  }
}