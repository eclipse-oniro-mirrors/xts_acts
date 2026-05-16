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
import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct TextMarqueeOptionsTest {
  @State valueText:string ='一日，我这个智能助手接到了一位员工的求助。他说自己遇到了一些麻烦，需要我的帮助。我听了他的问题，心中暗自想着：“机不可失，时不再来。”于是我立刻开始了解决他的问题。经过一番努力，我终于帮助他解决了问题。'

  build() {
    Column(){
      Text(this.valueText)
        .maxLines(1)
        .textOverflow({overflow:TextOverflow.MARQUEE})
        .marqueeOptions({
          start:true,
        })
        .id('TextMarqueeOptionsTest1')
        .height('10%')
      Text(this.valueText)
        .maxLines(1)
        .textOverflow({overflow:TextOverflow.MARQUEE})
        .marqueeOptions({
          start:true,
          spacing:null,
          marqueeUpdatePolicy:null
        })
        .id('TextMarqueeOptionsTest2')
        .height('10%')
      Text(this.valueText)
        .maxLines(1)
        .textOverflow({overflow:TextOverflow.MARQUEE})
        .marqueeOptions({
          start:true,
          spacing:undefined,
          marqueeUpdatePolicy:undefined
        })
        .id('TextMarqueeOptionsTest3')
        .height('10%')
      Text(this.valueText)
        .maxLines(1)
        .textOverflow({overflow:TextOverflow.MARQUEE})
        .marqueeOptions({
          start:true,
          spacing:LengthMetrics.vp(10),
          marqueeUpdatePolicy:MarqueeUpdatePolicy.DEFAULT
        }).id('TextMarqueeOptionsTest4')
        .height('10%')
      Text(this.valueText)
        .maxLines(1)
        .textOverflow({overflow:TextOverflow.MARQUEE})
        .marqueeOptions({
          start:true,
          spacing:LengthMetrics.px(10),
          marqueeUpdatePolicy:MarqueeUpdatePolicy.PRESERVE_POSITION
        }).id('TextMarqueeOptionsTest5')
        .height('10%')
    }
    .height('100%')
  }
}