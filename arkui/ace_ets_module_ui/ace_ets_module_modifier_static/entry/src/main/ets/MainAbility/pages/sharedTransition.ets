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
import { Entry,Component,$r,Builder,Search,Rect, RichEditor,SearchController,SharedTransitionEffectType,List,NavPathStack, Position,ListItem,Ellipse,LineCapStyle,LineJoinStyle,NavDestination,Shape,Path,RichEditorController,Polyline,Progress,RowOptions,Navigation,Polygon,ProgressType,Path,HorizontalAlign,Menu,MenuItemOptions,FontStyle,MenuItem,Font,Dimension,BorderRadiuses,ListItemGroup,LoadingProgress,Padding,Column,StickyStyle,ImageAnimator,ImageSpan,Alignment,Hyperlink,BreakpointsReference,GridRowDirection,TextOverflow,GridCol,ColumnOptions,Grid,GridItem,Gauge,FormComponent,Visibility,FormDimension,Divider,Counter,DataPanel,DatePicker,BorderImageOption,BorderOptions,AdaptiveColor,BackgroundEffectOptions,BorderStyle,RepeatMode,GradientDirection,Image,Checkbox,Blank,MarkStyle,ResourceColor,CheckboxGroup,Text,Toggle,ToggleType,FlexAlign,Color,Flex,ButtonType,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,GridRow,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter'
import { RecordData } from '@ohos.base';
@Entry
@Component
struct SharedTransition7Example {
  @State active: boolean = false
  @State duration: int = 1000
  @State delay: int = 0
  @State type: SharedTransitionEffectType = SharedTransitionEffectType.Static

  build() {
    List() {
      ListItem() {
        Row() {
          // Navigation({ target: 'pages/sharedTransition2', type: NavigationType.Push }) {
          Navigation(new NavPathStack()) {
            Image($r('app.media.icon')).width(50).height(50)
              .sharedTransition('sharedImage1', { duration: this.duration, delay: this.delay, type: this.type })
          }
          .key('Navigator')
          .padding({ left: 10 } as Padding)
          .onClick((e: ClickEvent) => {
            this.active = true
            console.info('SharedTransition current action state is: ' + this.active);
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "duration": this.duration,
                  "delay": this.delay,
                  "type": this.type
                } as Record<String,RecordData>
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 193,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("SharedTransition start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("SharedTransition emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })

          Text('SharedTransition').width(80).height(80).textAlign(TextAlign.Center)
        }
      }
    }
  }

  onPageShow() {
    console.info('sharedTransition page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 194,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)
  }

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("sharedTransition page state change called:" + JSON.stringify(eventData));
      const data = eventData.data as Record<String,RecordData>
      if (data["duration"] != null) {
        this.duration = data["duration"] as int;
        console.log("=============================== this.duration " + this.duration)
      }
      if (data["delay"] != null) {
        this.delay = data["delay"] as int;
        console.log("=============================== this.delay " + this.delay)
      }
      if (data["type"] != null) {
        this.type = data["type"] as SharedTransitionEffectType;
        console.log("=============================== this.type " + this.type);
      }
    }
  }
}