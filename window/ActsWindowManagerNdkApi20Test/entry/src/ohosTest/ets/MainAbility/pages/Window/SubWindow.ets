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
import windowndkapi20 from 'libwindowndkapi20.so';
import { floatingBall, window } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';
import Utils from '../../../test/common/Utils';

@Entry
@Component
struct SubWindow {
  @State currentStatus: string = 'SubWindowPage';
  aboutToAppear():void{
  }

  build() {
    Scroll() {
      Column() {
        Text(this.currentStatus)
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}