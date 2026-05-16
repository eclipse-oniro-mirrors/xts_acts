/*
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
import text from '@ohos.graphics.text';
import common2D from '@ohos.graphics.common2D';

export function buildParagraph() {
    let myColor: common2D.Color;
    myColor = { alpha: 255, red: 255, green: 0, blue: 0 };
    let fontCollection = new text.FontCollection();
    let myTextStyle: text.TextStyle = {
      color: myColor
    };
    let myParagraphStyle: text.ParagraphStyle = {
      textStyle : myTextStyle
    };
    const paragraphGraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
    paragraphGraphBuilder.addText('123');
    paragraphGraphBuilder.pushStyle(myTextStyle);
    return paragraphGraphBuilder.build();
}