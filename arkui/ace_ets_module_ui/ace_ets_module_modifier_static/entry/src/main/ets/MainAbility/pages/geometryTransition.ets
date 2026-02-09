'use static';
/**
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
import {
  Entry,
  Component,
  $r,
  Padding,
  Column,
  ColumnOptions,
  Gauge,
  FormComponent,
  Visibility,
  FormDimension,
  Divider,
  Counter,
  DataPanel,
  DatePicker,
  BorderImageOption,
  BorderOptions,
  AdaptiveColor,
  BackgroundEffectOptions,
  BorderStyle,
  RepeatMode,
  GradientDirection,
  Image,
  Checkbox,
  Blank,
  MarkStyle,
  ResourceColor,
  CheckboxGroup,
  Text,
  Toggle,
  ToggleType,
  FlexAlign,
  Color,
  Flex,
  ButtonType,
  FlexDirection,
  ItemAlign,
  Row,
  Button,
  ClickEvent,
  Week,
  FontWeight,
  Axis,
  Margin,
  Swiper,
  ForEach,
  PickerTextStyle,
  CalendarAlign,
  CalendarPicker,
  EdgeEffect,
  Curve,
  SwiperDisplayMode,
  ArrowPosition,
  Select,
  BlurStyle,
  MenuAlignType,
  TextInputController,
  TextAlign,
  AlphabetIndexer,
  ButtonAttribute
} from '@ohos.arkui.component';
import { State, Link, PropRef, } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';
import { ButtonModifier } from "@ohos.arkui.modifier";
import { RecordData } from '@ohos.base';


class CustomModifier extends ButtonModifier {
  applyNormalAttribute(instance: ButtonAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }
}

@Entry
@Component
struct geometryTransition7Example {
  @State btn1: boolean = false
  @State show: string = "show"

    @State geometryTransitionModifier1: ButtonAttribute = new CustomModifier()
            .geometryTransition("picture")

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, }) {
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor(0x317aff)
        .margin({ bottom: 50 } as Margin)
        .key('button')
        .onClick((e: ClickEvent) => {
          try {
            let backData: events_emitter.EventData = {
              data: {
                "btn1": this.btn1,
              } as Record<String,RecordData>
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 104,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("geometryTransitionTest_0100 start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("geometryTransitionTest_0100 emit action state err: " +
            JSON.stringify((err as Error)?.message))
          }
          this.getUIContext().animateTo({ duration: 1000 }, () => {
            this.btn1 = !this.btn1
            if (this.btn1) {
              this.show = "hide"
            } else {
              this.show = "show"
            }
          })
        })
      if (this.btn1) {
        Button('') {
          Image($r('app.media.icon')).width("80%").height(300)
        }

                .attributeModifier(this.geometryTransitionModifier1 as ButtonModifier)
      }
    }.height(400).width("100%").padding({ top: 100 } as Padding)
  }
}