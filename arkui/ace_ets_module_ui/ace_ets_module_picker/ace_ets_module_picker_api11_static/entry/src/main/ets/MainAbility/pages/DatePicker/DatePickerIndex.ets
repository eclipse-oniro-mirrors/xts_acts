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
import hilog from '@ohos.hilog';
import {
    Entry,
    Component,
    Column,
    Text,
    Margin,
    Row,
    Flex,
    FlexDirection,
    ItemAlign,
    FlexAlign,
    Alignment,
    TextAlign,
    TextOverflow,
    Color,
    $r,
    DatePicker,
    PickerTextStyle,
    DatePickerResult,
    FontWeight,
    ClickEvent,
    Button,
    Font
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'
import { RecordData } from '@ohos.base';
@Entry
@Component
struct DatePickerExample {
    
    private selectedDate: Date = new Date('2021-08-08')

    @State disappearTextStyle: PickerTextStyle = {color:Color.Black,font:{size:8,weight:FontWeight.Lighter}} as PickerTextStyle
    @State textStyle: PickerTextStyle = {color:Color.Red,font:{size:'10px',weight:FontWeight.Normal}} as PickerTextStyle
    @State selectedTextStyle: PickerTextStyle = {color:Color.Blue,font:{size:'20px',weight:FontWeight.Bold}} as PickerTextStyle

    @State disappearTextStyleDefault: PickerTextStyle = {color:$r("sys.color.ohos_id_color_text_primary"),font:{size:$r("sys.float.ohos_id_text_size_sub_title3"),weight:FontWeight.Lighter}} as PickerTextStyle
    @State textStyleDefault: PickerTextStyle = {color:$r("sys.color.ohos_id_color_text_primary"),font:{size:$r("sys.float.ohos_id_text_size_sub_title2"),weight:FontWeight.Normal}} as PickerTextStyle
    @State selectedTextStyleDefault: PickerTextStyle ={color:$r("sys.color.ohos_id_color_text_primary_activated"),font:{size:$r("sys.float.ohos_id_text_size_dialog_tittle"),weight:FontWeight.Bold}} as PickerTextStyle

    private stateChangCallBack:(eventData:events_emitter.EventData) => void = (eventData:events_emitter.EventData) => {
        console.info("select page state change called:" + JSON.stringify(eventData));
        if (eventData != null && eventData.data != null) {
            const data = eventData.data as Record<String,RecordData>
            if (data!['disappearTextStyle'] != null) {
                console.log('disappearTextStyledisappearTextStyle',data!['disappearTextStyle'] as PickerTextStyle)
                this.disappearTextStyle = data!['disappearTextStyle'] as PickerTextStyle
                console.log('disappearTextStyledisappearTextStyle2222',this.disappearTextStyle)
            }
            if (data!['textStyle'] != null) {
                this.textStyle = data!['textStyle'] as PickerTextStyle;
            }
            if (data!['selectedTextStyle'] != null) {
                this.selectedTextStyle = data!['selectedTextStyle'] as PickerTextStyle;
            }
        }
    }

    aboutToAppear(){        
        let stateChangeEvent: events_emitter.InnerEvent = {
            eventId: 185,
            priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(stateChangeEvent, this.stateChangCallBack);

        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    }

    build() {
        Column() {
            DatePicker({
                start: new Date('1970-1-1'),
                end: new Date('2100-1-1'),
                selected: this.selectedDate
            })
                .lunar(true)
                .disappearTextStyle(this.disappearTextStyle)
                .textStyle(this.textStyle)
                .selectedTextStyle(this.selectedTextStyle)
                .key('datePicker')
                .id('datePicker')
                .onDateChange((date: Date) => {
                     console.info( 'select current date is: ' + JSON.stringify(date))
                })
            
             DatePicker({
                start: new Date('1970-1-1'),
                end: new Date('2100-1-1'),
                selected: this.selectedDate
            })
                .lunar(true)
                .disappearTextStyle(this.disappearTextStyleDefault)
                .textStyle(this.textStyleDefault)
                .selectedTextStyle(this.selectedTextStyleDefault)
                .key('datePickerDefault')
                .id('datePickerDefault')
                .onDateChange((date: Date) => {
                     console.info( 'select current date is: ' + JSON.stringify(date))
                })
            
            Button('Dialog')
            .fontColor('black')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin(10)
            .backgroundColor('#0D9FFB')
            .width('40%')
            .height(40)
            .key("Dialog")
            .onClick((e:ClickEvent) => {
                this.getUIContext().showDatePickerDialog({
                start: new Date('1970-1-1'),
                end: new Date('2100-1-1'),
                selected: this.selectedDate,
                lunar:true,
                showTime:true,
                disappearTextStyle:this.disappearTextStyle,
                textStyle: this.textStyle,
                selectedTextStyle: this.selectedTextStyle,
              })
            })          
        }
    }
}