'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
import {
  IDataSource,
  DataChangeListener,
  DataOperation
} from '@ohos.arkui.component';
export class MyDataSource implements IDataSource<number> {
  private list: number[] = []

  constructor(list: number[]) {
    this.list = list
  }

  totalCount(): int {
    return this.list.length
  }

  getData(index: int): number {
    return this.list[index as int]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener(listener: DataChangeListener) {
  }
}