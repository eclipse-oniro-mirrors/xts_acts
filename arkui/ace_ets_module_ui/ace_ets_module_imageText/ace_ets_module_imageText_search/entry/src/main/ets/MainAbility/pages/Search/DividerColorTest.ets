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
import { ColorMetrics } from '@kit.ArkUI';

@Entry
@Component
struct DividerColorTest {
  @State valueText:string ='Search Text'
  @State colorTypeRGB: ColorMetrics = ColorMetrics.numeric(0x00FF00);
  @State colorTypeColorWithSpace: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0, 1.0, 0, 1.0);
  @State colorTypeRGBA: ColorMetrics = ColorMetrics.rgba(255, 0, 0, 1.0);
  @State colorTypeRes: ColorMetrics = ColorMetrics.resourceColor($r('app.color.color_D90013_red'));
  build() {
    Column(){
      Search({value:this.valueText})
        .searchButton('SEARCH', { fontSize: '14vp' })
        .id('DividerColorTest1').height('5%')
      Search({value:this.valueText})
        .searchButton('SEARCH', { fontSize: '14vp' })
        .dividerColor(null)
        .id('DividerColorTest2').height('5%')
      Search({value:this.valueText})
        .searchButton('SEARCH', { fontSize: '14vp' })
        .dividerColor(undefined)
        .id('DividerColorTest3').height('5%')
      Search({value:this.valueText})
        .dividerColor(this.colorTypeRGB)
        .searchButton('SEARCH', { fontSize: '14vp' })
        .id('DividerColorTest4').height('5%')
      Search({value:this.valueText})
        .dividerColor(this.colorTypeColorWithSpace)
        .searchButton('SEARCH', { fontSize: '14vp' })
        .id('DividerColorTest5').height('5%')
      Search({value:this.valueText})
        .dividerColor(this.colorTypeRGBA)
        .searchButton('SEARCH', { fontSize: '14vp' })
        .id('DividerColorTest6').height('5%')
      Search({value:this.valueText})
        .dividerColor(this.colorTypeRes)
        .searchButton('SEARCH', { fontSize: '14vp' })
        .id('DividerColorTest7').height('5%')
    }
    .height('100%')
  }
}