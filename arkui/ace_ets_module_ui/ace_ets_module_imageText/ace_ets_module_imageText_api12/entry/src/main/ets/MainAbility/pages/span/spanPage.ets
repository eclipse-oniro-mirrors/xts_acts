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
import events_emitter from '@ohos.events.emitter';

class MySpanComponentModifier implements AttributeModifier<SpanAttribute> {
  mFontSize: Length = 16
  mFontFamily: string = 'HarmonyOS Sans'
  mLineHeight: number | string = 0
  mFontStyle: FontStyle = FontStyle.Normal
  mFontWeight: number | FontWeight | string = 400
  mTextCase: TextCase = TextCase.Normal
  mDecorationType: TextDecorationType = TextDecorationType.None
  mDecorationColor: ResourceColor = Color.Red
  mFontColor: ResourceColor = 0x000000
  mLetterSpacing: number | string = 0
  applyNormalAttribute(instance: SpanAttribute): void {
    instance.fontSize(this.mFontSize);
    instance.fontFamily(this.mFontFamily);
    instance.lineHeight(this.mLineHeight);
    instance.fontStyle(this.mFontStyle);
    instance.fontWeight(this.mFontWeight);
    instance.textCase(this.mTextCase);
    instance.decoration({type: this.mDecorationType, color: this.mDecorationColor})
    instance.fontColor(this.mFontColor)
    instance.letterSpacing(this.mLetterSpacing)
  }
}
class MySpanFontModifier implements AttributeModifier<SpanAttribute> {
  mFont: Font = {}
  applyNormalAttribute(instance: SpanAttribute): void {
    instance.font(this.mFont);
  }
}

@Entry
@Component
struct VideoExample {
  @State message: string = 'span'
  @State mod1: MySpanComponentModifier = new MySpanComponentModifier()
  @State mod2: MySpanFontModifier = new MySpanFontModifier()

  @State mFontSize: Length = 16
  @State mFontFamily: string = 'HarmonyOS Sans'
  @State mLineHeight: number | string = 0
  @State mFontStyle: FontStyle = FontStyle.Normal
  @State mFontWeight: number | FontWeight | string = 400
  @State mTextCase: TextCase = TextCase.Normal
  @State mDecorationType: TextDecorationType = TextDecorationType.None
  @State mDecorationColor: ResourceColor = Color.Red
  @State mFontColor: ResourceColor = 0x000000
  @State mLetterSpacing: number | string = 0
  @State mFont: Font = {}
  @State numFont: number = 0
  @State fontStyleValue: string = ''

  private stateChangCallBack = (eventData:events_emitter.EventData) => {
    if (eventData != null) {
      console.info("Span page state change called:" + JSON.stringify(eventData));
      if (eventData.data?.mFontSize != null) {
        if(eventData.data?.mFontSize == 'resources50') {
          this.mod1.mFontSize = $r('app.float.50vp');
          //old test
          this.mFontSize = $r('app.float.50vp');
        }else{
          this.mod1.mFontSize = eventData.data?.mFontSize;
          //old test
          this.mFontSize = eventData.data?.mFontSize;
        }
      } else if (eventData.data?.mFontFamily != null) {
        this.mod1.mFontFamily = eventData.data?.mFontFamily;
        //old test
        this.mFontFamily = eventData.data?.mFontFamily;
      } else if (eventData.data?.mLineHeight != null) {
        this.mod1.mLineHeight = eventData.data?.mLineHeight;
        //old test
        this.mLineHeight = eventData.data?.mLineHeight;
      } else if (eventData.data?.mFontStyle != null) {
        this.mod1.mFontStyle = eventData.data?.mFontStyle;
        //old test
        this.mFontStyle = eventData.data?.mFontStyle;
      } else if (eventData.data?.mFontWeight != null) {
        this.mod1.mFontWeight = eventData.data?.mFontWeight;
        //old test
        this.mFontWeight = eventData.data?.mFontWeight;
      } else if (eventData.data?.mTextCase != null) {
        this.mod1.mTextCase = eventData.data?.mTextCase;
        //old test
        this.mTextCase = eventData.data?.mTextCase;
      }else if (eventData.data?.mDecorationType != null) {
        this.mod1.mDecorationType = eventData.data?.mDecorationType;
        this.mod1.mDecorationColor = eventData.data?.mDecorationColor;
        //old test
        this.mDecorationType = eventData.data?.mDecorationType;
        this.mDecorationColor = eventData.data?.mDecorationColor
      } else if (eventData.data?.mFontColor != null) {
        this.mod1.mFontColor = eventData.data?.mFontColor;
        //old test
        this.mFontColor = eventData.data?.mFontColor;
      } else if (eventData.data?.mLetterSpacing != null) {
        this.mod1.mLetterSpacing = eventData.data?.mLetterSpacing;
        //old test
        this.mLetterSpacing = eventData.data?.mLetterSpacing;
      } else if (eventData.data?.numFont != null) {
        console.log("testSpanFont10 eventData.data?.numFont: " + eventData.data?.numFont)
        if (eventData.data?.numFont == 0) {
          this.mFont = { size: 16, weight: FontWeight.Normal, family: 'HarmonyOS Sans', style: FontStyle.Normal }
        } else if (eventData.data?.numFont == 1) {
          this.mFont = { size: 32, weight: FontWeight.Normal, family: 'HarmonyOS Sans', style: FontStyle.Italic }
        } else if (eventData.data?.numFont == 2) {
          this.mFont = { size: 32, weight: FontWeight.Bold, family: 'HarmonyOS Sans', style: FontStyle.Italic }
        } else if (eventData.data?.numFont == 3) {
          this.mFont = { size: $r('app.float.50vp'), weight: FontWeight.Bold, family: $r('app.string.font_family_arial'), style: FontStyle.Italic }
        }
        console.log("testSpanFont10 stateChangCallBack ")
        console.log("testSpanFont10 stateChangCallBack mFont:" + JSON.stringify(this.mFont))
        this.mod2.mFont = this.mFont;

        // let strJson = getInspectorByKey('keykeyspan2');
        // console.log("font:" + JSON.parse(strJson).$attrs.font)
        console.log("testSpanFont10 stateChangCallBack end" )
      }
    }
  }

