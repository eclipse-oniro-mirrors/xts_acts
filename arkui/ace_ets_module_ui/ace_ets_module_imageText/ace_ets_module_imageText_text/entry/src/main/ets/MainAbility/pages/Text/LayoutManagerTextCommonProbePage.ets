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
import router from '@ohos.router';

export const LAYOUT_MANAGER_TEXT_COMMON_PAGE: string = 'MainAbility/pages/Text/LayoutManagerTextCommonProbePage';
export const LAYOUT_MANAGER_TEXT_COMMON_ROUTE_PARAM: string = 'probe';
export const LAYOUT_MANAGER_TEXT_COMMON_STATUS_KEY: string = 'actsAceLayoutManagerTextCommonStatus';

export class LayoutManagerTextCommonProbeRoute {
  public static readonly CHARACTER_POSITION: string = 'layout_manager_character_position';
  public static readonly GLYPH_RANGE: string = 'layout_manager_glyph_range';
  public static readonly CHARACTER_RANGE: string = 'layout_manager_character_range';
}

function readProbeRoute(): string {
  let p: Object | undefined = router.getParams();
  if (p === undefined) {
    return '';
  }
  let rec: Record<string, Object> = p as Record<string, Object>;
  let r: Object | undefined = rec[LAYOUT_MANAGER_TEXT_COMMON_ROUTE_PARAM];
  if (typeof r === 'string' && (r as string).length > 0) {
    return r as string;
  }
  return '';
}

@Entry
@Component
struct LayoutManagerTextCommonProbePage {
  @State private probe: string = LayoutManagerTextCommonProbeRoute.CHARACTER_POSITION;
  private textController: TextController = new TextController();
  @State private probeDone: boolean = false;

  aboutToAppear(): void {
    AppStorage.setOrCreate(LAYOUT_MANAGER_TEXT_COMMON_STATUS_KEY, 'pending');
    let r: string = readProbeRoute();
    if (r.length > 0) {
      this.probe = r;
    } else {
      this.probe = LayoutManagerTextCommonProbeRoute.CHARACTER_POSITION;
    }
    this.probeDone = false;
  }

  build() {
    Column({ space: 8 }) {
      Text('LayoutManager via TextController.getLayoutManager')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
      Text(`probe=${this.probe}`)
        .fontSize(11)
        .fontColor($r('sys.color.ohos_id_color_text_secondary'))
      Text('abcdefghijklmnop', { controller: this.textController })
        .fontSize(18)
        .maxLines(2)
        .width('100%')
        .height(56)
        .onAreaChange((_: Area, area: Area) => {
          if (this.probeDone) {
            return;
          }
          if (area.width <= 0 || area.height <= 0) {
            return;
          }
          try {
            let lm: LayoutManager = this.textController.getLayoutManager();
            if (this.probe === LayoutManagerTextCommonProbeRoute.CHARACTER_POSITION) {
              lm.getCharacterPositionAtCoordinate(4, 14);
            } else if (this.probe === LayoutManagerTextCommonProbeRoute.GLYPH_RANGE) {
              let charRange: TextRange = { start: 0, end: 3 };
              lm.getGlyphRangeForCharacterRange(charRange);
            } else if (this.probe === LayoutManagerTextCommonProbeRoute.CHARACTER_RANGE) {
              let glyphRange: TextRange = { start: 0, end: 1 };
              lm.getCharacterRangeForGlyphRange(glyphRange);
            } else {
              lm.getCharacterPositionAtCoordinate(1, 10);
            }
            AppStorage.setOrCreate(LAYOUT_MANAGER_TEXT_COMMON_STATUS_KEY, 'ok');
          } catch (_e) {
            AppStorage.setOrCreate(LAYOUT_MANAGER_TEXT_COMMON_STATUS_KEY, 'fail');
          }
          this.probeDone = true;
        })
    }
    .width('100%')
    .height('100%')
    .padding({ left: 12, right: 12, top: 8, bottom: 32 })
  }
}
