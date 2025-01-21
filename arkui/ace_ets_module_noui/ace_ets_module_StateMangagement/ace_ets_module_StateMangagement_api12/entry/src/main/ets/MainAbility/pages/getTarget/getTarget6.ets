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
import { UIUtils }  from '@ohos.arkui.StateManagement'

//获取代理对象的原始对象后，修改对象，不会触发UI刷新
@Observed
class Message {
  name: string = 'Tom';
}
@Entry
@Component
struct GetTarget6 {
  @State info: Message = new Message();

  build() {
    Column() {
      Text(`info.name: ${this.info.name}`).id('getTarget')
      Button(`更改代理对象的属性`)
        .onClick(() => {
          this.info.name = 'Alice'; // Text组件能够刷新
        }).id('button1')
      Button(`更改原始对象的属性`)
        .onClick(() => {
          let rawInfo: Message = UIUtils.getTarget(this.info);
          rawInfo.name = 'Bob'; // Text组件不能刷新
        }).id('button2')
    }
  }
}