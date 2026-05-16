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

import { webview } from '@kit.ArkWeb';
import { common } from '@kit.AbilityKit';
import { advertising } from '@kit.AdsKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct WebRegister {
private webController: webview.WebviewController = new webview.WebviewController();
private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

    aboutToAppear() {
        try {
            advertising.registerWebAdInterface(this.webController, this.context);
            hilog.info(0x0000, 'WebRegister',  `enter aboutToAppear`);
        } catch (err) {
            hilog.error(0x0000, 'WebRegister', '%{public}s', `register web ad interface error: ${err.code}, ${err.message}`);
        }
    }

    build() {
        Column() {
            Web({
                src: 'www.example.com',
                controller: this.webController,
            })
                .width("100%")
                .height("100%")

        }
    }
}