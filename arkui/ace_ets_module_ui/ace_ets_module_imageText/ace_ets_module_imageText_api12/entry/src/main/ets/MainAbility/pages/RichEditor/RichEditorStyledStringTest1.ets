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

import { LengthMetrics } from '@ohos.arkui.node'

@Entry
@Component
struct RichEditorStyledStringTest1 {
  stringLength: number = 0;
  @State selection: string = '';
  @State content: string = '';
  @State range: string = '';
  @State replaceString: string = '';
  @State rangeBefore: string = '';
  @State rangeAfter: string = '';
  richEditorStyledString: MutableStyledString = new MutableStyledString('');
  textStyle: TextStyle = new TextStyle({
    fontWeight: FontWeight.Lighter,
    fontFamily: 'HarmonyOS Sans',
    fontColor: Color.Green,
    fontSize: LengthMetrics.vp(10),
    fontStyle: FontStyle.Normal
  })
  fontStyle1: TextStyle = new TextStyle({ fontColor: Color.Blue });
  fontStyle2: TextStyle = new TextStyle({
    fontWeight: FontWeight.Bolder,
    fontFamily: 'Arial',
    fontColor: Color.Orange,
    fontSize: LengthMetrics.vp(10),
    fontStyle: FontStyle.Italic
  })
  // 创建属性字符串对象
  mutableStyledString: MutableStyledString = new MutableStyledString('start',
    [{ start: 0, length: 5, styledKey: StyledStringKey.FONT, styledValue: this.fontStyle1 }]);
  styledString: StyledString = new StyledString('插入属性字符串',
    [{ start: 0, length: 7, styledKey: StyledStringKey.FONT, styledValue: this.fontStyle2 }]);
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = {controller: this.controller};
  // 文本内容变化回调
  contentChangedListener: StyledStringChangedListener = {
    onWillChange: (value: StyledStringChangeValue) => {
      this.range = '[ ' + value.range.start + ' , ' + value.range.end + ' ]';
      this.replaceString = value.replacementString.getString();
      return true;
    },
    onDidChange: (rangeBefore, rangeAfter) => {
      this.rangeBefore = '[ ' + rangeBefore.start + ' , ' + rangeBefore.end + ' ]';
      this.rangeAfter = '[ ' + rangeAfter.start + ' , ' + rangeAfter.end + ' ]';
    }
  }

  @State str:string = ''

  build() {
    Column() {
      Column() {
        Text('获取属性字符串')
          .fontSize(10)
          .width('100%')
          .height('50%')
        Text('content' + this.str).width('100%')
          .height('50%')
          .id('RichEditorStyledStringTest1_content')
      }
      .borderWidth(1)
      .borderColor(Color.Black)
      .width('100%')
      .height('10%')

      Column() {
        Text('选中区信息')
          .fontSize(10)
          .width('100%')
        Text('selection range: ' + this.selection).width('100%')
        Text('selection content: ' + this.content).width('100%')
      }
      .borderWidth(1)
      .borderColor(Color.Black)
      .width('100%')

      Column() {
        Text('onWillChange回调信息')
          .fontSize(10)
          .width('100%')
        Text('range: ' + this.range).width('100%')
        Text('replacementString: ' + this.replaceString).width('100%')
        Text('onWillChange回调信息')
          .fontSize(10)
          .width('100%')
        Text('rangeBefore: ' + this.rangeBefore).width('100%')
        Text('rangeAfter: ' + this.rangeAfter).width('100%')
      }
      .borderWidth(1)
      .borderColor(Color.Black)
      .width('100%')

      RichEditor(this.options)
        .onReady(() => {
          // 注册文本变化回调
          this.controller.onContentChanged(this.contentChangedListener);
          // 设定组件展示的属性字符串
          this.controller.setStyledString(this.mutableStyledString);
        })
        .height('10%')
        .width('90%')
        .borderWidth(1)
        .borderColor(Color.Black)

      Column() {
        Row() {
          Button('获取属性字符串').onClick(() => {
            // 获取组件展示的属性字符串
            this.richEditorStyledString = this.controller.getStyledString();
            this.str = this.richEditorStyledString.getString();
          }).height('5%')
            .id('RichEditorStyledStringTest1_get')
          Button('删除选中内容').onClick(() => {
            // 获取选中范围
            let richEditorSelection = this.controller.getSelection();
            let start = richEditorSelection.start ? richEditorSelection.start : 0;
            let end = richEditorSelection.end ? richEditorSelection.end : 0;
            // 获取组件展示的属性字符串
            this.richEditorStyledString = this.controller.getStyledString();
            this.richEditorStyledString.removeString(start, end - start);
            // 使删除内容后的属性字符串展示在组件上
            this.controller.setStyledString(this.richEditorStyledString);
          }).height('5%')
        }

        Row() {
          Button('获取选中内容').onClick(() => {
            // 获取选中范围
            let richEditorSelection = this.controller.getSelection();
            let start = richEditorSelection.start ? richEditorSelection.start : 0;
            let end = richEditorSelection.end ? richEditorSelection.end : 0;
            // 获取组件展示的属性字符串
            this.richEditorStyledString = this.controller.getStyledString();
            this.selection = '[ ' + start + ' , ' + end + ' ]';
            this.content = this.richEditorStyledString.subStyledString(start, end - start).getString();
          }).height('5%')
          Button('更新选中样式').onClick(() => {
            // 获取选中范围
            let richEditorSelection = this.controller.getSelection();
            let start = richEditorSelection.start ? richEditorSelection.start : 0;
            let end = richEditorSelection.end ? richEditorSelection.end : 0;
            // 获取组件展示的属性字符串
            this.richEditorStyledString = this.controller.getStyledString();
            this.richEditorStyledString.setStyle({
              start: start,
              length: end - start,
              styledKey: StyledStringKey.FONT,
              styledValue: this.textStyle
            })
            // 使变更样式后的属性字符串展示在组件上
            this.controller.setStyledString(this.richEditorStyledString);
          }).height('5%')
        }
      }
      .width('100%')
    }
  }
}