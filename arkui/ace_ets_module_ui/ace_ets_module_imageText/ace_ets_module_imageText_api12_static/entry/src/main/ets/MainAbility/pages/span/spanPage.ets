'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { Entry, Color,Resource,Length, Span,Text,ResourceStr, ScrollDirection,Column, Component, $r, Scroll, AttributeModifier, SpanAttribute, FontStyle, FontWeight, TextCase, TextDecorationType, ResourceColor, Font } from '@ohos.arkui.component'
import {
  State,
  AppStorage
} from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { AppStorage,StoragePropRef,Observed } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import { RecordData } from '@ohos.base';
@Observed
class MySpanComponentModifier implements AttributeModifier<SpanAttribute> {
  mFontSize: number | string | Resource = 16;
  mFontFamily: string | Resource  = 'HarmonyOS Sans'
  mLineHeight: Length = 0
  mFontStyle: FontStyle = FontStyle.Normal
  mFontWeight: int | FontWeight  = 400
  mTextCase: TextCase = TextCase.Normal
  mDecorationType: TextDecorationType = TextDecorationType.None
  mDecorationColor: ResourceColor | undefined = Color.Red
  mFontColor: ResourceColor = Color.Red
  mLetterSpacing: double = 0
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
@Observed
class MySpanFontModifier implements AttributeModifier<SpanAttribute> {
  mFont: Font = {}
  applyNormalAttribute(instance: SpanAttribute): void {
    instance.font(this.mFont);
  }
}

@Entry
@Component
struct VideoExample {

  @State message: string = 'span';
  @State mod1: MySpanComponentModifier = new MySpanComponentModifier();
  @State mod2: MySpanFontModifier = new MySpanFontModifier();

  private stateChangCallBack: (eventData:events_emitter.EventData) => void = (eventData:events_emitter.EventData) => {
    if (eventData != null) {
      console.info("Span page state change called:" + JSON.stringify(eventData));
      let eventDa = eventData.data as Record<String,RecordData>
      if (eventDa!['mFontSize'] != null) {
        this.mod1.mFontSize = eventDa!['mFontSize']  as number | string | Resource;
      } else if (eventDa!['mFontFamily'] != null) {
        console.info('this.mod1.mFontFamily',eventDa!['mFontFamily'])
        this.mod1.mFontFamily = eventDa!['mFontFamily'] as string|Resource;
        console.info('this.mod1.mFontFamily22',this.mod1.mFontFamily)
      } else if (eventDa!['mLineHeight'] != null) {
        this.mod1.mLineHeight = eventDa!['mLineHeight'] as Length;
      } else if (eventDa!['mFontStyle'] != null) {
        this.mod1.mFontStyle = eventDa!['mFontStyle'] as FontStyle;
      } else if (eventDa!['mFontWeight'] != null) {
        this.mod1.mFontWeight = eventDa!['mFontWeight'] as int | FontWeight;
      } else if (eventDa!['mTextCase'] != null) {
        this.mod1.mTextCase = eventDa!['mTextCase'] as TextCase;
      }else if (eventDa!['mDecorationType'] != null) {
        this.mod1.mDecorationType = eventDa!['mDecorationType'] as TextDecorationType;
        this.mod1.mDecorationColor = eventDa!['mDecorationColor'] as ResourceColor;
      } else if (eventDa!['mFontColor'] != null) {
        this.mod1.mFontColor = eventDa!['mFontColor'] as ResourceColor;
      } else if (eventDa!['mLetterSpacing'] != null) {
        this.mod1.mLetterSpacing = eventDa!['mLetterSpacing'] as double;
      } else if (eventDa!['mFont'] != null) {
          this.mod2.mFont = eventDa!['mFont'] as Font
        }
        console.log("testSpanFont10 stateChangCallBack end" )
    }
  }

  onPageShow() {
    console.info('video page1 show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 6801,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }
  build() {
    Scroll() {
      Column() {
        Text(this.message).fontSize(9).fontColor(Color.Red)
        Text() {
          Span('This is the TEST Span component 测试')
            .key('keykeyspan')
            .attributeModifier(this.mod1)

        }.border({ width: 1 })
        .padding(10)

        Text() {
          Span('This is the test Span component2')
            .key('keykeyspan2')
            .attributeModifier(this.mod2)
        }.border({ width: 1 })
        .padding(10)
      }.width('100%').padding(10)
    }.scrollable(ScrollDirection.Vertical)
  }
}