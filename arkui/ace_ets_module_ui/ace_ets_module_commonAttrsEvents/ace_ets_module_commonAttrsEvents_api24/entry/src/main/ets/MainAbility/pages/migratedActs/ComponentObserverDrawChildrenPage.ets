/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
export const COMPONENT_OBSERVER_DRAW_CHILDREN_PAGE: string = 'MainAbility/pages/migratedActs/ComponentObserverDrawChildrenPage';

@Entry
@Component
struct ComponentObserverDrawChildrenPage {
  build() {
    Column({ space: 8 }) {
      Text('Instrument：ComponentObserver drawChildren')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
      Text('独立页面 — 宿主 id = oh_obs_draw_children_host')
        .fontSize(11)
        .fontColor($r('sys.color.ohos_id_color_text_secondary'))
      Column({ space: 4 }) {
        Text('child A').fontSize(12)
        Text('child B').fontSize(12)
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 12, right: 12, top: 8, bottom: 32 })
    .id('oh_obs_draw_children_host')
    .key('oh_obs_draw_children_host')
  }
}
