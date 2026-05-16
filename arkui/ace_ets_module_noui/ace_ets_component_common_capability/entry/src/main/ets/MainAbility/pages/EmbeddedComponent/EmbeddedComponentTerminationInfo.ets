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

import { Want } from '@kit.AbilityKit';

@Entry
@Component
struct EmbeddedComponentTerminationInfo {
  @State message: string = 'EmbeddedComponent Test';
  @State terminatedCode: number = -1;
  @State terminatedWant: string = '';
  @State hasError: boolean = false;
  @State errorMessage: string = '';

  private want: Want = {
    bundleName: 'com.example.embeddedComponent',
    abilityName: 'ExampleEmbeddedAbility',
  };

  build() {
    Column({ space: 10 }) {
      Text(this.message)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .id('termination_text')

      Text('Code: ' + this.terminatedCode)
        .fontSize(18)
        .id('code_text')

      Text('Want: ' + this.terminatedWant)
        .fontSize(18)
        .id('want_text')

      Text('Error: ' + this.errorMessage)
        .fontSize(18)
        .id('error_text')
        .visibility(this.hasError ? Visibility.Visible : Visibility.Hidden)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
