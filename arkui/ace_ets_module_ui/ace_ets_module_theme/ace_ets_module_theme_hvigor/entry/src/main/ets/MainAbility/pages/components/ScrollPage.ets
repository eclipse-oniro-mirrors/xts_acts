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
import { brownCustomTheme, redCustomTheme } from '../../themes/CustomTheme';
import { CustomTheme } from '@ohos.arkui.theme';

export const scrollThemeProperty = 'ScrollThemeProperty'
export const scrollThemeSetProperty = 'ScrollThemeSetProperty'

export class ScrollTextKeys {
  public static readonly verticalScrollTextSystem = `VerticalScrollText_System`
  public static readonly verticalScrollTextWithTheme = `VerticalScrollText_WithTheme`
  public static readonly verticalScrollBarTextSystem = `VerticalScrollBarText_System`
  public static readonly verticalScrollBarTextWithTheme = `VerticalScrollBarText_WithTheme`
  public static readonly horizontalScrollTextSystem = `HorizontalScrollText_System`
  public static readonly horizontalScrollTextWithTheme = `HorizontalScrollText_WithTheme`
  public static readonly horizontalScrollBarTextSystem = `HorizontalScrollBarText_System`
  public static readonly horizontalScrollBarTextWithTheme = `HorizontalScrollBarText_WithTheme`
}

export class ScrollKeys {
  public static readonly verticalScrollSystem = `VerticalScroll_System`
  public static readonly verticalScrollWithTheme = `VerticalScroll_WithTheme`
  public static readonly verticalScrollSystemCustomAttrs = `VerticalScroll_System_CustomAttrs`
  public static readonly verticalScrollWithThemeCustomAttrs = `VerticalScroll_WithTheme_CustomAttrs`
  public static readonly horizontalScrollSystem = `HorizontalScroll_System`
  public static readonly horizontalScrollWithTheme = `HorizontalScroll_WithTheme`
  public static readonly horizontalScrollSystemCustomAttrs = `HorizontalScroll_System_CustomAttrs`
  public static readonly horizontalScrollWithThemeCustomAttrs = `HorizontalScroll_WithTheme_CustomAttrs`
}

