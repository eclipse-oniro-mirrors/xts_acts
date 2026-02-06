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

import { UIUtils } from '@kit.ArkUI';

@Observed
class B {
  @Track public b: number = 0;

  onChange(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      console.info(`B property ${path} change from ${mon.value(path)?.before} to ${mon.value(path)?.now}`);
    });
  }

  constructor() {
    try {
      UIUtils.addMonitor(this, 'b', this.onChange);
    } catch (error) {
      if (error.code == 130000) {
        this.b = 1;
      }
    }
  }
}
@ObservedV2
class A {
  @Trace public a: number = 0;
  public invalidPath: number | string = 0;

  onChange(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      console.info(`A property ${path} change from ${mon.value(path)?.before} to   ${mon.value(path)?.now}`);
    });
  }

  constructor() {
    try {
      UIUtils.addMonitor(this, this.invalidPath as string, this.onChange);
    } catch (error) {
      if (error.code == 130001) {
        this.a = 1;
      }
    }
  }
}
@Entry
@ComponentV2
struct AddMonitorErrorCode001 {
  @Local num1: number = 0;
  @Local num2: number = 0;
  @Local num3: number = 0;
  @Local num4: number = 0;
  @Local classB: B = new B();
  @Local classA: A = new A();
  invalidPath: number | string = 0;
  build() {
    Column() {
      Text(this.classB.b.toString())
        .height('5%')
        .id('test1')
      Text(this.classA.a.toString())
        .height('5%')
        .id('test2')
      Text(this.num1.toString())
        .height('5%')
        .id('num1')
      Text(this.num2.toString())
        .height('5%')
        .id('num2')
      Text(this.num3.toString())
        .height('5%')
        .id('num3')
      Text(this.num4.toString())
        .height('5%')
        .id('num4')
      Button(`btn01`)
        .height('5%')
        .id('btn01')
        .onClick(() => {
          try {
            UIUtils.addMonitor(this.classA, 'a', (mon: IMonitor) => {});
          } catch (error) {
            if (error.code == 130002) {
              this.num1 = 1;
            }
          }
        })
      Button(`btn02`)
        .height('5%')
        .id('btn02')
        .onClick(() => {
          try {
            UIUtils.clearMonitor(this.classB, 'b', this.classB.onChange);
          } catch (error) {
            if (error.code == 130000) {
              this.num2 = 1;
            }
          }
        })
      Button(`btn03`)
        .height('5%')
        .id('btn03')
        .onClick(() => {
          try {
            UIUtils.clearMonitor(this.classA, this.invalidPath as string, this.classA.onChange);
          } catch (error) {
            if (error.code == 130001) {
              this.num3 = 1;
            }
          }
        })
      Button(`btn04`)
        .height('5%')
        .id('btn04')
        .onClick(() => {
          try {
            UIUtils.clearMonitor(this.classA, 'a', (mon: IMonitor) => {});
          } catch (error) {
            if (error.code == 130002) {
              this.num4 = 1;
            }
          }
        })
    }
  }


}