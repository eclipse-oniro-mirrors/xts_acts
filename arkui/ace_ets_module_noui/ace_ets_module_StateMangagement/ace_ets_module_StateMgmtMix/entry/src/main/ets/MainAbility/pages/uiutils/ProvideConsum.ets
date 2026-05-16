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
import { UIUtils } from '@kit.ArkUI';
import { DecoratorInfo, ObservedResult } from '@ohos.arkui.StateManagement';

const TAG = 'test_log v1 State';

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
class A {
  public a?: string;

  constructor(a?: string) {
    this.a = a ?? '';
  }
}

@Entry
@Component
struct V1ObjectLink {
  @Provide a3: A = new A('初始值_a');
  @Provide a4: A = new A('初始值_a_provide');
  @Provide('a') a: A = new A('a');
  @Consume('a4') a5: A;
  @State resultText: string | undefined = 'this is null'

  build() {
    Column() {
      Text(this.resultText)
        .id('ProvideConsumeText')
        .height('5%')
        .textAlign(TextAlign.Center)

      Button('testV1')
        .id('ProvideConsumeTest')
        .height('5%')
        .onClick(() => {
          this.resultText = '';
          this.resultText = this.resultText + text(this.a3)
          this.resultText = this.resultText + text(this.a5)
        })
      Child01()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}

@Component
export struct Child01 {
  @Consume('a') a: A;
  @State resultText1: string | undefined = 'this is null'

  build() {
    Column() {
      Text(this.resultText1)
        .id('textV102')
      Button('@link')
        .id('ButtonTextV102')
        .height('5%')
        .onClick(() => {
          this.resultText1 = '';
          this.resultText1 = this.resultText1 + text(this.a)
              console.log('bxq aaa' + this.resultText1)

        })
    }
  }
}