@Entry
@Component
struct ScrollPage {
  @StorageLink(scrollThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme
  @StorageLink(scrollThemeSetProperty) themeSet: boolean | undefined = true
  horizontalScrollerSystem: Scroller = new Scroller()
  verticalScrollerSystem: Scroller = new Scroller()
  horizontalScrollerSystemCustomAttrs: Scroller = new Scroller()
  verticalScrollerSystemCustomAttrs: Scroller = new Scroller()
  horizontalScrollerWithTheme: Scroller = new Scroller()
  verticalScrollerWithTheme: Scroller = new Scroller()
  horizontalScrollerWithThemeCustomAttrs: Scroller = new Scroller()
  verticalScrollerWithThemeCustomAttrs: Scroller = new Scroller()
  data: string[] = this.fillData()

  fillData(): string[]{
    let result: string[] = []
    let count: number = 15
    for (let i = 0; i < count; i++) {
      result.push('Item #' + i)
    }
    return result
  }

  @Builder
  ForEachBuilder(key: string | undefined){
    ForEach(this.data, (item: string) => {
      if (item == this.data[1]) {
        Text(item)
          .key(key)
      } else {
        Text(item)
      }
    }, (item: string) => item)
  }

  @Builder
  VerticalScrollBuilder(key: string, textKey: string, scroller: Scroller){
    Scroll(scroller) {
      Column({ space: `8vp` }) {
        this.ForEachBuilder(textKey)
      }
    }
    .key(key)
    .width(`80%`)
    .scrollBar(BarState.On)
    .scrollable(ScrollDirection.Vertical)
  }

  @Builder
  HorizontalScrollBuilder(key: string, textKey: string, scroller: Scroller){
    Scroll(scroller) {
      Row({ space: `8vp` }) {
        this.ForEachBuilder(textKey)
      }
    }
    .key(key)
    .height(`100vp`)
    .width(`80%`)
    .scrollBar(BarState.On)
    .scrollable(ScrollDirection.Horizontal)
  }

  @Builder
  VerticalScrollBuilderCustomAttrs(key: string, scroller: Scroller){
    Scroll(scroller) {
      Column({ space: `8vp` }) {
        this.ForEachBuilder(undefined)
      }
    }
    .key(key)
    .height(`100vp`)
    .width(`80%`)
    .scrollBar(BarState.On)
    .scrollable(ScrollDirection.Vertical)
    .scrollBarColor(brownCustomTheme.colors?.compFocusedTertiary?.toString())
  }

  @Builder
  HorizontalScrollBuilderCustomAttrs(key: string, scroller: Scroller){
    Scroll(scroller) {
      Row({ space: `8vp` }) {
        this.ForEachBuilder(undefined)
      }
    }
    .key(key)
    .height(`100vp`)
    .width(`80%`)
    .scrollBar(BarState.On)
    .scrollable(ScrollDirection.Horizontal)
    .scrollBarColor(brownCustomTheme.colors?.compFocusedTertiary?.toString())
  }

  @Builder
  VerticalScrollBarBuilder(textKey: string, scroller: Scroller){
    ScrollBar({ scroller: scroller,
      direction: ScrollBarDirection.Vertical, state: BarState.On }) {
      Text('#')
        .key(textKey)
        .width('20vp')
        .height('60vp')
        .borderRadius('10vp')
        .borderColor(Color.Black)
        .borderWidth(`1vp`)
        .textAlign(TextAlign.Center)
    }
    .margin({
      right: '20vp'
    })
  }

  @Builder
  HorizontalScrollBarBuilder(textKey: string, scroller: Scroller){
    ScrollBar({ scroller: scroller,
      direction: ScrollBarDirection.Horizontal, state: BarState.On }) {
      Text('<>')
        .key(textKey)
        .width('60vp')
        .height('20vp')
        .borderRadius('10vp')
        .borderColor(Color.Black)
        .borderWidth(`1vp`)
        .textAlign(TextAlign.Center)
    }
    .margin({
      left: '10%',
      right: '10%',
      bottom: `20vp`
    })
  }

  build(){
    Scroll() {
      Column({ space: `8vp` }) {
        Stack({ alignContent: Alignment.End }) {
          this.VerticalScrollBuilder(ScrollKeys.verticalScrollSystem, 
            ScrollTextKeys.verticalScrollTextSystem, this.verticalScrollerSystem)
          this.VerticalScrollBarBuilder(ScrollTextKeys.verticalScrollBarTextSystem, 
            this.verticalScrollerSystem)
        }
        .height(`100vp`)

        Stack({ alignContent: Alignment.Bottom }) {
          this.HorizontalScrollBuilder(ScrollKeys.horizontalScrollSystem, 
            ScrollTextKeys.horizontalScrollTextSystem, this.horizontalScrollerSystem)
          this.HorizontalScrollBarBuilder(ScrollTextKeys.horizontalScrollBarTextSystem, 
            this.horizontalScrollerSystem)
        }

        this.VerticalScrollBuilderCustomAttrs(ScrollKeys.verticalScrollSystemCustomAttrs, 
          this.verticalScrollerSystemCustomAttrs)

        this.HorizontalScrollBuilderCustomAttrs(ScrollKeys.horizontalScrollSystemCustomAttrs, 
          this.horizontalScrollerSystemCustomAttrs)

        WithTheme({ theme: this.themeSet ? this.localTheme : undefined }) {
          Column({ space: `8vp` }) {
            Stack({ alignContent: Alignment.End }) {
              this.VerticalScrollBuilder(ScrollKeys.verticalScrollWithTheme, 
                ScrollTextKeys.verticalScrollTextWithTheme, this.verticalScrollerWithTheme)
              this.VerticalScrollBarBuilder(ScrollTextKeys.verticalScrollBarTextWithTheme, 
                this.verticalScrollerWithTheme)
            }
            .height(`100vp`)

            Stack({ alignContent: Alignment.Bottom }) {
              this.HorizontalScrollBuilder(ScrollKeys.horizontalScrollWithTheme, 
                ScrollTextKeys.horizontalScrollTextWithTheme, this.horizontalScrollerWithTheme)
              this.HorizontalScrollBarBuilder(ScrollTextKeys.horizontalScrollBarTextWithTheme, 
                this.horizontalScrollerWithTheme)
            }

            this.VerticalScrollBuilderCustomAttrs(ScrollKeys.verticalScrollWithThemeCustomAttrs, 
              this.verticalScrollerWithThemeCustomAttrs)

            this.HorizontalScrollBuilderCustomAttrs(ScrollKeys.horizontalScrollWithThemeCustomAttrs, 
              this.horizontalScrollerWithThemeCustomAttrs)
          }
        }
      }
      .width('100%')
    }
  }
}