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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import { RenderNode, DrawContext } from "@ohos.arkui.node"
import drawing from "@ohos.graphics.drawing"
import common2D from "@ohos.graphics.common2D"
import image from "@ohos.multimedia.image"
import text from "@ohos.graphics.text";
import { UiDriver, BY, ON, PointerMatrix } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';
import buffer from '@ohos.buffer';

export function buildParagraph() {
    let fontCollection = new text.FontCollection();
    let myTextStyle: text.TextStyle = {
    color : {alpha: 255, red: 255, green: 0, blue: 0}
    };
    let myParagraphStyle: text.ParagraphStyle = {
    textStyle : myTextStyle
    };
    let myPlaceholderSpan: text.PlaceholderSpan = {
    width: 12,
    height: 21,
    align: text.PlaceholderAlignment.ABOVE_BASELINE,
    baseline: text.TextBaseline.ALPHABETIC,
    baselineOffset: 66
    };
    const ParagraphGraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
    ParagraphGraphBuilder.addPlaceholder(myPlaceholderSpan);
    ParagraphGraphBuilder.addText("123");
    ParagraphGraphBuilder.pushStyle(myTextStyle);
    return ParagraphGraphBuilder.build();
}