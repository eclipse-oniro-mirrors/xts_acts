/**
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
import { AppStorageV2, UIUtils } from '@kit.ArkUI';
import { ObservedResult } from '@ohos.arkui.StateManagement';

@ObservedV2
class BBB {
  @Trace
  public bbb?: string;

  constructor(bbb?: string) {
    this.bbb = bbb ?? '';
  }
}

@ObservedV2
class CCC {
  @Trace
  public ccc?: number;

  constructor(ccc?: number) {
    this.ccc = ccc ?? -1;
  }
}

@ObservedV2
class AAA {
  @Trace
  public bbb?: BBB;
  @Trace
  public ccc?: CCC;

  constructor(bbb?: BBB, ccc?: CCC) {
    this.bbb = bbb ?? new BBB();
    this.ccc = ccc ?? new CCC()
  }
}

@Entry
@ComponentV2
struct V2Param {
  @Local a: AAA = AppStorageV2.connect<AAA>(AAA, () => new AAA(new BBB('bbb'), new CCC(111)))!;
  @Local b: AAA = AppStorageV2.connect<AAA>(AAA, () => new AAA(new BBB('bbb'), new CCC(111)))!;
  @Local resultText: string | undefined = 'this is null'

  build() {
    Column() {
      Child01()
      Button('test1')
        .id('V2test_01')
        .height('5%')
        .onClick(() => {
          const obj = this.a;
          let res: ObservedResult = UIUtils.canBeObserved(obj);
          AppStorage.setOrCreate<ObservedResult>('ObservedResultRes', res);
          console.info(`res: ${JSON.stringify(res)}`);
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}

@ComponentV2
export struct Child01 {
  @Local a: AAA = AppStorageV2.connect<AAA>(AAA, () => new AAA())!;

  build() {
    Column() {
      Text('Child01 ' + this.a.bbb?.bbb)
        .height('5%')
    }
  }
}