  onPageShow() {
    console.info('video page1 show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 6801,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    let stateChangeEvent2: events_emitter.InnerEvent = {
      eventId: 6802,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent2, this.stateChangCallBack);
    let stateChangeEvent3: events_emitter.InnerEvent = {
      eventId: 6803,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent3, this.stateChangCallBack);
    let stateChangeEvent4: events_emitter.InnerEvent = {
      eventId: 6804,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent4, this.stateChangCallBack);
    let stateChangeEvent5: events_emitter.InnerEvent = {
      eventId: 6805,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent5, this.stateChangCallBack);
    let stateChangeEvent6: events_emitter.InnerEvent = {
      eventId: 6806,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent6, this.stateChangCallBack);
    let stateChangeEvent7: events_emitter.InnerEvent = {
      eventId: 6807,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent7, this.stateChangCallBack);
    let stateChangeEvent8: events_emitter.InnerEvent = {
      eventId: 6808,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent8, this.stateChangCallBack);
    let stateChangeEvent9: events_emitter.InnerEvent = {
      eventId: 6809,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent9, this.stateChangCallBack);
    let stateChangeEvent10: events_emitter.InnerEvent = {
      eventId: 6810,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent10, this.stateChangCallBack);
    let stateChangeEvent11: events_emitter.InnerEvent = {
      eventId: 6811,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent11, this.stateChangCallBack);
    let stateChangeEvent12: events_emitter.InnerEvent = {
      eventId: 6812,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent12, this.stateChangCallBack);
  }

  build() {
    Scroll() {
      Column() {
        Text(this.message).fontSize(9).fontColor(0xCCCCCC)
        Text() {
          Span('This is the TEST Span component 测试')
            .key('keykeyspan')
            .attributeModifier(this.mod1)
          // .fontSize(this.mFontSize)
          // .fontFamily(this.mFontFamily)
          // .lineHeight(this.mLineHeight)
          // .fontStyle(this.mFontStyle)
          // .fontWeight(this.mFontWeight)
          // .textCase(this.mTextCase)
          // .decoration({ type: this.mDecorationType, color: this.mDecorationColor })
          // .fontColor(this.mFontColor)
          // .letterSpacing(this.mLetterSpacing)
        }.border({ width: 1 })
        .padding(10)

        Text() {
          Span('This is the test Span component2')
            .key('keykeyspan2')
            .attributeModifier(this.mod2)
          // .font(this.mFont)
        }.border({ width: 1 })
        .padding(10)

      }.width('100%').padding(10)
    }.scrollable(ScrollDirection.Vertical)
  }
}