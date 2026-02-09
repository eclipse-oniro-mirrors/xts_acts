/*
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

import { MultiNavigation, MultiNavPathStack, SplitPolicy } from '@ohos.arkui.advanced.MultiNavigation';
import { PageHome } from './PageHome';
import { PageDetail } from './PageDetail';

@Entry
@Component
struct MultiEntryUndefined {
  @Provide('multiStack') multiStack: MultiNavPathStack = new MultiNavPathStack();

  @Builder
  PageMap(name: string) {
    if (name === 'PageHome') {
      PageHome()
    } if (name === 'PageDetail') {
      PageDetail()
    }
  }

  aboutToAppear(): void {
  }

  onNavigationModeChangeCallback() {
  }

  onHomeShowOnTopCallback() {
    AppStorage.setOrCreate('onNavigationModeChangeCallbackValue', 1);
  }

  build() {
    Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Column() {
        Button('popUndefined').onClick(() => {
          let value = this.multiStack.pop(false);
          console.log('MultiNavigation test value ', JSON.stringify(value))
          AppStorage.setOrCreate('popUndefined', value)
        }).height('5%')
        Button('popParamUndefined').onClick(() => {
          let value = this.multiStack.pop('test', true);
          console.log('MultiNavigation test value ', JSON.stringify(value))
          AppStorage.setOrCreate('popParamUndefined', value)
        }).height('5%')
        Button('getAllPathNameEmpty').onClick(() => {
          let allPathName: string[] = this.multiStack.getAllPathName();
          console.log('MultiNavigation test getAllPathName ', allPathName.length)
          AppStorage.setOrCreate('allPathName', allPathName)
        }).height('5%')
        Button('getParamByIndexUndefined').onClick(() => {
          let index = this.multiStack.getParamByIndex(1);
          console.log('MultiNavigation test getParamByIndex ', index)
          AppStorage.setOrCreate('index', index)
        }).height('5%')
        Button('getParamByNameEmpty').onClick(() => {
          let params = this.multiStack.getParamByName('1');
          console.log('MultiNavigation test getParamByIndex ', params.length)
          AppStorage.setOrCreate('params', params)
        }).height('5%')
        Button('getIndexByNameEmpty').onClick(() => {
          let indexs = this.multiStack.getIndexByName('1');
          console.log('MultiNavigation test getIndexByName ', indexs.length)
          AppStorage.setOrCreate('indexs', indexs)
        }).height('5%')
        Button('switchFullScreenState').onClick(() => {
          let flag = this.multiStack.switchFullScreenState(true);
          console.log('MultiNavigation test getIndexByName ', flag)
          AppStorage.setOrCreate('flag', flag)
        }).height('5%')
      }
    }
    .height('80%')
    .width('100%')
  }
}