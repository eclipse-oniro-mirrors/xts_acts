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

import { display } from '@kit.ArkUI';
import window from '@ohos.window';
@Entry
@Component
struct Page1 {
    @State handlePopup: boolean = false;
    @State maxH: number = 365;
    @State maxW: number = 365;
    @State message: string = 'This is a popup with PopupOptions This is a popup with PopupOptions ' +
        'This is a popup with PopupOptions This is a popup with PopupOptions';

    onPageShow(): void {
        window.getLastWindow(getContext()).then(windowObj => {
            let properties = windowObj.getWindowProperties();
            console.log('Window Width:', properties.windowRect.width);
            this.maxW = properties.windowRect.width / display.getDefaultDisplaySync().densityPixels;
            this.maxH = properties.windowRect.height / display.getDefaultDisplaySync().densityPixels;
        });
    }
    build() {
        Column() {
            Flex({ wrap: FlexWrap.Wrap }) {
                Button('handlePopup')
                    .id('popup')
                    .width(this.maxW - 45)
                    .height(this.maxH - 150)
                    .onClick(() => {
                        this.handlePopup = !this.handlePopup;
                    })
                    .bindPopup(this.handlePopup, {
                        width: 150,
                        targetSpace: 1,
                        message: this.message,
                        avoidTarget: AvoidanceMode.COVER_TARGET
                    })
            }
        }.width('100%').height('100%')
    }
}