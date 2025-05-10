/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Chip, ChipSize } from '@ohos.arkui.advanced.Chip';

@Entry
@Component
struct ChipOnClose2 {
  @State text: string = ''
  build() {
    Column() {
      Column(){
        Chip({
          prefixIcon: {
            src: $r('app.media.icon'),
            size: { width: 16, height: 16 },
            fillColor: Color.Red,
          },
          label: {
            text: "操作块",
            fontSize: 16,
            fontColor: Color.Blue,
            fontFamily: "HarmonyOS Sans",
            labelMargin: { left: 4, right: 4 },
          },
          size: ChipSize.NORMAL,
          allowClose: true,
          enabled: false,
          backgroundColor: 0x808080,
          onClose:()=>{
            this.text = 'onClose'
          }
        })
      }.width(120).borderWidth(1).key('ChipOnClose2Col')
      Text(this.text).key('ChipOnClose2')
    }
  }
}