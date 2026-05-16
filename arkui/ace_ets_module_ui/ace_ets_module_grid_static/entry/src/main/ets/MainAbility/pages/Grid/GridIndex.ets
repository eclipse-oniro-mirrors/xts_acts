'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Component, Column, Grid, GridItem, Text, ScrollState, ScrollSource, ScrollResult } from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct GridIndex {
  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.info('[ARKUI_NEW] GridIndex error ' + error);
    }
    AppStorage.setOrCreate<string>('gridOnWillScrollCalled', 'false');
    AppStorage.setOrCreate<string>('gridOnDidScrollCalled', 'false');
    AppStorage.setOrCreate<string>('gridOnScrollIndexCalled', 'false');
  }

  build() {
    Column() {
      Grid() {
        GridItem() { Text('1') }
        GridItem() { Text('2') }
        GridItem() { Text('3') }
        GridItem() { Text('4') }
      }
      .syncLoad(true)
      .key('gridFocusDefault')
      .id('gridFocusDefault')
      .columnsTemplate('1fr 1fr')
      .height('20%')
      .width('100%')

      Grid() {
        GridItem() { Text('A') }
        GridItem() { Text('B') }
        GridItem() { Text('C') }
        GridItem() { Text('D') }
      }
      .syncLoad(false)
      .key('gridFocusWrap')
      .id('gridFocusWrap')
      .columnsTemplate('1fr 1fr')
      .height('20%')
      .width('100%')

      Grid() {
        GridItem() { Text('X') }
        GridItem() { Text('Y') }
      }
      .key('gridUndefined')
      .id('gridUndefined')
      .columnsTemplate('1fr 1fr')
      .height('20%')
      .width('100%')

      Grid() {
        GridItem() { Text('S1') }
        GridItem() { Text('S2') }
        GridItem() { Text('S3') }
        GridItem() { Text('S4') }
        GridItem() { Text('S5') }
        GridItem() { Text('S6') }
        GridItem() { Text('S7') }
        GridItem() { Text('S8') }
        GridItem() { Text('S9') }
        GridItem() { Text('S10') }
        GridItem() { Text('S11') }
        GridItem() { Text('S12') }
      }
      .columnsTemplate('1fr 1fr')
      .height('30%')
      .width('100%')
      .key('gridScrollCallbacks')
      .id('gridScrollCallbacks')
      .onWillScroll((_scrollOffset: double, _scrollState: ScrollState, _scrollSource: ScrollSource):
        undefined | ScrollResult => {
        AppStorage.setOrCreate<string>('gridOnWillScrollCalled', 'true');
        console.info('[ARKUI_NEW] Grid onWillScroll triggered');
        return undefined;
      })
      .onDidScroll((_scrollOffset: double, _scrollState: ScrollState): void => {
        AppStorage.setOrCreate<string>('gridOnDidScrollCalled', 'true');
        console.info('[ARKUI_NEW] Grid onDidScroll triggered');
      })
      .onScrollIndex((_first: int, _last: int): void => {
        AppStorage.setOrCreate<string>('gridOnScrollIndexCalled', 'true');
        console.info('[ARKUI_NEW] Grid onScrollIndex triggered');
      })
    }.width('100%').height('100%')
  }
}
