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

import { SubHeader } from '@ohos.arkui.advanced.SubHeader';

@Entry
@Component
struct SubHeaderExample {
  @Builder
  myTitle() {
    Column() {
      Text('主标题')
        .fontColor($r('sys.color.font_primary'))
        .fontSize(15)
      Text('副标题')
        .fontColor($r('sys.color.font_secondary'))
        .fontSize(14)
    }
  }

  @Builder
  myTitle2() {
    Column() {
      Text('主标题2')
        .fontColor($r('sys.color.font_primary'))
        .fontSize(15)
      Text('副标题2')
        .fontColor($r('sys.color.font_secondary'))
        .fontSize(14)
    }
  }

  @State changeFlag: boolean = true;

  build() {
    Column() {
      SubHeader({
        titleBuilder: () => {
          if (this.changeFlag) {
            this.myTitle()
          } else {
            this.myTitle2()
          }
        }
      })
      Button('变更Builder内容').onClick(() => {
        this.changeFlag = !this.changeFlag;
      })
    }
  }
}