/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
import { window } from "@kit.ArkUI";
import { BusinessError } from "@kit.BasicServicesKit";
import { UIContext } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

export namespace utils {
  export function createWindow(context: Context): window.Window | undefined {
    let windowClass: window.Window | undefined = undefined;
    let config: window.Configuration = {
      name: "test",
      windowType: window.WindowType.TYPE_DIALOG,
      ctx: context
    };
    try {
      window.createWindow(config, (err: BusinessError, data: window.Window) => {
        const errCode: number = err.code;
        if (errCode) {
          console.error(`Failed to create the window. Cause code: ${err.code}, message: ${err.message}`);
          return;
        }
        windowClass = data;
        console.info('Succeeded in creating the window. Data: ' + JSON.stringify(data));
        windowClass.resize(500, 1000);
        windowClass.setUIContent('pages/index/index');
        // constructor001
        let uiContext = new UIContext();
        hilog.info(0x00, 'testTag', `uiContext: ${uiContext.getId()}`)
        windowClass.showWindow().then(() => {
          let uiContext0 = UIContext.resolveUIContext();
          hilog.info(0x00, 'testTag', `sally----- showWindow uicontext: ${uiContext0?.getId()},
            strategy: ${uiContext0.strategy}`); //1
          AppStorage.SetOrCreate('resolveUIContextStrategy1', uiContext0.strategy);

          if (windowClass != undefined) {
            windowClass.destroyWindow();
          }
        })
      });
    } catch (exception) {
      console.error(`Failed to create the window. Cause code: ${exception.code}, message: ${exception.message}`);
    }
    return windowClass;
  }
}