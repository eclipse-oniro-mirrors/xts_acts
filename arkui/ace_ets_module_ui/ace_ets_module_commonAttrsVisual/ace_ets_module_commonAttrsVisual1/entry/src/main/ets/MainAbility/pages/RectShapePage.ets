/*
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

import { RectShape } from '@kit.ArkUI';

@Entry
@Component
struct RectShapePage {
  build() {
    Column({ space: 15 }) {
      Button('get').onClick(() => {
        let strJson = getInspectorByKey('testImage1');
        console.info('[materialFilter] materialId value :' + JSON.stringify(JSON.parse(strJson).$attrs.mask?.shape));
      })
      Image($r('app.media.icon'))
        .maskShape(new RectShape({radiusWidth: '20', radiusHeight: '20', radius: '10'}).width('350px').height('280px').fill(Color.Red))
        .width('500px').height('280px')
        .id('testImage1')
      Image($r('app.media.icon'))
        .maskShape(new RectShape({radiusWidth: 20, radiusHeight: 20, radius: 10}).width('350px').height('280px').fill(Color.Red))
        .width('500px').height('280px')
        .id('testImage2')
      Image($r('app.media.icon'))
        .maskShape(new RectShape({radiusWidth: 20, radiusHeight: 20, radius: [20, 10]}).width('350px').height('280px').fill(Color.Red))
        .width('500px').height('280px')
        .id('testImage3')
      Image($r('app.media.icon'))
        .maskShape(new RectShape({radiusWidth: 20, radiusHeight: 20, radius: ['20', '10']}).width('350px').height('280px').fill(Color.Red))
        .width('500px').height('280px')
        .id('testImage4')
    }
    .width('100%')
    .margin({ top: 15 })
  }
}