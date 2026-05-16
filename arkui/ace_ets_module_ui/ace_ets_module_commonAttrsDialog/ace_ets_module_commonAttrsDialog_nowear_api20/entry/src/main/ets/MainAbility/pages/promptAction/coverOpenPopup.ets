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

import { ComponentContent, FrameNode } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { display } from '@kit.ArkUI';
import window from '@ohos.window';

interface PopupParam {
    updateFunc?: () => void;
    _text: string;
}

export function showPopup(context: UIContext, uniqueId: number, contentNode: ComponentContent<PopupParam>,
    popupParam: PopupParam) {
    const promptAction = context.getPromptAction();
    let frameNode: FrameNode | null = context.getFrameNodeByUniqueId(uniqueId);
    let targetId = frameNode?.getFirstChild()?.getUniqueId();
    promptAction.openPopup(contentNode, { id: targetId }, {
        width: 100,
        avoidTarget: AvoidanceMode.COVER_TARGET,
        targetSpace: 1,
    })
        .then(() => {
            console.info('openPopup success');
        })
        .catch((err: BusinessError) => {
            console.info('openPopup error: ' + err.code + ' ' + err.message);
        })
    return promptAction;
}

@Builder
function buildText(param?: PopupParam) {
    Column() {
        Text(param?._text);
        Button('Update Popup')
            .fontSize(20)
            .onClick(() => {
                param?.updateFunc?.();
            })
    }
}

@Entry
@Component
struct OpenPopup {
    contentNode1: ESObject;
    showPo1: ESObject;
    @State maxW: number = 365;
    @State maxH: number = 365;
    @State message: string = 'This is a popup with PopupOptions This is a popup with PopupOptions This is a' +
        ' popup with PopupOptions This is a popup with PopupOptions This is a popup with PopupOptions';

    onPageShow(): void {
        window.getLastWindow(getContext()).then(windowObj => {
            let properties = windowObj.getWindowProperties();
            console.log('neutest Window Width:', properties.windowRect.width);
            this.maxW = properties.windowRect.width / display.getDefaultDisplaySync().densityPixels;
            this.maxH = properties.windowRect.height / display.getDefaultDisplaySync().densityPixels;
        });
    }

    build() {
        Column() {
            Button('Open Popup')
                .onClick(() => {
                    let context = this.getUIContext();
                    const popupParam: PopupParam = { _text: this.message };
                    this.contentNode1 = new ComponentContent(context, wrapBuilder(buildText), popupParam);
                    this.showPo1 = showPopup(context, this.getUniqueId(), this.contentNode1, popupParam);
                })
                .width(this.maxW - 45)
                .height(this.maxH - 150)
                .id('coverID')
        }.width('100%').height('100%')
    }
}

