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
import { UIUtils } from '@kit.ArkUI';
import { DecoratorInfo, ObservedResult } from '@ohos.arkui.StateManagement';
const TAG = 'test_log v1 LocalStorageLink';

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
  public z?: string;

  constructor(z?: string) {
    this.z = z ?? '';
  }
}
let storage = new LocalStorage();
@Entry(storage)
@Component
struct V1ObjectLink {
  @LocalStorageLink('z') z: A = new A('aa');
  @State resultText: string | undefined = 'this is null'

  build() {
    Column() {
      Text(this.resultText)
        .id('LocalStorageLinkText')
        .height('5%')
        .textAlign(TextAlign.Center)
        
      Button('testV1')
        .id('LocalStorageLinkTest')
        .height('5%')
        .onClick(() => {
          this.resultText = '';
          this.resultText = this.resultText + text(this.z)

        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }

}