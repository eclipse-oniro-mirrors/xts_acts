/**
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

@Observed
class B {
  public a7?: string;
  constructor(a7?: string) {
    this.a7 = a7 ?? '';
  }
}

@Entry
@Component
struct V1ObjectLink {
  @State a7: B = new B('B');
  @State resultText: string | undefined = 'this is null'

  build() {
    Column() {
      Text(this.resultText)
        .textAlign(TextAlign.Center).height('5%')
      Child02({ a7: this.a7 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}
@Component
export struct Child02 {
  @ObjectLink a7: B;
  @State resultText3: string | undefined = 'this is null'

  build() {
    Column() {
      Text(this.resultText3)
        .height('5%')
        .id('ObjectLinkText')
      Button('@ObjectLink')
        .id('ObjectLinkTest')
        .height('5%')
        .onClick(() => {
          this.resultText3 = '';
          this.resultText3 = this.resultText3 + text(this.a7)
        })
    }
  }
}
