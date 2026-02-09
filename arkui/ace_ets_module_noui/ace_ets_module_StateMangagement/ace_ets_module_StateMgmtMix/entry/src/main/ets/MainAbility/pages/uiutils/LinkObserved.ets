/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
const TAG = 'test_log v1 Link';
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
@Observed
class A {
  public a6?: string;
  constructor(a6?: string) {
    this.a6 = a6 ?? '';
  }
}
@Entry
@Component
struct V1ObjectLink {
  @State a1: A = new A('初始值_a_State');
  @Prop a2: A = new A('初始值_a_prop');
  @State a6: A = new A('A');
  @State resultText: string | undefined = 'this is null'
  build() {
    Column() {
      Text(this.resultText)
        .height('5%')
        .textAlign(TextAlign.Center)
      Child01({ a6: this.a6 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}

@Component
export struct Child01 {
  @Link a6: A;
  @State resultText1: string | undefined = 'this is null'

  build() {
    Column() {
      Text(this.resultText1)
        .height('5%')
        .id('LinkText')
      Button('@link')
        .height('5%')
        .id('LinkTest')
        .onClick(() => {
          this.resultText1 = '';
          this.resultText1 = this.resultText1 + text(this.a6)
        })
    }
  }
}