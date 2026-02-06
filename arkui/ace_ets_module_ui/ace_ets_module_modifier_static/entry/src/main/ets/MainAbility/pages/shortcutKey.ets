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
import { Entry,Component,$r,Builder,Search,Scroll,Slider, RichEditor,Stack,ModifierKey,SearchController,ButtonAttribute,SharedTransitionEffectType,List,NavPathStack, Position,ListItem,Ellipse,LineCapStyle,LineJoinStyle,NavDestination,Shape,Path,RichEditorController,Polyline,Progress,RowOptions,Navigation,Polygon,ProgressType,Path,HorizontalAlign,Menu,MenuItemOptions,FontStyle,MenuItem,Font,Dimension,BorderRadiuses,ListItemGroup,LoadingProgress,Padding,Column,StickyStyle,ImageAnimator,ImageSpan,Alignment,Hyperlink,BreakpointsReference,GridRowDirection,TextOverflow,GridCol,ColumnOptions,Grid,GridItem,Gauge,FormComponent,Visibility,FormDimension,Divider,Counter,DataPanel,DatePicker,BorderImageOption,BorderOptions,AdaptiveColor,BackgroundEffectOptions,BorderStyle,RepeatMode,GradientDirection,Image,Checkbox,Blank,MarkStyle,ResourceColor,CheckboxGroup,Text,Toggle,ToggleType,FlexAlign,Color,Flex,ButtonType,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,GridRow,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import {ButtonModifier} from "@ohos.arkui.modifier";
import { RecordData } from '@ohos.base';

class CustomModifier extends ButtonModifier {
  applyNormalAttribute(instance: ButtonAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }
}

@Entry
@Component
struct ShortcutKey7Test {
  @State buttonModifier: ButtonAttribute = new CustomModifier()
      .keyboardShortcut('B', [ModifierKey.CTRL]);

  sendEvent(message: string, eventId: int) {
    let eventData: events_emitter.EventData = {
      data: {
        "msg": message
      } as Record<String,RecordData>
    }
    let event: events_emitter.InnerEvent = {
      eventId: eventId,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.emit(event, eventData)
  }

  baseEvent: int = 62000

  build() {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {
        Button("Ctrl + B")
          .attributeModifier(this.buttonModifier as ButtonModifier)
          .onClick((e: ClickEvent) => {
            this.sendEvent('Ctrl_B', this.baseEvent)
          })
          .key('ShortcutKey_Button_0')
      }.width("100%")
    }
  }
}