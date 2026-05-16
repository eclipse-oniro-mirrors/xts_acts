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

export const SWIPER_CACHED_COUNT_PAGE: string = 'MainAbility/pages/Swiper/SwiperCachedCountProbePage';
export const SWIPER_CACHED_COUNT_ROUTE_PARAM: string = 'probe';
export const SWIPER_CACHED_COUNT_STATUS_KEY: string = 'actsAceSwiperCachedCountStatus';

export class SwiperCachedCountProbeRoute {
  public static readonly BOTH_TRUE: string = 'options_both_true';
  public static readonly IS_SHOWN_ONLY: string = 'options_is_shown_only';
  public static readonly INDEPENDENT_ONLY: string = 'options_independent_only';
  public static readonly EMPTY_OPTIONS: string = 'options_empty';
}

function readProbeRoute(): string {
  let p: Object | undefined = router.getParams();
  if (p === undefined) {
    return '';
  }
  let rec: Record<string, Object> = p as Record<string, Object>;
  let r: Object | undefined = rec[SWIPER_CACHED_COUNT_ROUTE_PARAM];
  if (typeof r === 'string' && (r as string).length > 0) {
    return r as string;
  }
  return '';
}

@Builder
function probeSwiperWithCached(itemCount: number, cacheCount: number, options: CachedCountOptions) {
  Swiper() {
    if (itemCount > 0) {
      Text('0').width('100%').height('100%')
    }
    if (itemCount > 1) {
      Text('1').width('100%').height('100%')
    }
    if (itemCount > 2) {
      Text('2').width('100%').height('100%')
    }
  }
  .width('90%')
  .height(120)
  .cachedCount(cacheCount, options)
}

@Entry
@Component
struct SwiperCachedCountProbePage {
  @State private probe: string = SwiperCachedCountProbeRoute.BOTH_TRUE;

  aboutToAppear(): void {
    AppStorage.setOrCreate(SWIPER_CACHED_COUNT_STATUS_KEY, 'pending');
    let r: string = readProbeRoute();
    if (r.length > 0) {
      this.probe = r;
    } else {
      this.probe = SwiperCachedCountProbeRoute.BOTH_TRUE;
    }
  }

  build() {
    Column({ space: 8 }) {
      Text('Swiper.cachedCount(count, CachedCountOptions)')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
      Text(`probe=${this.probe}`)
        .fontSize(11)
        .fontColor($r('sys.color.ohos_id_color_text_secondary'))
      if (this.probe === SwiperCachedCountProbeRoute.BOTH_TRUE) {
        probeSwiperWithCached(3, 2, { isShown: true, independent: true } as CachedCountOptions)
      } else if (this.probe === SwiperCachedCountProbeRoute.IS_SHOWN_ONLY) {
        probeSwiperWithCached(2, 2, { isShown: true } as CachedCountOptions)
      } else if (this.probe === SwiperCachedCountProbeRoute.INDEPENDENT_ONLY) {
        probeSwiperWithCached(2, 2, { independent: true } as CachedCountOptions)
      } else if (this.probe === SwiperCachedCountProbeRoute.EMPTY_OPTIONS) {
        probeSwiperWithCached(2, 1, {} as CachedCountOptions)
      } else {
        probeSwiperWithCached(1, 1, {} as CachedCountOptions)
      }
    }
    .width('100%')
    .height('100%')
    .padding({ left: 12, right: 12, top: 8, bottom: 32 })
    .onAppear(() => {
      AppStorage.setOrCreate(SWIPER_CACHED_COUNT_STATUS_KEY, 'ok');
    })
  }
}
