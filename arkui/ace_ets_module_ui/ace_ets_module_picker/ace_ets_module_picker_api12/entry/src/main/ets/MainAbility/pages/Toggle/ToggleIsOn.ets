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

class MyToggleStyle implements ContentModifier<ToggleConfiguration> {
  constructor() { }
  applyContent(): WrappedBuilder<[ToggleConfiguration]> {
    return wrapBuilder(buildToggle)
  }
}
@Builder function buildToggle(config: ToggleConfiguration) {
  Column({ space: 10 }) {
    Text('isOn status is: ' + config.isOn)
      .id('ToggleContentModifier_isOn')
      .fontSize(20)
      .fontColor(Color.Black)
      .width('70%')
  }
}

@Entry
@Component
struct ToggleContentTest {
  build() {
    Column({ space: 50 }) {
      Toggle({ type: ToggleType.Switch, isOn: false })
        .contentModifier(new MyToggleStyle())
        .onChange((isOn: boolean) => {
          console.info('Switch Log:' + isOn)
        })
    }.height('100%').width('100%')
  }
}