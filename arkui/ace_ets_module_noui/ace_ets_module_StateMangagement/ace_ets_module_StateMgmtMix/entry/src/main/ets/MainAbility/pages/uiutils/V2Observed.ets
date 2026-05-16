/**
* Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { AppStorageV2, UIUtils} from '@kit.ArkUI';
import { ObservedResult } from '@ohos.arkui.StateManagement';
import { DecoratorInfo } from '@ohos.arkui.StateManagement';

const TAG = 'test_log v2';
function text(obj:object|undefined) : string {
  let res : ObservedResult = UIUtils.canBeObserved(obj);
  let bool: boolean = res.isObserved
  let value: string|undefined = 'undefined'
  let info: DecoratorInfo|undefined = res.decoratorInfo.pop()
  if (info){
    let val: string|undefined =  info?.decoratorName
    if (val){
      value = val
    }
  }
  return value + ' ' + bool + ' ';
}

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
@ObservedV2
class C {
  @Trace
  public c?: string;

  constructor(c?: string) {
    this.c = c ?? '';
  }

  test(): void {
    let res = UIUtils.canBeObserved(this);
    console.info(TAG, `res: ${JSON.stringify(res)}`);
  }
}
@Entry
@ComponentV2
struct V2Param {
  @Local a: AAA = AppStorageV2.connect<AAA>(AAA, () => new AAA(new BBB('bbb'), new CCC(111)))!;
  @Local b: AAA = AppStorageV2.connect<AAA>(AAA, () => new AAA(new BBB('bbb'), new CCC(111)))!;
  @Provider('c') c: C = new C('cc');
  @Local resultText: string | undefined = 'this is null'

  build() {
    Column() {
      Text(this.resultText)
        .id('V2text_01')
        .height('5%')
        .fontWeight(FontWeight.Bold)

      Child01()
      Child02({ b: this.b })
      Child03()
      Button('test1')
        .id('V2test_01')
        .height('5%')
        .onClick(() => {
          this.resultText = '';
          this.resultText = this.resultText + text(this.a)
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
    Column({ space: 10 }) {
      Text('Child01 ' + this.a.bbb?.bbb)
    }
  }
}
@ComponentV2
export struct Child02 {
  @Param @Require b: AAA;
  @Local resultText1: string | undefined = 'this is null'

  build() {
    Column() {
      Text(this.resultText1)
        .height('5%')
        .id('V2text_02')
      Button('test2')
        .height('5%')
        .id('V2test_02')
        .onClick(() => {
          this.resultText1 = '';
          this.resultText1 = this.resultText1 + text(this.b)
        })
    }
  }
}
@ComponentV2
export struct Child03 {
  @Consumer('c') c: C = new C();
  @Local resultText2: string | undefined = 'this is null'

  build() {
    Column() {
      Text('Child01'+this.c.c)
        .id('V2text_03')
        .height('5%')
      Button('test3')
        .id('V2test_03')
        .height('5%')
        .onClick(() => {
          this.resultText2 = '';
          this.resultText2 = this.resultText2 + text(this.c)
        })
    }
  }
}