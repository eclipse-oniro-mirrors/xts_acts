/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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

import { BusinessError, pasteboard } from '@kit.BasicServicesKit';
import render from 'libnativerender.so';
import image from '@ohos.multimedia.image'
import { LengthMetrics } from '@ohos.arkui.node';
import web_webview from '@ohos.web.webview'

@Entry
@Component
struct styledStringMenu {
  @State message: string = 'Hello World'
  @State textString: number = -2
  uint8Array :Uint8Array|undefined = undefined
  // controller: RichEditorController = new RichEditorController();
  // options: RichEditorOptions = { controller: this.controller }
  styledStringController : RichEditorStyledStringController = new RichEditorStyledStringController();
  styledStringOption : RichEditorStyledStringOptions = {controller : this.styledStringController };
  webController: web_webview.WebviewController = new web_webview.WebviewController()
  @State html: string = ''
  controller: RichEditorStyledStringController = new RichEditorStyledStringController()
  options: RichEditorStyledStringOptions = {controller: this.controller};

  styleString1: MutableStyledString = new MutableStyledString('hello', [{
    start: 0,
    length: 5,
    styledKey: StyledStringKey.FONT,
    styledValue: new TextStyle({ fontColor: Color.Blue,fontSize:LengthMetrics.px(40)})
  }])

  build() {
    Column() {
      Column() {
        Text('测试CAPI，测试前下面框中先粘贴一次').height('5%')
        Text('' + this.textString).id('textString').height('5%')
        RichEditor(this.options)
          .borderWidth(1)
          .borderColor(Color.Red)
          .width('100%')
          .height('20%')
          .id('richEditor2')
        Button('点击测试CAPI')
          .id('but2').height('5%')
          .onClick(() =>{
            let sysBoard = pasteboard.getSystemPasteboard()

            try {
              let result: boolean = sysBoard.hasDataType('openharmony.styled-string');
              console.info(`testStyledString001 Succeeded in checking the DataType. Result: ${result}`);
            } catch (err) {
              console.error('testStyledString001 Failed to check the DataType. Cause:' + err.message);
            };
            sysBoard.getData((err, data) => { // MulitTypeRecord.
              let count = data.getRecordCount()  // '1234[图]' ,  record1 : {plainText : '1234',  openharmony.styled-string : arrayBuffer}, mimeType = 'plainText'
              //              record2 {UriText : '/../../.png, openharmony.styled-string : arrayBuffer'}, mimeType = 'UriText'
              for (let i = 0; i < count; i++) {
                const record = data.getRecord(i)
                let  mimeTypes = data.getMimeTypes(); // 获得 所有record 的mimeType 集合。  // text, uri, arraybuffer
                let type = record.mimeType;

                let types = new Array(pasteboard.MIMETYPE_TEXT_PLAIN,pasteboard.MIMETYPE_TEXT_URI,pasteboard.MIMETYPE_PIXELMAP,'openharmony.styled-string')
                let validTypes = record.getValidTypes(types) // 获取record1 里的所有数据的样式集合。
                if (validTypes.includes('openharmony.styled-string')) {
                  let spanString = record.getData('openharmony.styled-string')
                  spanString.then((value) => {
                    console.info(`testStyledString001 Succeeded obtain buffer `);
                    let buffer = value as ArrayBuffer;
                    let uint8Array = new Uint8Array(buffer); // 从剪切板中获取属性字符串的序列化的字节数组。 uint8Array -> 属性字符串
                    console.log('testStyledString001-----------' + uint8Array)
                    console.log('testStyledString001-----------' + uint8Array.length)
                    this.textString = render.testStyledString001(uint8Array);  // napi ，将JS侧数据传到C侧.
                    console.log('testStyledString001------textString-----' + this.textString)
                  })
                }
              }
            })
          })

        Button('复制html及属性字符串')
          .onClick(async () =>{
            let sysBoard = pasteboard.getSystemPasteboard()
            let mutableStyledString = new MutableStyledString('test', [
              {
                start: 0,
                length: 2,
                styledKey: StyledStringKey.BASELINE_OFFSET,
                styledValue: new BaselineOffsetStyle(LengthMetrics.px(100))
              },
              {
                start: 0,
                length: 4,
                styledKey: StyledStringKey.LINE_HEIGHT,

                styledValue:new LineHeightStyle(new LengthMetrics(50))
              },
            ])

            let buffer = StyledString.marshalling(mutableStyledString)
            let html = StyledString.toHtml(mutableStyledString);
            let records: Record<string, pasteboard.ValueType> = {
              'text/html': html,
              'openharmony.styled-string': buffer
            };
            let pasteData = pasteboard.createData(records)

            sysBoard.setData(pasteData)
          }).height('5%')
        Text('==============================').height('5%')
        Text('测试JS ToHtml').height('5%')
        RichEditor(this.options)
          .borderWidth(1)
          .borderColor(Color.Red)
          .width('100%')
          .height('20%')
          .id('richEditor')
        Column() {
          Row() {
            Button('添加文字')
              .onClick(() => {
                console.log('testStyledString001----------add Text')
                this.controller.setStyledString(this.styleString1)
              })
              .id('but1')
          }
        }.height('5%')
        RichEditor(this.styledStringOption).height('5%')
        Text(this.html).height('5%')


      }.width('100%').backgroundColor(Color.White).height('100%')
    }.height('100%')
  }
}