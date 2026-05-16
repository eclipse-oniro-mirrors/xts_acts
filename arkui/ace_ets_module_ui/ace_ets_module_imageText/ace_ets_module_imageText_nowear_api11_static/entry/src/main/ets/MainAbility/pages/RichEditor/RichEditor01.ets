'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Entry, Component, TextDataDetectorType,RichEditorController,RichEditorOptions,
  Column,PasteEvent,RichEditor,Text,RichEditorImageSpanResult,RichEditorTextSpanResult,
  RichEditorSelection,RichEditorInsertValue,RichEditorDeleteValue,Span,
  Color,Row,ClickEvent,Button,RichEditorRange
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct RichEditor01 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller } as RichEditorOptions;
  private start: int = -1;
  private end: int = -1;
  @State message: string = "[-1, -1]"
  @State content: string = ""
  @State text: string = ""
  @State insertOffset: string = ""
  @State insertValue: string = ""
  @State addTextSpan: string = ""


  build() {
    Column() {
      Column() {
        Text("selection range:").width("100%")
        Text() {
          Span(this.message)
        }.width("100%")
        Text("selection content:").width("100%")
        Text(this.content).width("100%").key('RichEditor01Text')
        Text(this.insertOffset).width("100%").key('RichEditor02Text')
        Text(this.insertValue).width("100%").key('RichEditor03Text')
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width("100%")
      .height("20%")

      Row() {
        Button("获取选择内容").onClick((e:ClickEvent) => {
          this.content = "";
          this.controller!.getSpans({
            start: this.start,
            end: this.end
          })!.forEach(item => {
            if(item instanceof RichEditorImageSpanResult){
              this.content += (item as RichEditorImageSpanResult).valueResourceStr;
              this.content += "\n"
            } else {
              this.content += (item as RichEditorTextSpanResult).value;
              this.content += "\n"
            }
          })
        }).key('RichEditor01GetSpans')
        Button("删除选择内容").onClick((e:ClickEvent) => {
          this.controller!.deleteSpans({
            start: 0,
            end: 1
          } as RichEditorRange)
          this.start = -1;
          this.end = -1;
          this.message = "[" + this.start + ", " + this.end + "]"
        }).key('RichEditor01DelSpans')

      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width("100%")
      .height("10%")
      Row() {
        Button("获取组件信息").onClick((e:ClickEvent) => {
          let strJson = inspector.getInspectorByKey('RichEditorKey');
          this.text = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson))
        })
        Button("获取光标位置").onClick((e:ClickEvent) => {
          this.content = this.controller.getCaretOffset() + ''
        }).key('getCaretOffset')

      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width("100%")
      .height("10%")
      Row() {
        Button("设置光标位置1").onClick((e:ClickEvent) => {
          this.content = this.controller!.setCaretOffset(1) + ''
          let add = this.controller!.getCaretOffset() as int
          console.log('this.point_position111:' + this.content + add);
        }).key('setCaretOffset01')
        Button("设置光标位置100").onClick((e:ClickEvent) => {
          this.content = this.controller.setCaretOffset(100) + ''
        }).key('setCaretOffset02')
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width("100%")
      .height("10%")

      Column() {
        RichEditor(this.options)
          .key('RichEditorKey')
          .onReady(():void => {
            this.content = '012345678'
          })
          .onSelect((value: RichEditorSelection):void => {
            this.start = value.selection[0];
            this.end = value.selection[1];
            this.message = "[" + this.start + ", " + this.end + "]"
          })
          .aboutToIMEInput((value: RichEditorInsertValue):Boolean => {
            console.log("---------------------- aboutToIMEInput ----------------------")
            console.log("insertOffset:" + value.insertOffset)
            console.log("insertValue:" + value.insertValue)
            this.insertOffset = value.insertOffset + ''
            this.insertValue = value.insertValue + ''
            return true;
          })
          .onIMEInputComplete((value: RichEditorTextSpanResult):void => {
            console.log("---------------------- onIMEInputComplete ---------------------")
            console.log("spanIndex:" + value.spanPosition.spanIndex)
            console.log("spanRange:[" + value.spanPosition.spanRange[0] + "," + value.spanPosition.spanRange[1] + "]")
            console.log("offsetInSpan:[" + value.offsetInSpan[0] + "," + value.offsetInSpan[1] + "]")
            console.log("value:" + value.value)
            this.content = value.spanPosition.spanIndex + ',' +  value.value + ',' + value.spanPosition.spanRange[0] + "," + value.spanPosition.spanRange[1] + ',' + + value.offsetInSpan[0] + "," + value.offsetInSpan[1] + ',' + value.textStyle.fontSize
          })
          .aboutToDelete((value: RichEditorDeleteValue):Boolean => {
            this.content = 'aboutToDelete'
            console.log("---------------------- aboutToDelete --------------------------")
            console.log("offset:" + value.offset)
            console.log("direction:" + value.direction)
            console.log("length:" + value.length)
            value.richEditorDeleteSpans.forEach(item => {
              console.log("---------------------- item --------------------------")
              console.log("spanIndex:" + item.spanPosition.spanIndex)
              console.log("spanRange:[" + item.spanPosition.spanRange[0] + "," + item.spanPosition.spanRange[1] + "]")
              console.log("offsetInSpan:[" + item.offsetInSpan[0] + "," + item.offsetInSpan[1] + "]")
              if (item instanceof RichEditorImageSpanResult) {
                console.log("image:" + (item as RichEditorImageSpanResult).valueResourceStr)
              } else {
                console.log("text:" + (item as RichEditorTextSpanResult).value)
              }
            })
            return true;
          })
          .onDeleteComplete(():void => {
            console.log("---------------------- onDeleteComplete ------------------------")
          })
          .borderWidth(1)
          .borderColor(Color.Green)
          .width("100%")
          .height("30%")


      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width("100%")
      .height("70%")
    }
  }
}