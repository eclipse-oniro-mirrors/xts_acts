/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
import { Colors } from '../../themes/checkSystemTokens/colorValues/ColorsTokens';
import { DataClass } from '../../../test/Utils';

export const colorsForCheck = 'checkColor';

@Component
export struct SystemColorsFromResources {
  @Prop postfix : string;
  @State data: DataClass[] = [];

  aboutToAppear() {
    Colors.colors.forEach((it, key) => {
      this.data.push({
        text: key,
        token: $r(it)
      });
    });
  }

  build() {
    Row() {
      Column({ space: '8vp' }) {
        ForEach(this.data, (item: DataClass) => {
          Row() {
            Blank()
              .width('15%')
              .height('20vp')
              .backgroundColor(item.token)
              .key(`${item.text}${colorsForCheck}${this.postfix}`)
              .borderColor(Color.Black)
              .borderWidth('1vp')
            Text(item.text)
              .padding({ left: '8vp' })
          }
          .padding({ left: '8vp', right: '8vp' })
        }, (item: DataClass) => JSON.stringify(item.token) + item.text)
      }.alignItems(HorizontalAlign.Start)
    }
  }
}