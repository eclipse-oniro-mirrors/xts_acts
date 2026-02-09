/**
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
import { UIUtils } from '@ohos.arkui.StateManagement';
@Entry
@ComponentV2
struct FlushErrorCode {
  @Local firstName: string = 'Hua';
  @Local lastName: string = 'Li';
  @Local count: number = 0;
  @Local count1: number = 0;
  @Local flag11: number = 0;
  @Local flag12: number = 0;
  @Local flag21: number = 0;
  @Local flag22: number = 0;
  @Local flag31: number = 0;
  @Local flag32: number = 0;
  @Computed
  get fullName1() {
    console.info('fullName');
    // 在computed中调用applySync、flushUpdates、flushUIUpdates运行时报错
    try {
      UIUtils.flushUIUpdates()
    } catch (error) {
      if (error?.code === 140001) {
        this.flag11++;
      }
    }
    return this.firstName + ' ' + this.lastName;
  }
  @Computed
  get fullName2() {
    console.info('fullName');
    try {
      UIUtils.flushUpdates()
    } catch (error) {
      if (error?.code === 140001) {
        this.flag21++;
      }
    }
    return this.firstName + ' ' + this.lastName;
  }
  @Computed
  get fullName3() {
    console.info('fullName');
    try {
      UIUtils.applySync(() => {
        this.count++;
      })
    } catch (error) {
      if (error?.code === 140001) {
        this.flag31++;
      }
    }
    return this.firstName + ' ' + this.lastName;
  }

  @Monitor('count')
  onCountChange(monitor: IMonitor) {
    monitor.dirty.forEach((path: string) => {
      console.info(`${path} changed from ${monitor.value(path)?.before} to ${monitor.value(path)?.now}`);
    });
    try {
      UIUtils.flushUIUpdates();
    } catch (error) {
      if (error?.code === 140002) {
        this.flag12++;
      }
    }
  }

  @Monitor('count1')
  onCountChange2(monitor: IMonitor) {
    monitor.dirty.forEach((path: string) => {
      console.info(`${path} changed from ${monitor.value(path)?.before} to ${monitor.value(path)?.now}`);
    });
    try {
      UIUtils.flushUpdates();
    } catch (error) {
      if (error?.code === 140002) {
        this.flag22++;
      }
    }
  }

  build() {
    Column() {
      Text(this.flag11.toString())
        .height('5%')
        .id('FlushErrorCode_001')
      Text(this.flag21.toString())
        .height('5%')
        .id('FlushErrorCode_002')
      Text(this.flag31.toString())
        .height('5%')
        .id('FlushErrorCode_003')
      Text(this.flag12.toString())
        .height('5%')
        .id('FlushErrorCode_004')
      Text(this.flag22.toString())
        .height('5%')
        .id('FlushErrorCode_005')
      Text(`${this.fullName1}`)
      .height('5%')
      Text(`${this.fullName2}`)
      .height('5%')
      Text(`${this.fullName3}`)
      .height('5%')
      Button('change count')
        .height('5%')
        .id('FlushErrorCode_006')
        .onClick(() => {
          this.count++;
          this.count1++;
        })
    }
  }
}