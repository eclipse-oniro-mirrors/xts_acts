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
import { LengthMetrics, LengthUnit } from '@ohos.arkui.node'
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct StyledStringUrl13Test {
    fontStyleAttr1: TextStyle = new TextStyle({ fontColor: Color.Blue });
    mutableStyledString2: MutableStyledString = new MutableStyledString('test hello world',[
        {
            start: 0,
            length: 5,
            styledKey: StyledStringKey.URL,
            styledValue: new UrlStyle('xxx.cn')
        }
        ]);
    @State fontColor1: ResourceColor = Color.Red;
    controller: TextController = new TextController();
    options: TextOptions = { controller: this.controller };
    controller2: TextController = new TextController();
    @State styledKey1: StyledStringKey = StyledStringKey.DECORATION

  async onPageShow() {
        this.controller2.setStyledString(this.mutableStyledString2)
    }

    build() {
        Column() {
            Column({ space: 10 }) {
                // 显示配了字体各种样式的属性字符串，Text组件亦配置冲突部分生效属性字符串配置，未冲突区间生效Text组件属性设置值
                Text(this.styledKey1 + '').fontSize(12).id('urlIdStyledStringUrl13Test')

                Text(undefined, this.options)
                    .fontColor(this.fontColor1)
                    .font({ size: 20, weight: 500, style: FontStyle.Normal })
                
                Text(undefined, { controller: this.controller2 })
                    .fontSize(30)
                    .copyOption(CopyOptions.InApp)
                    .draggable(true)

                Button('查询文本样式').id('searchStyleStyledStringUrl13Test')
                    .onClick(() => {
                        let styles = this.mutableStyledString2.getStyles(0, this.mutableStyledString2.length)
                        this.styledKey1 = styles[0].styledKey
                    })
                    .margin({ top: 10 })
            }.width('100%')

        }
    }
}