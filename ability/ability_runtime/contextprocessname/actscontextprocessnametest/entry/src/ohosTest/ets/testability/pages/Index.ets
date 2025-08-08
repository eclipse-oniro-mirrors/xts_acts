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
 
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';

let want: Want = {
  deviceId: '',
  bundleName: 'com.example.contextprocessname',
  moduleName: 'entry_test',
  abilityName: 'assistAbility'
}
@Entry
@Component
struct Index {
  @State loadUIExtensionAbility_bundle: boolean = false;
  @State loadUIExtensionAbility_type: boolean = false;
  @State loadUIExtensionAbility_instance: boolean = false;
  build() {
    Row() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
        Text('Hello').fontSize(50)
        Button('startAbility').onClick(()=>{
          (getContext(this) as common.UIAbilityContext).startAbility(want).then((res)=>{
            console.log('startAbility success')
          }).catch( (err:BusinessError)=>{
            console.log('startAbility err' + err.code + err.message)
          })
        })
      }
      .height('100%')
      .width('100%')
    }
  }
}