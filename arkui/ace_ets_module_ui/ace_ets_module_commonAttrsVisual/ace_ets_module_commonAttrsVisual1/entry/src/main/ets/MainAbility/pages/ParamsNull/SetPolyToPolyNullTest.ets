/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { matrix4 } from '@kit.ArkUI';

@Entry
@Component
struct SetPolyToPolyNullIndex {
  private matrix1 = matrix4.identity().setPolyToPoly(null);
  private matrix2 = matrix4.identity().setPolyToPoly(undefined);

  build() {
    Stack() {
      Column() {
        Text('null')
          .id('btn_setPolyToPoly_null')
          .transform(this.matrix1)
        Text('undefined')
          .id('btn_setPolyToPoly_undefined')
          .transform(this.matrix2)
      }.backgroundColor(Color.Blue)
        .width('100%')
        .height('100%')
    }.width("100%").height("100%").opacity(0.5)
  }
}