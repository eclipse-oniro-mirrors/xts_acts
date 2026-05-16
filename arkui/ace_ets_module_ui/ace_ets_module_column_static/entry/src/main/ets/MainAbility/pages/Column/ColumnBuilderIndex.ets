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
import { Entry, Component, Column, ColumnOptions, Text, Button } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ColumnBuilderIndex {
  @State columnStatus: string = 'init';

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('ColumnBuilderIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Text('column_builder_text_1').key('columnBuilderText1').height('5%');
      Text('column_builder_text_2').key('columnBuilderText2').height('5%');
      Button('verifyColumnBuilder')
        .id('verifyColumnBuilderBtn')
        .height('8%')
        .onClick(() => {
          this.columnStatus = 'column_builder_ok';
        });
      Text(this.columnStatus).key('columnBuilderStatus').height('5%');
    }
    .id('columnBuilderRoot')
    .width('100%')
    .height('100%');
  }
}
